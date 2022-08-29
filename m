Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6CFECAAA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 17:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6bYNpML21qzhk9c6rS49HOi5hkJ5sJySwf5mxEe49g=; b=VUB5AQUBMfv4YAfblrMvd0peu/
	te0MjT1t8TpUXGTHN4J6ongRo4cUK+sr3LO6jlxrzKvkt0VLt/qE/pBiBWI3Ed6A/h+sNuCFBbUuS
	9zpolmsecg60s2pYf74ASfViaDUvuQF1ZO+Iz8pY6nl5TObU1A7iSI7G5iYEZkLxSK3yx+Kej/gOb
	3xV/qhkZBCKGbKdQ6Ou4hVUNe8DA4ESVwOIiPA+UKreoBhhgpYuqj+f0b2D8q9BRqgnpyNwB2D/4A
	XCeGmQFIGX5OUBrATPP/JjtMdC7YIjzjb16Jew/JtQR2EhiEBy/qmzeMXl2Qszwe/qo209uJgIOvy
	bHeIHnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSikR-00C4LX-47; Mon, 29 Aug 2022 17:40:31 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSikO-00C4K3-3c
	for linux-mediatek@lists.infradead.org; Mon, 29 Aug 2022 17:40:30 +0000
Received: by mail-pj1-x102b.google.com with SMTP id n8-20020a17090a73c800b001fd832b54f6so6650905pjk.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Aug 2022 10:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=s6bYNpML21qzhk9c6rS49HOi5hkJ5sJySwf5mxEe49g=;
        b=rRgo00unpZZnp/iKatcDw2P9q6aBOTa3VIJ41hGdq2Ue/i2CtTN2avO+BGFzPm7ldJ
         Q4fcuykOqMRAXY15s1bCTM3iY+m2zAG0mUi09ztJOxDuEVlbao5Vu0ZROdDmba5HZX9z
         mHPC7Jp3kLqFIbD03qnGdPz08YXFSVzC23jN911UhzBB9JMn0vPw9BKRahCzStPcwpJL
         vAL6DWNqiIGoRocETe742dBQeMUzBWmIX9gHDnCjreZ718lu4bVA8ktqsjs9QMNp8WVb
         I3YkJ71m+b5yYqo/m3O5I9esu+OgU2Cw/ZIRjR2ssuxrgD3GVRjq6S7inlqGU5kDWqvQ
         gd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=s6bYNpML21qzhk9c6rS49HOi5hkJ5sJySwf5mxEe49g=;
        b=pwymbqf2fiMf332Qqtz7K2ehDEt/aT75w6o7fw7AakZxpzdwMeaCHLraia9VbXm3Jt
         svNRXxIZdMHz2ho/xreQpRV/f1nXnMVUbIICkGVsuSpk2crKPL/qFrf3dnSZXG/to7zV
         3ccvCMm2T22mYUkFzwca3tc5SAWl57n+kvznUnnLeP2l0VAwmg8FX0gfU70aJbEFYu4w
         ZDGyEWUuynPvWdWmzS0u8+ppMGJSfEP2DqtYdmkbekycHaTZCD5WNYvRN/0T+NXtBJFP
         cN59jimmw50CBBXXbtEHpXTZ+ALkorQuGdkCwNAhYPKzRcXMwKtrED+lYzHjDcH48HDO
         aMCA==
X-Gm-Message-State: ACgBeo28alxwWFXKQQZ+O8BMOvTHxlfx8OK0MyFgGVzXKxqHoI1ft/L8
	HYrqZ9X5QG4IPf68vZ2Omyortg==
X-Google-Smtp-Source: AA6agR5A1l3owXOrDlGd71lrBje/h4zCkOyCf84EtysjEUjXD5K1Zz+Ho52D2qgBJcB1fk3TqmErmw==
X-Received: by 2002:a17:902:9b85:b0:16e:cc02:b9b2 with SMTP id y5-20020a1709029b8500b0016ecc02b9b2mr17622412plp.74.1661794824904;
        Mon, 29 Aug 2022 10:40:24 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id r2-20020aa79882000000b0053826ec2a68sm3224505pfl.191.2022.08.29.10.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 10:40:23 -0700 (PDT)
Date: Mon, 29 Aug 2022 11:40:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	weishunc@google.com
Subject: Re: [PATCH v2 2/9] remoteproc: mediatek: Support hanlding scp core 1
 wdt timeout
Message-ID: <20220829174021.GA2264818@p14s>
References: <20220608083553.8697-1-tinghan.shen@mediatek.com>
 <20220608083553.8697-3-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608083553.8697-3-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_104028_180641_A7AE29FA 
X-CRM114-Status: GOOD (  26.11  )
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

Hi Tinghan,

I have started reviewing this set and I expect comments to be spread out over a few
days.  I will tell you when I am done.

Please see below for comments...

On Wed, Jun 08, 2022 at 04:35:46PM +0800, Tinghan Shen wrote:
> MT8195 SCP is a dual-core processor. The SCP core 1 watchdog timeout
> interrupt uses the same interrupt line of SCP core 0 watchdog timeout
> interrupt.
> 
> Add support for handling SCP core 1 watchdog timeout interrupt in the
> SCP IRQ handler.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h |  4 ++++
>  drivers/remoteproc/mtk_scp.c    | 27 ++++++++++++++++++++++++++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index ea6fa1100a00..73e8adf00de3 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -54,6 +54,10 @@
>  #define MT8192_CORE0_WDT_IRQ		0x10030
>  #define MT8192_CORE0_WDT_CFG		0x10034
>  
> +#define MT8195_SYS_STATUS		0x4004
> +#define MT8195_CORE0_WDT		BIT(16)
> +#define MT8195_CORE1_WDT		BIT(17)
> +
>  #define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
>  
>  #define SCP_FW_VER_LEN			32
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 47b2a40e1b4a..3510c6d0bbc8 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -212,6 +212,31 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
>  	}
>  }
>  
> +static void mt8195_scp_irq_handler(struct mtk_scp *scp)
> +{
> +	u32 scp_to_host;
> +
> +	scp_to_host = readl(scp->reg_base + MT8192_SCP2APMCU_IPC_SET);
> +
> +	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
> +		scp_ipi_handler(scp);
> +
> +		/*
> +		 * SCP won't send another interrupt until we clear
> +		 * MT8192_SCP2APMCU_IPC.
> +		 */
> +		writel(MT8192_SCP_IPC_INT_BIT,
> +		       scp->reg_base + MT8192_SCP2APMCU_IPC_CLR);
> +	} else {
> +		if (readl(scp->reg_base + MT8195_SYS_STATUS) & MT8195_CORE1_WDT) {
> +			writel(1, scp->reg_base + MT8195_CORE1_WDT_IRQ);
> +		} else {
> +			writel(1, scp->reg_base + MT8192_CORE0_WDT_IRQ);
> +			scp_wdt_handler(scp, scp_to_host);

Why is scp_wdt_handler() not called when CORE1 signals a watchdog failure?  If
this is the intended behaviour there is no way for anyone but you to know that
it is the case.  

> +		}
> +	}
> +}
> +
>  static irqreturn_t scp_irq_handler(int irq, void *priv)
>  {
>  	struct mtk_scp *scp = priv;
> @@ -961,7 +986,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  static const struct mtk_scp_of_data mt8195_of_data = {
>  	.scp_clk_get = mt8195_scp_clk_get,
>  	.scp_before_load = mt8195_scp_before_load,
> -	.scp_irq_handler = mt8192_scp_irq_handler,
> +	.scp_irq_handler = mt8195_scp_irq_handler,
>  	.scp_reset_assert = mt8192_scp_reset_assert,
>  	.scp_reset_deassert = mt8192_scp_reset_deassert,
>  	.scp_stop = mt8195_scp_stop,
> -- 
> 2.18.0
> 

