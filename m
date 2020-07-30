Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6D5C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 16:34:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56F032082E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 16:34:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J8E8Kxi0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lBLrUmJQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56F032082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=crjHLyjjnLbX+cBONRlvM/ZU+vWe0poDmqR6LfU2Cxw=; b=J8E8Kxi0ebXLL6If9RgNpYh9j
	F5edBLj3dXWdp2SWJf3OhwO2jbMRnGlGm8T1u39m267N6/K5uoXDQ4LjC2aI1f84s9x8GBUKnaI1/
	I3dqE5Zo1B51cUfi4BjFQJVtXRZSFIAukU03s1vIsEFt8zBWglphWtobsRQNeJo6IESjZCAbo8D+S
	Dg+WURcEjSFZBxHjMTsH2aDiG7UzL9JR3lor6OlbKfkPP2MOiIlo3mVXGn4dCQWnfaBZaIIfQ7XD/
	QkMZC0r9nr6PJ2TNCeRgwofFh+1VEXlZ0m05OEp0KJVtK1lsl+D4JWWY477sSQdbl2x6tgUaIa933
	aTSmMPO+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1BVj-0003uR-38; Thu, 30 Jul 2020 16:34:27 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1BVg-0003st-NM
 for linux-mediatek@lists.infradead.org; Thu, 30 Jul 2020 16:34:25 +0000
Received: by mail-wr1-x443.google.com with SMTP id 88so25483054wrh.3
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2020 09:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OY2UZZNO5LoFUNWNmqvzQjaXu/4IwXq/RHkRHAApjs0=;
 b=lBLrUmJQX9VJPFwYT69dLDlzsDo8zAW0PO5jvXXZP3/XinvgCCZlBVOjDxJMf/UxCh
 I5cqvdLVLep8MkjWGC7JZkSSxaVClsy8MkrDU9+WGXUiU9Pj76bkOSKa5Hv92it1DIzX
 vGMuJkjTMfOT78JPZ7Q2ALMvGeYbbyJTKtvBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OY2UZZNO5LoFUNWNmqvzQjaXu/4IwXq/RHkRHAApjs0=;
 b=VpDXRIuo1hS02DWU7wfl5KaSwumC/V3cKGXRLhozxS4ITPldXvszQyBPoY6eI4xAdp
 +tETgxcPTmyjBFELOv+Rob8ZL4OsDZ66WFMuLlfLKJ5YmQlLDORFMrPd5hN9P7qTKKtZ
 B+a20gvZtBTqJpsBvNOnYKdIiUzBVz6BSsBDXlPwFRaXe0Gfo422qbMukeCvfvOdP1za
 rFUuOq04XCufz1usoritoxxYmNVAHb3CLpWAXxYEISajFpyhLdAIqkHFLAZvyYU4f13j
 wT7f8xrouO1FC80GZIDFfWprhD39c7uqfr5UREgZvPETd63qNPqJwNcPFsMj1MBuuOWy
 l3Ng==
X-Gm-Message-State: AOAM530E+W1QaPIfST5UKj9RubLg8Sh8U9vBBTpWfS0gztjb9ZrMDlqX
 1ttOGkTEhDZFvmbLBMb3FwKfOA==
X-Google-Smtp-Source: ABdhPJyd/og2bHNbufMlQHyw0CDJCp05jQFuR7xNgIFnvnG4uh2oyghPjdLycRR/FRn52yrO9lK8pw==
X-Received: by 2002:adf:f488:: with SMTP id l8mr3483642wro.123.1596126862114; 
 Thu, 30 Jul 2020 09:34:22 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id a134sm11060738wmd.17.2020.07.30.09.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 09:34:21 -0700 (PDT)
Date: Thu, 30 Jul 2020 16:34:19 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v10 22/28] media: platform: Change the call functions of
 getting/enable/disable the jpeg's clock
Message-ID: <20200730163419.GA3779380@chromium.org>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
 <20200723030451.5616-23-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723030451.5616-23-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_123424_826233_B195D151 
X-CRM114-Status: GOOD (  22.57  )
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
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Xia,

On Thu, Jul 23, 2020 at 11:04:45AM +0800, Xia Jiang wrote:
> Use the generic of_property_* helpers to get the clock_nums and clocks
> from device tree.
> Use the generic clk_bulk_* helpers to enable and disable clocks.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v10: new add patch
> ---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 47 +++++++++++++++----
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 ++--
>  2 files changed, 42 insertions(+), 13 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 7881e9c93df7..921ed21f7db3 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -783,14 +783,15 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  	ret = mtk_smi_larb_get(jpeg->larb);
>  	if (ret)
>  		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
> -	clk_prepare_enable(jpeg->clk_jdec_smi);
> -	clk_prepare_enable(jpeg->clk_jdec);
> +
> +	ret = clk_bulk_prepare_enable(jpeg->num_clks, jpeg->clks);
> +	if (ret)
> +		dev_err(jpeg->dev, "Failed to open jpeg clk: %d\n", ret);
>  }
>  
>  static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
>  {
> -	clk_disable_unprepare(jpeg->clk_jdec);
> -	clk_disable_unprepare(jpeg->clk_jdec_smi);
> +	clk_bulk_disable_unprepare(jpeg->num_clks, jpeg->clks);
>  	mtk_smi_larb_put(jpeg->larb);
>  }
>  
> @@ -939,6 +940,7 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
>  {
>  	struct device_node *node;
>  	struct platform_device *pdev;
> +	int ret, i;
>  
>  	node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
>  	if (!node)
> @@ -952,12 +954,39 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
>  
>  	jpeg->larb = &pdev->dev;
>  
> -	jpeg->clk_jdec = devm_clk_get(jpeg->dev, "jpgdec");
> -	if (IS_ERR(jpeg->clk_jdec))
> -		return PTR_ERR(jpeg->clk_jdec);
> +	jpeg->num_clks =
> +		of_property_count_strings(jpeg->dev->of_node, "clock-names");
> +
> +	if (jpeg->num_clks > 0) {
> +		jpeg->clks = devm_kcalloc(jpeg->dev, jpeg->num_clks,
> +					  sizeof(struct clk_bulk_data),
> +					  GFP_KERNEL);
> +		if (!jpeg->clks)
> +			return -ENOMEM;
> +	} else {
> +		dev_err(&pdev->dev, "Failed to get jpeg clock count\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < jpeg->num_clks; i++) {
> +		ret = of_property_read_string_index(jpeg->dev->of_node,
> +						    "clock-names", i,
> +						    &jpeg->clks->id);

The names of the clocks must be explicitly specified in the driver, as per
the DT bindings.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
