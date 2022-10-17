Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A16C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCTfi8EohP0/f/dHHu5qpABoBPiRJzFOeNfn7nLzrEY=; b=32CsfIOknCjHXPtYmuqQQK1JEB
	Ec83ifF6FzSN+P+GDPXIBM3jukTiL84VwQRtRGCPNv0S2HT2YGNKdIrNNP6AQws/kHW2aTyPRXKAG
	G5XengvKiVIHmMoADEW70KYsgW/PSghjxF8Xch7B9UzS8XQebc/hptBVrD8cv9r5+VuyAmRZzbWn2
	ts/Tn2QYqz43q3YEpBS9MqyP0ZomKW9k6ZsdCYHDkbWkDvvJ5gDGqYHr4Io9bd0GwDJ5Xd/Vm9JGD
	y+RH4yYvI1eI6GnvLnf6wFGyxdtk+4uTjLodzf15O0Y1ZCR6JXYm3Z5b4BKNbA/0i6Oa8XGLs8BxA
	607RLCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okQys-00Ce6R-GX; Mon, 17 Oct 2022 14:20:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okQyp-00Ce3S-Ji; Mon, 17 Oct 2022 14:20:36 +0000
X-UUID: b505d3bddbcb4738beb7e2cd25d606a7-20221017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SCTfi8EohP0/f/dHHu5qpABoBPiRJzFOeNfn7nLzrEY=;
	b=ChQ48xbwQoffs2pVw5xsHQB1p2ZiyK7ymxsB2HU7eyz88Z0n1Nq5mp2NL6SJEK3CgdsUISZBnbGEctTjBg2oCDkR6mCmrRxklFgHU9ATCibStazGWULRldx2itReRLk6to58gKtL0PmwdFA38BAH+yvhcYE7dvcqF+Ke7+HjRZk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:fe93ce2f-d79b-4de8-bedb-f3542eb3d462,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:43789fdb-0379-47b3-a5dd-2ef5001d380a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b505d3bddbcb4738beb7e2cd25d606a7-20221017
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 978747471; Mon, 17 Oct 2022 07:20:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 17 Oct 2022 22:20:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 17 Oct 2022 22:20:13 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <chaotian.jing@mediatek.com>, <ulf.hansson@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mengqi Zhang <mengqi.zhang@mediatek.com>
Subject: [PATCH 2/2] dt-bingdings: mmc: Mediatek: add ICE clock
Date: Mon, 17 Oct 2022 22:20:07 +0800
Message-ID: <20221017142007.5408-3-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221017142007.5408-1-mengqi.zhang@mediatek.com>
References: <20221017142007.5408-1-mengqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_072035_667109_4126D286 
X-CRM114-Status: UNSURE (   7.60  )
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

Document the binding for crypto clock of the Inline Crypto Engine
of Mediatek SoCs.

Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index d8e1e2e9adf2..f93d686e2911 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -57,6 +57,7 @@ properties:
       - description: peripheral bus clock gate (required for MT8192).
       - description: AXI bus clock gate (required for MT8192).
       - description: AHB bus clock gate (required for MT8192).
+      - description: crypto clock used for data encrypt/decrypt (optional).
 
   clock-names:
     minItems: 2
@@ -69,6 +70,7 @@ properties:
       - const: pclk_cg
       - const: axi_cg
       - const: ahb_cg
+      - const: crypto
 
   interrupts:
     description:
-- 
2.25.1


