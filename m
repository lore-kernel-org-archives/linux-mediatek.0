Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6474C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 22:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0w/d9sj+eQP/KumVb27tqn78q+jh8ljXd5qf3YqYI8=; b=vjHzPvSUNuZ/rY
	dJyWNDndes0e/msnmNf5Bw4Xi+W4bdkRS7/32YC1JanA5vav21MxeEyG/JrU3oqIPl2prSt0TePyL
	e8OQ96pGny6WRCSC+EeC12CiDqgcE/3S0VTCmtqDFOn5dvi2hf3cK0byrY8p9TdZp6aZUHIIUyUhm
	s78FVBtE1OD36kbuh4Ix8UMJVyA/20K9FttMjqWGbAl/oVDPpLaWnOiWmzF9BPB3cLyBsJwYgOMmZ
	cT8PEYny1Kv5v1QmoaWAB4P7KwGU5nQG0otjgV3lCCn0osUSEm6YjJducFAPpE/AyaqkM+FSOiC8u
	DmfWXU0lpcXhoeIFKhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTtBA-00722h-AC; Mon, 14 Mar 2022 22:28:40 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTtAw-0071xY-Vc
 for linux-mediatek@lists.infradead.org; Mon, 14 Mar 2022 22:28:28 +0000
Received: by mail-oo1-xc34.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso22117056oop.13
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Mar 2022 15:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nQWuqg+ddOw1oV88Ty6v00QRPKt0GAj8NU+qEDYWO1I=;
 b=DWIDuPdANPxggwyxysS41MKFKbgxS7fkRxBrxcq4WZhLsEOVoC/190qUjKO0WrcEz2
 HiK0siER3AD5sgCRTQNgQ8/N5EX2OLxSNRG5cZ0leQS9KUP9kapFMG+dof6VDruanClL
 hh8qFFy6AiVYFXWrs6N4xXfPTWx6g5ZU1zLrOgwulN+/ejxqi1Pv/GF3zKo/R1ZmghSX
 yPFU8OfhQva/95dcbXAVEdH9oDcVDxRUT02RDoqZa2FGx3TcjyjRG8U7wOki+KQLldGY
 XdcI2t/BkHas1esRbgo4ySE9bY98ZY1WelKEct+9PpPijyvyMOujB6o3CErj58wtXgEK
 C3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nQWuqg+ddOw1oV88Ty6v00QRPKt0GAj8NU+qEDYWO1I=;
 b=mCwbtf+8vF+d2KQokb4P3UCbScJjgA1ACGEMAVlYq8oXn8/i5MD6j+E5ZujnN4Kw0b
 aHvLudtuSk48edlEA71+8iLcWLurWSlWcxOikHpDD4EpwixKns/xGp8Js8i2MrivgP9g
 oj5muQPBucncxjW/h9zXAqSt3OSK5JQWAIwCn5LoAOfh2T/fISz3htL2Y0fTPvTHEM4R
 3ezNW1rhviNpUXSAm+Dj3fPwRMumROLMNdmGFM7f5+codTPhVuY2/CQNCrTah+1q4s6u
 Wujicqy5mixHgC2nzF1O9Hf+I/36B4GtsqbTFXWPfi3mJyZWjM8BrsuaLerIER/zPP7K
 5u/Q==
X-Gm-Message-State: AOAM533kQ3HmXkEmhDx3DhjzWfZbJdEHID2THV0D7xEn37HmS2FsvD7p
 v5qO5vK65VeAPhhh0kEf9tk1Jw==
X-Google-Smtp-Source: ABdhPJwfNTLqkeOQnK1jvXc3XDq+dTSGGjbe07ZUKsKBp7CCf9AnvWDHI5pE6GufZ1uel/pwlnBIow==
X-Received: by 2002:a05:6870:17a1:b0:da:b3f:3258 with SMTP id
 r33-20020a05687017a100b000da0b3f3258mr512703oae.264.1647296905949; 
 Mon, 14 Mar 2022 15:28:25 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 n128-20020a4a4086000000b0032118eda64bsm7991304ooa.38.2022.03.14.15.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 15:28:25 -0700 (PDT)
Date: Mon, 14 Mar 2022 17:28:23 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: ohad@wizery.com, mathieu.poirier@linaro.org, robh+dt@kernel.or,
 matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, khilman@baylibre.com,
 Julien STEPHAN <jstephan@baylibre.com>
Subject: Re: [PATCH v4 6/7] remoteproc: mtk-apu: Add support of MT8365
Message-ID: <Yi/Bh8CsB2bnE9Ca@builder.lan>
References: <20220304161514.994128-1-abailon@baylibre.com>
 <20220304161514.994128-7-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304161514.994128-7-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_152827_028199_1FFD15F7 
X-CRM114-Status: GOOD (  19.04  )
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
> This adds support of APU available in the MT8365.
> 
> Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  drivers/remoteproc/mtk_apu.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_apu.c b/drivers/remoteproc/mtk_apu.c
> index deec51b86ba5..57dd73c63d3f 100644
> --- a/drivers/remoteproc/mtk_apu.c
> +++ b/drivers/remoteproc/mtk_apu.c
> @@ -96,6 +96,24 @@ static const struct mtk_apu_conf mt8183_conf = {
>  	.clk_names = mt8183_clk_names
>  };
>  
> +static const char * const mt8365_clk_names[] = {
> +	"if_ck",
> +	"edma",
> +	"ahb",
> +	"axi",
> +	"ipu",
> +	"jtag",
> +	"smi_cam",
> +	"ifr_apu_axi",
> +};
> +
> +static const struct mtk_apu_conf mt8365_conf = {
> +	.core_default0 = BIT(26) | BIT(20),
> +	.core_default1 = BIT(3) | BIT(7),

Would it be possible to get some defines for these bits as well?

Thanks,
Bjorn

> +	.num_clks = ARRAY_SIZE(mt8365_clk_names),
> +	.clk_names = mt8365_clk_names
> +};
> +
>  static int mtk_apu_iommu_map(struct rproc *rproc, struct rproc_mem_entry *entry)
>  {
>  	struct mtk_apu_rproc *apu_rproc = rproc->priv;
> @@ -633,6 +651,7 @@ static int mtk_apu_rproc_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id mtk_apu_rproc_of_match[] = {
>  	{ .compatible = "mediatek,mt8183-apu", .data = &mt8183_conf },
> +	{ .compatible = "mediatek,mt8365-apu", .data = &mt8365_conf },
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
