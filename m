Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A97C32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 12:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cSfNvRkXsaTSJIsFm9G+GczbyEq3LGT/ioLJVJiL7vc=; b=318uUAKd7366U1h+aewNWJnyG2
	Rx+GC9vsJ+OUaw3HeiR//pqdY00p2iypc+8ojTXbd3zX/U2nGZ2/qoNCty6yBpatTeUMNGTCD3q9I
	hzQ0pb8xtWgt8WGeJQmVUDvAGQ3PypXj6KkfA+5uuT1ULQmcbi5EV0d3adql4PmkMZ2xIWpiSXKIt
	m07oEtHsF2Re3CDQ0Hq690e9d25dXWv8XYsle0fMPiN1PXGgCeYy6VF60zQ6clSHBoqIdTXAFz3FA
	cBnOBXiW/0RV4ROGwXh0xU4L67PP02iSaJx7AQLSPRQeBBh0cHNq8zMHZfzkhD3CcZYRrqCFX96OZ
	ee3J4zEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1Pn-008ETV-NT; Fri, 19 Aug 2022 12:47:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1Pj-008EOU-RH; Fri, 19 Aug 2022 12:47:53 +0000
X-UUID: 880d76400d0647058a8b08d4ba69391e-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cSfNvRkXsaTSJIsFm9G+GczbyEq3LGT/ioLJVJiL7vc=;
	b=BoADxzZIV88S+At9Ya2ph+6hfCu8dkvwHvF0UlXQ7BnELcEQQTomXFaETuV8cYkoaZ1Eiitug3EIGGaTrH19OYK+1+sB4jdrBC3safVr71a5eHZxD9Te27RWavil21ZJrmIVg1dvaJkiiuYUbxOO4sBD5cVowcs1GVzKMZCMeR8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:3c9b56a1-6237-4589-90cf-02627e70acca,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:df6fba67-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 880d76400d0647058a8b08d4ba69391e-20220819
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 785295595; Fri, 19 Aug 2022 05:47:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 20:47:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 19 Aug 2022 20:47:39 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, MandyJH Liu <mandyjh.liu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH] dt-bindings: mfd: mediatek: Add scpsys compatible for mt8186
Date: Fri, 19 Aug 2022 20:47:36 +0800
Message-ID: <20220819124736.21768-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_054751_955590_E238E0C9 
X-CRM114-Status: UNSURE (   8.78  )
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

Add a new scpsys compatible for mt8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
index 3737207d8504..c8c4812fffe2 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
@@ -21,6 +21,7 @@ properties:
           - mediatek,mt8167-scpsys
           - mediatek,mt8173-scpsys
           - mediatek,mt8183-scpsys
+          - mediatek,mt8186-scpsys
           - mediatek,mt8192-scpsys
           - mediatek,mt8195-scpsys
       - const: syscon
-- 
2.18.0


