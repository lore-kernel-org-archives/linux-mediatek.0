Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF111C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 08:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQdcqRijxUkHsak+jAfhkkvLukBS0vcYzdFtrdyXflw=; b=WaM7PdMxCdRS0c+7V0eHcPjAqy
	wnx82qWboyZXe2wUSIVozUQGSuPbdYyiD01YT+gl1/sTtlwrBhv06k7ALrlsJjen+b54+T9m8bqg8
	DKN7OQnxhg1gv/6URBY9FDZRnwfjJ3NGXP/QyupOqvvc7L/RrcGX86fCj7jxtg9nl2YQAKRxsBnU3
	ggF129ZeorWS9xmhzGeDpe23HzWcsy4Ka7NyATt0bPABEwYPowkCrmoHbT3amoJKIk6AUArzSHjDX
	wtr0LkRxYi0RxgdZs9Fa29DR/nBIioS1Fg5wG/1AYDtEcoPxEXCurFp7UlpFINFjCZNIYwNzwinYy
	o1C2FXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAVw-007BH2-8y; Fri, 30 Dec 2022 08:13:16 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAPf-00791k-IM
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 08:06:49 +0000
Received: by mail-vs1-xe29.google.com with SMTP id a66so20618732vsa.6
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 00:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iQdcqRijxUkHsak+jAfhkkvLukBS0vcYzdFtrdyXflw=;
        b=hJrOI48JiYR65s9nCvSCbLB6/evML3aOoc6h+o+f3sjNM430ssdY4mTfsfoOuqiE77
         SfnNNqM26q/P0n106if0Zu2bwW9SvUE5hjv4D9piG3JN02D1FVQl65JpTXlhhT0mEDhD
         lf0+C7oAiy61ZM+ycfbYEnO9A6aiVYZIH5934=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQdcqRijxUkHsak+jAfhkkvLukBS0vcYzdFtrdyXflw=;
        b=FgOS4SALMaiYWdR76Oma0UH9oiWxl3rvtd0g4bUC8Oevm7gzmQTHrtIvQabT5kM1BT
         /DAfQbGweLc4uQStUsGN5Tsk75AScnZXNXnhLKb5vEpoTmbcKL/VT7M/30HZBDBpXUQm
         wtdX7yFrcxWiJjJP/3uxqlbPQln1E7fBN8mMPMDFVdlFnbX3lRDA7YTgZmn3eDodRGlx
         zy3bBxf0ws7BOz3ncaEto6raRbvqu9zBuZh4SaM1PbJ23EckYOcwi6xIwltwvRW6ehmO
         QVTivY9b8zhwzKoHYccOJsJGotoS6xHKYodaBj237cZ6CPnaiX1S3s2C4WN36NNHChYc
         BXJQ==
X-Gm-Message-State: AFqh2krcw3bLCBZnhKf+clkvpVAdRWHE0SLR0PjKjJynkP/eOfojvYow
	54Qi+6IZP9A0UAh42dluj3pQiuXehnbwJ+v7hOB5nA==
X-Google-Smtp-Source: AMrXdXtUtwb9Xd2cX7zaHUb5ee4VgtB+nh99Dg/x/skgVf2ZCGUYciWzd1E+Ypz1KXO3wscCEMwAn2Ze8MjLtrhpUfM=
X-Received: by 2002:a05:6102:74b:b0:3ad:3d65:22b with SMTP id
 v11-20020a056102074b00b003ad3d65022bmr4417228vsg.65.1672387606063; Fri, 30
 Dec 2022 00:06:46 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-16-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-16-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 16:06:35 +0800
Message-ID: <CAGXv+5H9FqFeng+dev2A-W6FPuWvVuLMgSgVcubwE7NLCy58pw@mail.gmail.com>
Subject: Re: [PATCH v2 15/23] clk: mediatek: mt8192: Join top_adj_divs and top_muxes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, 
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, 
	nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, 
	daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, 
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, 
	ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_000647_801188_96A68D6E 
X-CRM114-Status: GOOD (  15.05  )
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

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> These two are both mtk_composite arrays, one dependent on another, but
> that's something that the clock framework is supposed to sort out and
> anyway registering them separately isn't going to ease the framework's
> job in checking dependencies.
>
> Put the contents of top_adj_divs in top_muxes to join them together
> and register them in one shot.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt8192.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
> index ec9dc7fe848e..702770326286 100644
> --- a/drivers/clk/mediatek/clk-mt8192.c
> +++ b/drivers/clk/mediatek/clk-mt8192.c
> @@ -698,9 +698,7 @@ static struct mtk_composite top_muxes[] = {
>         MUX(CLK_TOP_APLL_I2S7_M_SEL, "apll_i2s7_m_sel", apll_i2s_m_parents, 0x320, 23, 1),
>         MUX(CLK_TOP_APLL_I2S8_M_SEL, "apll_i2s8_m_sel", apll_i2s_m_parents, 0x320, 24, 1),
>         MUX(CLK_TOP_APLL_I2S9_M_SEL, "apll_i2s9_m_sel", apll_i2s_m_parents, 0x320, 25, 1),
> -};
> -
> -static const struct mtk_composite top_adj_divs[] = {
> +       /* APLL_DIV */

This would be CLK_AUDDIV_2 ~ 4 actually. 4 dividers per register.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

