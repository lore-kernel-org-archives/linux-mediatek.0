Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969CCC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhkPrbVqrKln9QKuPhJ/We9iAXWnWgwxKtNvZBrL5V8=; b=IN0pRhWxpCZPEk9SkCKB5NbfMl
	XWAthKV81vCKq025ROs6EhIzKTrZpTPULd8eOIncfsxvehMhGewwEb98sm9BB0xoGfhLYCUPbB+a3
	7o5mg9CQ2bBmnrtLl/rMiGqCFVUTO+QIQ3+72lV1bBDhOHeDAQcjw8fTgSKl171jWMl5WzoJHVfDV
	c0Jdjqj+w8StqewY2i9oHSZ/igSQG6udzlsX3Y2ray7+BbrTWpCPW4Dzj28wxJ/mOFbyrZ4oOR1+9
	WChjPcz73YmPpRlUMy/eE9pwvzvggc9ZKaS4owiJCD16k7Gni6o5SqrLRHyDE//powXWKoxwSq98l
	QeZCJtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSq-006ncb-0w;
	Fri, 31 Mar 2023 09:54:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBS2-006nFy-2W;
	Fri, 31 Mar 2023 09:53:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DAE666603193;
	Fri, 31 Mar 2023 10:53:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256421;
	bh=lYuwy5PNbHveUqITfyBOBH4VBeg+QrO312pmvp34imI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R1PP/ANMnDEwlLmop4KwyIE6ajslhceXPLKAsCRayaggPIqR5xHQ5m5d4HFfVc1Qo
	 AXxK3es7x9/UWIv1GmGBcNB4B4MKyeNLM6joUQum6FBFgMyMXuT7j+mLS8RAIyYudS
	 VIGUM5SNCbOnvTskxCLSyaYTMJABGprNzQI+D/9/SRNomkxfZjieBn9PKULNzCXE7c
	 NkuCNJByDVJe7E60v84D5l9g4zUtoey5L1okU14Nz3z4xNEh2UIBuXWRtxz2iqOSRG
	 0E/bsucStViM0HIYPj3j8Il3JOo4yXohFhAlqAmDBATea0gGUhVoItevidkdlxV3q4
	 guk+DTUidFvgg==
Message-ID: <816f8d82-b66d-6fad-51d7-a37c241b0417@collabora.com>
Date: Fri, 31 Mar 2023 11:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 06/19] clk: mediatek: Add MT8188 camsys clock support
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
 <20230331082131.12517-7-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-7-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025344_034772_71EF8613 
X-CRM114-Status: GOOD (  14.88  )
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

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 camsys clock controllers which provide clock gate
> control for camera IP blocks.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   drivers/clk/mediatek/Kconfig          |   7 ++
>   drivers/clk/mediatek/Makefile         |   1 +
>   drivers/clk/mediatek/clk-mt8188-cam.c | 120 ++++++++++++++++++++++++++
>   3 files changed, 128 insertions(+)
>   create mode 100644 drivers/clk/mediatek/clk-mt8188-cam.c
> 
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 681d392620c5..9170f76a8ee7 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -692,6 +692,13 @@ config COMMON_CLK_MT8188
>   	help
>             This driver supports MediaTek MT8188 clocks.
>   
> +config COMMON_CLK_MT8188_CAMSYS
> +	tristate "Clock driver for MediaTek MT8188 camsys"
> +	depends on COMMON_CLK_MT8188_VPPSYS
> +	default COMMON_CLK_MT8188_VPPSYS
> +	help
> +	  This driver supports MediaTek MT8188 camsys and camsys_raw clocks.
> +
>   config COMMON_CLK_MT8192
>   	tristate "Clock driver for MediaTek MT8192"
>   	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 1a642510ce38..c235e9a0d305 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -102,6 +102,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186_VENCSYS) += clk-mt8186-venc.o
>   obj-$(CONFIG_COMMON_CLK_MT8186_WPESYS) += clk-mt8186-wpe.o
>   obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
>   				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o
> +j-$(CONFIG_COMMON_CLK_MT8188_CAMSYS) += clk-mt8188-cam.o

Please fix that typo here.

After which,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



