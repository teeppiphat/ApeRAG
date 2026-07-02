'use client';

import {
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
} from '@/components/ui/sidebar';
import { MonitorCog } from 'lucide-react';
import { useTranslations } from 'next-intl';
import Link from 'next/link';
import { usePathname } from 'next/navigation';

export const AdminSideBarMenu = () => {
  const pathname = usePathname();
  const page_auth = useTranslations('page_auth');
  const admin_config = useTranslations('admin_config');

  return (
    <SidebarGroup>
      <SidebarGroupLabel>{page_auth('administrator')}</SidebarGroupLabel>
      <SidebarGroupContent>
        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton
              asChild
              isActive={pathname.match('/admin/configuration') !== null}
            >
              <Link href="/admin/configuration">
                <MonitorCog /> {admin_config('metadata.title')}
              </Link>
            </SidebarMenuButton>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarGroupContent>
    </SidebarGroup>
  );
};
