Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D651C30653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQQUVeIK7k0d9MgtOJcxNr56RS5eoBT5sfu3gWH8b0g=; b=4UAraKQAKBw5W42o+c06Ete8/n
	oOEGbrDnGh6JuJCAKUtwmc4HJlBaK41SbsOetxjUll2zVJZQ4+yHnFcWlw2859tfbDZQlekYmGkd8
	iSlcRPHDl0hqe3aOIvA05KlW7M96fGxYYCbBBtj53SE9KxoqXfdKhRYxk5LBTi0Bhq7HegZ0GgGlf
	kKD+n1Mia9KI6931ZlCUI5z9eL0FVTTfUi4lZ4m1q/CerJ2/Ctl3MDlqEEs/Ulqae5suP4J+oAT7E
	u10yx80iddO9sMlvismfz7FS9uFOPGZV1FZD3j/wcAJikxlx7ir7AHkqWbhVrbDIfdwqRcTVfp//j
	czohqy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPoG-00000006JFw-2Q8C;
	Wed, 26 Jun 2024 10:23:28 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPo6-00000006J2W-3OxZ
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 10:23:25 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so46165641fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719397340; x=1720002140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQQUVeIK7k0d9MgtOJcxNr56RS5eoBT5sfu3gWH8b0g=;
        b=QXB+i43RhVmOqBV64qRdr2baLCL/EmcmYg5MzJpr4FfzpypvdVA65XrwsVrwVaFuTG
         ijZQvsmS/4i9mu/ln8O1wcHVXUMa0FB/V5dq9MIP03PLUM7mdGu4u5bcVl2H9vSDsutt
         6c7j2PGUaOkZG57TixXd81R75Pqay4wjKBgA5SOCKvgq12qin+3eR4IW6OE/M0kxFwkz
         ur9hhwLQ/xpZq1tNl/hvq1X5KpjH6j/sTCE0e70pWzTmnQRlQsdNDZGvyWYARbH6PPO4
         g3iSIUNHP8NbrJCD6g0kkI2WNjYaRS57HRhYSvllPB25uXN6WS/TQxXpclNOFogWJijo
         Ka3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719397340; x=1720002140;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQQUVeIK7k0d9MgtOJcxNr56RS5eoBT5sfu3gWH8b0g=;
        b=U+wSoKXsR79iLIlxWNyveatd/FPvVJijJtKmC/Im6DIDdgwh5689gvhARFj+ZeEfcA
         a1Vm0wcvpbNH6TGf7iheWGSOV0FYyuQpENHETjEV/2W/hOQ+0u8b3p9SEyGypaJoOM1m
         s2uPRgeMcahLHQJ/ukFqrhomcvHCA3k+8HftEoDwQMRNdQfuO/RQtJhcmPXrhCQ3spar
         Fplp8qczauGGq79P1rtdgV8h1l/eUDz19/CvYiOga0ZNPdxSxZNcaK9NYjc5AyZuqrx+
         6hGkYkwvwji9FuaYrZvdLh2cJtQcK/rYsfmQqfNlx6EiQYdXAmjkZSxV70BXP8WX0RGq
         9D2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyUNUP66OL7iT34r3WpnTENnfI+e3DdtRTiPeWXLbWvYAhX3p6HeiYLsf4Va16UiOMI6WMKalOHrj+n9hfCZoANLxbXgc8l/cTXmH+q4LjpCi0
X-Gm-Message-State: AOJu0Yy+FGB39UlhuDA/zGVQeWHZZ5Dk98hQpOO4MnpiymilGWeKmMUa
	Jdc2Fw6mT3NEamFMSj/RO9t6aXkiZ0BFLlJhHhKTSIBM4pbZs8W4E3rjzhKeGiE=
X-Google-Smtp-Source: AGHT+IF66geCJ+IDyk7DWlk8gVgabzMqbrOvnz5dxF4G+PQuP7P1Yu2mU/puCcrZCVWhA+b+phfFGg==
X-Received: by 2002:a19:6b03:0:b0:52c:dba6:b4c8 with SMTP id 2adb3069b0e04-52ce183265emr8209671e87.13.1719397340267;
        Wed, 26 Jun 2024 03:22:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8245e87sm20498075e9.9.2024.06.26.03.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:22:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
 Wells Lu <wellslutw@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Tony Lindgren <tony@atomide.com>, 
 Stephen Warren <swarren@wwwdotorg.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com>
Subject: Re: (subset) [PATCH v2 20/20] pinctrl: samsung: Use scope based
 of_node_put() cleanups
Message-Id: <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
Date: Wed, 26 Jun 2024 12:22:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_032320_655768_CAF388ED 
X-CRM114-Status: UNSURE (   6.48  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Sat, 04 May 2024 21:20:18 +0800, Peng Fan (OSS) wrote:
> Use scope based of_node_put() cleanup to simplify code.
> 
> 

Applied, thanks!

[20/20] pinctrl: samsung: Use scope based of_node_put() cleanups
        https://git.kernel.org/pinctrl/samsung/c/707807f4c1128e39442519e849e4ce0b7c29b110

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


