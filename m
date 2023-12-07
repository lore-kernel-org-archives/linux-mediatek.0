Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9FCC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 06:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCJcyyZ8EMNjvJVmY4Ygro4ZBJTkkM+cPjU66561fik=; b=OYxEvspz3Z7cQIGJW4DX1z5ywU
	wawTTnbt7eqmV34nv36UBmWYHcyn93I9iMaxlQfx6h/9LC8r7LIPNCUzYpKE//mbx2X1EUB7Mwq/o
	a8vvxZB6ZeUpz2Q37mFU2f92KAByayMg9+ipZHRtn8CyP47x9WLllCeOF1RAxP51hKYiAsjs+NhPU
	KKUEF9bLszTdJmnM0P24SZw/Az0/0sq9J6I96AAxXkXNw186rR8wgAvfXHjp0KxaeSP7esXo+9LzX
	eLvrLFRhZGZpsOPJrhB/gKOx/Jcb0m+qlLTM1VlYZL9pYROTtbAf0aC+beW+qFLJhVg8vOlgiFTTK
	vqsCCx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB8JA-00C2J3-0x;
	Thu, 07 Dec 2023 06:56:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB8J7-00C2Id-0o;
	Thu, 07 Dec 2023 06:56:26 +0000
X-UUID: b90d14dc94cd11ee9b09ad09c76753c8-20231206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RCJcyyZ8EMNjvJVmY4Ygro4ZBJTkkM+cPjU66561fik=;
	b=UTxcd1kGvh7vpHDIFyBSoCNlyxzPxfKVeJABcH6/JMM/jSqvAACF6uWEv+CPcCB5ELDqzcXrHuZ4DBtBL73H3eRBEiANJzHcjetxCgSQ71SXEgAXSD7PevKgJPz9vyiBjUkKV35yPUHvxfWAcyrjOmYc9x5rwoKJhYjQboSTPx0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:1b0fc96a-ecfa-4f7c-8f6f-3a1187e134b7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:fae8ea60-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b90d14dc94cd11ee9b09ad09c76753c8-20231206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 531175737; Wed, 06 Dec 2023 23:56:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Dec 2023 14:35:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Dec 2023 14:35:39 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wenbin
 Mei <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Axe Yang
	<axe.yang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: mmc: mtk-sd: add tuning steps related property
Date: Thu, 7 Dec 2023 14:35:34 +0800
Message-ID: <20231207063535.29546-2-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207063535.29546-1-axe.yang@mediatek.com>
References: <20231207063535.29546-1-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_225625_301417_05737393 
X-CRM114-Status: UNSURE (   9.08  )
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

Add 'mediatek,tuning-steps' setting. This property will give MSDC
a chance to extend tuning steps up to 64. With more tuning steps,
MSDC may achieve a more optimal calibration result, thus avoiding
potential CRC issues.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Axe Yang <axe.yang@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 3fffa467e4e1..c532ec92d2d9 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -145,6 +145,15 @@ properties:
     minimum: 0
     maximum: 7
 
+  mediatek,tuning-step:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Some SoCs need extend tuning step for better delay value to avoid CRC issue.
+      If not present, default tuning step is 32. For eMMC and SD, this can yield
+      satisfactory calibration results in most cases.
+    enum: [32, 64]
+    default: 32
+
   resets:
     maxItems: 1
 
-- 
2.18.0


