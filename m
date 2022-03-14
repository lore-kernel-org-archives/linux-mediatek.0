Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A86C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 22:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHsFQX0zVeeZqZo4ykuj0796kmHFJw+on4ZxZ46eI5w=; b=LFfo6wGjYoMbhn
	zl+flNJRNF+dfm4AUOqFtKkpbwWQbCGC5sVMLV/l+ggjUaFPcol7mU4Q3kH9KCXWJjmtplEiV+r5T
	qPx9y5BT4MFS6R0Ha5IohnXB26/eYp5LR13CQY6KoUSydSPeNOD7L3p+4U9pSX4lJd1AlxrnDQxNI
	R5QbzyLhgnhFsfryWJ+k+tzXkVJoae937Vk6Ija1yp0GjN6kH+ZHoUHirOzvJSxel+pErg5eYL2QE
	/ZS7r34/H+DMk/dvrMxTPAtfaFTcYCPo/btZjBAgNxORLivBtDijSe2Sc+OIgAZL2SBA1D71EdKE6
	nVGWHKbM4WjkTZkiY6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTtAP-0071qx-Jk; Mon, 14 Mar 2022 22:27:53 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTtAD-0071oU-M6
 for linux-mediatek@lists.infradead.org; Mon, 14 Mar 2022 22:27:43 +0000
Received: by mail-oo1-xc30.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so22320828oot.11
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Mar 2022 15:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lpISCI/Ldp2ZkDjSdXy+XxHBdMq+2i8M+iR+Wj/TmxI=;
 b=FSWP4VZ/rSXb9qrV1Oeet9ZEJaCd66it/y7godMtyQLOuMqXFPz8nhmIAUjynsGqsj
 xMQ16ip563mQMttvihWIpDXyM+IHlqy0Hu3CGr76bXYXMXevfI5IzcwSVwnTjsDG/T8p
 6ZqJ0IMMvBkY99NkHpyEG5p7DFJaDjno2AmvEaIMJOR05LosC6ISrOy4FIoXDVw96Sni
 PpJuNLBa0MxRifeceQQoXPPxQ2b/n4vLqmHIJ8n9/AS2nue0G0GUZ+5dz6lSQEj39eaZ
 tfCkx7Y0u60ZnMeT8ydGHUSqmumMJEfoIczQMH9R3Fuj1722cTgCiIlz4ZEO33XOMUhu
 VHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lpISCI/Ldp2ZkDjSdXy+XxHBdMq+2i8M+iR+Wj/TmxI=;
 b=gTD8zshN7Qne5EA/1qp2KOqWSVO28oi3V+8xuflLiuyL2dDMOAz19nNzm9UQPhRzBA
 2cqnaLRVP1kYaeAuAtslbQsujT68zgocQp2n3v7KSCFQ36oGvYOPiKq/z1/8PbfIY4Uj
 cih4Iot+r5iQtzdO8OpEa6OzwaPYIU2WRg3omtMRFmw/fMU+wdX7EFNP3JjFfeJxw9mM
 z8Gv4DUxYKFe1CTzg+Qs8i3ws8hQDQn1ScI1kNZ5Cy2u0RpjmRhP7SzSfS46Xv+hL/5P
 7YbOBAIBLpHRExyZvoa4syd7FkUymxSP7gM5FclyGU20ERIW0ztiWCH/F1aLyXAmnyZG
 BKlA==
X-Gm-Message-State: AOAM532VxKG7iXTYmpMBlJsDscoX6I/5KtzhwQqO5Irqres2G4Ek/kxO
 Rj4HtxQrTg3jSVXBeiySMZDhpA==
X-Google-Smtp-Source: ABdhPJxmeIMIwdljPYgEiOpLwwF50yShXUo59tqn9r0ZE1A2Pyb2elUZbs81pJLhj0EN+3dSb5i+Ng==
X-Received: by 2002:a4a:d747:0:b0:320:d7c2:4357 with SMTP id
 h7-20020a4ad747000000b00320d7c24357mr10664075oot.92.1647296860481; 
 Mon, 14 Mar 2022 15:27:40 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 ay39-20020a056820152700b003209eddff85sm7905003oob.45.2022.03.14.15.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 15:27:39 -0700 (PDT)
Date: Mon, 14 Mar 2022 17:27:37 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: ohad@wizery.com, mathieu.poirier@linaro.org, robh+dt@kernel.or,
 matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, khilman@baylibre.com,
 Julien STEPHAN <jstephan@baylibre.com>
Subject: Re: [PATCH v4 5/7] remoteproc: mtk_apu: Use match_data
Message-ID: <Yi/BWTRGu5sbpw7S@builder.lan>
References: <20220304161514.994128-1-abailon@baylibre.com>
 <20220304161514.994128-6-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304161514.994128-6-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_152741_754239_B7AC6A03 
X-CRM114-Status: GOOD (  23.82  )
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

On Fri 04 Mar 10:15 CST 2022, Alexandre Bailon wrote:

> From: Julien STEPHAN <jstephan@baylibre.com>
> 
> This commits prepare the driver to be more generic in order to support
> multiple platform using the compatible property.
> To do that, put some register values and the clocks names inside
> private data.
> 
> Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  drivers/remoteproc/mtk_apu.c | 35 ++++++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_apu.c b/drivers/remoteproc/mtk_apu.c
> index 3905eb5b7174..deec51b86ba5 100644
> --- a/drivers/remoteproc/mtk_apu.c
> +++ b/drivers/remoteproc/mtk_apu.c
> @@ -58,12 +58,20 @@
>  
>  #define APU_RESET_DELAY				(27)
>  
> +struct mtk_apu_conf {
> +	u32 core_default0;
> +	u32 core_default1;
> +	u32 num_clks;
> +	const char * const *clk_names;
> +};
> +
>  struct mtk_apu_rproc {
>  	struct device *dev;
>  	void __iomem *base;
>  	int irq;
>  	unsigned int num_clks;
>  	struct clk_bulk_data *clks;
> +	struct mtk_apu_conf *conf;
>  	struct iommu_domain *domain;
>  	struct list_head mappings;
>  
> @@ -81,6 +89,13 @@ static const char * const mt8183_clk_names[] = {
>  	"jtag"
>  };
>  
> +static const struct mtk_apu_conf mt8183_conf = {
> +	.core_default0 = (0x10 << 23) | (0x10 << 18),

CORE_DEFAULT0_AWUSER_USE_IOMMU | CORE_DEFAULT0_ARUSER_USE_IOMMU ?

> +	.core_default1 = (0x10 << 0) | (0x10 << 5),

CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU | CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU ?

Regards,
Bjorn

> +	.num_clks = ARRAY_SIZE(mt8183_clk_names),
> +	.clk_names = mt8183_clk_names
> +};
> +
>  static int mtk_apu_iommu_map(struct rproc *rproc, struct rproc_mem_entry *entry)
>  {
>  	struct mtk_apu_rproc *apu_rproc = rproc->priv;
> @@ -289,10 +304,9 @@ static int mtk_apu_rproc_start(struct rproc *rproc)
>  	writel(core_ctrl, apu_rproc->base + CORE_CTRL);
>  
>  	/* Configure memory accesses to go through the IOMMU */
> -	writel(CORE_DEFAULT0_AWUSER_USE_IOMMU | CORE_DEFAULT0_ARUSER_USE_IOMMU |
> -	      CORE_DEFAULT0_QOS_SWAP_1, apu_rproc->base + CORE_DEFAULT0);
> -	writel(CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU |
> -		CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU,
> +	writel(apu_rproc->conf->core_default0 | CORE_DEFAULT0_QOS_SWAP_1,
> +		apu_rproc->base + CORE_DEFAULT0);
> +	writel(apu_rproc->conf->core_default1,
>  		apu_rproc->base + CORE_DEFAULT1);
>  
>  	/* Release the APU */
> @@ -565,11 +579,18 @@ static int mtk_apu_rproc_probe(struct platform_device *pdev)
>  		goto free_rproc;
>  	}
>  
> -	apu_rproc->num_clks = ARRAY_SIZE(mt8183_clk_names);
> +
> +	apu_rproc->conf = (struct mtk_apu_conf *)device_get_match_data(dev);
> +	if (!apu_rproc->conf) {
> +		ret = -ENODEV;
> +		goto free_rproc;
> +	}
> +
> +	apu_rproc->num_clks = apu_rproc->conf->num_clks;
>  	apu_rproc->clks = devm_kcalloc(dev, apu_rproc->num_clks,
>  				     sizeof(*apu_rproc->clks), GFP_KERNEL);
>  	for (i = 0; i < apu_rproc->num_clks; ++i)
> -		apu_rproc->clks[i].id = mt8183_clk_names[i];
> +		apu_rproc->clks[i].id = apu_rproc->conf->clk_names[i];
>  
>  	ret = devm_clk_bulk_get(dev, apu_rproc->num_clks, apu_rproc->clks);
>  	if (ret) {
> @@ -611,7 +632,7 @@ static int mtk_apu_rproc_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id mtk_apu_rproc_of_match[] = {
> -	{ .compatible = "mediatek,mt8183-apu", },
> +	{ .compatible = "mediatek,mt8183-apu", .data = &mt8183_conf },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mtk_apu_rproc_of_match);
> -- 
> 2.34.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
