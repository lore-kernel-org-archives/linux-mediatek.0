Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29353C44514
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 07:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Cdb0RCCdG1Y5r/It8CwrJzVJ0JbWRfQ0sD99bdj9c+M=; b=nOdu+XiH/+4+osWaAU84Me3y/R
	EoJdDKEXasPYBGzt2pXM8ep0vApsWr/x3pfXGb5Mi2novyfU4GY44dBJ/dZYKqYLRitFVwUhmUhQU
	vvUAEGIijg5B5S+lOcbivNg8uOU/dDrzNNprxS/tTYdeAiBs5vLS/AHwausQ+6YMkfmYmrL0Tn0c8
	y3+eF0cMX2RNFCd0NTBvviOdgb7vEcMeTNUfYDJw3uvK3wE7aFvJnAzPTFJqVZ8/F4/aacMGSD06W
	8PZydNCd/2TPIzG5wmGV8yGfigXaPwLwz8YpOpj++vlVgmEtgEE2TGuD/KDR6vbzhw+gRgegY11ug
	Y8Ql0Tyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd8i-00000001Tlo-1iRN;
	Fri, 17 Jul 2026 07:37:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd8e-00000001Tk9-01xS;
	Fri, 17 Jul 2026 07:37:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D5F761A103B;
	Fri, 17 Jul 2026 07:37:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 943D660361;
	Fri, 17 Jul 2026 07:37:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC0A611BD3D44;
	Fri, 17 Jul 2026 09:37:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784273852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Cdb0RCCdG1Y5r/It8CwrJzVJ0JbWRfQ0sD99bdj9c+M=;
	b=kon2YfH/dOK4tDt53OBaDo5FFMl+LDNwDVUop5ds1NRI/Wg1uSfOdRPoX//xppPkYw4F4k
	i7WIsxXBl1un2FVxbtH0z+MNg/Pxf/kDZFkkmQMF7GWX2KDvfCGfcNPlsGE/XeWd6UWU5+
	GU0KvK2Qz5NhcKTqLYeMaoODnDSsLW8zaf8j7HAZsl2HX2a+q1UNwnNfj8/t2YSHY0CoOJ
	iuHvYWwy+oF8TF5SvX8WUIAoCWzZZkD3fHymApMwuHuo/Ci0SwMn3oduihoRjpk8TrJJuw
	dKfxpFRA4xRbQoh0VoLeExcl0443IzDaZd45c4NSu8UobUALaKN9EhlqiiNUTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pan Chuang <panchuang@vivo.com>
Subject: Re: [PATCH v2] thermal/drivers: Remove redundant error messages on
 IRQ request failure
In-Reply-To: <20260717024733.374913-1-panchuang@vivo.com> (Pan Chuang's
	message of "Fri, 17 Jul 2026 10:47:10 +0800")
References: <20260717024733.374913-1-panchuang@vivo.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 09:37:18 +0200
Message-ID: <87v7aekqxd.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_003740_173759_DA384F3D 
X-CRM114-Status: UNSURE (   5.87  )
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
Cc: "open list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <imx@lists.linux.dev>, Heiko Stuebner <heiko@sntech.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>, Frank Li <Frank.Li@nxp.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Peter Griffin <peter.griffin@linaro.org>, Thierry Reding <thierry.reding@kernel.org>, "open
 list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Florian Fainelli <florian.fainelli@broadcom.com>, Magnus Damm <magnus.damm@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, Jonathan Hunter <jonathanh@nvidia.com>, John Madieu <john.madieu.xa@bp.renesas.com>, "open
 list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wenst@chromium.org>, Zhang Rui <rui.zhang@intel.com>, Thara Gopinath <thara.gopinath@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, "open list:ARM/QUALCOMM
 MAILING LIST" <linux-arm-msm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>, Markus Mayer <mmayer@broadcom.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "moderated list:BROADCOM BCM7XXX ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Niklas S?derlund <niklas.soderlund+renesas@ragnatech.se>, zhanghongchen <zhanghongchen@loongson.cn>, "open
 list:THERMAL" <linux-pm@vger.kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, open list <linux-kernel@vger.kernel.org>, "open list:RENESAS R-CAR
 THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Lukasz Luba <lukasz.luba@arm.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17/07/2026 at 10:47:10 +08, Pan Chuang <panchuang@vivo.com> wrote:

> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Niklas S?derlund <niklas.soderlund+renesas@ragnatech.se>

                       ^
There is an encoding issue here

>  drivers/thermal/armada_thermal.c                          | 5 +----

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l


