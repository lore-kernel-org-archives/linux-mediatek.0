Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E11C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 18:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqm9CVgn+kW4HfPyiUnaMeFl30Q6IABDDhBs2wPsJt8=; b=s7jVVS2cZDxvWxD3DX9+OUwps4
	BPgjY5jcnK/unBTcLcTRgrQY3soKhNlxx9WgPabEM8pT+QLn/K86qttv8otCshUSyFjgN7oV5eSub
	44bnMI3kKqRw96MN4y8AI4R6nf7Nrd8AYzfnICT8U2bVuPByZUV0rEMbYuPBaOwiaDlGRH426vbC0
	xBxwTH8tHGFbcGizkfUNjXajjauTj2WgrtYUzITQin0K1cSajeOWPIjyeywPrOZRtpjQF1mzvlMaE
	kcC5T5qpSfuUTroN2F4zj1FcBWJMnQGQ++iPevnVWaTMDGrDa/YAXOj8PKK/ysl5authYCQseLlOb
	1JqetOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohx8k-001kLZ-Pw; Mon, 10 Oct 2022 18:04:34 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohx8h-001kK6-Ri; Mon, 10 Oct 2022 18:04:33 +0000
Received: by mail-pf1-x42c.google.com with SMTP id 204so11381593pfx.10;
        Mon, 10 Oct 2022 11:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqm9CVgn+kW4HfPyiUnaMeFl30Q6IABDDhBs2wPsJt8=;
        b=A2PJRdVcfbhm6nKDfokFMdxjYrpiSG3A4L5AsylMNB7KWpc04WjyBf1DPB5kO4pZz6
         FHdpXDhtVD02kl7k145LFNvqafRpExtpXpvtiLiscsljc6GrdVbaMRyU5ZI9O9uuL95Q
         fVrvfW+B28HFKAPaZsLwIeww/gPenfcO6FdL9ikuvZDW3oBLTvcxAIAcy5Yqolty2SDo
         SXbpjGzqqFa5U/XEk1HqvY0a6ffFz6ScEQ0sa5HLpv0XcZYsFCLDUsWLTP3KOIi4PX4s
         BG/fjbo9bPuCikKWtlaZd1kJVUmukbZBGBr0JuAbPMCTzfTJ7q79Radhe1xeQlW+u/Af
         VLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqm9CVgn+kW4HfPyiUnaMeFl30Q6IABDDhBs2wPsJt8=;
        b=l1wZ1dzXrClvsyTrJLUQOKLjVUGPx6N9ubHhxGjc6wLhhj4zSjl6BNxcSNqo6t6u2B
         CQ6FIettQlCH7saZ1Upoi7Ttc36UEuD8pMNFs/XxHBqnIOifW67kqX+H+L/XZ/RtCMcn
         koNBWD/sajvfz7906oDTtGkaqNBMQLDbF7iXmNMNeIdfDUecJRObYIEhAT8ScMu/Drme
         qkdaZfKarOPOHdygU78U5ybaOkMuXD5qMLpr+rbOkzOshz+fp6QvjJ+d/dGvvpV9EN6F
         WSf/K4WIfCMwNtgKxcAQIzyC3/rlxhwyk9HoYdf6HpY23CHr6eXH7M1hqYts15SoFwx3
         1FtQ==
X-Gm-Message-State: ACrzQf0jhk6PR+9jy9aKLKY8ZKvv6gWNZMVT2PtaC73A2qRtScQ83jsg
	B4uI9RKJaCIeoDKwW4Ln7LQ=
X-Google-Smtp-Source: AMsMyM5J5FVo9mNe1Zc+Y7OpqNKgLUl0RAHmsZbJrDII9arkrOq1Q+BsxPnFewT4XfclXkbXoDbWGw==
X-Received: by 2002:a63:8ac2:0:b0:460:6480:8c59 with SMTP id y185-20020a638ac2000000b0046064808c59mr11102218pgd.472.1665425069945;
        Mon, 10 Oct 2022 11:04:29 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:bff:9bd3:c2da:5f42])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090341c600b00178ab008364sm7052943ple.37.2022.10.10.11.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 11:04:29 -0700 (PDT)
Date: Mon, 10 Oct 2022 11:04:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v2 5/5] Input: mtk-pmic-keys: add MT6357 support
Message-ID: <Y0ReqmnLfKo20HO5@google.com>
References: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
 <20221005-mt6357-support-v2-5-f17ba2d2d0a9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005-mt6357-support-v2-5-f17ba2d2d0a9@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_110431_936030_01E2D0AA 
X-CRM114-Status: GOOD (  18.88  )
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

On Wed, Oct 05, 2022 at 04:57:25PM +0200, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add PMIC Keys support on MT6357 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please merge through MFD tree with the rest of the patches.

> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index 9b34da0ec260..2a63e0718eb6 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -10,6 +10,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mfd/mt6323/registers.h>
>  #include <linux/mfd/mt6331/registers.h>
> +#include <linux/mfd/mt6357/registers.h>
>  #include <linux/mfd/mt6358/registers.h>
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6397/registers.h>
> @@ -90,6 +91,19 @@ static const struct mtk_pmic_regs mt6331_regs = {
>  	.rst_lprst_mask = MTK_PMIC_MT6331_RST_DU_MASK,
>  };
>  
> +static const struct mtk_pmic_regs mt6357_regs = {
> +	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
> +		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
> +				   0x2, MT6357_PSC_TOP_INT_CON0, 0x5,
> +				   MTK_PMIC_PWRKEY_RST),
> +	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
> +		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
> +				   0x8, MT6357_PSC_TOP_INT_CON0, 0xa,
> +				   MTK_PMIC_HOMEKEY_INDEX),
> +	.pmic_rst_reg = MT6357_TOP_RST_MISC,
> +	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
> +};
> +
>  static const struct mtk_pmic_regs mt6358_regs = {
>  	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
> @@ -276,6 +290,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
>  	}, {
>  		.compatible = "mediatek,mt6331-keys",
>  		.data = &mt6331_regs,
> +	}, {
> +		.compatible = "mediatek,mt6357-keys",
> +		.data = &mt6357_regs,
>  	}, {
>  		.compatible = "mediatek,mt6358-keys",
>  		.data = &mt6358_regs,
> 
> -- 
> b4 0.10.1

Thanks.

-- 
Dmitry

