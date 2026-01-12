Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2C3C9EC7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 11:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKcVMavfDPR/GjnaR/5gl5HBiFyT0Avl2Y9Z3h3P8K8=; b=QshdmXYZ86qRVB6J2CHwKSguyX
	BV//OyFAz4WbrrUubSmg6sURp2N5zKiMNI7FS26xNG496bZeV/Ct7yO6YQNhNHYczzuSKEkr4WCWB
	U/q43PYUYSxmrW3oK9SpOUr79yNNi6r31AsZRBIxBYCbMdlvwmgDdGmhxvjjXi1y4X2LF/D06NzzR
	B8MWYF5hpnOYw4t6ch/jUwbAlkAmvs/F2ouvBc5rYC4S38lrErJkMP1V8e/goumuTNpzO3tTbz5DB
	cXWwWFQChhm6OzaeTqcEKOBYwirVNqbY0pcNtlVhnIZFo+vZdoh4Jsq8zaUEZpqMgXEu3odGj2ju/
	XAv+b8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGVi-00000005I24-0GCU;
	Mon, 12 Jan 2026 11:55:02 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGVe-00000005I0R-3UgK;
	Mon, 12 Jan 2026 11:55:00 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7CHOD2269630;
	Mon, 12 Jan 2026 05:53:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=mKcVMavfDPR/GjnaR/
	5gl5HBiFyT0Avl2Y9Z3h3P8K8=; b=O6dwoWKsDC46oiBx+YC30Ra2kOw7veHlDE
	XXOlNN7g9YwPbUP8yF4FwOtFlDN2ga9aovvtnnkwmNP9J/76lWoLokoDUsVUsK/6
	Q942zt+q1+YO/C4E0rqC9mGg1dcD3WAbf2U+zM853W/ZJLXZVqF+2ttMCfK5hV2x
	wjjBdxM37Ma1UXjQ1QP+XpJ+7G3NsqGiMtfpVVMLbvu6UpB2Tnl1Ypd0qvDoxFXi
	lnx2r2Oe3n9c0v6mj0AC/TK1MknSfjTpBj+M3gk8aJogMTE+WdzS6GyMS+Fvu+ok
	l+1uJD/3QM46n92jEmTGWVULb1KuCrQMNWKZqIsu6Y7+i8msrhYw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021094.outbound.protection.outlook.com [52.101.52.94])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bkn201jwa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 05:53:57 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcB263S4PLVVnzQD9rnRMHwn42kuiJ674nutxNQSYCZDZOKWBt+KqK9ZKEuKktGynYcX0jia/XF95Xy/VYA3sUUT00qnmkLhXbD5zn1uE7ld8y5SBcZrlviLjrcDuEQKKRfV9xmzNToQEn8PfGQib9mWu0MIJlhGH36aSzd+bV6ihWFt9ZDgtL+vbHd735aDJRXnAJFDaEPLWXbnwe383zA9mk3udI3SyNZvJarpXIdbQWnM51lL50M7F2vW3ShNBRr8MCPkkpzWmmC94r7XQH4v+5GTv8r/NwZu7Dz3RC0vt5QwA1KWIR8fpZe9FOTWe2J2GosWNVNHD6rVKph2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKcVMavfDPR/GjnaR/5gl5HBiFyT0Avl2Y9Z3h3P8K8=;
 b=QUxRUB9KYguU2IF35i8JIsofoLY99hy1G7e5EY890rlTtAtDk2z4qHQvWBNRJPLtVYsOKKa3aZsZXAIc7YxSrL8ZMIrjhRSY20YCw4LNxtb01y0xCZm4Lks/vU+MRWF0EKJ3hntGq/swdvt0lBvYJv/ScTsCTG8Hiocsm3snG0/lL5KOMS+q/u734GndIVa9hl22ioYPYLw9ARgTZeaQ+YBEf4o/ooUjNLZuF2kJKAX0TCApIht8cDvoLaROMvho2xZ+Ih+FUkGNKiwA4JPNyCXvXHpw65iVzY5wVggzy73wyfgXiqJgXC77TJNWzgebAP7O3LbKCxijoj+Dic+MJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKcVMavfDPR/GjnaR/5gl5HBiFyT0Avl2Y9Z3h3P8K8=;
 b=jPdee84Z/RqW5+XURusIY+qRuEJIT3co20kzHmiMBtLjRpvfvt1qx79Zk8Py8nBc5Q/D+kcSlS1CINfqqPhqdMnyAYrVWpDeoOjTVKJHpgD4kk2XNc24GASoWcGLvIsLfpOQWvsn/fzowODr1yCS7fDENaebZrwVw37rDKQo0Ck=
Received: from BN0PR04CA0174.namprd04.prod.outlook.com (2603:10b6:408:eb::29)
 by CH0PR19MB7933.namprd19.prod.outlook.com (2603:10b6:610:188::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 11:53:53 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::dc) by BN0PR04CA0174.outlook.office365.com
 (2603:10b6:408:eb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 11:53:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.0
 via Frontend Transport; Mon, 12 Jan 2026 11:53:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C6E7340654E;
	Mon, 12 Jan 2026 11:53:51 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8ED3A820247;
	Mon, 12 Jan 2026 11:53:51 +0000 (UTC)
Date: Mon, 12 Jan 2026 11:53:50 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Varshini Rajendran <varshini.rajendran@microchip.com>, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, David Lechner <dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>, Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, Sergio Perez Gonzalez <sperezglz@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>, Alessandro Grassi <alessandro.grassi@mailbox.org>, Chen-Yu Tsai <wens@kernel.org>, Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Wanner <ryan.wanner@microchip.com>, Michael Hennerich <michael.hennerich@analog.com>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, William Zhang <william.zhang@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v1 1/4] spi: Propagate default fwnode to the SPI
 controller device
Message-ID: <aWTgzqXrGMcdpFOr@opensource.cirrus.com>
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
 <20260108203004.3538449-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108203004.3538449-2-andriy.shevchenko@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|CH0PR19MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 691ddfb2-bd56-4e2d-2d8f-08de51d141e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IOch9kY5POsIU1IyeDrarty6p1TVrcAEgh154ybiK/Mub6HmaGhLDvM5eB3W?=
 =?us-ascii?Q?qB/jR/icP1tna5w8GAKmKjAzmUzWrD43Ht9Hv/Zey0lvOKyBdpsebkV1j/n3?=
 =?us-ascii?Q?88t2pN4m6Yobtz0ooMiAsV2EOonAl9OmcqoLj3EfjgWk5dbUE9eYdEKrTF5m?=
 =?us-ascii?Q?xXDUCUZviXpCtVH7jHp3gEpD2H4RvaiPQ6vx7wXJ4vRH3bcIwKIb0o8qg8gT?=
 =?us-ascii?Q?N5BtEFObbNDzWn6NI6U4WYyWvJcgIgOrgVa67aevdV80/0BUHEo0vVehz1uN?=
 =?us-ascii?Q?+PqBo1MO5fSEuqc7nQhEzP6vOoTiDSx3wB3qLR0Aw9h/UfM9OfS7q+5y5Dgo?=
 =?us-ascii?Q?DT8IS3pJ85J0kqa0wC9MBzvBGLT5hb9edovn6TBJ3nXM8i44BHnpBulk41qw?=
 =?us-ascii?Q?ssIosElyI2TG8zVsqWJ8adIjmkTZAVy9yRkFXFTpaNjR5tS1NSgWxaNhGNtl?=
 =?us-ascii?Q?y81oLpCL3PbgYZJ0AEFxXvyzIQdwiy2KtW4k9P2VW663mtq1Q8mkoItH0uTE?=
 =?us-ascii?Q?X4uO835Gi1RixHLGg8ILYYuBpvP6bGteq9Nm9S7HI5yCqgdtp3/Io3jo4IAl?=
 =?us-ascii?Q?P6xfhp9oj+WZUixnydXsk8gIP66uQhCPqA6pg17kPohXYbH4yL5T4o9vI6I9?=
 =?us-ascii?Q?lljMGwbQYN2Feb8FXCI/oMrcPkc9rJiyt9gxQOrZ35BcbcD76VhqAkWCzm1n?=
 =?us-ascii?Q?+b4wx53lcL/hkntH8o041m/8OuNEWOiWdpVWb5KRc+Wf6K9pyw1TCtvjdRvF?=
 =?us-ascii?Q?RWVwrWX8WT7xvP4UFLFV1Q417D9AxeuMSJd9QaMCnyODzctuCbnVuvuc7ex9?=
 =?us-ascii?Q?5BIhd/kyDQa19vhNqH/OmAUr2wDLQv0Gdltnuf4w9bZdVvxC/tzDp4paF/Sy?=
 =?us-ascii?Q?IfFn/BqPQX2QO7vWXbphanUclgJJkKvjaMO8ZnvBRktMsKVAHGtvuxb3l4L+?=
 =?us-ascii?Q?/rJKGjFM164SK8F/Y+8g6JGIDNdJqNfkLiTMJ9P8Q/+M6VK4ZUPPVe0VCwHl?=
 =?us-ascii?Q?O10GrH7N182zBz8MipiEhkHcjg51UiY3EfDBdLmod6R/eEjsTDpH1RFiGPBT?=
 =?us-ascii?Q?dNbvcmF1U4aqGILkpY+9g0BwpXx1SG775GYVgzXh61R8zk5lQbOBsh/tV4yB?=
 =?us-ascii?Q?qQd8nhXCrTsMGb8qjl8PPVL0ravc+IEwoWXcetyg81quy113W+VX9bLDwLf8?=
 =?us-ascii?Q?vp0tsPB2dX5N7lE9BLiD/kJP8WZeHyEb1pNWegI0se6hlJcTwWJovgSuq1my?=
 =?us-ascii?Q?dddqv/MnphoVKw9WbcqGj1SIYHqnrnHGOiH4QJ1qrt55c4x0jbnYWBllBRo4?=
 =?us-ascii?Q?Cc123D/xwTFo8RCkwqphTIgtYE5230N9UK91YtU5BPrzMOPjbxEQqKilF7c3?=
 =?us-ascii?Q?Xm/xCfxNCIo7bul1ZqaCZDKVujI+tDOeXppsL3dBF8zfsaip/UPodmQSvlMI?=
 =?us-ascii?Q?91gA+jT1G5wIf751zZVw0q10Z1HRaiUOR4cdBrhTreeKrVLUHKayyqfvTaW4?=
 =?us-ascii?Q?yW/s3oYzVg8F1gTNG/CHadqVV7cbgQKRLq/uJVFTtiwQ5nThosSfezcRFxtP?=
 =?us-ascii?Q?3uZwetmbKzFHQrtb4qY=3D?=
X-Forefront-Antispam-Report: CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:53:52.6834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 691ddfb2-bd56-4e2d-2d8f-08de51d141e5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR19MB7933
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA5NCBTYWx0ZWRfX1QhPQhQpk960
 S13DKCfpPcp8zkVYurlpKK3MFqg7tIxpiAh2QGk6ZNlamMvwr9Ia6RaMNzQtmqSRnBrEFI/PNwe
 SUKnyGiwGdbayXZoMsxdMaxGnwynH0lld5zuAGYuw1u3NFuMa3LD85KLCXCn6mAOMxeTULryKS2
 5JHQJhHH4kA1cSBYeS7Eqjz5EJD2x6ckMJjd7Xp3YtpbWpr6EvnwcxbGGDi0fdxFCK/aVlGBFZz
 UakD8lSJqvU/gI5c9yipGw3Lfb3O19EcgHS/yQkPZ1n7dtom7GuKkdAVQquSJVCCkAasgdP2uU0
 P7K+lNWX2NpNknyUK4WBtD46QZCdXVK3EVlJYGVLoVl1VTQT5HH6FYQnryHDzyqsTVNLYrO7TzR
 NZ/o4TZabVkqLX2kr7oB4eAYGtzn9K0yu/KFB8DA6uwkq2CID6BkTua/TM+cqQzHjwmDtki46mW
 d12LjPSq7KR8u2MvW/w==
X-Authority-Analysis: v=2.4 cv=LPVrgZW9 c=1 sm=1 tr=0 ts=6964e0d5 cx=c_pps
 a=8OTw2qS5QgwVLUZ+0dTndg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=J5ERI9i5UL_4qVT6lJYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: TZ6PK0lYmagXf7hbYDc_lR6kmRR0L_1F
X-Proofpoint-ORIG-GUID: TZ6PK0lYmagXf7hbYDc_lR6kmRR0L_1F
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_035458_877252_C7C09245 
X-CRM114-Status: UNSURE (   9.44  )
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

On Thu, Jan 08, 2026 at 09:23:38PM +0100, Andy Shevchenko wrote:
> Most of the SPI controller drivers share the parent's fwnode
> by explicit assignment. Propagate the default by SPI core,
> so they may drop that in the code. Only corner cases may require
> a special treatment and we simply (re)assign the controller's
> fwnode explicitly (as it's done right now, no changes required
> for that).
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

