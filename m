Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D03C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 20:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2aWBeYsPOZw3VmzBEuzhxtl3VZ6kigXr5nDO9DM/2U=; b=G2xTl7YbAIYiahYaHKIl7xMcs/
	kwrwflfK2Up8ZWNc+SEGOTQNiv1bR4M3xci3h+Tg5VduPPBHW0VDRpTCN3XiVLrnjZpASKNjjeMV8
	6c3djkToTybrWmc3h+jXpUpbmKXZrkxdQv+0w+pTnBOYG2xR9wApJfY5yRLPcR6nMQnbzU6sBI1Yx
	ImFGpCvH5pP3Ku7HYWF2XIfkcAAUBzh6X1Tup8DscP+FrehZ/j/0T4i6+bBFFHvi0sI4QJrM7l0z3
	KlMbVK2UsUwGBzP9/Zw/FvQipIs5OGAvcqGzJc973+f1QP+5jSL9rktUBzo8MRMK8aWCDW2wUVyj8
	M6ESIM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcAqY-00BQEy-2U;
	Tue, 14 Mar 2023 20:02:10 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcAqW-00BQDG-0t;
	Tue, 14 Mar 2023 20:02:09 +0000
Received: by mail-ed1-x534.google.com with SMTP id x13so19502912edd.1;
        Tue, 14 Mar 2023 13:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678824121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2aWBeYsPOZw3VmzBEuzhxtl3VZ6kigXr5nDO9DM/2U=;
        b=lw9U5mN5yNQ8LCsLdSPoz/LDlbOc3gdpgfgiPbj+UqVyBLryGF2SizPvnYrGuXei2B
         8CW7NuAiXt4lKM4L9hLgAXaccTOgRMCI1EvGQWwXwoLfbSjekCLkx04ulURMT7COkO4t
         J++Ji4mnWJ2UzCR+dvqXSdOOQb3sEJxSRc0R9uXLeMKtpVefTko8JVJiowBonJ/C3gBf
         QQfQI+JmzBhQwe8tsP9bYsRCCsLEEdhQi0ckBlSevIeYHRThMVn730fagDOm32V7a1HE
         ZDvYKKwjM/xqSLM7VFhMoyBfgNqbVnesZJb6FBMHIWhX9FQIa+DGEu+4K8/FRwIdyO0Q
         eW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2aWBeYsPOZw3VmzBEuzhxtl3VZ6kigXr5nDO9DM/2U=;
        b=2KMwP8sQOLYFilqrDV8IKWYhmDiOmIDuzu/mPSVrpJcvHlDfRGKnMt4el/JszIh2Mc
         p09CkCbtrn6f2A1G4VxcatWxdm6GnbzfcpnSwX/dXLK0sdkO1Yvmmuu8M/sv0mvu7R3z
         09JmpV9BO3u5wJ0ovxiUw1dyFzmqdg9jTkWs4t8+oNTpp+zbFvKTwgrweargJM/KR9AO
         pghTSrJzmm4iTk2Ouh1moKAoa+UB79kQuxw28hY6T6rZFn4UCUNTavMbG/NJyYH/roZf
         skd1/A00gqstjIJS418pSRbtsEm7Ohf/r3SiJMGNAyvdflozSSFlquDPx6m8ohB59Pu8
         rw5A==
X-Gm-Message-State: AO0yUKWqUNXHtCP0QL+2nmCoX24PrNc/qoVHTMQjXNMAuyXG6lBQ7k62
	9Tn3M6wV0m6UM8i5w4ycneM=
X-Google-Smtp-Source: AK7set9e9EO060s4bRckBVlG+IlgdCeWavxzh4N5oYIX6Pb2j4hXy67uRYvwwfD6th6kq9HthDHzWQ==
X-Received: by 2002:a05:6402:ce:b0:4fa:96fd:797b with SMTP id i14-20020a05640200ce00b004fa96fd797bmr363385edu.6.1678824121330;
        Tue, 14 Mar 2023 13:02:01 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id lj6-20020a170906f9c600b008bbc9115038sm1534607ejb.56.2023.03.14.13.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:02:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject:  Re: [PATCH] pinctrl: Use of_property_present() for testing DT property
 presence
Date: Tue, 14 Mar 2023 21:01:59 +0100
Message-ID: <3218406.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20230310144721.1544669-1-robh@kernel.org>
References: <20230310144721.1544669-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_130208_313148_57858B04 
X-CRM114-Status: GOOD (  25.07  )
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

Dne petek, 10. marec 2023 ob 15:47:20 CET je Rob Herring napisal(a):
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pinctrl/mediatek/pinctrl-moore.c |  2 +-
>  drivers/pinctrl/pinctrl-single.c         |  4 ++--
>  drivers/pinctrl/pinctrl-stmfx.c          |  2 +-
>  drivers/pinctrl/renesas/pinctrl.c        |  4 ++--
>  drivers/pinctrl/stm32/pinctrl-stm32.c    |  2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c    | 20 ++++++++++----------

For sunxi:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  6 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c
> b/drivers/pinctrl/mediatek/pinctrl-moore.c index 007b98ce5631..8649a2f9d324
> 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -586,7 +586,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>  	 * Documentation/devicetree/bindings/gpio/gpio.txt on how to
>  	 * bind pinctrl and gpio drivers via the "gpio-ranges" property.
>  	 */
> -	if (!of_find_property(hw->dev->of_node, "gpio-ranges", NULL)) {
> +	if (!of_property_present(hw->dev->of_node, "gpio-ranges")) {
>  		ret = gpiochip_add_pin_range(chip, dev_name(hw->dev), 
0, 0,
>  					     chip->ngpio);
>  		if (ret < 0) {
> diff --git a/drivers/pinctrl/pinctrl-single.c
> b/drivers/pinctrl/pinctrl-single.c index 190923757cda..0dabbcf68b9f 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -939,11 +939,11 @@ static int pcs_parse_pinconf(struct pcs_device *pcs,
> struct device_node *np,
> 
>  	/* cacluate how much properties are supported in current node */
>  	for (i = 0; i < ARRAY_SIZE(prop2); i++) {
> -		if (of_find_property(np, prop2[i].name, NULL))
> +		if (of_property_present(np, prop2[i].name))
>  			nconfs++;
>  	}
>  	for (i = 0; i < ARRAY_SIZE(prop4); i++) {
> -		if (of_find_property(np, prop4[i].name, NULL))
> +		if (of_property_present(np, prop4[i].name))
>  			nconfs++;
>  	}
>  	if (!nconfs)
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c
> b/drivers/pinctrl/pinctrl-stmfx.c index 1181c4b506b1..3c031692e44d 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -632,7 +632,7 @@ static int stmfx_pinctrl_probe(struct platform_device
> *pdev) pctl->dev = &pdev->dev;
>  	pctl->stmfx = stmfx;
> 
> -	if (!of_find_property(np, "gpio-ranges", NULL)) {
> +	if (!of_property_present(np, "gpio-ranges")) {
>  		dev_err(pctl->dev, "missing required gpio-ranges 
property\n");
>  		return -EINVAL;
>  	}
> diff --git a/drivers/pinctrl/renesas/pinctrl.c
> b/drivers/pinctrl/renesas/pinctrl.c index b74147800319..5c71e168b370 100644
> --- a/drivers/pinctrl/renesas/pinctrl.c
> +++ b/drivers/pinctrl/renesas/pinctrl.c
> @@ -125,8 +125,8 @@ static int sh_pfc_dt_subnode_to_map(struct pinctrl_dev
> *pctldev, * inside a subnode nor across subnodes.
>  	 */
>  	if (!pmx->func_prop_name) {
> -		if (of_find_property(np, "groups", NULL) ||
> -		    of_find_property(np, "pins", NULL)) {
> +		if (of_property_present(np, "groups")||
> +		    of_property_present(np, "pins")) {
>  			pmx->func_prop_name = "function";
>  			pmx->groups_prop_name = "groups";
>  			pmx->pins_prop_name = "pins";
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c
> b/drivers/pinctrl/stm32/pinctrl-stm32.c index cb33a23ab0c1..66a25becd8f5
> 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1374,7 +1374,7 @@ static struct irq_domain
> *stm32_pctrl_get_irq_domain(struct platform_device *pde struct device_node
> *parent;
>  	struct irq_domain *domain;
> 
> -	if (!of_find_property(np, "interrupt-parent", NULL))
> +	if (!of_property_present(np, "interrupt-parent"))
>  		return NULL;
> 
>  	parent = of_irq_find_parent(np);
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> b/drivers/pinctrl/sunxi/pinctrl-sunxi.c index f35179eceb4e..1dc1882cbdd7
> 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -224,16 +224,16 @@ static int sunxi_pctrl_get_group_pins(struct
> pinctrl_dev *pctldev,
> 
>  static bool sunxi_pctrl_has_bias_prop(struct device_node *node)
>  {
> -	return of_find_property(node, "bias-pull-up", NULL) ||
> -		of_find_property(node, "bias-pull-down", NULL) ||
> -		of_find_property(node, "bias-disable", NULL) ||
> -		of_find_property(node, "allwinner,pull", NULL);
> +	return of_property_present(node, "bias-pull-up") ||
> +		of_property_present(node, "bias-pull-down") ||
> +		of_property_present(node, "bias-disable") ||
> +		of_property_present(node, "allwinner,pull");
>  }
> 
>  static bool sunxi_pctrl_has_drive_prop(struct device_node *node)
>  {
> -	return of_find_property(node, "drive-strength", NULL) ||
> -		of_find_property(node, "allwinner,drive", NULL);
> +	return of_property_present(node, "drive-strength") ||
> +		of_property_present(node, "allwinner,drive");
>  }
> 
>  static int sunxi_pctrl_parse_bias_prop(struct device_node *node)
> @@ -241,13 +241,13 @@ static int sunxi_pctrl_parse_bias_prop(struct
> device_node *node) u32 val;
> 
>  	/* Try the new style binding */
> -	if (of_find_property(node, "bias-pull-up", NULL))
> +	if (of_property_present(node, "bias-pull-up"))
>  		return PIN_CONFIG_BIAS_PULL_UP;
> 
> -	if (of_find_property(node, "bias-pull-down", NULL))
> +	if (of_property_present(node, "bias-pull-down"))
>  		return PIN_CONFIG_BIAS_PULL_DOWN;
> 
> -	if (of_find_property(node, "bias-disable", NULL))
> +	if (of_property_present(node, "bias-disable"))
>  		return PIN_CONFIG_BIAS_DISABLE;
> 
>  	/* And fall back to the old binding */
> @@ -1424,7 +1424,7 @@ static int sunxi_pinctrl_setup_debounce(struct
> sunxi_pinctrl *pctl, return 0;
> 
>  	/* If we don't have any setup, bail out */
> -	if (!of_find_property(node, "input-debounce", NULL))
> +	if (!of_property_present(node, "input-debounce"))
>  		return 0;
> 
>  	losc = devm_clk_get(pctl->dev, "losc");





