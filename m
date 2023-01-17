Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0400C3DA78
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 13:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tzcj7YcBvmsXG1Iqf3XfpgVaGKs2epzXYS+rFPxnuU=; b=Y0alQsaMy4QbX74eFMyDM/ayWw
	5ngDhM9+S7Md1eSfhmMDIV8v7ylCLz1QG2396X+3Ru1UR1Nv8AhQ7nRLkSF4JTbnH+bFDb3jbc4FJ
	miBRyj7yKLo1qfS7PBmYFGVwJ8i4qAKS2bIjGT3UmmywGHIfcmR/O1dymepMAkEtthQ/0mXphcfgZ
	UavvvLntJsBIRC6JsFZXUYD/Yh2IFZRRuU4RNs1DG7ZMsJ89heGLy/r2fdjqcrQwSxy3bdG5qdfoA
	IzSvVHBfsW5WLWlq82I5DVC+Owxau/m5Zjskyw55wvPFUtkMXa3kQjMGmVEUS+BXYEs/Tkjv1Bg2r
	5Gs8OCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHmDi-00EPzT-Nz; Tue, 17 Jan 2023 13:41:46 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHmDf-00EPyH-2W; Tue, 17 Jan 2023 13:41:44 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30HDfg9Q043905;
	Tue, 17 Jan 2023 07:41:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673962902;
	bh=8tzcj7YcBvmsXG1Iqf3XfpgVaGKs2epzXYS+rFPxnuU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nl1+B6EplvVzZA15QZJmQnV0YdsSFFGL1wr8SRISR+q9H9TiP1ZqN85q/gNU2qBdv
	 zNMgyU0UiBgblxBGfzA/wut5xt/feiJ9bD01HeFvMnc3ieIWAVaWt6ztcrzvYEKyWa
	 GyKdUF/kYV5RCxvXO6tawJu2Duq9hvEqPPXSXWzk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30HDfg2n112619
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Jan 2023 07:41:42 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 17
 Jan 2023 07:41:41 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 17 Jan 2023 07:41:41 -0600
Received: from [10.250.235.217] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30HDfBu1083638;
	Tue, 17 Jan 2023 07:41:12 -0600
Message-ID: <5c888a22-aa56-6d94-2d56-ac5c224f8565@ti.com>
Date: Tue, 17 Jan 2023 19:11:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: (subset) [PATCH v2 23/23] arm64: dts: Update cache properties for
 ti
To: Pierre Gondois <pierre.gondois@arm.com>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Tsahee
 Zidenberg <tsahee@annapurnalabs.com>,
        Antoine Tenart <atenart@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit
	<suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Neil
 Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>,
        Khuong Dinh
	<khuong@os.amperecomputing.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep
 Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore
	<anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang
	<leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix
 Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP
 Linux Team <linux-imx@nxp.com>, Chester Lin <clin@suse.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Matthias Brugger
	<mbrugger@suse.com>,
        NXP S32 Linux Team <s32@nxp.com>, Wei Xu
	<xuwei5@hisilicon.com>,
        Chanho Min <chanho.min@lge.com>, Andrew Lunn
	<andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Lars Povlsen
	<lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        <UNGLinuxDriver@microchip.com>, Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter
	<jonathanh@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Geert
 Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jisheng Zhang <jszhang@kernel.org>, Nishanth Menon <nm@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Viorel Suman <viorel.suman@nxp.com>,
        Abel Vesa
	<abelvesa@kernel.org>, Zhou Peng <eagle.zhou@nxp.com>,
        Shenwei Wang
	<shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Ming Qian
	<ming.qian@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
        Adam Ford
	<aford173@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
        Li Jun
	<jun.li@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
        Markus Niebel
	<Markus.Niebel@ew.tq-group.com>,
        Joakim Zhang <qiangqing.zhang@nxp.com>, Marek Vasut <marex@denx.de>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Alexander Stein
	<alexander.stein@ew.tq-group.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martink@posteo.de>,
        David Heidelberg <david@ixit.cz>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Liu Ying
	<victor.liu@nxp.com>, Wei Fang <wei.fang@nxp.com>,
        Clark Wang
	<xiaoning.wang@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Chris Packham
	<chris.packham@alliedtelesis.co.nz>,
        Vadym Kochan <vadym.kochan@plvision.eu>,
        Sameer Pujar <spujar@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>,
        Sumit
 Gupta <sumitg@nvidia.com>,
        Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
        Vidya
 Sagar <vidyas@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>,
        Johan Jonker
	<jbx6244@gmail.com>,
        Christopher Obbard <chris.obbard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Aswani Reddy
	<aswani.reddy@samsung.com>,
        Shashank Prashar <s.prashar@samsung.com>,
        Arjun K
 V <arjun.kv@samsung.com>, <devicetree@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
        <linux-tegra@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-realtek-soc@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>
References: <20221107155825.1644604-1-pierre.gondois@arm.com>
 <20221107155825.1644604-24-pierre.gondois@arm.com>
Content-Language: en-US
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
In-Reply-To: <20221107155825.1644604-24-pierre.gondois@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_054143_233543_73F722D2 
X-CRM114-Status: GOOD (  12.41  )
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

Hi Pierre Gondois,

On 11/7/2022 9:27 PM, Pierre Gondois wrote:
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes
> The 'cache-unified' property should be present if one of the
> properties for unified cache is present ('cache-size', ...).
> 
> Update the Device Trees accordingly.

[...]

[23/23] arm64: dts: Update cache properties for ti
        commit: 880932e657ffc677c1b053a947afa87ffed1b29d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain
during the next merge window (or sooner if it is a relevant bug fix),
however if problems are discovered then the patch may be dropped or
reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


[...]

