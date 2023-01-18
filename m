Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B8FC00A5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 03:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBHaGgi41TaUh6BdqsOGpW7S+XnuKs5NkQrgXCGRHoE=; b=DEaKsWHRNDE4Wru4Ag4geNG62s
	Tm/ayM1YDh6QVAEVkagY45/mGtJeQLMNg1k3hkmsRuIaqr6gW4JlQVzN/NwOKpVaNyL1SInG29AUk
	TmNVHueHowqL+DmPDOqbcMwJJL+iH06C3PB8PbRKoJrAtHWKPwmkyNO9CUfUP2r+9abh7NReqmjXb
	XWpJOtytU27eLymR6Y2L6OhjvVUZPQK2+Qv9iQzoZz09hqOEqlmDrfKvKeFSYANnCjRkc9ivXKgNg
	BVwD9CoJJxw7FQjd9SzZDA+vRP7I7x2hJEMU+JRtL1BSKZBrZ3G8OhwMTQPYEKFuI+hfJYgShIUif
	HCw4SCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHz4i-00GjdG-LS; Wed, 18 Jan 2023 03:25:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHz4f-00Gjbw-SF; Wed, 18 Jan 2023 03:25:19 +0000
X-UUID: b83ab4c096df11edbbe3f76fe852e059-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xBHaGgi41TaUh6BdqsOGpW7S+XnuKs5NkQrgXCGRHoE=;
	b=qpZQSTxKFq9nDFZDWxzTXtYdJClU3VFrqmzRf6onBEnW8FFFG69zzOrBRcI5D8v7+xv63Vy//1FJHVTA2ARtVXH2iKj9Xshl1/h45Uvxs+xsObQPnx5MW1vhigx/EKJH0+dhpdUYphTCSajG2UCwK6dIGw57yZ1OPJo8NF2b+iM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:d6302dfd-3913-4e54-aaa1-335532228473,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:794720f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: b83ab4c096df11edbbe3f76fe852e059-20230117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1384608607; Tue, 17 Jan 2023 20:25:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 11:15:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 11:15:10 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v6 1/4] dt-bindings: arm: mediatek: migrate MT8195 vppsys0/1 to mtk-mmsys driver
Date: Wed, 18 Jan 2023 11:15:06 +0800
Message-ID: <20230118031509.29834-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118031509.29834-1-moudy.ho@mediatek.com>
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_192517_930494_F261072D 
X-CRM114-Status: GOOD (  11.15  )
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

MT8195 VPPSYS 0/1 should be probed from mtk-mmsys driver to
populate device by platform_device_register_data then start
its own clock driver.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../arm/mediatek/mediatek,mt8195-clock.yaml      | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
index 17fcbb45d121..d62d60181147 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
@@ -28,11 +28,9 @@ properties:
           - mediatek,mt8195-imp_iic_wrap_s
           - mediatek,mt8195-imp_iic_wrap_w
           - mediatek,mt8195-mfgcfg
-          - mediatek,mt8195-vppsys0
           - mediatek,mt8195-wpesys
           - mediatek,mt8195-wpesys_vpp0
           - mediatek,mt8195-wpesys_vpp1
-          - mediatek,mt8195-vppsys1
           - mediatek,mt8195-imgsys
           - mediatek,mt8195-imgsys1_dip_top
           - mediatek,mt8195-imgsys1_dip_nr
@@ -92,13 +90,6 @@ examples:
         #clock-cells = <1>;
     };
 
-  - |
-    vppsys0: clock-controller@14000000 {
-        compatible = "mediatek,mt8195-vppsys0";
-        reg = <0x14000000 0x1000>;
-        #clock-cells = <1>;
-    };
-
   - |
     wpesys: clock-controller@14e00000 {
         compatible = "mediatek,mt8195-wpesys";
@@ -120,13 +111,6 @@ examples:
         #clock-cells = <1>;
     };
 
-  - |
-    vppsys1: clock-controller@14f00000 {
-        compatible = "mediatek,mt8195-vppsys1";
-        reg = <0x14f00000 0x1000>;
-        #clock-cells = <1>;
-    };
-
   - |
     imgsys: clock-controller@15000000 {
         compatible = "mediatek,mt8195-imgsys";
-- 
2.18.0


