Return-Path: <SRS0=K1YL=GT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4A2C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:07:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3FA623A56
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3FA623A56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OEkv/TaIHMzX4iOoGgUzv7GbTNXlQKw0nQNbzCbYZSU=; b=pnottvR9FA7beAIpQdSgKmPr7
	bomfOVGM8OTFzrQdLi9mzn+iIWQiwBJlMIZN99uP054seV8ZTajDfax6FvZ5nDZeuCdMxNRwyoZ4L
	XX9yl5Nnm0Oz9DJ8FqeBnEORG/d57t+jipzA4g9hranrR/Zgwzj21kFkuBncDAUkchR6Nj9sDt4/C
	3HM6veAuG20nQ0VnLnqXTWv7owGPLO9p+ZZqOiQqVXH32+10pCDNudKI7nDUdintwL8KiLv1fYDsh
	zMY2LObjB5o8Q6JBtgpEovivwH9evaO2VNNVTnD63nz2nCyzW1SAiVl8CZ1QD5REh+o4C3ezq2Y9s
	3qL7qWXkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0hYF-0007yd-S0; Sat, 16 Jan 2021 09:07:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0hY7-0007vD-Iu; Sat, 16 Jan 2021 09:07:13 +0000
X-UUID: 27a71a7dad7545559199f1d033b8dd6b-20210116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=G+OJnN7fDA/BpSOYjVKjCZxkMLdTgC3xWjZvIWrZOsk=; 
 b=CjDorTamaaAl2TKnlXVJhezEjFA9/VvMnEaznENunTBcs/dH5xs2N41vpeOxe7S2gYf3cSMZlucgFcv9g5WciOen2wGgexa67G3XAflkb4ELEk301kTGSG1Xt2Ypx94v94BxGQoiOYB6ZBaeZ/Ui97ntuXvubAu/Z6oZ8szi3SE=;
X-UUID: 27a71a7dad7545559199f1d033b8dd6b-20210116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 183387646; Sat, 16 Jan 2021 01:07:05 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Jan 2021 01:07:04 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Jan 2021 17:06:58 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 16 Jan 2021 17:06:58 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH next 03/15] dt-bindings: phy: mediatek: dsi-phy: modify
 compatible dependence
Date: Sat, 16 Jan 2021 17:06:44 +0800
Message-ID: <20210116090656.11752-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2941C6C062B00D6A4C12F6AB8FC1907DA6D697F2F4234EBEDA9C467556CFAEAB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_040711_814756_B96058DA 
X-CRM114-Status: GOOD (  10.52  )
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
 Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The compatilbe "mediatek,mt7623-mipi-tx" is not supported in driver,
and in fact uses "mediatek,mt2701-mipi-tx" instead on MT7623, so changes
the compatible items to make dependence clear.

And add an optional "clock-names" property, it's not used to get the clock,
but some DTS files provide it.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../bindings/phy/mediatek,dsi-phy.yaml          | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index 71d4acea1f66..af6e554c5b69 100644
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
@@ -32,6 +35,10 @@ properties:
     items:
       - description: PLL reference clock
 
+  clock-names:
+    items:
+      - const: ref
+
   clock-output-names:
     maxItems: 1
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
