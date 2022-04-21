Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4846EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 06:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rOz9xWDvI4HukbbiCmNM9bvVNm/I6/SP5dFnVgUETg0=; b=nqmSS2tpZNImAh
	Y6wO42uaBOgQyXSbIbIYnl+Om/qQANSV2qLC9XNf2sVBsVj3z/0D5OvvXo05R3JO16k9tnfp11wBW
	UzLLSKSO+Uusb+oVwruLQfxztQpHf9qAzJGp4FNBRPHaK0/uAM52LV8a9PIntqOjrPyl0Qd5P1Rt7
	ZPg/TkZ2rPM2+mH2eQdI24Z/0UeZx+dxZT9TOBH0b2SDwoU/iWKXLrvtXxI4lPVdWnwfuz6QUWwO2
	VW6QDTk2CywVcb1fHZauxRRw25KEWzdIB++iLPbJ2NGZTxOJcOSxg8prVnRgt272SJTrKG5WEtg2H
	yjXkLUcngFxZ2D+YIrrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQhA-00BsoK-SS; Thu, 21 Apr 2022 06:53:40 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQgx-00Bsi0-6y
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 06:53:28 +0000
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f18982c255so42276407b3.1
 for <linux-mediatek@lists.infradead.org>; Wed, 20 Apr 2022 23:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BxxyCE6218CsP33ncCT/QjJmGyzhJs4lIXEcCs7Cp7E=;
 b=NtyTmm73BO2ZpdykD4mRz6MZYwBQaD//bYiwl1WzFNjs/yuG3viWAA5tnQ3+Np0V7l
 9WJLbq1ASUtwB+n3y06WniFE8c5Q/NVHtWLHM/GRWczXMTFwtr1ZtGUPLoVIShUqOy4R
 wjEB14EJIEVodi7+Q2nUKIr/n1UDFi2JG+ekw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BxxyCE6218CsP33ncCT/QjJmGyzhJs4lIXEcCs7Cp7E=;
 b=Tmycpg94Dw+046ZFXEH858/zqFJrsZNgaYXzFLPaNydilwEearRr7vHWazKgoRtgP1
 9zvuONyhCbT0bovvBYq0OY8KC9XoPOtNekU7GhS1LLFMDE2YxIE3m0Zlu6Vs3drqHLf7
 yjZnsoG2yTxRRThnDt36KkhdaYztAFin2JynQHvckqlj8lJ40u69W3XW+X0AURuN7H/F
 g7Ww+h7Q6G+geRT/iNooXI8Fi7C0HdOi1OipPXHPIeew0lMFgCFOwqJM0hw91l6dMv13
 lGJEQgF+3ACPcduOdh9ZQB94hBaA5risD5XLpsKrlItF6YpEv8XyfTKCDkXZetr2+ra6
 pEEQ==
X-Gm-Message-State: AOAM5330s1N07StNUWBq9m3rT0D4zo8c46d9ZZU8vJs8T8p+J6s29cm9
 +CEteip9+/V/3mdwJ6MssLVbrcMYmC92ur0IquPVUg==
X-Google-Smtp-Source: ABdhPJzVfB7TYnUrWb3CObQ/ODXX6LZUZjYXGH+wB1eh9ocMpbmW/G3DUs7pecxGAlW308Nn1wwuqQuNoV0zmu7lPZc=
X-Received: by 2002:a0d:eb46:0:b0:2ef:4946:544 with SMTP id
 u67-20020a0deb46000000b002ef49460544mr24654407ywe.286.1650524004092; Wed, 20
 Apr 2022 23:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-12-rex-bc.chen@mediatek.com>
In-Reply-To: <20220420130527.23200-12-rex-bc.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 21 Apr 2022 14:53:13 +0800
Message-ID: <CAGXv+5HMe7LaXiMJofW4ZT0Ku70mNAt2A=98YzZbx-frF7kQGQ@mail.gmail.com>
Subject: Re: [PATCH V2 11/12] clk: mediatek: reset: Add infra_ao reset support
 for MT8192
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, 
 chun-jie.chen@mediatek.com, runyang.chen@mediatek.com, 
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_235327_286621_AFAE751B 
X-CRM114-Status: GOOD (  22.36  )
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

On Wed, Apr 20, 2022 at 9:05 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> The infra_ao reset is needed for MT8192. Therefore, we add this patch
> to support it.
>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mt8192.c         | 11 +++++++++++
>  include/dt-bindings/reset/mt8192-resets.h | 11 +++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
> index ab27cd66b866..7926b83b9035 100644
> --- a/drivers/clk/mediatek/clk-mt8192.c
> +++ b/drivers/clk/mediatek/clk-mt8192.c
> @@ -1114,6 +1114,13 @@ static const struct mtk_gate top_clks[] = {
>         GATE_TOP(CLK_TOP_SSUSB_PHY_REF, "ssusb_phy_ref", "clk26m", 25),
>  };
>
> +static const struct mtk_clk_rst_desc clk_rst_desc = {
> +       .version = MTK_RST_SET_CLR,
> +       .reg_num = 4,
> +       .reg_ofs = 0x0,
> +       .reset_n_cells = 2,

If you want to do this, you need to update the bindings first.

> +};
> +
>  #define MT8192_PLL_FMAX                (3800UL * MHZ)
>  #define MT8192_PLL_FMIN                (1500UL * MHZ)
>  #define MT8192_INTEGER_BITS    8
> @@ -1239,6 +1246,10 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
>         if (r)
>                 goto free_clk_data;
>
> +       r = mtk_clk_register_rst_ctrl_with_dev(&pdev->dev, &clk_rst_desc);
> +       if (r)
> +               goto free_clk_data;
> +
>         r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>         if (r)
>                 goto free_clk_data;
> diff --git a/include/dt-bindings/reset/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
> index be9a7ca245b9..feac1ac85906 100644
> --- a/include/dt-bindings/reset/mt8192-resets.h
> +++ b/include/dt-bindings/reset/mt8192-resets.h
> @@ -7,6 +7,7 @@
>  #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
>  #define _DT_BINDINGS_RESET_CONTROLLER_MT8192
>
> +/* TOPRGU */
>  #define MT8192_TOPRGU_MM_SW_RST                                        1
>  #define MT8192_TOPRGU_MFG_SW_RST                               2
>  #define MT8192_TOPRGU_VENC_SW_RST                              3
> @@ -27,4 +28,14 @@
>
>  #define MT8192_TOPRGU_SW_RST_NUM                               23
>
> +/* INFRA RST0 */
> +#define MT8192_INFRA_RST0_LVTS_AP_RST                          0
> +/* INFRA RST2 */
> +#define MT8192_INFRA_RST2_PCIE_PHY_RST                         15
> +/* INFRA RST3 */
> +#define MT8192_INFRA_RST3_PTP_RST                              5
> +/* INFRA RST4 */
> +#define MT8192_INFRA_RST4_LVTS_MCU                             12
> +#define MT8192_INFRA_RST4_PCIE_TOP                             1
> +

This change should be part of the binding change.

For these, please also add a patch for the actual device tree changes.


ChenYu

>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
