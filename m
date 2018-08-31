From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 00/16] unify usb mcu layer between mt76x2u and mt76x0u
 drivers
Date: Fri, 31 Aug 2018 11:12:38 +0200
Message-ID: <20180831091237.GA7261@redhat.com>
References: <20180825104056.9130-1-lorenzo.bianconi@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180825104056.9130-1-lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nbd-Vt+b4OUoWG0@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, Aug 25, 2018 at 12:40:40PM +0200, Lorenzo Bianconi wrote:
> Use shared mt76u mcu routines available in mt76-usb module and
> unify usb mcu layer between mt76x2u and mt76x0u drivers.
> Remove unused mt76x0 routines.
> This patchset is based on top of Stanislaw's patchset (not applied yet):
> https://marc.info/?l=linux-wireless&m=153510933510810&w=2
> 
> Lorenzo Bianconi (16):
>   mt76: move mt76_reg_pair definition in mt76.h
>   mt76: split __mt76u_mcu_send_msg and mt76u_mcu_send_msg routines
>   mt76: move mt76x2u_mcu_deinit routine in mt76-usb module
>   mt76: add multiple regs read support to usb_mcu layer
>   mt76x0: use mt76u_init for bus initialization
>   mt76x0: remove mt76x0_vendor_reset routine
>   mt76x0: remove mt76x0_vendor_single_wr routine
>   mt76x0: remove mt76x0_mcu_msg_alloc routine
>   mt76x0: use shared mt76 usb mcu completion
>   mt76x0: remove mt76x0_complete_urb routine
>   mt76x0: remove mt76x0_vendor_request routine
>   mt76x0: remove unused mt76x0_wait_asic_ready routine
>   mt76x0: use mt76u_mcu_send_msg utility routine to send fw cmds
>   mt76x0: remove unused mt76x0_mcu structure
>   mt76x0: use mt76u_mcu_fw_send_data for fw uploading
>   mt76x0: remove unused routines for usb_buff alloc/free

For the series:

Reviewed-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
