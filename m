Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D72C282D1
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Mar 2025 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+L7XbtqDHwNvJUYAa1gSH9tcjYho7+xK58vS0fLoWWw=; b=UtqR5yQ6S6GEnwwxBJ/aYKLVpP
	222NB4SE2X25LVVEev2X0pozrOK/uNPc9XbDNHGQwVaW4/v3IdX+2sWMG8mRwxbFf0w5J5fccZqPM
	vsplX31zwJwVAJiQ57ZtsuFvKQC0nQzE2/WvdwguPJYj5Rh825gJdLAJQ9hpRg0UzgWfU959Py6tV
	CfsHPgEWAQA8IalVLGmtqooWblHeFiye28ChL5XOSJZra6cfqfocnV4ExY1qWuIIdK6PYp7hypH+j
	V3AovQkAGpqz/zrGcm3paZco87Dof2GcXMdhc9iAJPAwcpRv9BLoJQuu+reLhqh3GnOznhsbEYAbs
	uEpVE7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6z2-0000000AOuJ-326z;
	Thu, 06 Mar 2025 08:53:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6wF-0000000AOJO-3k2M;
	Thu, 06 Mar 2025 08:50:45 +0000
X-UUID: 14509ce6fa6811efa1e849db4cc18d44-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+L7XbtqDHwNvJUYAa1gSH9tcjYho7+xK58vS0fLoWWw=;
	b=PbHGUyWLkS78neyhusP+36+5eaglCBmiBvkfFR7EIngAe7RuFS/7QohJs6tRm6gD0dA1k6d7dxXLFp41K5dRs1RqQJqdk5c5ihyObwXjAO/ujXjSObtY0S+emqcmYLUBR3YgSO8Hn1zSn7b+LfohNBcXAsUnog427EYAAgjIx0M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e2c79104-eeec-4312-9867-eeb2ebe9485d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:b21618ce-23b9-4c94-add0-e827a7999e28,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 14509ce6fa6811efa1e849db4cc18d44-20250306
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1291107859; Thu, 06 Mar 2025 01:50:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Mar 2025 16:50:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Mar 2025 16:50:36 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Wenbin Mei
	<wenbin.mei@mediatek.com>
CC: <yong.mao@mediatek.com>, <qingliang.li@mediatek.com>,
	<andy-ld.lu@mediatek.com>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Axe Yang <axe.yang@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: mmc: mtk-sd: add single burst switch
Date: Thu, 6 Mar 2025 16:48:05 +0800
Message-ID: <20250306085028.5024-2-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250306085028.5024-1-axe.yang@mediatek.com>
References: <20250306085028.5024-1-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_005043_975287_891D8A9C 
X-CRM114-Status: GOOD (  11.43  )
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

Add 'mediatek,disable-single-burst' setting. This property can be
used to switch bus burst type, from single burst to INCR, which is
determined by the bus type within the IP. Some versions of the IP
are using AXI bus, thus this switch is necessary as 'single' is not
the burst type supported by the bus.

Signed-off-by: Axe Yang <axe.yang@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 0debccbd6519..6076aff0a689 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -100,6 +100,14 @@ properties:
     minimum: 0
     maximum: 0xffffffff
 
+  mediatek,disable-single-burst:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Burst type setting. For some versions of the IP that do not use
+      AHB bus, the burst type need to be switched to INCR.
+      If present, use INCR burst type.
+      If not present, use single burst type.
+
   mediatek,hs200-cmd-int-delay:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.46.0


