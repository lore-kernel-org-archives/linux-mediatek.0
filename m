Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBF1C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 13:32:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43F326109E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 13:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43F326109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBoQpmibezv8bWnziP/TZ3VIvsH/UcGX+xGpIzG9CpA=; b=2UX0+BAsof+LRE
	eRe6m13/FmmK1Lh8fpEqZY5b4UsWCWBC8rXG2PsAXrGgkXi9Wfneiu4Md/jGKWP1yEtfPX/vq1BB2
	RbeiwhJfidshCW5Y7k7G9YibenmJMTKLYHeRoj20mQ+UayvRAl8tFxC9eIAhurKHUm9/PrTmJHx4k
	AwRTC6S9i5PIv087LrfE5tk14eQkr9Nsg9gGH1a9F+bFakp83GcJkPLGMVF1aHjOM0ednXn3Y4Z7Z
	DI14VMbw0vxaMrvZ7h5wN72ww2iaCdH+q7VOdofbRIRzaLK4dD4DB5jYG9quR9pjecO3n6v6zSn4b
	9NQkZsC/73giEPhjYf0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lts7Y-00AUeL-Vt; Thu, 17 Jun 2021 13:31:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lts7M-00AUNa-4T; Thu, 17 Jun 2021 13:31:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C81D6044F;
 Thu, 17 Jun 2021 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623936695;
 bh=u0qd6O0XohK2blFPQxVjvBt/wYTUHl/fZzzKtLhEk7E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gsmcnqVxOrJtKmRUja/eV6hZhh9xFUtY4FQU7G4cPnZWA3Z/MNAN+W/ur6Sazs6VL
 sI+R36fTde9mqKcZZjB3PQ48qhcdWlLZDRrZmLa7XrNtiXCzhJQkbaodqG+fs60A/h
 06kGpw4YNvtfIm0YJD5yKXkPtL4igREkK3VE7RgY=
Date: Thu, 17 Jun 2021 15:31:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ikjoon Jang <ikjn@chromium.org>, Tianping Fang <tianping.fang@mediatek.com>
Subject: Re: [PATCH] usb: xhci-mtk: allow multiple Start-Split in a microframe
Message-ID: <YMtOtC1j2DouJ9Is@kroah.com>
References: <1623895911-29259-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623895911-29259-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_063136_236071_6058C1B5 
X-CRM114-Status: GOOD (  19.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 17, 2021 at 10:11:51AM +0800, Chunfeng Yun wrote:
> This patch is used to relax bandwidth schedule by allowing multiple
> Start-Split in the same microframe.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/host/xhci-mtk-sch.c | 16 ----------------
>  drivers/usb/host/xhci-mtk.h     |  2 --
>  2 files changed, 18 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index c07411d9b16f..149a0f4a6ec4 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -470,11 +470,9 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
>  
>  static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>  {
> -	struct mu3h_sch_tt *tt = sch_ep->sch_tt;
>  	u32 extra_cs_count;
>  	u32 start_ss, last_ss;
>  	u32 start_cs, last_cs;
> -	int i;
>  
>  	if (!sch_ep->sch_tt)
>  		return 0;
> @@ -491,10 +489,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>  		if (!(start_ss == 7 || last_ss < 6))
>  			return -ESCH_SS_Y6;
>  
> -		for (i = 0; i < sch_ep->cs_count; i++)
> -			if (test_bit(offset + i, tt->ss_bit_map))
> -				return -ESCH_SS_OVERLAP;
> -
>  	} else {
>  		u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
>  
> @@ -521,9 +515,6 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>  		if (cs_count > 7)
>  			cs_count = 7; /* HW limit */
>  
> -		if (test_bit(offset, tt->ss_bit_map))
> -			return -ESCH_SS_OVERLAP;
> -
>  		sch_ep->cs_count = cs_count;
>  		/* one for ss, the other for idle */
>  		sch_ep->num_budget_microframes = cs_count + 2;
> @@ -558,13 +549,6 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
>  	for (i = 0; i < num_esit; i++) {
>  		base = sch_ep->offset + i * sch_ep->esit;
>  
> -		for (j = 0; j < bits; j++) {

Now that bits is no longer used, we get a build warning.

Can you fix this patch and resend it?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
