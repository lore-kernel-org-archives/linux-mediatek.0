Return-Path: <SRS0=LMMB=CJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D50CC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 01:52:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1DC720782
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 01:52:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZaAKzLCY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rckeqeT9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1DC720782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ISC5nyDbz9AQFsZZ9/XSrUMB3Ik6YN3+AY4xUqX9DfU=; b=ZaAKzLCYwWSdZFu4iekD0bSBV
	rlwVHTOcTH8llQpsbq49JweW1ZOGUJFjaPvezIcp8LCAeiaqzMupZpKmUHquUDt5OsQdFE6LjmBfa
	ZasWjS8YMOjHBwJD5uEp5tsmS8Z6gV/z9DKMPw868pfNc/+y5noXE9i15WbTFKMs/eTjlVkQCu1x7
	W1dK3TGByyLpQVr6tGLYNo8HF0ppaNJmpvlNUsdrbYLsHrfTXIPHJw8Bnt6mjMw/4mEjg8JSWKOtE
	EU0nm/vXnCIqT2I0F269NYycinLdQ3pwX34XZXngzBs4X/taX1Rhd8C5QkpkbchP4G+81DBDsSw9u
	XEvA0Dnyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCYzz-0003jj-AC; Mon, 31 Aug 2020 01:52:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCYzx-0003j8-Lz; Mon, 31 Aug 2020 01:52:42 +0000
X-UUID: 44973f302d8a47eebea27c4c7129932e-20200830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CKPJOw9Pxq9nUroeTbwTwZKLGO0Crpt83e3+Rzmhnfc=; 
 b=rckeqeT9blEUI8eczTUNnmz0uwebwQSnwayquCCYbLbjNdLo6sYcKCRR2T8yDXgkCNnLRDR0q/GXYstyk4s870/xRSPEYl8UYmKhQ3/GOSlmIZb6aW3PxW5bOTbUsWjHrYQudzfJvWFyhN/GyPgliS1UjS5xlQ22crvSCLrpLhs=;
X-UUID: 44973f302d8a47eebea27c4c7129932e-20200830
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2017848795; Sun, 30 Aug 2020 17:52:39 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 30 Aug 2020 18:52:38 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n2.mediatek.inc
 (172.21.101.56) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 31 Aug 2020 09:52:29 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 31 Aug 2020 09:52:29 +0800
Message-ID: <1598838655.7054.11.camel@mhfsdcap03>
Subject: Re: [PATCH v4] usb: mtu3: fix panic in mtu3_gadget_stop()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Date: Mon, 31 Aug 2020 09:50:55 +0800
In-Reply-To: <1598539328-1976-1-git-send-email-macpaul.lin@mediatek.com>
References: <1598520178-17301-1-git-send-email-macpaul.lin@mediatek.com>
 <1598539328-1976-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 77E100386F2C0ABE68A90833F81AA8EAAAE55A04FA2870F70C909006F70608A82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_215241_907831_86619ABB 
X-CRM114-Status: GOOD (  21.91  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Felipe Balbi <balbi@kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, Ainge Hsu <ainge.hsu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Macpaul Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-27 at 22:42 +0800, Macpaul Lin wrote:
> This patch fixes a possible issue when mtu3_gadget_stop()
> already assigned NULL to mtu->gadget_driver during mtu_gadget_disconnect().
> 
> [<ffffff9008161974>] notifier_call_chain+0xa4/0x128
> [<ffffff9008161fd4>] __atomic_notifier_call_chain+0x84/0x138
> [<ffffff9008162ec0>] notify_die+0xb0/0x120
> [<ffffff900809e340>] die+0x1f8/0x5d0
> [<ffffff90080d03b4>] __do_kernel_fault+0x19c/0x280
> [<ffffff90080d04dc>] do_bad_area+0x44/0x140
> [<ffffff90080d0f9c>] do_translation_fault+0x4c/0x90
> [<ffffff9008080a78>] do_mem_abort+0xb8/0x258
> [<ffffff90080849d0>] el1_da+0x24/0x3c
> [<ffffff9009bde01c>] mtu3_gadget_disconnect+0xac/0x128
> [<ffffff9009bd576c>] mtu3_irq+0x34c/0xc18
> [<ffffff90082ac03c>] __handle_irq_event_percpu+0x2ac/0xcd0
> [<ffffff90082acae0>] handle_irq_event_percpu+0x80/0x138
> [<ffffff90082acc44>] handle_irq_event+0xac/0x148
> [<ffffff90082b71cc>] handle_fasteoi_irq+0x234/0x568
> [<ffffff90082a8708>] generic_handle_irq+0x48/0x68
> [<ffffff90082a96ac>] __handle_domain_irq+0x264/0x1740
> [<ffffff90080819f4>] gic_handle_irq+0x14c/0x250
> [<ffffff9008084cec>] el1_irq+0xec/0x194
> [<ffffff90085b985c>] dma_pool_alloc+0x6e4/0xae0
> [<ffffff9008d7f890>] cmdq_mbox_pool_alloc_impl+0xb0/0x238
> [<ffffff9008d80904>] cmdq_pkt_alloc_buf+0x2dc/0x7c0
> [<ffffff9008d80f60>] cmdq_pkt_add_cmd_buffer+0x178/0x270
> [<ffffff9008d82320>] cmdq_pkt_perf_begin+0x108/0x148
> [<ffffff9008d824d8>] cmdq_pkt_create+0x178/0x1f0
> [<ffffff9008f96230>] mtk_crtc_config_default_path+0x328/0x7a0
> [<ffffff90090246cc>] mtk_drm_idlemgr_kick+0xa6c/0x1460
> [<ffffff9008f9bbb4>] mtk_drm_crtc_atomic_begin+0x1a4/0x1a68
> [<ffffff9008e8df9c>] drm_atomic_helper_commit_planes+0x154/0x878
> [<ffffff9008f2fb70>] mtk_atomic_complete.isra.16+0xe80/0x19c8
> [<ffffff9008f30910>] mtk_atomic_commit+0x258/0x898
> [<ffffff9008ef142c>] drm_atomic_commit+0xcc/0x108
> [<ffffff9008ef7cf0>] drm_mode_atomic_ioctl+0x1c20/0x2580
> [<ffffff9008ebc768>] drm_ioctl_kernel+0x118/0x1b0
> [<ffffff9008ebcde8>] drm_ioctl+0x5c0/0x920
> [<ffffff900863b030>] do_vfs_ioctl+0x188/0x1820
> [<ffffff900863c754>] SyS_ioctl+0x8c/0xa0
> 
> Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Cc: stable@vger.kernel.org
> ---
> Changes for v4:
>   - Add a "Fixes:" line.  Thanks Felipe.
> Changes for v3:
>   - Call synchronize_irq() in mtu3_gadget_stop() instead of remembering
>     callback function in mtu3_gadget_disconnect().
>     Thanks for Alan's suggestion.
> Changes for v2:
>   - Check mtu_gadget_driver out of spin_lock might still not work.
>     We use a temporary pointer to remember the callback function.
> 
>  drivers/usb/mtu3/mtu3_gadget.c |    1 +
>  1 file changed, 1 insertions(+)
> 
> diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
> index 1de5c9a..1ab3d3a 100644
> --- a/drivers/usb/mtu3/mtu3_gadget.c
> +++ b/drivers/usb/mtu3/mtu3_gadget.c
> @@ -564,6 +564,7 @@ static int mtu3_gadget_stop(struct usb_gadget *g)
>  
>  	spin_unlock_irqrestore(&mtu->lock, flags);
>  
> +	synchronize_irq(mtu->irq);
>  	return 0;
>  }
>  
Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
