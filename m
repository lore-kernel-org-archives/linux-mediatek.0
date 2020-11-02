Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44882C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 19:40:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3F8F2225E
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 19:40:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OfIrTM3q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSRBOUtk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3F8F2225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0gFUoUnycJSVpKY2vQk++bTvDjpDiUuiATijY+u1BEQ=; b=OfIrTM3q4nGoYTH1MYxPWcue2
	b8Cr//MBKTKLbt+Ex4twOBjyiVAbhn95i15D9/+19ltcK/pvdp5ZQB4lgI8JHul2pSx8+P4CRN4EJ
	Lo1M8mjv9h+vvXl16jRxGvD4gbFXRPeVqq6YfSvxm6Rd9e71eMUsEd5yWayROOcx6dxw2w54C9b7l
	Rx7J3WMnlDdmb2sQs6QzdUN5rMkt2Fhew7oL2UYDLWq9+5FZ+WXAFF68TG/vNy+oybE07CQttNdjr
	KLOu8PJ4BdsEDOfoUsLMrhuYrbiSkJ5X/T33vxx8a0/e2ea0P2C6RBQovBQK+OPXNk5a/9NpoqQQP
	zOU0WQDjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZfgX-0003KV-Rp; Mon, 02 Nov 2020 19:40:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZfgQ-0003G2-2V; Mon, 02 Nov 2020 19:40:03 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F8CA22268;
 Mon,  2 Nov 2020 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604346000;
 bh=IWunD2Cz2xcaCwPBQNJRvEa6f66eGVu+ZtfdVqx9Ivk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cSRBOUtkHP+xHtFE878bi0AZQGfo0GAygXV2x1BUU+joBUGj/03cbHOYhxbsOxBoD
 +DrMG+Qro8hQLQ4rlVnq0Xf+SR9GmrAw7nPRFzY3UPRWJWTFIvABJVAz2xF+YU20hr
 SH6n/VG6nEZIsoqBbXt3mmxNdFr+TZdllKa7DAGY=
Date: Mon, 2 Nov 2020 20:40:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "siddhant gupta(siddhant1223)" <siddhantgupta416@gmail.com>
Subject: Re: [PATCH] staging: mt7621-dma: Prefer Using BIT Macro instead of
 left shifting on 1.
Message-ID: <20201102194055.GA2429929@kroah.com>
References: <20201102193402.GA14965@Sleakybeast>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102193402.GA14965@Sleakybeast>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_144002_317924_DC3CB577 
X-CRM114-Status: GOOD (  15.98  )
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
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, mamatashukla555@gmail.com, himadrispandya@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03, 2020 at 01:04:02AM +0530, siddhant gupta(siddhant1223) wrote:
> 
> Replace left shifting on 1 by a BIT macro to fix checkpatch warning.
> 
> Signed-off-by: Siddhant Gupta <siddhantgupta416@gmail.com>
> 
> ---
>  drivers/staging/mt7621-dma/mtk-hsdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
> index 354536783e1c..a9e1a1b14035 100644
> --- a/drivers/staging/mt7621-dma/mtk-hsdma.c
> +++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
> @@ -72,7 +72,7 @@
>  #define HSDMA_GLO_TX_DMA		BIT(0)
>  
>  #define HSDMA_BT_SIZE_16BYTES		(0 << HSDMA_GLO_BT_SHIFT)
> -#define HSDMA_BT_SIZE_32BYTES		(1 << HSDMA_GLO_BT_SHIFT)
> +#define HSDMA_BT_SIZE_32BYTES		BIT(HSDMA_GLO_BT_SHIFT)
>  #define HSDMA_BT_SIZE_64BYTES		(2 << HSDMA_GLO_BT_SHIFT)
>  #define HSDMA_BT_SIZE_128BYTES		(3 << HSDMA_GLO_BT_SHIFT)

In looking at the code, does this change really make sense?

(hint, I don't think so...)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
