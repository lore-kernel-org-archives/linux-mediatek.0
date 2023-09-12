Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E318CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 07:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kc/m6BKxfPocjcLRXCIQqzPT0L3Xx2EyPLgUjFjwYAE=; b=V8b8RrNNEjjWJzot99WENqh6Un
	6qZIsE3RTMP722stf5m3Kr50SdLi+MA4g255EKio3Y7jZ+2j6E8MpwCB+7pr5fEJ8eGo1qbXvrp2y
	Ty5JR0EJoYYX3oBIr0vOWaqjqxHXFADlywAuXYGxSZVOo6Kg39+fL6f3PVe9Nrk0/IKMYKSk6rNeQ
	vtjxU5MxIhXBHAJ8Elw0NZlvrgczl/Ab4rlRkzOLXTBIhIl2YYT1vwhECsz4IUV+mY4Pg0JmjgvKR
	Vdu3nS2VGL1t/BUc64pfzB8vYeC3ncce3ymE4IighNZlKKgeRGFodE+vyp+dkFAbpDH03VbUk70AX
	4siqnGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxlP-002OFO-0I;
	Tue, 12 Sep 2023 07:24:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxlM-002OEK-20;
	Tue, 12 Sep 2023 07:24:46 +0000
X-UUID: 6e3dcf6a513d11ee9b7791016c24628a-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kc/m6BKxfPocjcLRXCIQqzPT0L3Xx2EyPLgUjFjwYAE=;
	b=qUqpXbKbcWkjRRjkGAImp/M7kWH7hJZMEIQgktOmPikTY9vLiMr2D50HEXYV2U51XKkpCLiXsOIXFDRu9m/T1doaYsKfTi4W5Cp+yTNEeeH71kUUTxKzpwyWnR+rBKEyII88auTxtLJVFdgvsalp2hRG+7Gw1oqerLB8VPzlxHc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:23233ed1-eb2f-49a7-91e6-bb79ae1e7dd7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:22bcd613-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 6e3dcf6a513d11ee9b7791016c24628a-20230912
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 335857491; Tue, 12 Sep 2023 00:24:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 15:23:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 15:23:41 +0800
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
Subject: [PATCH v3 1/2] dt-bindings: arm64: dts: mediatek: mt8365-evk: update compatible
Date: Tue, 12 Sep 2023 15:23:39 +0800
Message-ID: <20230912072340.22862-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_002444_669011_477492F9 
X-CRM114-Status: GOOD (  11.66  )
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

Fix compatible of 'mediatek,mt8365-evk' from 'enum' to 'const'.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

change for v2:
 - rebase this patch to follow the v5 patch set of mt8395.
  - depends on https://lore.kernel.org/lkml/20230909132819.21626-2-macpaul.lin@mediatek.com/T/
 - Fix description as a single board.

changes for v3:
 - rebase this patch to follow the v6 patch set of mt8395.
  - depends on https://lore.kernel.org/lkml/20230911115717.26184-1-macpaul.lin@mediatek.com/T/
 - drop "Fixes:" tag in commit message.
 - drop platform description update for mt8365-evk (Genio 350-EVK).

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 2e8ad49c3479..bab4fa0e8199 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -245,7 +245,7 @@ properties:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
       - items:
-          - enum:
+          - const:
               - mediatek,mt8365-evk
           - const: mediatek,mt8365
       - description: MediaTek Genio 1200 Boards (Genio 1200 EVK)
-- 
2.18.0


