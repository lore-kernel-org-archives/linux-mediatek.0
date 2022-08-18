Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E1EC00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 17:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LaZOyiObHkyEhZNc2TFYjhypH1nyLZblVQUB+V6qQA=; b=eT/9iac4j+akaYEXsmocGMWQy6
	+gktvm0jVgzAd+isC77p/wI6jQh2JmJFjg4AHS1Adb3VDGUmxZu0Ol0j1jnS8x8WWIY2JLgAlWzUu
	QQugCcM/1AaCmP/wYPw99QkAc+V8nUpfAqKSVEN1CMILQRsutZ5RH8tue0dGPd42r/IQfPAb++xr8
	/GgxTl6xI6v3SGjXhjDhculWArVR3nd6zL929gdInAj9xL9zpw3xta3x9bHn1hpX9EVtW+xe3hOmE
	vVfbO+xFlRc9cfQcL1AQ3zCCpN27gz+pvc5baOP6QFc/+UOW3D9ptvhuOoRpjn+PtYpKpS3LuyXdK
	xzbmoOng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOjd9-007h9I-V7; Thu, 18 Aug 2022 17:48:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOjcy-007h3M-1N; Thu, 18 Aug 2022 17:48:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE9BF61735;
	Thu, 18 Aug 2022 17:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F13C433C1;
	Thu, 18 Aug 2022 17:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1660844898;
	bh=udomEyyFxdEYeJSomBe9t/Lqt0I7Cxz89UK62m0Wvw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Br7DMj0OTnbMu5MA/Vo9QfrhjNhiI0219bY6t+oWXGFdvlEO1qE6Rd21K2bWtYkAL
	 EBzjFObkmkG/Mn2pM0Gmhq1BtKqr2SfCJtaGvB58WWUZAQy/Rw9P00tJvWmEK4PY4B
	 kFLHI2g77BvnlRezTbo9dVrWsqjiiq+WuVHYFCVs=
Date: Thu, 18 Aug 2022 19:48:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ikjoon Jang <ikjn@chromium.org>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH v2 1/2] usb: xhci-mtk: relax TT periodic bandwidth
 allocation
Message-ID: <Yv57X37JcYCBhabS@kroah.com>
References: <20220805060328.6189-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805060328.6189-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_104820_161040_B0C672F2 
X-CRM114-Status: GOOD (  23.59  )
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

On Fri, Aug 05, 2022 at 02:03:27PM +0800, Chunfeng Yun wrote:
> Currently uses the worst case byte budgets on FS/LS bus bandwidth,
> for example, for an isochronos IN endpoint with 192 bytes budget, it
> will consume the whole 5 uframes(188 * 5) while the actual FS bus
> budget should be just 192 bytes. It cause that many usb audio headsets
> with 3 interfaces (audio input, audio output, and HID) cannot be
> configured.
> To improve it, changes to use "approximate" best case budget for FS/LS
> bandwidth management. For the same endpoint from the above example,
> the approximate best case budget is now reduced to (188 * 2) bytes.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: change commit message
> ---
>  drivers/usb/host/xhci-mtk-sch.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk-sch.c
>  b/drivers/usb/host/xhci-mtk-sch.c
> index 06a6b19acaae..a17bc584ee99 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -425,7 +425,6 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info
>  *sch_ep, int offset)
>  
>  static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
>  {
> -	u32 extra_cs_count;
>  	u32 start_ss, last_ss;
>  	u32 start_cs, last_cs;
>  
> @@ -461,18 +460,12 @@ static int check_sch_tt(struct mu3h_sch_ep_info
>  *sch_ep, u32 offset)
>  		if (last_cs > 7)
>  			return -ESCH_CS_OVERFLOW;
>  
> -		if (sch_ep->ep_type == ISOC_IN_EP)
> -			extra_cs_count = (last_cs == 7) ? 1 : 2;
> -		else /*  ep_type : INTR IN / INTR OUT */
> -			extra_cs_count = 1;
> -
> -		cs_count += extra_cs_count;
>  		if (cs_count > 7)
>  			cs_count = 7; /* HW limit */
>  
>  		sch_ep->cs_count = cs_count;
> -		/* one for ss, the other for idle */
> -		sch_ep->num_budget_microframes = cs_count + 2;
> +		/* ss, idle are ignored */
> +		sch_ep->num_budget_microframes = cs_count;
>  
>  		/*
>  		 * if interval=1, maxp >752, num_budge_micoframe is larger
> -- 
> 2.18.0
> 

This doesn't apply to my tree without fuzz, and when I force it, I get a
build error.  Can you please rebase against 6.0-rc1 and resend?

thanks,

greg k-h

