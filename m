Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC05C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 06:58:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B400D619A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 06:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B400D619A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s4ScTssQZF8CwxdpNiBKKd6ykatFgNOCrUYVDx+wMWw=; b=hSG1GOxrSiacWyenkAjSLPNi+G
	LAagrT7LfQmYwKY4yOEqoAUX2BUecs4HpTb4/6YitPNcwK74qRkKannXduwZO/IBAoL8cDhhNQPLF
	sk3/zSmx/PBQ28tc8yLHpF3p2ZU0wysYOO+BwPwC6v+WIg1516CDhA0DtOGBB8OSwbNHgpXy6bIG0
	4WU6Rhef4n9t8EzbaW03tujCTMZDd0NFrye3YG0cNiH92FqDwdJk35WoTlPQE7iBZNIVbUBnWhNsW
	DInqqb14HFcpeGeEx+LNlSUCis/lzSB4MxoedHCzrsjIYR4MGXzOMqTlu/YEO94rHHpXwLRWCO+tG
	Iw3f5Jrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPJwU-000htP-Gz; Thu, 25 Mar 2021 06:58:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPJuZ-000hCb-Ia; Thu, 25 Mar 2021 06:56:09 +0000
X-UUID: 9b9bbca9eadc4da580cab575436a6bb5-20210324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=oDSp8AK15SfkF3sjel/YUFJRAY6Ga3QfU3h1S6+N4YQ=; 
 b=SWKHtFj6SzbKCU+dUkz6wyy2gMCvoCCosaB0h2ih7IPKfsmnuMi23ajnS+AlXZ0c1f7CpnwYDKcw6MZtt5yHq2EMrgKhzMZZVEhIwqPnn749s4JwrlokSIsekDJj5hkRYzLpBGLtj1cIXbV4pIdkXrAvC+K24tkr50sdS9PrmSU=;
X-UUID: 9b9bbca9eadc4da580cab575436a6bb5-20210324
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 99581271; Wed, 24 Mar 2021 22:55:17 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 23:55:16 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 14:55:07 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Mar 2021 14:55:07 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH RESEND v5 01/12] dt-bindings: phy: mediatek: dsi-phy: modify
 compatible dependence
Date: Thu, 25 Mar 2021 14:54:47 +0800
Message-ID: <20210325065458.43363-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_065608_213181_C90FBC54 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jie Qiu <jie.qiu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cawa Cheng <cawa.cheng@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt7623-mipi-tx is compatible to mt2701-mipi-tx, and use
"mediatek,mt2701-mipi-tx" instead on MT7623, so modify
the compatible items to make dependence clear.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v5: no changes
v4: add acked-by CK, and reviewed-by Rob
v3: modify commit message suggested by CK
v2: separate two patches suggested by CK
---
 .../devicetree/bindings/phy/mediatek,dsi-phy.yaml   | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index 71d4acea1f66..6e4d795f9b02 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -19,11 +19,14 @@ properties:
     pattern: "^dsi-phy@[0-9a-f]+$"
 
   compatible:
-    enum:
-      - mediatek,mt2701-mipi-tx
-      - mediatek,mt7623-mipi-tx
-      - mediatek,mt8173-mipi-tx
-      - mediatek,mt8183-mipi-tx
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt7623-mipi-tx
+          - const: mediatek,mt2701-mipi-tx
+      - const: mediatek,mt2701-mipi-tx
+      - const: mediatek,mt8173-mipi-tx
+      - const: mediatek,mt8183-mipi-tx
 
   reg:
     maxItems: 1
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
