Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F3DC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RHi3OnsojvXkjX18UANGfzdBDEKDAPVy948TgEhtMM=; b=jn02vIj4IhCigAkMTU8WkHq77q
	z/GWJ915Js/ZQLb67MaqOfN/I+ifhjzjwidVme59AjrYspvCWqB5+m5Vk3YzsU+5mk72WBpPFTbjX
	/pFzd3ruXRkz87VvOOcSgWjpho2aFwXk4AUppCRXzbfAKuEschTj08VjSlzOx7uGJT2kioojuMUr2
	5PrLcWepG395gkkgNUpMvaUICL4g5QAa1RVF9uETEe6TyU7Tk2G9DNHobvi2/n4gSCG1+I0KMs/+c
	uFLtN94KIqmA4EEG+GsynQYFdK7657E4kqyeIbnHr//GPj8Mfa4C/E0kt/jwzTgh+vmJTTLoagzaT
	NzrpbNDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4hO-00G2oc-V4; Mon, 07 Nov 2022 16:10:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4hK-00G2le-1N; Mon, 07 Nov 2022 16:10:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 010481424;
	Mon,  7 Nov 2022 08:10:10 -0800 (PST)
Received: from pierre123.arm.com (pierre123.nice.arm.com [10.34.100.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C7D3F3F534;
	Mon,  7 Nov 2022 08:09:48 -0800 (PST)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Tsahee Zidenberg <tsahee@annapurnalabs.com>,
	Antoine Tenart <atenart@kernel.org>,
	Brijesh Singh <brijeshkumar.singh@amd.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Chester Lin <clin@suse.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Chanho Min <chanho.min@lge.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Viorel Suman <viorel.suman@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Ming Qian <ming.qian@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Li Jun <jun.li@nxp.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Kepplinger <martink@posteo.de>,
	David Heidelberg <david@ixit.cz>,
	Liu Ying <victor.liu@nxp.com>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Shijie Qin <shijie.qin@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Vadym Kochan <vadym.kochan@plvision.eu>,
	Sameer Pujar <spujar@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Prathamesh Shete <pshete@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Vidya Sagar <vidyas@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Christopher Obbard <chris.obbard@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Aswani Reddy <aswani.reddy@samsung.com>,
	Shashank Prashar <s.prashar@samsung.com>,
	Ajay Kumar <ajaykumar.rs@samsung.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 04/23] arm64: dts: Update cache properties for apm
Date: Mon,  7 Nov 2022 16:56:57 +0100
Message-Id: <20221107155825.1644604-5-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107155825.1644604-1-pierre.gondois@arm.com>
References: <20221107155825.1644604-1-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_081006_243621_E4231F47 
X-CRM114-Status: UNSURE (   9.08  )
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

The DeviceTree Specification v0.3 specifies that the cache node
'compatible' and 'cache-level' properties are 'required'. Cf.
s3.8 Multi-level and Shared Cache Nodes
The 'cache-unified' property should be present if one of the
properties for unified cache is present ('cache-size', ...).

Update the Device Trees accordingly.

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 4 ++++
 arch/arm64/boot/dts/apm/apm-storm.dtsi     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index a8526f8157ec..68ba865fcd58 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -97,15 +97,19 @@ cpu@301 {
 		};
 		xgene_L2_0: l2-cache-0 {
 			compatible = "cache";
+			cache-level = <2>;
 		};
 		xgene_L2_1: l2-cache-1 {
 			compatible = "cache";
+			cache-level = <2>;
 		};
 		xgene_L2_2: l2-cache-2 {
 			compatible = "cache";
+			cache-level = <2>;
 		};
 		xgene_L2_3: l2-cache-3 {
 			compatible = "cache";
+			cache-level = <2>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index f56d687f772d..9ac7417f65eb 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -81,15 +81,19 @@ cpu@301 {
 		};
 		xgene_L2_0: l2-cache-0 {
 			compatible = "cache";
+			cache-level = <2>;
 		};
 		xgene_L2_1: l2-cache-1 {
 			compatible = "cache";
+			cache-level = <2>;
 		};
 		xgene_L2_2: l2-cache-2 {
 			compatible = "cache";
+			cache-level = <2>;
 		};
 		xgene_L2_3: l2-cache-3 {
 			compatible = "cache";
+			cache-level = <2>;
 		};
 	};
 
-- 
2.25.1


