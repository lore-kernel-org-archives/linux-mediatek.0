Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBCCE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 18:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/qM869MCmQZkRsPpCevAXNj2FXSE3qMjToZGsvPE8I=; b=D5HHxtaSex/Ob8
	qppeNB3cDDlV+EybzRPLwsk+R8vN78pVTAE1vGNdIoY77T/RVpWus2PYA51AN9l7bbJ0NbzuRkZm4
	v5ojwVA19plIpLarujEh5XbvgapPU7x2f0KuntIux+SmNK8gbM4SF/yvaZ9GhNcX4xBF87kIwaatr
	FGetPECWJXj9Pi9hMfRwsz9jGuhGgZJUq4lxt2fhStPPwDI+YI16RlfxgRt+/gzniLpNWp4YcE50q
	xQy8k38N0XC1JrCh3fZ609udeS524TnqjvWYYkWvF5/HlY9SJnqLInBFO5V96FEgCczjXtDg8q/R6
	6RP64kug6L6v/yh+maiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5F1-0000000CRXq-2XCb;
	Tue, 10 Dec 2024 18:45:51 +0000
Received: from smtp-25.smtpout.orange.fr ([80.12.242.25] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5Ey-0000000CRUO-3cgc;
	Tue, 10 Dec 2024 18:45:50 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id L5EotBIgE01M2L5EotfE5j; Tue, 10 Dec 2024 19:45:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733856342;
	bh=o/qM869MCmQZkRsPpCevAXNj2FXSE3qMjToZGsvPE8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ZQr52uRj3DCZS904wPu9oO3He4yPgn4PkS2eoS14L924pm6/3GFbuRKA0gVxK62lE
	 YcpeFbwShTcxSGCoFi59YGdorMjjicdzgbyRG1dMGBxyC0Bt3U9FNUm21MmcLUwSs5
	 IW6mdXYyCnSEdO1ntkwjXE8H88rjXAbhoMLgm2kxBtZrca8nB2JlVpMujmDE2NDNeg
	 fM1st214JoIHg3VdZR7yngsugauVnKWR9NMRVuLZSEaZgSnKKkF7tj5qwvIMHB5R/0
	 dWCDEPJ4f0VCwTI8Z1MWhrwU0WqTYsdXly05mbhwOeKTRBRWDYNeYswTWNb33/mDAP
	 UXAbWMjvBEO4A==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 10 Dec 2024 19:45:42 +0100
X-ME-IP: 90.11.132.44
Message-ID: <32201aec-f3d2-49a7-b0ca-2ede10fec103@wanadoo.fr>
Date: Tue, 10 Dec 2024 19:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] pinctrl: mediatek: add MT7988 pinctrl driver
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@kernel.org>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-3-linux@fw-web.de>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241202110045.22084-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_104549_306067_32A7B348 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Le 02/12/2024 à 12:00, Frank Wunderlich a écrit :
> From: Daniel Golle <daniel@makrotopia.org>
> 
> Add pinctrl driver for the MediaTek MT7988 SoC.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> [correctly initialise for the function_desc structure]
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> ---

...

> +/* flash */
> +static int mt7988_snfi_pins[] = { 22, 23, 24, 25, 26, 27 };
> +static int mt7988_snfi_funcs[] = { 2, 2, 2, 2, 2, 2 };
> +
> +static int mt7988_emmc_45_pins[] = {
> +	21, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37
> +};
> +static int mt7988_emmc_45_funcs[] = { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 };
> +
> +static int mt7988_sdcard_pins[] = { 32, 33, 34, 35, 36, 37 };
> +static int mt7988_sdcard_funcs[] = { 5, 5, 5, 5, 5, 5 };
> +
> +static int mt7988_emmc_51_pins[] = { 38, 39, 40, 41, 42, 43,
> +				     44, 45, 46, 47, 48, 49 };
> +static int mt7988_emmc_51_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 };

At least all the _pins arrays could be const.
Maybe we could also make it possible to have _funcs const as well.

...

> +static struct mtk_pin_soc mt7988_data = {

const?

> +	.reg_cal = mt7988_reg_cals,
> +	.pins = mt7988_pins,
> +	.npins = ARRAY_SIZE(mt7988_pins),
> +	.grps = mt7988_groups,
> +	.ngrps = ARRAY_SIZE(mt7988_groups),
> +	.funcs = mt7988_functions,
> +	.nfuncs = ARRAY_SIZE(mt7988_functions),
> +	.eint_hw = &mt7988_eint_hw,
> +	.gpio_m = 0,
> +	.ies_present = false,
> +	.base_names = mt7988_pinctrl_register_base_names,
> +	.nbase_names = ARRAY_SIZE(mt7988_pinctrl_register_base_names),
> +	.bias_disable_set = mtk_pinconf_bias_disable_set,
> +	.bias_disable_get = mtk_pinconf_bias_disable_get,
> +	.bias_set = mtk_pinconf_bias_set,
> +	.bias_get = mtk_pinconf_bias_get,
> +	.pull_type = mt7988_pull_type,
> +	.bias_set_combo = mtk_pinconf_bias_set_combo,
> +	.bias_get_combo = mtk_pinconf_bias_get_combo,
> +	.drive_set = mtk_pinconf_drive_set_rev1,
> +	.drive_get = mtk_pinconf_drive_get_rev1,
> +	.adv_pull_get = mtk_pinconf_adv_pull_get,
> +	.adv_pull_set = mtk_pinconf_adv_pull_set,
> +};

...

CJ

