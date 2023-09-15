Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2730BEED613
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayjTBw9SUMzwI9y+pFFSZ5QeOsb/Yitc7WAaF4WzbUE=; b=YeTtTFuV+miNdJnHiXob1AyYFY
	++ojKj5Ui+TH3kN6/jUuHVNS3OoSqy/Mhov0/0Aiqv2yKNriyCJ+tn5dem0O5F9js8FdiTi4NXaWV
	8eOZutbaBID1IN1FIAxl7/pfnxnKfas9feEj5pn2lma59vfk9ghmTCNSlo0CfhqGUtacUyTlaosIw
	1gPWxfL+GZGTW0JpteVC0aS35wLhRO3y/972ETTswIDUehobheD8OywK8X5KxKyFZl9hjXE/lRH6E
	HgXymtnZAFgYKcPai6+4lg+zG+4BbvoPPU+mWdbr9r3r3cs+8AY52vkLRhD9GISCsYXuVZzXmRqRm
	jcXIGS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAiL-00Aytg-0M;
	Fri, 15 Sep 2023 15:26:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAiI-00Ayrb-2f;
	Fri, 15 Sep 2023 15:26:36 +0000
X-UUID: 3b624ca053dc11ee86758d4a7c00f3a0-20230915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ayjTBw9SUMzwI9y+pFFSZ5QeOsb/Yitc7WAaF4WzbUE=;
	b=UMso3/9/wC+EddZeWeCRad/A2f8xRO+4u9OJU7lCff39OWaqFk7c82c2X/HIYCZ74fhhDtXeeuG9ZNChTVFQNy0CXHdjheqvyd48rpmQZhZWINgTSGOAy8KjCDIcVd390lgHGMN/lQRIJfZMIxzseM1TCOlUxmaMdkDJRhdV9Mw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:8064a3bb-dcd4-478d-8cc4-8c4c4bafd5c4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:d55afd13-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3b624ca053dc11ee86758d4a7c00f3a0-20230915
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <william-tw.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 603547621; Fri, 15 Sep 2023 08:26:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Sep 2023 23:26:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Sep 2023 23:26:21 +0800
From: William-tw Lin <william-tw.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kevin Hilman <khilman@kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: [PATCH v2 1/3] arm64: dts: Add node for chip info driver
Date: Fri, 15 Sep 2023 23:26:05 +0800
Message-ID: <20230915152607.18116-2-william-tw.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230915152607.18116-1-william-tw.lin@mediatek.com>
References: <20230915152607.18116-1-william-tw.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.485700-8.000000
X-TMASE-MatchedRID: cAwOsowI+VJbbwmb1mOeyx+WEMjoO9WWTJDl9FKHbrkUtdRZTmEaId3Z
	0ElDaJ9X4vM1YF6AJbbCCfuIMF6xLcK21zBg2KlfD12T7q2dIUsyhzfPOvCngZwAmEUTn8WLHvE
	+nnZyoJ4qoAEUxaAvfg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.485700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: EBC19D5A9B5547D23D75391669BDC015A5C50DADB4553DE91B5ECEF8B5B584312000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_082634_877951_FE6141FC 
X-CRM114-Status: UNSURE (   9.94  )
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

Add dts node for socinfo retrieval for the following projects:
MT8173, MT8183, MT8186, MT8192, MT8195

Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi |  9 +++++++++
 5 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index c47d7d900f28..8cac18ed7833 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -590,6 +590,15 @@
 			reg = <0 0x10206000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			socinfo_data1: socinfo-data1 {
+				reg = <0x040 0x4>;
+			};
+
+			socinfo_data2: socinfo-data2 {
+				reg = <0x044 0x4>;
+			};
+
 			thermal_calibration: calib@528 {
 				reg = <0x528 0xc>;
 			};
@@ -1520,4 +1529,10 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_VENC_LT>;
 		};
 	};
+
+	socinfo {
+		compatible = "mediatek,socinfo";
+		nvmem-cells = <&socinfo_data1 &socinfo_data2>;
+		nvmem-cell-names = "socinfo-data1", "socinfo-data2";
+	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5169779d01df..b17af0edb198 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1706,6 +1706,15 @@
 			reg = <0 0x11f10000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			socinfo_data1: socinfo-data1 {
+				reg = <0x04C 0x4>;
+			};
+
+			socinfo_data2: socinfo-data2 {
+				reg = <0x060 0x4>;
+			};
+
 			thermal_calibration: calib@180 {
 				reg = <0x180 0xc>;
 			};
@@ -2105,4 +2114,10 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_CAM>;
 		};
 	};
+
+	socinfo {
+		compatible = "mediatek,socinfo";
+		nvmem-cells = <&socinfo_data1 &socinfo_data2>;
+		nvmem-cell-names = "socinfo-data1", "socinfo-data2";
+	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index f04ae70c470a..860559d239a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1660,6 +1660,10 @@
 				reg = <0x59c 0x4>;
 				bits = <0 3>;
 			};
+
+			socinfo_data1: socinfo-data1 {
+				reg = <0x7a0 0x4>;
+			};
 		};
 
 		mipi_tx0: dsi-phy@11cc0000 {
@@ -2083,4 +2087,10 @@
 			power-domains = <&spm MT8186_POWER_DOMAIN_IPE>;
 		};
 	};
+
+	socinfo {
+		compatible = "mediatek,socinfo";
+		nvmem-cells = <&socinfo_data1>;
+		nvmem-cell-names = "socinfo-data1";
+	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 5e94cb4aeb44..3e1315da3b56 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1122,6 +1122,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			socinfo_data1: socinfo-data1 {
+				reg = <0x044 0x4>;
+			};
+
+			socinfo_data2: socinfo-data2 {
+				reg = <0x050 0x4>;
+			};
+
 			lvts_e_data1: data1@1c0 {
 				reg = <0x1c0 0x58>;
 			};
@@ -1901,4 +1909,10 @@
 			power-domains = <&spm MT8192_POWER_DOMAIN_MDP>;
 		};
 	};
+
+	socinfo {
+		compatible = "mediatek,socinfo";
+		nvmem-cells = <&socinfo_data1 &socinfo_data2>;
+		nvmem-cell-names = "socinfo-data1", "socinfo-data2";
+	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 48b72b3645e1..17c4805d7963 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1683,6 +1683,9 @@
 			lvts_efuse_data2: lvts2-calib@1d0 {
 				reg = <0x1d0 0x38>;
 			};
+			socinfo_data1: socinfo-data1 {
+				reg = <0x7a0 0x4>;
+			};
 		};
 
 		u3phy2: t-phy@11c40000 {
@@ -3519,4 +3522,10 @@
 			};
 		};
 	};
+
+	socinfo {
+		compatible = "mediatek,socinfo";
+		nvmem-cells = <&socinfo_data1>;
+		nvmem-cell-names = "socinfo-data1";
+	};
 };
-- 
2.18.0


