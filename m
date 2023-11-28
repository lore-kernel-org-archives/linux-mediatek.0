Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8D9C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 07:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kILKxh9E79r7aDOclLB0+1y/1FG780xXk0u2JGX8Ho=; b=gEmTYFsP/LgBAnlbmfVoWO+FhG
	y5xUdx/gQCWbQYVuKUuD5wuEVcJCQLf78nJm1JFiqUSYnXHqzROnUMHFO5crzGmByzMBfeXJ3Ozz4
	KgbMRVaAWleiEV/YhgGqU6mbiamyPAYNKD6Kf1QQxejgCn3icAWWIpsw9b5ihCJ+NNtAvld4Cd65m
	H0eeCEFmKY/WzNKV47ODEi3gTMLJKw+FqWzPwY6AuT3Abl7K03Uy7Im0rdUzEXzaFRDwMANpwYQIS
	fO28KItyZQC701/cnSu9Wyf6Zg2rVeGo6rXeAjWZf+X3/bic7qfwdjvPy2ZGzcWVjWjQ3WWR7oqBL
	lKq0PN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7s6X-004JVy-31;
	Tue, 28 Nov 2023 07:01:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7s6W-004JTb-0z;
	Tue, 28 Nov 2023 07:01:57 +0000
X-UUID: ffd46c088dbb11ee86758d4a7c00f3a0-20231128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1kILKxh9E79r7aDOclLB0+1y/1FG780xXk0u2JGX8Ho=;
	b=aOBae1mV0+QXRvn1HS+GiRv1oRfapxE2fs9q/FNHCXGt2B+4aXW2xPB77N1tKNBq9BJsQUaiJg/qoSs+XR1XPy2eMGhgezLCy11gt6VU1cI9kU5iiy8OVgxf+QxN/vvLEpanyV8CKr800IGxpCGes8yKsrgL5mj7ND0c3INXw5o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:83130685-ac39-46b0-ada8-f45c8d98cfa3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:abefa75,CLOUDID:298508fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ffd46c088dbb11ee86758d4a7c00f3a0-20231128
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2042954212; Tue, 28 Nov 2023 00:01:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 28 Nov 2023 15:01:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 28 Nov 2023 15:01:40 +0800
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
	<axe.yang@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: add tuning steps related property
Date: Tue, 28 Nov 2023 15:01:26 +0800
Message-ID: <20231128070127.27442-2-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231128070127.27442-1-axe.yang@mediatek.com>
References: <20231128070127.27442-1-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_230156_344769_8664DBF8 
X-CRM114-Status: UNSURE (   9.89  )
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
2.25.1


