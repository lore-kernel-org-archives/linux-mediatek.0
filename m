Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C6AEDE9AD
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7J7GD2rJpRodzTyvQUOEl10XrSH/1mr5sIgAgvizokI=; b=B23dvy8KSrrPn3Vqw4+TkVTMDT
	AE3gW0ZEN3hRE2rsUtzLmaglMfUaD1XARhTDWG4G2W4hQzoR4H8xR79JG+N4oqqERWNJ7M2IlDToy
	t9C35mWZso8cSSIBXNQ3EFrM2sVk++0tpnJ2E0avdEHNrqQew61vCR3TXh+2Gy2oa9NxU4KWR7MXP
	5gMbVdGMZcv6IdCNP1bnd4UjDq+lM6H92V99rpEtQ2ltj4/gcIWCFpiIccqMmOC/5BGBnrVy+KXdM
	O3FoRqM/wZzT3FekIXyefYifGjYB1ufae9iBZybgKUsqCgTq8Ey7NAKhZTi5ViOMLzTjawLpiQc64
	U4Xb1NDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qglBt-008IwR-2E;
	Thu, 14 Sep 2023 12:11:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qglBp-008IvE-37;
	Thu, 14 Sep 2023 12:11:24 +0000
X-UUID: cd985fd252f711ee86758d4a7c00f3a0-20230914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7J7GD2rJpRodzTyvQUOEl10XrSH/1mr5sIgAgvizokI=;
	b=A8dIJSHdep1QNZ4DLWgAmwwf2aqU9Uu8LLvwF3pGUXmyDoi+hVlsGuQm8wm5JAIa8kS/T21I2pcRBdTEsZ8gwD9HUmlp8KfNFILY7QO2C+EsJjO19PbPJ3+iwBC81riETGuJrlYgGETgjR0bDuBTgsCK4VyQKgh+4c2On3Pqogo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:b14179ed-a127-4cbc-adfa-8ee9e06c297f,IP:0,U
	RL:0,TC:0,Content:30,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:30
X-CID-META: VersionHash:0ad78a4,CLOUDID:19c0b2ef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cd985fd252f711ee86758d4a7c00f3a0-20230914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1515019038; Thu, 14 Sep 2023 05:11:15 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Sep 2023 20:10:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Sep 2023 20:10:38 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v2 1/1] arm64: dts: mediatek: mt8186: Increase CCI frequency
Date: Thu, 14 Sep 2023 20:10:35 +0800
Message-ID: <20230914121035.17320-2-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230914121035.17320-1-chun-jen.tseng@mediatek.com>
References: <20230914121035.17320-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.167600-8.000000
X-TMASE-MatchedRID: Zel3CUePV2j/fXSbEtZs/DvfsoCuAcP+An4P7FuKVFCyD8qnkE3ipL51
	zIfS792k09NQNrxIpFZ6v97VXslRaa+/EguYor8cFEUknJ/kEl7dB/CxWTRRu+rAZ8KTspSz4uA
	5FNdU//N7OSBMCCNnVs1bUp6r4MDAWQS/Gs8AJC6r5oK9Wx6kkn6xK/W/SHj8ZAupowockPot4O
	eZu1Ug0Gm8SaS5j+RbF0aD5ljt43pMcHZD6gqu7wxMjfifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.167600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: EF85E8C8A12336A2F2F1AA4B7BB0B5F525AEB258EDE195636DD3920A884264262000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_051122_016790_45FB1D6C 
X-CRM114-Status: UNSURE (   9.19  )
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

The original CCI OPP table's lowest frequency 500 MHz is too low and causes
system stalls. Increase the frequency range to 1.05 GHz ~ 1.4 GHz and adjust
the OPPs accordingly.

Fixes: 32dfbc03fc26 ("arm64: dts: mediatek: mt8186: Add CCI node and CCI OPP table")

Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 90 ++++++++++++------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index f04ae70c470a..b98832d032eb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -39,79 +39,79 @@
 		compatible = "operating-points-v2";
 		opp-shared;
 
-		cci_opp_0: opp-500000000 {
-			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <600000>;
+		cci_opp_0: opp-1050000000 {
+			opp-hz = /bits/ 64 <1050000000>;
+			opp-microvolt = <843750>;
 		};
 
-		cci_opp_1: opp-560000000 {
-			opp-hz = /bits/ 64 <560000000>;
-			opp-microvolt = <675000>;
+		cci_opp_1: opp-1073000000 {
+			opp-hz = /bits/ 64 <1073000000>;
+			opp-microvolt = <850000>;
 		};
 
-		cci_opp_2: opp-612000000 {
-			opp-hz = /bits/ 64 <612000000>;
-			opp-microvolt = <693750>;
+		cci_opp_2: opp-1096000000 {
+			opp-hz = /bits/ 64 <1096000000>;
+			opp-microvolt = <856250>;
 		};
 
-		cci_opp_3: opp-682000000 {
-			opp-hz = /bits/ 64 <682000000>;
-			opp-microvolt = <718750>;
+		cci_opp_3: opp-1120000000 {
+			opp-hz = /bits/ 64 <1120000000>;
+			opp-microvolt = <862500>;
 		};
 
-		cci_opp_4: opp-752000000 {
-			opp-hz = /bits/ 64 <752000000>;
-			opp-microvolt = <743750>;
+		cci_opp_4: opp-1143000000 {
+			opp-hz = /bits/ 64 <1143000000>;
+			opp-microvolt = <881250>;
 		};
 
-		cci_opp_5: opp-822000000 {
-			opp-hz = /bits/ 64 <822000000>;
-			opp-microvolt = <768750>;
+		cci_opp_5: opp-1166000000 {
+			opp-hz = /bits/ 64 <1166000000>;
+			opp-microvolt = <893750>;
 		};
 
-		cci_opp_6: opp-875000000 {
-			opp-hz = /bits/ 64 <875000000>;
-			opp-microvolt = <781250>;
+		cci_opp_6: opp-1190000000 {
+			opp-hz = /bits/ 64 <1190000000>;
+			opp-microvolt = <906250>;
 		};
 
-		cci_opp_7: opp-927000000 {
-			opp-hz = /bits/ 64 <927000000>;
-			opp-microvolt = <800000>;
+		cci_opp_7: opp-1213000000 {
+			opp-hz = /bits/ 64 <1213000000>;
+			opp-microvolt = <918750>;
 		};
 
-		cci_opp_8: opp-980000000 {
-			opp-hz = /bits/ 64 <980000000>;
-			opp-microvolt = <818750>;
+		cci_opp_8: opp-1236000000 {
+			opp-hz = /bits/ 64 <1236000000>;
+			opp-microvolt = <937500>;
 		};
 
-		cci_opp_9: opp-1050000000 {
-			opp-hz = /bits/ 64 <1050000000>;
-			opp-microvolt = <843750>;
+		cci_opp_9: opp-1260000000 {
+			opp-hz = /bits/ 64 <1260000000>;
+			opp-microvolt = <950000>;
 		};
 
-		cci_opp_10: opp-1120000000 {
-			opp-hz = /bits/ 64 <1120000000>;
-			opp-microvolt = <862500>;
+		cci_opp_10: opp-1283000000 {
+			opp-hz = /bits/ 64 <1283000000>;
+			opp-microvolt = <962500>;
 		};
 
-		cci_opp_11: opp-1155000000 {
-			opp-hz = /bits/ 64 <1155000000>;
-			opp-microvolt = <887500>;
+		cci_opp_11: opp-1306000000 {
+			opp-hz = /bits/ 64 <1306000000>;
+			opp-microvolt = <975000>;
 		};
 
-		cci_opp_12: opp-1190000000 {
-			opp-hz = /bits/ 64 <1190000000>;
-			opp-microvolt = <906250>;
+		cci_opp_12: opp-1330000000 {
+			opp-hz = /bits/ 64 <1330000000>;
+			opp-microvolt = <993750>;
 		};
 
-		cci_opp_13: opp-1260000000 {
-			opp-hz = /bits/ 64 <1260000000>;
-			opp-microvolt = <950000>;
+		cci_opp_13: opp-1353000000 {
+			opp-hz = /bits/ 64 <1353000000>;
+			opp-microvolt = <1006250>;
 		};
 
-		cci_opp_14: opp-1330000000 {
-			opp-hz = /bits/ 64 <1330000000>;
-			opp-microvolt = <993750>;
+		cci_opp_14: opp-1376000000 {
+			opp-hz = /bits/ 64 <1376000000>;
+			opp-microvolt = <1018750>;
 		};
 
 		cci_opp_15: opp-1400000000 {
-- 
2.18.0


