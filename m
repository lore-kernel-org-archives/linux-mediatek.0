Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A642CA0EFF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Aug 2025 05:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNO/sZh36BtvOrIs0dymop8RasdaGvxzbWCoCMoiUko=; b=qD62VdK3xX13faW9/SCtrfM9pG
	Zou7x3JM7HO4/V42fP32tVWjNyo1tyla7BONQFmfDFiJ8Q1qRatESijrVx3U3nWoRkXar8xfNoU2T
	+xOjk74Mdmi39Q6MfVoLfZ/U1BSgGC6YCFUfiW0N7qqIkOJO40h0r29HmAsTOf/VRFLQHXQaFlX72
	bIEdvlawPIBxGNBTjg9m/pUCDWS6Cxlfgrc3hXzDR4wcqy689PEEnW7cDaCXY5u8YYXxE6vo/19yJ
	Jzn/OK6zg6qbYKhvTf5lWfUtA3lWtJ28cSXvdtIcjCt9iHVt26OK5QUMmUybiFOJSnSNk5F6H7hLZ
	yj9bdk7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usDsC-00000007SYt-1409;
	Sat, 30 Aug 2025 05:11:32 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usDs8-00000007SYU-3GQv
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Aug 2025 05:11:30 +0000
Received: from [192.168.0.192] (ip5f5af7fb.dynamic.kabel-deutschland.de [95.90.247.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AED366004C2C9;
	Sat, 30 Aug 2025 07:11:10 +0200 (CEST)
Message-ID: <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de>
Date: Sat, 30 Aug 2025 07:11:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btmtksdio: Fix build after header cleanup
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 oe-kbuild-all@lists.linux.dev, Marcel Holtmann <marcel@holtmann.org>,
 Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org
References: <202508300413.OnIedvRh-lkp@intel.com>
 <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_221128_969703_2F32D220 
X-CRM114-Status: GOOD (  19.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Calvin,


Thank you for your patch, and addressing the regression right away.

Am 30.08.25 um 02:50 schrieb Calvin Owens:
> Syzbot found a randconfig which fails after my recent patch:
> 
>      drivers/bluetooth/btmtksdio.c:442:33: error: array type has incomplete element type ‘struct h4_recv_pkt’
>        442 | static const struct h4_recv_pkt mtk_recv_pkts[] = {
>            |                                 ^~~~~~~~~~~~~
>      drivers/bluetooth/btmtksdio.c:443:11: error: ‘H4_RECV_ACL’ undeclared here (not in a function)
>        443 |         { H4_RECV_ACL,      .recv = btmtksdio_recv_acl },
>            |           ^~~~~~~~~~~
>      drivers/bluetooth/btmtksdio.c:444:11: error: ‘H4_RECV_SCO’ undeclared here (not in a function)
>        444 |         { H4_RECV_SCO,      .recv = hci_recv_frame },
>            |           ^~~~~~~~~~~
>      drivers/bluetooth/btmtksdio.c:445:11: error: ‘H4_RECV_EVENT’ undeclared here (not in a function)
>        445 |         { H4_RECV_EVENT,    .recv = btmtksdio_recv_event },
> 
> ...because we can have BT_MTKSDIO=y with BT_HCIUART_H4=n, and the
> definitions used here are gated on BT_HCIUART_H4 in hci_uart.h.

The drivers below seem to be affected:

     drivers/bluetooth/bpa10x.c:     { H4_RECV_EVENT,   .recv = 
hci_recv_frame },
     drivers/bluetooth/btmtksdio.c:  { H4_RECV_EVENT,    .recv = 
btmtksdio_recv_event },
     drivers/bluetooth/btmtkuart.c:  { H4_RECV_EVENT,    .recv = 
btmtkuart_recv_event },
     drivers/bluetooth/btnxpuart.c:  { H4_RECV_EVENT,        .recv = 
hci_recv_frame },

> I think the simplest way to fix this is to remove the gate on the
> definitions in hci_uart.h. Since the constants are macros, there's no
> runtime cost to doing so, and nothing seems to rely on their absence in
> the BT_HCIUART_H4=n case.

Looking at the implementation, it looks like they only work with the H4 
protocol? So maybe, that should be denoted in the Kconfig files?

> I let randconfig builds run for awhile in drivers/bluetooth/ and didn't
> hit anything else, so hopefully this was the only fallout.
> 
> Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508300413.OnIedvRh-lkp@intel.com/
> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>   drivers/bluetooth/hci_uart.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
> index 5ea5dd80e297..fd0624988aba 100644
> --- a/drivers/bluetooth/hci_uart.h
> +++ b/drivers/bluetooth/hci_uart.h
> @@ -121,7 +121,6 @@ void hci_uart_set_flow_control(struct hci_uart *hu, bool enable);
>   void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
>   			 unsigned int oper_speed);
>   
> -#ifdef CONFIG_BT_HCIUART_H4
>   int h4_init(void);
>   int h4_deinit(void);
>   
> @@ -165,7 +164,6 @@ struct h4_recv_pkt {
>   struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
>   			    const unsigned char *buffer, int count,
>   			    const struct h4_recv_pkt *pkts, int pkts_count);
> -#endif
>   
>   #ifdef CONFIG_BT_HCIUART_BCSP
>   int bcsp_init(void);

It’s a valid fix.

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

