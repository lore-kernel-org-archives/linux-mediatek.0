Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AAEC761A6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 16:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7MhNZCWbmm+EQT2ZpLl2E/34gvDoi8JcsBYxfVZFwk=; b=me++aPOw2Q4nNSUvuPTM54q1cs
	dfUkuF90UGu8D5Qvq5Of+5C4mdycD6aI7O1yGiwZu31jL5bXAJxGMjyMlAkd1DxC3y84EMAd3McF9
	X41xOXcOjv/46P4bcYT/lulZlhqSIcFFoviz3opkMwv74VD+UharrQ1pHXR1Cg3ihGBlKSdFgOe6n
	QlHpIh9H/SMZayvsaSbiYspm7c6ehQx7xnVcL5FNmvMlSVau/OsEjqibq8NyK2PXVA19ql3an+YvT
	VUgTsUVPUodaX51w308Rqso3hqi6sEzvOR/dCJ+UEikhfQrU8sK9vrUpkYKyhSGViEQb9Dg3tOOga
	nRzxoBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjyH-002ITm-02;
	Tue, 04 Apr 2023 16:57:25 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjyC-002IRs-2O;
	Tue, 04 Apr 2023 16:57:22 +0000
Received: by mail-ed1-x530.google.com with SMTP id w9so133315961edc.3;
        Tue, 04 Apr 2023 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680627437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7MhNZCWbmm+EQT2ZpLl2E/34gvDoi8JcsBYxfVZFwk=;
        b=VpLHIMinqDrwBgJCKe6aTCq+o2ToI2AcQwk7ETuH985y5l712JB/Jr1vrwVpie63AZ
         nP362aTfXVOwRwLlXpHGRk4PBTdeD94ijJ3+RUp1P9nqBBAXEX3pLLPbG+6Inwk7Uyaj
         uFjOnX4OGtjx8sYfx5vR29bO11rfY1Hsi6htfgOa7JqSh39Nv9chkha/eSesvzGdBXYu
         bpqi5ctpHBfKsmoMkLOHfPG+HXDlIrDf4yTtLRYMdJ/ZFlrEERZIjqkBnEZBJXKN5zvv
         6tBj4cl/oiz+AS47+YvLvIi9B3cokqy7sBMFOpBtuySkQHlO05Xw1iJ2uLy3r//bUthI
         cYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680627437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7MhNZCWbmm+EQT2ZpLl2E/34gvDoi8JcsBYxfVZFwk=;
        b=VcmZ7zKhFO7LkNmloHcJlnZ2kaAY9JVRKscI315hVefAZvhnNufkT3tFTDGID46Fcd
         ODVWE3+IeBkf8NfDYwCzFNQdc4r2uM4s3YMyxTI+1Qlxhi1kMO3xENB+ML4aqKRH/ngs
         MzX2MtI7uemkabTrPgK9UkYtKZYm2cxzgrECui3n6hRJbTsFMWB1icBpXZqyMpJvTIgT
         zMDPu1uG1jB125d0F4RDtIPKtdI3Cd5PXFM0xHW4aBEt5/VzxFHaiQP8Mva9kyNvc/I2
         QybOpnrlUAArddLdc/VHXlm0SDX2tHPqTRUfBBrNoOszLaYsGZWOCogPyWshdfcQRCFS
         jLbg==
X-Gm-Message-State: AAQBX9dEl6jWzEl0M5OoSwhL8nFObELPsYmOM1ummLMYwQMmTxg7TOYh
	YgAqzZZUaXf5UGnHCo/JWXM=
X-Google-Smtp-Source: AKy350aLVwwKqFdLN/chhOt48r5LY4guvRxpRxIkNFsLEqvsNQmQtpD22vmnvW+Hx6srEDa7zCZz5g==
X-Received: by 2002:aa7:d514:0:b0:4fb:6523:2b38 with SMTP id y20-20020aa7d514000000b004fb65232b38mr156531edq.27.1680627437154;
        Tue, 04 Apr 2023 09:57:17 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id e27-20020a50d4db000000b004fadc041e13sm6144420edj.42.2023.04.04.09.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:57:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-rtc@vger.kernel.org,
 Michael Walle <michael@walle.cc>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject:  Re: [PATCH V4] nvmem: add explicit config option to read old syntax fixed OF
 cells
Date: Tue, 04 Apr 2023 18:57:14 +0200
Message-ID: <4817385.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230403225540.1931-1-zajec5@gmail.com>
References: <20230403225540.1931-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_095720_802073_5D04EABE 
X-CRM114-Status: GOOD (  18.66  )
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

Dne torek, 04. april 2023 ob 00:55:40 CEST je Rafa=C5=82 Mi=C5=82ecki napis=
al(a):
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Binding for fixed NVMEM cells defined directly as NVMEM device subnodes
> has been deprecated. It has been replaced by the "fixed-layout" NVMEM
> layout binding.
>=20
> New syntax is meant to be clearer and should help avoiding imprecise
> bindings.
>=20
> NVMEM subsystem already supports the new binding. It should be a good
> idea to limit support for old syntax to existing drivers that actually
> support & use it (we can't break backward compatibility!). That way we
> additionally encourage new bindings & drivers to ignore deprecated
> binding.
>=20
> It wasn't clear (to me) if rtc and w1 code actually uses old syntax
> fixed cells. I enabled them to don't risk any breakage.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> [for meson-{efuse,mx-efuse}.c]
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> [for mtk-efuse.c, nvmem/core.c, nvmem-provider.h]
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> [MT8192, MT8195 Chromebooks]
> Tested-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> [for microchip-otpc.c]
> Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> [SAMA7G5-EK]
> Tested-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
> This is based on top of them
> [PATCH V6 3/3] nvmem: core: add support for fixed cells *layout*
>=20
> V2: Fix stm32-romem.c typo breaking its compilation
>     Pick Martin's Acked-by
>     Add paragraph about layouts deprecating add_legacy_fixed_of_cells
> V3: Update commit description:
>     1. Make it clear we're NOT dropping fixed cells support
>     2. Use nicer words (s/made sense/was totally safe/)
>     3. Explain fixed cells layout thing
>     4. Add paragraph with purpose of this commit
> V4: Completely rewrite commit message.
>     Rename config option to "add_legacy_fixed_of_cells".
> ---
>  drivers/mtd/mtdcore.c          | 2 ++
>  drivers/nvmem/apple-efuses.c   | 1 +
>  drivers/nvmem/core.c           | 8 +++++---
>  drivers/nvmem/imx-ocotp-scu.c  | 1 +
>  drivers/nvmem/imx-ocotp.c      | 1 +
>  drivers/nvmem/meson-efuse.c    | 1 +
>  drivers/nvmem/meson-mx-efuse.c | 1 +
>  drivers/nvmem/microchip-otpc.c | 1 +
>  drivers/nvmem/mtk-efuse.c      | 1 +
>  drivers/nvmem/qcom-spmi-sdam.c | 1 +
>  drivers/nvmem/qfprom.c         | 1 +
>  drivers/nvmem/rave-sp-eeprom.c | 1 +
>  drivers/nvmem/rockchip-efuse.c | 1 +
>  drivers/nvmem/sc27xx-efuse.c   | 1 +
>  drivers/nvmem/sprd-efuse.c     | 1 +
>  drivers/nvmem/stm32-romem.c    | 1 +
>  drivers/nvmem/sunplus-ocotp.c  | 1 +
>  drivers/nvmem/sunxi_sid.c      | 1 +

=46or sunxi_sid:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/nvmem/uniphier-efuse.c | 1 +
>  drivers/nvmem/zynqmp_nvmem.c   | 1 +
>  drivers/rtc/nvmem.c            | 1 +
>  drivers/w1/slaves/w1_ds250x.c  | 1 +
>  include/linux/nvmem-provider.h | 2 ++
>  23 files changed, 29 insertions(+), 3 deletions(-)




