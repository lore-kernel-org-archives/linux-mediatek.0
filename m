Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEC9C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 12:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iups3FZ2m/TPgq/dVLf3uXp1vX1U6qVnUs8rJULDzjA=; b=tMglTdmLFZg2S7aSiU2T+38lof
	YaZROFgl+hFhyYrj8qNgXnpMfkoqU4A80WL0BfCLm5GtqhgBQJaTrZ5EBo4YzP7k3+Y9ht+iKmHhY
	AzneoyaF9fHU0NX5leCemhQpIrT3HHg2Ppkk7A5Tf1F0q3KcjqYni+qP9nFApmkSWOiBUGu46e8Jn
	Tu2wUBM1gU6ks6MJ2ldI/dAM0aI0buuCsq+5xqMnRMXGmtfOKLL1fLrwXTUdk4KOzbFC4SsHQiq3F
	9atzgG+sBBdkzsWYW6Hrgt7XZlW0XDEx6wBmzZo+AA27Zpq+ESs9yN3heMWEfHMnCXqOlJcSYCZhO
	K5kLrl/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oByIT-00EPQo-Ic; Thu, 14 Jul 2022 12:50:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oByIQ-00EPO0-LL; Thu, 14 Jul 2022 12:50:24 +0000
X-UUID: e09f04cd6382459998997d262f13f5a7-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ad76512e-4926-42d2-ade5-a7b3d4cff3ee,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:fee77fd7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e09f04cd6382459998997d262f13f5a7-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1901663595; Thu, 14 Jul 2022 05:50:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 14 Jul 2022 20:28:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 14 Jul 2022 20:28:40 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones
	<lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tinghan
 Shen <tinghan.shen@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, MandyJH
 Liu <mandyjh.liu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, YT Lee
	<yt.lee@mediatek.corp-partner.google.com>
Subject: [PATCH v2 09/19] arm64: dts: mt8195: Add cpufreq node
Date: Thu, 14 Jul 2022 20:28:27 +0800
Message-ID: <20220714122837.20094-10-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220714122837.20094-1-tinghan.shen@mediatek.com>
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_055022_723132_6C8F31F6 
X-CRM114-Status: GOOD (  10.25  )
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

From: YT Lee <yt.lee@mediatek.corp-partner.google.com>

Add cpufreq node for mt8195.

Signed-off-by: YT Lee <yt.lee@mediatek.corp-partner.google.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 8032b839dfe8..900aaa16f862 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -26,6 +26,7 @@
 			compatible = "arm,cortex-a55";
 			reg = <0x000>;
 			enable-method = "psci";
+			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <578>;
 			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
@@ -38,6 +39,7 @@
 			compatible = "arm,cortex-a55";
 			reg = <0x100>;
 			enable-method = "psci";
+			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <578>;
 			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
@@ -50,6 +52,7 @@
 			compatible = "arm,cortex-a55";
 			reg = <0x200>;
 			enable-method = "psci";
+			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <578>;
 			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
@@ -62,6 +65,7 @@
 			compatible = "arm,cortex-a55";
 			reg = <0x300>;
 			enable-method = "psci";
+			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <578>;
 			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
@@ -74,6 +78,7 @@
 			compatible = "arm,cortex-a78";
 			reg = <0x400>;
 			enable-method = "psci";
+			performance-domains = <&performance 1>;
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
@@ -86,6 +91,7 @@
 			compatible = "arm,cortex-a78";
 			reg = <0x500>;
 			enable-method = "psci";
+			performance-domains = <&performance 1>;
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
@@ -98,6 +104,7 @@
 			compatible = "arm,cortex-a78";
 			reg = <0x600>;
 			enable-method = "psci";
+			performance-domains = <&performance 1>;
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
@@ -110,6 +117,7 @@
 			compatible = "arm,cortex-a78";
 			reg = <0x700>;
 			enable-method = "psci";
+			performance-domains = <&performance 1>;
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
@@ -231,6 +239,12 @@
 		clock-output-names = "clk32k";
 	};
 
+	performance: performance-controller@11bc10 {
+		compatible = "mediatek,cpufreq-hw";
+		reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
+		#performance-domain-cells = <1>;
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupt-parent = <&gic>;
-- 
2.18.0


