Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE58C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uC/3T3eGWGFOEE1PbRSfClhA+s+YXINyGNLQ2E3nzRI=; b=1zBkcS4SMpqRFSN+SHi2B1ZD+u
	pj3H6kC+Ic+FSP4ffHQ+VIig4qcfpIHSibuN/ENp7KXDDT0qmVdIJW4kE59PT/U+F3jNunSpTQNVR
	owDd+NitdQVW1LYsUKNgp95QYnYZk5fzPFEWegDprT0snBu1qBothUz/fmHFC3JGhtr7a8M8+oRw0
	lr+VgVyfXQRHlfa5H+hSYGbC45c6KYVTK2cKmpJktESD0SW+UgyeP8efjXuihcc1Lk3X7z2tAmBvD
	SNOdT7VqHLdRHpt0WJrM7nEjNL3xjuc+6DpOkK8b7mA8QJByMztd4KTbYjYEwMgW5eOILvm2t4Ybi
	8cFCMBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiBBa-003nVT-CN; Tue, 11 Oct 2022 09:04:26 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiBBV-003nTA-Bw; Tue, 11 Oct 2022 09:04:22 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B5tpq8002064;
	Tue, 11 Oct 2022 04:04:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=uC/3T3eGWGFOEE1PbRSfClhA+s+YXINyGNLQ2E3nzRI=;
 b=Eqt0HEjl4HUC1I5SG11ICumXSv1k9d5cWofmQzkWUH2trm3jUTD+u/G2Apo/fsSb/cSG
 Tng23BiSSDN5jFWaZNgOaFOOIIzazw5pNqpYPCUWag8OwtSdpHakIct1ESArNLkNJ0of
 Xm5zmUclf5hNi4T1CjfgYghZ79wqGh6Q7V9aNUCOOZ+X3gbAOEXOSz7QEPMb4ZPkmawG
 ctBvlVxGU+zctoeD/CUTZvVxJkjdIdwzEZOQtwPdzz7ArdID4uqQQpbxPU6f79jyQETN
 2nTesBLmGIsh9NM22V7r9Ury3vf5q8z4vtAkbXqpCUc0MtSOWoMivhnQjDryye4ogbNk mg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3k36m1u4wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 04:04:01 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Tue, 11 Oct
 2022 04:03:59 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Tue, 11 Oct 2022 04:03:59 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 53567356B;
	Tue, 11 Oct 2022 09:03:59 +0000 (UTC)
Date: Tue, 11 Oct 2022 09:03:59 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent
 Gibson <warthog618@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg
	<mika.westerberg@linux.intel.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Samuel Holland
	<samuel@sholland.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Bjorn Andersson
	<bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Phil Edworthy
	<phil.edworthy@renesas.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linux-actions@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
        <linux-rpi-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-mediatek@lists.infradead.org>,
        <linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-omap@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter
	<jonathanh@nvidia.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam
	<mani@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
	<joel@jms.id.au>,
        Florian Fainelli <f.fainelli@gmail.com>, Ray Jui
	<rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Jacky
 Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>, Andy Shevchenko <andy@kernel.org>,
        Sean Wang <sean.wang@kernel.org>, Andrew
 Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman
	<avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry
	<tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen
	<yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Ludovic
 Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre
	<nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Paul Cercueil
	<paul@crapouillou.net>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Tony Lindgren
	<tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy
 Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki
	<s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Viresh Kumar
	<vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, <soc@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Emil
 Renner Berthing <kernel@esmil.dk>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v2 13/36] pinctrl: lochnagar: Add missed header(s)
Message-ID: <20221011090359.GE92394@ediswmail.ad.cirrus.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-14-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221010201453.77401-14-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Q0XwLx7qaYTbXGAyatd6dgbnlBdk8dwU
X-Proofpoint-ORIG-GUID: Q0XwLx7qaYTbXGAyatd6dgbnlBdk8dwU
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_020421_473007_C07C1E02 
X-CRM114-Status: GOOD (  13.66  )
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

On Mon, Oct 10, 2022 at 11:14:29PM +0300, Andy Shevchenko wrote:
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
> 
> While at it, sort headers alphabetically.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

