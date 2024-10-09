Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45922CEDD8D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HZS/yt81yGM8+lk4cRjFAiTKAwgRjPBEqGkttJks2E=; b=BTUy+/Q8mjkYKMY4sOjHLtRmux
	WDMVvqFefLL+K/EC/hJWx0XBKHULEyGV1NOQIEsb4y7sIBfWnvapQLb00udccD7z4IebVN3u04ZHM
	sKLsxUunUHYDHByqMhbCE0VYLz+OvbwXPDT2mMmoLqLMHGQXWFt7QnkIvRkNsBN+Ov7GXWfAyR1Zf
	f+ECE23NFGKvvRB9m8kLQ93i51WXtRlySdC/oxOQM7pnxPpGE0VKbYbGDOH2l8b5Jtf3Iky6t0KDZ
	fNEF63JYL66PYNZYlHjJdBK6figtGigDCQJZi0sI+ZhGbfx2uywdkSWtVyuh6/FVIW/8mMhvHIk5X
	KYW5+Zpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syVcE-00000009BBq-18vj;
	Wed, 09 Oct 2024 12:16:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syVOw-000000099aC-227p;
	Wed, 09 Oct 2024 12:02:47 +0000
X-UUID: 61fa5fdc863611efb3adad29d29602c1-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0HZS/yt81yGM8+lk4cRjFAiTKAwgRjPBEqGkttJks2E=;
	b=J2yN2wWvcJj7fWAxi2uQ0GiJfEaN2dMt3RLgzcpdlUPDgYiVjPu9w3EAobvyGA36vEM5+64Ww0bQA4h8mg1gXAmq/oIOjSzDePIz/RYrZ7snXL/QqgNvnRRXCiGK57JV/dXTFAmCf7IgwTG8zuy3PBrrxfk/lrrMTneDVafzuo8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:e68d27a7-0a6f-4cbb-b3e3-9ab156e080aa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:1afe0041-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 61fa5fdc863611efb3adad29d29602c1-20241009
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1957815824; Wed, 09 Oct 2024 05:02:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 20:02:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 20:02:36 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Andy-ld Lu <andy-ld.lu@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 3/3] dt-bindings: mmc: mtk-sd: Add support for MT8196
Date: Wed, 9 Oct 2024 20:01:26 +0800
Message-ID: <20241009120203.14913-4-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009120203.14913-1-andy-ld.lu@mediatek.com>
References: <20241009120203.14913-1-andy-ld.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_050246_572331_90C226DD 
X-CRM114-Status: UNSURE (   9.36  )
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

Extend the devicetree bindings to include the MT8196 mmc controller,
new tx/rx would be supported from MT8196, and the register settings
of STOP_DLY_SEL and POP_EN_CNT would also be variant.

Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index c532ec92d2d9..9281a0326891 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt8135-mmc
           - mediatek,mt8173-mmc
           - mediatek,mt8183-mmc
+          - mediatek,mt8196-mmc
           - mediatek,mt8516-mmc
       - items:
           - const: mediatek,mt7623-mmc
@@ -190,6 +191,7 @@ allOf:
             - mediatek,mt8186-mmc
             - mediatek,mt8188-mmc
             - mediatek,mt8195-mmc
+            - mediatek,mt8196-mmc
             - mediatek,mt8516-mmc
     then:
       properties:
-- 
2.46.0


