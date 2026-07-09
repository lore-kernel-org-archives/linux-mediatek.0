Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F93C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 07:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMx843/5S34JEAk8VaWDn/h5oOHvje0shPRIPDVNBUs=; b=hoL7xm8dGjRRiex1GHoYyQJAoI
	zCFVQdTbODYgQx73goW0AnfDDbEdHx0YGj2fNSFfIb0PnOcYu71RJjRgPTbi8dHU0wWTC9jJJscb6
	8wchdaYtwHKq7gAzLu6fa8IvDEUyxShbD79BwXM8u+57BsZZvSLl/eHScAj8DRMBNJ6pa7TDP/w87
	Eqdxi/fuO+5LY9W/m6pqd2FC2NvSzjd8L2xokXalVPK9s3zzySd5k5GRhDVWvI0+iuSa/d8GeY6yG
	GZRzw7CBbMTUH+zfcOJsSHzbKxClnEw41Ot3jGv/RiiesdCBqATjZk+C/m6HisgHgN86FqU8EAAZ+
	jfz4JnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj7R-00000001Gsq-0zcQ;
	Thu, 09 Jul 2026 07:24:25 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whj7N-00000001Gqi-0qhJ
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 07:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gMx8
	43/5S34JEAk8VaWDn/h5oOHvje0shPRIPDVNBUs=; b=NuwCZfDvc91ju+YTsx4n
	eZWwMQbPm+QI4f+FRcoOPL3cEQKcFifbAWJOWfe20PCky4AkARDVTO7jSTImK0ng
	KYaZgKYF5nnCwqAs4KsFUVF7HIlFDaBKbPhucbl1UAZlMoXIFD0+WwRPxFmexC6j
	QsXrtzYDtk9TUduI/3rlJBSGTwEpt3LfNbh5UZqHQWE4jYOdmr4/5fNvvwsBYRFJ
	Wpd9tnh7uHCLgkA4+zbfkLwLNiQZ6I6kO2HYGGya2nLPUYso+L5Kh/hv0inG7DpN
	XsLyWddSoLcbgvRTYh3Hvj0cMvMcMhwLJQEQLct9v1RTgUPKVR6ylOLxKRfuhrsY
	Rg==
Received: (qmail 1017861 invoked from network); 9 Jul 2026 09:24:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jul 2026 09:24:05 +0200
X-UD-Smtp-Session: l3s3148p1@XaNSgihWothQT+F6
Date: Thu, 9 Jul 2026 09:24:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 00/18] thermal/drivers: Remove redundant error messages
 on IRQ request failure
Message-ID: <ak9MldvSmaDyJn42@shikoro>
References: <20260709023048.599150-1-panchuang@vivo.com>
 <d31c4217-4733-4459-a9d7-265731d295fc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d31c4217-4733-4459-a9d7-265731d295fc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_002422_074346_29AE8A0E 
X-CRM114-Status: UNSURE (   5.81  )
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
Cc: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>, Frank Li <Frank.Li@nxp.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Laura Nao <laura.nao@collabora.com>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, Peter Griffin <peter.griffin@linaro.org>, Thierry Reding <thierry.reding@kernel.org>, "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, Jonathan Hunter <jonathanh@nvidia.com>, John Madieu <john.madieu.xa@bp.renesas.com>, "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Zhang Rui <rui.zhang@intel.com>, Thara Gopinath <thara.gopinath@gmail.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Mason Chang <mason-cw.chang@mediatek.com>, "moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>, Markus Mayer <mmayer@broadcom.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, zhanghongchen <zhanghongchen@loongson.cn>, "open list:THERMAL" <linux-pm@vger.kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, Pan Chuang <panchuang@vivo.com>, open list <linux-kernel@vger.kernel.org>, "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Lukasz Luba <lukasz.luba@arm.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


> all of these 18 are just one commit, no?

I think so, too.


