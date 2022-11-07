Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF61C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVbeVIzcWsBHEvXpUIqWxWV9Pr4GUmBdcHJPygjeNp8=; b=VHYgYkc/Wm9Dx2ZbO3cqZyGkRo
	07s/50OWFxRptnHmj3l+ydoz2J3Py/pLy7cOCA7XAN2VgeL0ZA10IlNtwLbLdjXffKhMuaYRtAaP4
	VYXBTlFs084CxPWqeoFR/EKTYhuXZ+v3l/0pYenOt9Z4c5p4FaBiKHp8fqDLD0PTLf3L8nyON8YQ6
	Vzdb+gcQLWQyfuFCgGgIzDtSPcjAP0/WuueV5911DIpBWUCZrkBgxa8YbeQw2gXfilO5aqA6Xowgi
	xFK61MCFDZ8qUrcP5TKnrjXkxMP0T0GWv4fzU2FXzZmkjWMhqqeDNeRtHqT4dnPma0EkD4/nYidzK
	n+SOO9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os53Q-00GDJ7-PH; Mon, 07 Nov 2022 16:32:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4sE-00G8Fh-Fr; Mon, 07 Nov 2022 16:21:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55027ED1;
	Mon,  7 Nov 2022 08:21:26 -0800 (PST)
Received: from pierre123.arm.com (pierre123.nice.arm.com [10.34.100.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 251943F534;
	Mon,  7 Nov 2022 08:21:05 -0800 (PST)
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
	Adam Ford <aford173@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Tim Harvey <tharvey@gateworks.com>,
	Li Jun <jun.li@nxp.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	David Heidelberg <david@ixit.cz>,
	Liu Ying <victor.liu@nxp.com>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Vadym Kochan <vadym.kochan@plvision.eu>,
	Sameer Pujar <spujar@nvidia.com>,
	Prathamesh Shete <pshete@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Vidya Sagar <vidyas@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Christopher Obbard <chris.obbard@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Aswani Reddy <aswani.reddy@samsung.com>,
	Shashank Prashar <s.prashar@samsung.com>,
	Bharat Uppal <bharat.uppal@samsung.com>,
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
Subject: [PATCH v2 12/23] arm64: dts: Update cache properties for mediatek
Date: Mon,  7 Nov 2022 16:57:05 +0100
Message-Id: <20221107155825.1644604-13-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107155825.1644604-1-pierre.gondois@arm.com>
References: <20221107155825.1644604-1-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082122_660797_A5733CEA 
X-CRM114-Status: UNSURE (   9.88  )
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
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 3 +++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 3 +++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 64693c17af9e..c326aeb33a10 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -198,16 +198,19 @@ cluster_off_b: cluster-off-b {
 
 		l2_0: l2-cache0 {
 			compatible = "cache";
+			cache-level = <2>;
 			next-level-cache = <&l3_0>;
 		};
 
 		l2_1: l2-cache1 {
 			compatible = "cache";
+			cache-level = <2>;
 			next-level-cache = <&l3_0>;
 		};
 
 		l3_0: l3-cache {
 			compatible = "cache";
+			cache-level = <3>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 6b20376191a7..424fc89cc6f7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -169,16 +169,19 @@ core3 {
 
 		l2_0: l2-cache0 {
 			compatible = "cache";
+			cache-level = <2>;
 			next-level-cache = <&l3_0>;
 		};
 
 		l2_1: l2-cache1 {
 			compatible = "cache";
+			cache-level = <2>;
 			next-level-cache = <&l3_0>;
 		};
 
 		l3_0: l3-cache {
 			compatible = "cache";
+			cache-level = <3>;
 		};
 
 		idle-states {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 905d1a90b406..cb74905cfbb8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -213,16 +213,19 @@ cluster_off_b: cluster-off-b {
 
 		l2_0: l2-cache0 {
 			compatible = "cache";
+			cache-level = <2>;
 			next-level-cache = <&l3_0>;
 		};
 
 		l2_1: l2-cache1 {
 			compatible = "cache";
+			cache-level = <2>;
 			next-level-cache = <&l3_0>;
 		};
 
 		l3_0: l3-cache {
 			compatible = "cache";
+			cache-level = <3>;
 		};
 	};
 
-- 
2.25.1


