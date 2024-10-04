Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D4ACF856A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 03:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Igm/g11ai9vwnRyUQTM0+p9KLTeYcyfZjO5y3QI8Ioo=; b=nkUJ38z5NMzNzXLb+TmOUjELA/
	eKJvImPx81LUGMqhipeFyQ1lq17DGzUCukp9RyQo8w1/rERdUesHXXJkRut9OmAOsifngTmb+sPDv
	Gfk7VbUE/HvQ9XTK0lKF61kJ/aVENOtcRRx8LyEgAJyMO89Zoo2/xEqXyEI4t+p4XyCOnRLVHfAbb
	PtyRz8nMVncgsAcRJHj3rY+SaL5TgD+m//pk+wlcqBBS8akMbWTLgZkTFzHHQO8b6hmkMWUUAi0nw
	Eem971ufrZCfQbrK+Zg9jdFDv6aocQ1BfS29lOdRmm/NYAAlKaepo2kiFA1BnodufK40/IYBOCLW5
	yiG7Mz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swYa6-0000000AuWz-2iKI;
	Fri, 04 Oct 2024 03:02:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swYa3-0000000AuVI-3WDK;
	Fri, 04 Oct 2024 03:02:13 +0000
X-UUID: 089065be81fd11efb3adad29d29602c1-20241003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Igm/g11ai9vwnRyUQTM0+p9KLTeYcyfZjO5y3QI8Ioo=;
	b=Tm0AzsPbGZktN+dcpyi2xiTEq75Pd/i5LEz+NvhNjf7jgZ/+FXxL/A2yJXXZ5ZbgdxJIaKaG5hKrpHYBaqCxYcqRTHjx37//9B7P5k88slQ6qHAv/RDA/acqHJd6kJdOc5d49fkKTk+KNMnG7/g7rusfmjiJlTCHVhlLujmCZIY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:1743d216-550b-4dfa-ad11-cbe9d7a3ce15,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:4e38ba40-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 089065be81fd11efb3adad29d29602c1-20241003
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1476580914; Thu, 03 Oct 2024 20:02:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 4 Oct 2024 11:02:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 4 Oct 2024 11:02:00 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt6359: fix dtbs_check error for RTC and regulators
Date: Fri, 4 Oct 2024 11:01:48 +0800
Message-ID: <20241004030148.13366-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241004030148.13366-1-macpaul.lin@mediatek.com>
References: <20241004030148.13366-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.373200-8.000000
X-TMASE-MatchedRID: EzeqGrx38DlDKVWWbGcmRiZm6wdY+F8KCt59Uh3p/NWUzka/OKYytcFk
	Mp+HRF4cVkYkwvZAWNf5IV2n4J3Q94JrRWPc34Z+wCZxkTHxcclUENBIMyKD0Zsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNXRcsnIv8tAumPlydFJwJDGe8bOplaTm7MOBUyCKCucp6aZ5Zuvojc6cuh
	RZrNicI5xhmyygWGqpKLts6W3au/+QX1Vdxi30aK6c9X2DKLPd82Gj2QC3yG0smXVK/H8eHzG7s
	r7xobSAsPEFD+rZA81DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.373200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: AF13A379B377423AD72CE79A8E91DB3E0B9E9FC241246632324AC6B30BAE59A72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_200211_908063_7555F161 
X-CRM114-Status: GOOD (  11.76  )
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

This patch fixes the following dtbs_check errors:
1. 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
 - Update 'mt6359rtc' in 'mt6359.dtsi' with a generic device name 'rtc'
2. 'pmic: regulators: 'compatible' is a required property'
 - Add 'mediatek,mt6359-regulator' to compatible property.

Fixes: 3b7d143be4b7 ("arm64: dts: mt6359: add PMIC MT6359 related nodes")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Changes for v2:
 - No change.

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 8e1b8c85c6ed..dd732a820a7c 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -18,6 +18,8 @@ mt6359codec: mt6359codec {
 		};
 
 		regulators {
+			compatible = "mediatek,mt6359-regulator";
+
 			mt6359_vs1_buck_reg: buck_vs1 {
 				regulator-name = "vs1";
 				regulator-min-microvolt = <800000>;
@@ -296,7 +298,7 @@ mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
 			};
 		};
 
-		mt6359rtc: mt6359rtc {
+		mt6359_rtc: rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
 	};
-- 
2.45.2


