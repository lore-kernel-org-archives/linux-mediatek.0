Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B80AC636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 21:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2x4QxJv4nKAQD6nmh3v1P/gvRFcvPZ/+reUMK1IHmk=; b=eX6AK90RijJZ98i6eS+js9q1JG
	UP8PEAYDsN9yJMatZ2qT+zMgo91etsUPWXD16cUAo7ZnQ25QmrVTrHwYY7ib0zPMdtoe2UFPAGxB0
	5Lhh1uErMgDCivCxlxW25PhgiZw28kI/OvjX9L1sWUv70oq2qyPfPb/3h0xCejDV+3U7Kn98yh1Qe
	fjJ1GMPAl9GYQZPs9g21oUfgR0V1apcXs1Ic80dnDhzNQpW51A1eMFxiy6YcbJovd5fKitw8IcNCQ
	6C8LQdWqfT2HYqLeHd44AvTWkqRdjhLgq9yQzp2v3ZtjQIN/AF4kKyX1qCp352ML2g00o88CJzQu0
	i/YUjaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUaLH-009qfK-Md; Tue, 21 Feb 2023 21:38:31 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUaLC-009qdd-Pk; Tue, 21 Feb 2023 21:38:28 +0000
Received: by mail-ed1-x52b.google.com with SMTP id g1so22520338edz.7;
        Tue, 21 Feb 2023 13:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2x4QxJv4nKAQD6nmh3v1P/gvRFcvPZ/+reUMK1IHmk=;
        b=hvcbbxjHy3yfhZZaSoQ20ukzgEnIfEyrMlnC1c8Mj23mZ7Z3onoLj/8XHMhGA9BGdj
         2e55K/WV6r5hQDtRQOvv6Luyw8hQYXkV9vDaxVFsHD77eysOg2nkgkw+/JjpTCkAeFBN
         lznssBgKnma18h7wVh5jhzY5IReazXSbGL9j8s7utXvSkeXZmD8s6kMSM7EcRgZLCYyG
         yYnuxUfUfSGSdRy10QjagUJAF3urpw1t3CZN0Gk6ajP79qxMM1PpbRMsSgckdZqlRUJa
         cllc8OuefC+uCPx2sarqRn+81n7w22uOi37fJj34mGr+UEKjzYlRxX8OQjb0wgqBB63z
         ZHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2x4QxJv4nKAQD6nmh3v1P/gvRFcvPZ/+reUMK1IHmk=;
        b=QFLBxIl2iTMos5zT+mWucPQePlK2N/m7eBh6MslkPYhGEAZ77fnZwZVC4wd1o/fnoM
         osI8ohlI5UN+dV3HVs1oGjC8OTLOk4I1XQdkM8GPJiiwmYsiw7WEL9dbftKi7LXhck5i
         /vPeFSZpYlBpXuBWgMd9hERw7H827g36rvyJIGlOEe4Ac7JneZ23mULpwSJ1cI3jBYAw
         sXmNfnzi5cquffM4wdbmHEfkAq2DpOZHo4n28+K9dbIBnSjsr6cZhEXn/iQTc7PI7bYY
         W4jMAnqnw/O5te1104yUzPg6A4GYr+ETvaCh34FgV6ziHz1LBczvl+UESg1RVwLyat9l
         v1Nw==
X-Gm-Message-State: AO0yUKUPCn2TSelSCtiNoMAE/Ygd9f+P+GrIEZ38d1KIndeT8zg47zyK
	UivVM36Xv7VyhGBZpG4qE6J1GN2MQi6oenXAs7k=
X-Google-Smtp-Source: AK7set+WgWx80yG+IPD6BZtc2LM511WxHd/1uNy9RyymaByA5DzDe9ltu/NxF8DAR1dqIEJxGGjio8OxlPTpsYlt4UQ=
X-Received: by 2002:a17:907:3d91:b0:8af:2e89:83df with SMTP id
 he17-20020a1709073d9100b008af2e8983dfmr13559381ejc.6.1677015504149; Tue, 21
 Feb 2023 13:38:24 -0800 (PST)
MIME-Version: 1.0
References: <20230221145021.31993-1-zajec5@gmail.com>
In-Reply-To: <20230221145021.31993-1-zajec5@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 21 Feb 2023 22:38:13 +0100
Message-ID: <CAFBinCDxB=xtz9mtZupBC7J5oxknN1ENHzJ-cFxX4FTDSgZeFQ@mail.gmail.com>
Subject: Re: [PATCH] nvmem: add explicit config option to read OF fixed cells
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Evgeniy Polyakov <zbr@ioremap.net>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-rtc@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_133826_899107_06B89AD5 
X-CRM114-Status: GOOD (  14.83  )
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

Hello Rafa=C5=82,

On Tue, Feb 21, 2023 at 3:50 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> NVMEM subsystem looks for fixed NVMEM cells (specified in DT) by
> default. This behaviour made sense in early days before adding support
> for dynamic cells.
>
> With every new supported NVMEM device with dynamic cells current
> behaviour becomes non-optimal. It results in unneeded iterating over DT
> nodes and may result in false discovery of cells (depending on used DT
> properties).
I am not familiar with the recent changes around dynamic cells.
Is there any discussion/summary that I can read to get up to speed?

My main thought is: if there are many "fixed OF cells" implementations
and only a few "dynamic" ones - does it make sense to flip the logic
and introduce a new "use_dynamic_of_cells" flag instead?


Best regards,
Martin

