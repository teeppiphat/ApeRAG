import { getServerApi } from '@/lib/api/server';
import { Metadata } from 'next';
import { getTranslations } from 'next-intl/server';
import { redirect } from 'next/navigation';
import { SignUpForm } from './signup-form';

export async function generateMetadata(): Promise<Metadata> {
  const page_auth = await getTranslations('page_auth');
  return {
    title: page_auth('signup'),
  };
}

export default async function Page() {
  const apiServer = await getServerApi();
  let authType;
  try {
    const res = await apiServer.defaultApi.configGet();
    authType = res.data.auth?.type;
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
  } catch (err) {
    authType = undefined;
  }

  if (authType === 'none') {
    redirect('/workspace/collections');
  }

  return <SignUpForm />;
}
