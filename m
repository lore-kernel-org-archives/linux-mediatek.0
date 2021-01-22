Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788C3C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:05:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E72238EE
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30E72238EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w/mHZO8Gw2SXTnK4QtXgnSvgZHe1xIt5Og/4jXU66fg=; b=CYiQhkjlU3tvzUj9y334ia+Au
	bZrOL28Bnl8nlyksMuwZGJ79ubChEa7CGndebtC3p9Gl7sHBBVg4rtwTSHyfbLJow/3EVZZdjxGHm
	dTEGOuZCk69D2ZAZHp0xC69OMLthB/5mVzP++wEI5PYGJni/3raMc5AT3y67ZFB4IZ4yCAw93lVXO
	NTJ6CxOzQdbB38jDRRDM1ZvwnTpPda6JaOJwRiP50rajiHh+kL7O52B3Y00rfR/e1x4oXBMTjsWYJ
	E1GaNBEo7FEV1j2nkljCfDd+0w8psN+hDbZdJRIkBLflZ0aqByYlq3g/moMNDZ/zjPK41/Djq/SeP
	AI3RuJv7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2vBE-0005Jy-A5; Fri, 22 Jan 2021 12:04:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2vAS-0004xJ-DX; Fri, 22 Jan 2021 12:03:59 +0000
X-UUID: 368508ff2ec645609ceceb49474381f7-20210122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iJWCGfU5SL9p5xF0unlcnUoDW5RnO4Bq8sFL6Of5k4Q=; 
 b=dfpOk+QscCwscRfSIOm0qae7jWWlx82zv5KkutOqKHgiszTfocUWIsNRmZw4CifJmJLg0KLN00xsZbvbCrIBbzS8X0Ci4J3bGMgRyqwWm+H88NEZcjzy9aDUfsN5ogTQ9BM5LhSag8jn+kNBfy4hC7jD0+BH4KhSlmjh02A1j3k=;
X-UUID: 368508ff2ec645609ceceb49474381f7-20210122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1011664067; Fri, 22 Jan 2021 04:03:42 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 04:03:41 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 20:03:38 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Jan 2021 20:03:37 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH next v2 03/17] dt-bindings: phy: mediatek: dsi-phy: modify
 compatible dependence
Date: Fri, 22 Jan 2021 20:03:09 +0800
Message-ID: <20210122120323.4337-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
References: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F04E50F19F4BC40B902CECC833742C05D9A0D46DB951459ADC99C74EEFBAC6A92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_070356_645423_0F309871 
X-CRM114-Status: GOOD (  10.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The compatilbe "mediatek,mt7623-mipi-tx" is not supported in driver,
and in fact uses "mediatek,mt2701-mipi-tx" instead on MT7623, so changes
the compatible items to make dependence clear.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
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
