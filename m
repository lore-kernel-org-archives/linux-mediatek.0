Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317E4C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 02:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rPhxw80N6FEBy21KT6JKdnb7Rk8Y3VIbK2ia2FDIwSQ=; b=WwmeBFEc+0jPk1re7EW/TP9qDN
	WKFSWiY5nIo+FYSNj+kBQVq4PDnD5hJrpWtUdAbU26Ty2iIw6CygRvhL8PzuEXGvwCEHcyy7jb44p
	9S6quwDelnjuZx/j4ENV14AGm7/tFtcfwEt2CJxgY5T4wXpQJzKBqZ5nQJ9606kZsaGuGmfhPG0S0
	sKM+7lXUF1EjQ0nl+7vmG40EqSMCJ5ZdJM8Belf3EraTpjdgQkJ4MQ8kX353Le1+NvsC5yJ2qvl4c
	qAxTVzd8wN6gxKf+jC6QrH77kLVzbbP5KinXmRYrhW2nr97qS5NtfGuJNSpFm8Hi7ETJU9XM2sXrM
	FKtk7udg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poEpS-00Ehll-23;
	Mon, 17 Apr 2023 02:42:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poEpP-00Ehku-0t;
	Mon, 17 Apr 2023 02:42:52 +0000
X-UUID: 8a0ca632dcc911edb7d8d11f642b8e78-20230416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rPhxw80N6FEBy21KT6JKdnb7Rk8Y3VIbK2ia2FDIwSQ=;
	b=m2Kqs15VjsPNlF6/VKHKuWev5qCkpxyB/udWcZv2hv2P8NlpONd+PZgLxAMieCgptRapEFeWahOZTmlxTSmEGGKk9hqH6YpFYIL8Duwz3f153LMRF4pnBzYktggh6U/ILjtd5N7tlLIEUJHLN8qb26opyI/YlYB6riOSjyWqUkk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:bad59ba3-b347-4e97-86ef-b95db8084430,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:220086a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 8a0ca632dcc911edb7d8d11f642b8e78-20230416
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1645069003; Sun, 16 Apr 2023 19:42:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 17 Apr 2023 10:42:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 17 Apr 2023 10:42:14 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mathias Nyman
	<mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tianping Fang
	<tianping.fang@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: usb: mtk-xhci: add an optional frame count clock
Date: Mon, 17 Apr 2023 10:42:12 +0800
Message-ID: <20230417024213.17973-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_194251_321113_02A1A5FA 
X-CRM114-Status: UNSURE (   8.03  )
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

Add optional clock 'frmcnt_ck' used on 4nm or advanced process SoC

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: add acked-by and Reviewed-by tags

v2: based the patch:
    https://patchwork.kernel.org/project/linux-mediatek/patch/20230403191850.374839-1-krzysztof.kozlowski@linaro.org/
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 1b0dfaa6b3dd..f2f926cf4039 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -77,6 +77,7 @@ properties:
       - description: Mcu bus clock for register access
       - description: DMA bus clock for data transfer
       - description: controller clock
+      - description: frame count clock
 
   clock-names:
     minItems: 1
@@ -86,6 +87,7 @@ properties:
       - const: mcu_ck
       - const: dma_ck
       - const: xhci_ck
+      - const: frmcnt_ck
 
   phys:
     description:
-- 
2.18.0


