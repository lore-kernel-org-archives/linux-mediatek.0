Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04080C77B7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 06:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zITZHaBffEXHgQvakViptRVDM6YtdJ7FNpbDESp+DO4=; b=uC9z5rm9nwRCfd13IL501HCVjJ
	vlmvEhD6dznrV+n3BQc5J/f/H9RS1ssMjsDYjxlvXF2JdNUmKYQzio+5J6jIlUrrNXFTyAUdGksMe
	sEbzHAbJmYjH1CqOg2QXYfeq609g2OFbto4HKb+JSdVSVWphOE+89S/Jgx+cmZyJ/EhYLnoy8nTbe
	KLkHp41xQ0XQf6zbNkBytdf7MxidsKpfu3nbqDUs5V0o3RgHV/XS7tLXgQEMcdUHxQJNMUE/GEzfC
	g4ZnYkFJlcyGSv/BrwzFbz9bs7kkltZhxpIfq1fyyPF2aOG9/+rnLSZypozPmHa6I1o1y4CQN68r/
	NPiZEi9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdTi-005Gva-1L;
	Wed, 10 May 2023 06:39:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdTf-005Gsk-0X;
	Wed, 10 May 2023 06:39:08 +0000
X-UUID: 5aecfb7ceefd11ed83ed1395ce914268-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zITZHaBffEXHgQvakViptRVDM6YtdJ7FNpbDESp+DO4=;
	b=RMy+qCiWsl3rXwmUylt4gMfvkzBz+VaXyQNYgXWSPBOmr6CzS7QTZRJhru9PiyhcgRMq7veYubKgzxuCAaiFeW+6wjuiS0eXkC1x87iea97rpT7ps4P3sGqPbRkQkvYdDJRyZlUTMmdkGh8FL5wgnBydRigCQsxWgcMLjhbSV7c=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:5672f416-5fd0-4c14-935f-53f5bb5af905,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.24,REQID:5672f416-5fd0-4c14-935f-53f5bb5af905,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:178d4d4,CLOUDID:fee1b03a-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:2305101438029ZZL3W1M,BulkQuantity:2,Recheck:0,SF:38|29|28|16|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 5aecfb7ceefd11ed83ed1395ce914268-20230509
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 442556419; Tue, 09 May 2023 23:39:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.194) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 May 2023 14:37:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 14:37:58 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tinghan
 Shen <tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11 11/11] arm64: dts: mediatek: mt8195: Add SCP 2nd core
Date: Wed, 10 May 2023 14:37:49 +0800
Message-ID: <20230510063749.5127-12-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230510063749.5127-1-tinghan.shen@mediatek.com>
References: <20230510063749.5127-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_233907_216076_701AC743 
X-CRM114-Status: GOOD (  12.22  )
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

Rewrite the MT8195 SCP device node as a cluster and
add the SCP 2nd core in it.

Since the SCP device node is changed to multi-core structure,
enable SCP cluster to enable probing SCP core 0.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |  6 +++-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 32 ++++++++++++++-----
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 8ac80a136c37..8addb94a24a1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -962,7 +962,11 @@
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
 
-&scp {
+&scp_cluster {
+	status = "okay";
+};
+
+&scp_c0 {
 	status = "okay";
 
 	firmware-name = "mediatek/mt8195/scp.img";
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index a44aae4ab953..10947b4b4707 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -916,14 +916,30 @@
 			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
 		};
 
-		scp: scp@10500000 {
-			compatible = "mediatek,mt8195-scp";
-			reg = <0 0x10500000 0 0x100000>,
-			      <0 0x10720000 0 0xe0000>,
-			      <0 0x10700000 0 0x8000>;
-			reg-names = "sram", "cfg", "l1tcm";
-			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+		scp_cluster: scp@10500000 {
+			compatible = "mediatek,mt8195-scp-dual";
+			reg = <0 0x10720000 0 0xe0000>, <0 0x10700000 0 0x8000>;
+			reg-names = "cfg", "l1tcm";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x10500000 0x100000>;
 			status = "disabled";
+
+			scp_c0: scp@0 {
+				compatible = "mediatek,scp-core";
+				reg = <0x0 0xa0000>;
+				reg-names = "sram";
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			scp_c1: scp@a0000 {
+				compatible = "mediatek,scp-core";
+				reg = <0xa0000 0x20000>;
+				reg-names = "sram";
+				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
 		};
 
 		scp_adsp: clock-controller@10720000 {
@@ -2464,7 +2480,7 @@
 				 <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
 				 <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
 			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
-			mediatek,scp = <&scp>;
+			mediatek,scp = <&scp_c0>;
 			clocks = <&vencsys CLK_VENC_VENC>;
 			clock-names = "venc_sel";
 			assigned-clocks = <&topckgen CLK_TOP_VENC>;
-- 
2.18.0


