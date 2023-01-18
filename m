Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEE9C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Pi2FhYms8rU5qm8xKHkMWUh3m1gamMEnH3Omx98304=; b=vakykewo6qqlxTcLHMxgvGeTZc
	tajcZPC05kbULEezShmpql2ocG05r3SAyx9B8a0HZht8QgeNIVmV7YH2NLDAuQyVj3cLL0v1Es4oU
	hdl+4QV2kSvJEIIgo1hJvDwlJBeXa3upJ0rE2DXLnQ+eux45nwn8Z7LK/t2dlMa8xjur9cn7k5yWZ
	OCvmiQjH1BDj2/trqcxpJBCX8XW6YDcDPaWka3JFYr8HzjELPBeKRzSge7zUchn1uLVGdJO7wDat9
	sPsuXwPGtFoWRY3mWuiRO6TMEjXEi3xXW+FzvLkjPbrNDj17Sas9gugcnkCeFEVJUee2Yz5dQEvK2
	+xAPP71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3hS-00HRn4-F0; Wed, 18 Jan 2023 08:21:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3hN-00HRmB-1F; Wed, 18 Jan 2023 08:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674030092; x=1705566092;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=2Pi2FhYms8rU5qm8xKHkMWUh3m1gamMEnH3Omx98304=;
  b=UlhasIbja8Z+aerB7F2ZmMZwuO/ZFl0sWyzZZlHkWtodje9I9VFtM9vN
   PfARl0mAfmTpHhlN92ctDLueznD6+U8nGT2RsZJn3ZibYjYy6ri8qKVVa
   wScMjBxko7dFSsGAnrAA1X/L6jLc5MfZk6D4wZN717CLsk89VbB+dhKBZ
   rMb0H/51LUKVn8logTA5B8KosLpc9USGpMHQWsUcdyybuymng8HdfGUOq
   x2tqVo/t4h/NX3EDli/J6MxVC0oEvvz36bhyIfrgF42hUVjmF/bVA9fiB
   CjGT/tdt51+/36DRxA4WuEQkZ/AEJBWUc1YGBKsPq2FBCoEcdJNloW2mA
   w==;
X-IronPort-AV: E=Sophos;i="5.97,224,1669100400"; 
   d="scan'208";a="196300402"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jan 2023 01:21:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 01:21:26 -0700
Received: from den-dk-m31857.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 01:21:07 -0700
Message-ID: <7eb58e2459715a6b2bb5eb45e2ce1f1e88050dff.camel@microchip.com>
Subject: Re: [PATCH v2 13/23] arm64: dts: Update cache properties for
 microchip
From: Steen Hegelund <steen.hegelund@microchip.com>
To: Pierre Gondois <pierre.gondois@arm.com>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "Tsahee
 Zidenberg" <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>,
	Brijesh Singh <brijeshkumar.singh@amd.com>, Suravee Suthikulpanit
	<suravee.suthikulpanit@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Khuong Dinh
	<khuong@os.amperecomputing.com>, Liviu Dudau <liviu.dudau@arm.com>, "Sudeep
 Holla" <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	William Zhang <william.zhang@broadcom.com>, Anand Gore
	<anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>,
	=?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Alim Akhtar
	<alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang
	<leoyang.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"NXP Linux Team" <linux-imx@nxp.com>, Chester Lin <clin@suse.com>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Matthias Brugger
	<mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>, Wei Xu
	<xuwei5@hisilicon.com>, Chanho Min <chanho.min@lge.com>, Andrew Lunn
	<andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, "Sebastian
 Hesselbarth" <sebastian.hesselbarth@gmail.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Daniel Machon <daniel.machon@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Avi Fishman <avifishman70@gmail.com>, "Tomer
 Maimon" <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, "Patrick
 Venture" <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair
	<benjaminfair@google.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
	"Bjorn Andersson" <andersson@kernel.org>, Konrad Dybcio
	<konrad.dybcio@somainline.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
	<mhiramat@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	<kristo@kernel.org>, Viorel Suman <viorel.suman@nxp.com>, Abel Vesa
	<abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Ming Qian
	<ming.qian@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Adam Ford
	<aford173@gmail.com>, Tim Harvey <tharvey@gateworks.com>, Lucas Stach
	<l.stach@pengutronix.de>, Richard Zhu <hongxing.zhu@nxp.com>, Li Jun
	<jun.li@nxp.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, Joakim Zhang
	<qiangqing.zhang@nxp.com>, Marek Vasut <marex@denx.de>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Alexander Stein
	<alexander.stein@ew.tq-group.com>, Paul Elder <paul.elder@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>, David Heidelberg <david@ixit.cz>, "Joy
 Zou" <joy.zou@nxp.com>, Oliver Graute <oliver.graute@kococonnector.com>, "Liu
 Ying" <victor.liu@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, Shijie Qin
	<shijie.qin@nxp.com>, Wei Fang <wei.fang@nxp.com>, Jacky Bai
	<ping.bai@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, Chris Packham
	<chris.packham@alliedtelesis.co.nz>, Vadym Kochan <vadym.kochan@plvision.eu>,
	Sameer Pujar <spujar@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>, "Mikko
 Perttunen" <mperttunen@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>,
	Sumit Gupta <sumitg@nvidia.com>, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Vidya Sagar <vidyas@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, "Johan
 Jonker" <jbx6244@gmail.com>, Christopher Obbard <chris.obbard@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Aswani Reddy
	<aswani.reddy@samsung.com>, Shashank Prashar <s.prashar@samsung.com>, "Arnd
 Bergmann" <arnd@arndb.de>, <devicetree@vger.kernel.org>,
	<linux-rpi-kernel@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<openbmc@lists.ozlabs.org>, <linux-tegra@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-realtek-soc@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
Date: Wed, 18 Jan 2023 09:21:07 +0100
In-Reply-To: <20221107155825.1644604-14-pierre.gondois@arm.com>
References: <20221107155825.1644604-1-pierre.gondois@arm.com>
	 <20221107155825.1644604-14-pierre.gondois@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_002133_234851_16FF1FFB 
X-CRM114-Status: GOOD (  15.47  )
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

Hi Pierre,

This looks good to me.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>

BR
Steen

On Mon, 2022-11-07 at 16:57 +0100, Pierre Gondois wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e
> content is safe
>=20
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes
> The 'cache-unified' property should be present if one of the
> properties for unified cache is present ('cache-size', ...).
>=20
> Update the Device Trees accordingly.
>=20
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> ---
> =C2=A0arch/arm64/boot/dts/microchip/sparx5.dtsi | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/microchip/sparx5.dtsi
> b/arch/arm64/boot/dts/microchip/sparx5.dtsi
> index 2dd5e38820b1..c4bca23b96b9 100644
> --- a/arch/arm64/boot/dts/microchip/sparx5.dtsi
> +++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
> @@ -52,6 +52,7 @@ cpu1: cpu@1 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 };
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 L2_0: l2-cache0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatib=
le =3D "cache";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cache-level =
=3D <2>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 };
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>=20
> --
> 2.25.1
>=20


