Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2320BC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GEB/PItp3ApqYqJMuq7w9mwjWCEXCCq4x+XaxUYFjtY=; b=xCysLk8u4+tzQGqNAYAULsvk6p
	5jyI1tYBwyefk8ELKcN9Z114YxI3QJnBkdj7neAf/3/WwiV2mJQa5jRClsGBD5FivGjpFQW19oWYd
	M2bJp1pxlCcyzrbptK91lzPtMQI7uIBJ0e+TTZwBO2Gz3pqEBIYG6vpGrzHz75y11wiEpZIZjiSjl
	4e0oXqW4SOhT5WZ5WaDdiZ7iFG+kFCptpXGKBMmRdx1nMqKIeumlUfYoO03uCVrMT05sXNpYd0+jh
	BRU69YLakOiO1gWFmPVnVBptBx6MOdsFCzgsGrdpqtuCPZ7aCy3n8M/KwvXntNPuP0CSDVLm1O4ZQ
	eraX0hKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f1Y-005u58-3g; Thu, 01 Dec 2022 08:34:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f1R-005twQ-Um; Thu, 01 Dec 2022 08:34:27 +0000
X-UUID: b12d26fc6db349e7a56e654cb97edb3e-20221201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GEB/PItp3ApqYqJMuq7w9mwjWCEXCCq4x+XaxUYFjtY=;
	b=WGLBy8dU39blEpJFwRgIQVMqlq4N5GUMWE1ApWNtuEa8bXgFJQoA7bL1IRonaCvyP82UYVWL6uzzL1YReIcNm6egKUOvDfQdF+shpxJLwppxqpvMzE4AELDazkxkX2DAqvN9pnMY7mJHi7v9yY01fdUnU5SyBfllwVgcz4bJDG8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:5fc1f1b9-8b55-4c6f-a86c-e597da66e60a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:57ed406c-41fe-47b6-8eb4-ec192dedaf7d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b12d26fc6db349e7a56e654cb97edb3e-20221201
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 733678954; Thu, 01 Dec 2022 01:34:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 1 Dec 2022 15:33:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Dec 2022 15:33:30 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH] arm64: dts: mt8192: Add adsp power domain controller
Date: Thu, 1 Dec 2022 15:33:28 +0800
Message-ID: <20221201073328.1559-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_003425_059230_155BD95A 
X-CRM114-Status: UNSURE (   9.80  )
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

Add adsp power domain controller node for mt8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
Ref: https://lore.kernel.org/all/2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com/
    [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
---
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 8 ++++++++
 include/dt-bindings/power/mt8192-power.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 424fc89cc6f7..e71afba871fc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -514,6 +514,14 @@
 						};
 					};
 				};
+
+				power-domain@MT8192_POWER_DOMAIN_ADSP {
+					reg = <MT8192_POWER_DOMAIN_ADSP>;
+					clocks = <&topckgen CLK_TOP_ADSP_SEL>;
+					clock-names = "adsp";
+					mediatek,infracfg = <&infracfg>;
+					#power-domain-cells = <0>;
+				};
 			};
 		};
 
diff --git a/include/dt-bindings/power/mt8192-power.h b/include/dt-bindings/power/mt8192-power.h
index 4eaa53d7270a..63e81cd0d06d 100644
--- a/include/dt-bindings/power/mt8192-power.h
+++ b/include/dt-bindings/power/mt8192-power.h
@@ -28,5 +28,6 @@
 #define MT8192_POWER_DOMAIN_CAM_RAWA	18
 #define MT8192_POWER_DOMAIN_CAM_RAWB	19
 #define MT8192_POWER_DOMAIN_CAM_RAWC	20
+#define MT8192_POWER_DOMAIN_ADSP	21
 
 #endif /* _DT_BINDINGS_POWER_MT8192_POWER_H */
-- 
2.18.0


