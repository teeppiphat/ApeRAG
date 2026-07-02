import { getServerApi } from '@/lib/api/server';
import { Metadata } from 'next';
import { getTranslations } from 'next-intl/server';
import { redirect } from 'next/navigation';
import { SignInForm } from './signin-form';

export async function generateMetadata(): Promise<Metadata> {
  const page_auth = await getTranslations('page_auth');
  return {
    title: page_auth('signin'),
  };
}

export default async function Page() {
  const apiServer = await getServerApi();
  let methods;
  let authType;
  try {
    const res = await apiServer.defaultApi.configGet();
    methods = res.data.login_methods || [];
    authType = res.data.auth?.type;
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
  } catch (err) {
    methods = ['local'];
  }

  if (authType === 'none') {
    redirect('/workspace/collections');
  }

  return <SignInForm methods={methods} />;
}
