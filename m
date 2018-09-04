From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 01/16] mt76: move mt76_reg_pair definition in mt76.h
Date: Tue,  4 Sep 2018 08:12:21 +0000 (UTC)
Message-ID: <20180904081221.7FFB0607B5@smtp.codeaurora.org>
References: <20180825104056.9130-2-lorenzo.bianconi@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180825104056.9130-2-lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> Move common definition of mt76_reg_pair in mt76.h
> and remove duplicated code in mt76x2_init_common.c
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

16 patches applied to wireless-drivers-next.git, thanks.

5090efa4a2e8 mt76: move mt76_reg_pair definition in mt76.h
4c89ff2c74e3 mt76: split __mt76u_mcu_send_msg and mt76u_mcu_send_msg routines
288d600a8880 mt76: move mt76x2u_mcu_deinit routine in mt76-usb module
851ab66e293c mt76: add multiple regs read support to usb_mcu layer
795dbf0fd20c mt76x0: use mt76u_init for bus initialization
e9fa647a0ad3 mt76x0: remove mt76x0_vendor_reset routine
72750efddba9 mt76x0: remove mt76x0_vendor_single_wr routine
84740d5dc66e mt76x0: remove mt76x0_mcu_msg_alloc routine
ad27c4ae0ba7 mt76x0: use shared mt76 usb mcu completion
73d411e2d499 mt76x0: remove mt76x0_complete_urb routine
172222cff066 mt76x0: remove mt76x0_vendor_request routine
876d3d02ee31 mt76x0: remove unused mt76x0_wait_asic_ready routine
6f4796b7063e mt76x0: use mt76u_mcu_send_msg utility routine to send fw cmds
0e3612e06be4 mt76x0: remove unused mt76x0_mcu structure
a0b65ca60ec7 mt76x0: use mt76u_mcu_fw_send_data for fw uploading
01b302cd5874 mt76x0: remove unused routines for usb_buff alloc/free

-- 
https://patchwork.kernel.org/patch/10576059/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
