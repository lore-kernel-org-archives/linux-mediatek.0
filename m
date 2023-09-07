Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2273EC8724
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hJEKGvhmxp8R6c53ojV/bh0zFZPHPL5RolXP5Jg/CXY=; b=MookSm13Wjgd1Tc/oGWHd+VD0L
	/FDwVQSk+l6m+TOcL7Zk5mAiftO6jfmbCRM/mVgXdVgIszW78LY/tuha9Qca2PXmbVdkRx6eW27je
	zFXIIrcRGpAUxiyLtvuuFlncRykbXeOhiVTerRH9C0vGMv9CZVOfTgShSki81QxR0pSmRnKofw7+D
	YgsI4JS9b/WzkM9cNhnzWBLoDX/zDfdLgajgEs0I2uK2hKwQAC9beiySspoKwtOphWzbpy8j8OybF
	qMhFgHoyNpXL3L0c81pax38lL/mLDxkFTUzjOtyn9W0mWKDJK3uCQzGzY1k3FouNcUweIi09SAKrR
	ju74Aeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeF2b-00C8ZE-1s;
	Thu, 07 Sep 2023 13:27:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeF2Z-00C8Ys-0G;
	Thu, 07 Sep 2023 13:27:24 +0000
X-UUID: 43de8a024d8211ee86758d4a7c00f3a0-20230907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hJEKGvhmxp8R6c53ojV/bh0zFZPHPL5RolXP5Jg/CXY=;
	b=Cn53C4OavqoNUN/EvJKfnpUTS+IgZn+jMqYpflh3U5ZK8mGrFezUWEZxRCHwdSY1Df5wUZbkiXApsnVAGgwkZTydFrlpbgaUy+ZwdldfVOOE0e3YFsoj5hFFb/DbYXrbhsqUcn5BZFls+A/Ze7JFXfubfrgYM1mucrrBBcY8tEU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:473e337b-3f50-45b7-8dbf-3deac3ef5083,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:eaf6c2c2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 43de8a024d8211ee86758d4a7c00f3a0-20230907
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 712241373; Thu, 07 Sep 2023 06:27:17 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Sep 2023 21:16:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Sep 2023 21:16:42 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Macpaul Lin
	<macpaul.lin@mediatek.com>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?=
	<bero@baylibre.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk board
Date: Thu, 7 Sep 2023 21:16:29 +0800
Message-ID: <20230907131630.28346-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_062723_154539_5D5197B1 
X-CRM114-Status: GOOD (  10.33  )
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

1. Add compatible for MT8395.
2. Add bindings for the MediaTek mt8395-evk board, also known
as the "Genio 1200-EVK".

The MT8195 and MT8395 belong to the same SoC family,
with only minor differences in their physical characteristics.
They utilize unique efuse values for differentiation.

The booting process and configurations are managed by boot
loaders, firmware, and TF-A. Consequently, the part numbers
and procurement channels vary.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

Changes for v2:
 - add more detail description for mt8395.
 - add bindings for mt8395, and mt8395-evk.

Changes for v3:
 - add back bindings for mt8195 compatible.

Changes for v4:
 - No change, update Reviewed-by tag only. Thanks.

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index ae12b1cab9fb..2e8ad49c3479 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -248,6 +248,12 @@ properties:
           - enum:
               - mediatek,mt8365-evk
           - const: mediatek,mt8365
+      - description: MediaTek Genio 1200 Boards (Genio 1200 EVK)
+        items:
+          - enum:
+              - mediatek,mt8395-evk
+          - const: mediatek,mt8395
+          - const: mediatek,mt8195
       - items:
           - enum:
               - mediatek,mt8516-pumpkin
-- 
2.18.0


