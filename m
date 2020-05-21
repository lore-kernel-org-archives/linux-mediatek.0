Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767F2C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 16:01:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 432242072C
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 16:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u0pQ0X/y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GeTX2t72"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 432242072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixfuBtHZKIeEgDhK3BjP0LsRX6fxmsAd/sxprPvhX3c=; b=u0pQ0X/yxGOZfg
	6aAl69hwxoxrUQ7aEzzB4NPZrUbCVWFS+w2c28GpoKEWKdpNzteAFCFS8rVQklwlycQl56MR9n4Rc
	FjhRydELzyRD+/X6ZdCc0ylhmDgjE+gOOxxbxao2JTk1mWnIXWiEcb4cCGdIb496lKmKbO5o/UKJm
	qxuR50OZuxhO9BRat2RJnRDdC/hmG02OD494pYWBNuKNJcABwYfDfMLfKPy/C28CcxYb8aBGs0QEM
	9WYs4w1IVGdY47Ins339H+FxY+8ZRDwlhZmupdy99tbyHFOl3b7WsMmgc6kQq5+q8XejEvea20FY/
	COuiXO3Cf6sVD3vhlm+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbncr-00061p-CE; Thu, 21 May 2020 16:00:53 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbnco-00060u-Pr
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 16:00:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id n5so6912939wmd.0
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=l1/7oVopGR8ZQd6NaIEuCXZDCOqHLrR/3N7LZWtpNqA=;
 b=GeTX2t72tcZNw5Q1Vq3bxOOwmr927HcyIkpXvBpKk0ZxuhWAwrGZ2fRvHtBA+vCd0a
 shiz7RMixnasTu8+CYC9VSFQPu/XFvPZUYSqT+77V10ReU/ZVMLAWMEwJi0ovuk6Cshd
 DWBNncRW5nBLTOcjfC9jlB3vujEzgdkgNY/1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l1/7oVopGR8ZQd6NaIEuCXZDCOqHLrR/3N7LZWtpNqA=;
 b=hqSA74RCDWkzp3NI1XbVvSwLJ0H6tOAz/Wy7LWDw1tjaAUekWUH95gFMOgMn0FyaHL
 yVw8yvxVT/U6HPqrKP4JAJADp6BgH/QT2JoLNiiPUaa8gDztn6+9J7ZnGi3laS3NUcdf
 oztaXbK4HaHhPrOrr3RKx8+G/1+65AUzt2X1g2uBe5lWC5lsy6WpZShGwpwYIQVZrDze
 CJdScMbTAAhNutYUPYdnhVMnVlVp1ja1tLImWhhxL26hEXPhGjYmh5amn4txePuiI0I8
 nvIiM94ix84L4D1lDkkwk5ppIcbNiddmKIypat3z5GoOqMi82sD6ZLkp9wtzh0hZE0OB
 8zlQ==
X-Gm-Message-State: AOAM530BM/znkUz7IzQGkDcyRoEr2IuNsJXM20i17eqB1mkentZPSXYa
 jPuqDVJHl//UzLdHyY+UmcDyxQ==
X-Google-Smtp-Source: ABdhPJwBbbkzQM0pkq+XJy1eUeL/VqXKXEJpvr6yzQ+SOqXN0RpdIlsOxlmRNdPbmgSFjRlsFB6ApA==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr8868032wmj.146.1590076848935; 
 Thu, 21 May 2020 09:00:48 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id y207sm7661823wmd.7.2020.05.21.09.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:00:48 -0700 (PDT)
Date: Thu, 21 May 2020 16:00:46 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v8 11/14] media: dt-bindings: Add jpeg enc device tree
 node document
Message-ID: <20200521160046.GJ209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-12-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-12-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_090050_862929_69721CB4 
X-CRM114-Status: GOOD (  17.82  )
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
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org, mojahsu@chromium.org,
 srv_heupstream@mediatek.com, Rick Chang <rick.chang@mediatek.com>,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 sj.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yong.wu@mediatek.com,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Xia,

On Fri, Apr 03, 2020 at 05:40:30PM +0800, Xia Jiang wrote:
> Add jpeg enc device tree node document
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> 
> v7: no changes
> 
> v6: no changes
> 
> v5: no changes
> 
> v4: no changes
> 
> v3: change compatible to SoC specific compatible
> 
> v2: no changes
> ---
>  .../bindings/media/mediatek-jpeg-encoder.txt  | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> new file mode 100644
> index 000000000000..fa8da699493b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> @@ -0,0 +1,37 @@
> +* MediaTek JPEG Encoder
> +
> +MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
> +
> +Required properties:
> +- compatible : should be one of:
> +               "mediatek,mt2701-jpgenc"
> +               ...

What does this "..." mean?

> +               followed by "mediatek,mtk-jpgenc"
> +- reg : physical base address of the JPEG encoder registers and length of
> +  memory mapped region.
> +- interrupts : interrupt number to the interrupt controller.
> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- clock-names: must contain "jpgenc". It is the clock of JPEG encoder.

nit: In principle the clocks should be named after the function the clock
performs on the consumer side, i.e. the JPEG block in this case, I guess
here it's just a generic clock that does everything, but I guess it comes
from somewhere. Is it the AHB clock or something? In that case it would
normally be called "ahb".

> +- power-domains: a phandle to the power domain, see
> +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> +- mediatek,larb: must contain the local arbiters in the current SoCs, see
> +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> +  for details.

I believe this isn't necessary anymore, because larbs are added
automatically by the MTK IOMMU driver using device links. +CC Yong who
worked on that.

> +- iommus: should point to the respective IOMMU block with master port as
> +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +  for details.
> +
> +Example:
> +	jpegenc: jpegenc@1500a000 {
> +		compatible = "mediatek,mt2701-jpgenc",
> +			     "mediatek,mtk-jpgenc";
> +		reg = <0 0x1500a000 0 0x1000>;
> +		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> +		clocks =  <&imgsys CLK_IMG_VENC>;
> +		clock-names = "jpgenc";
> +		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> +		mediatek,larb = <&larb2>;

Ditto.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
