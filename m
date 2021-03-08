Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28165C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:38:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9219F651D1
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9219F651D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kkEpEiBoxTX0eHiaQEw4ULW5pZKlTFkrUzpPiAZDc5c=; b=Nx6bnImll5risx/g+z6l+xKKo
	NYjjg3wakEcB2N6QTPlfrHG+GqnK460O8SY3jYXJyQGlRCi88/n9+BR3kdEOuKtwStilrq5RUnqXl
	XKKpseUop8jztL27Spo53FQZZi6Bx+KUYj0kb3ztUcM7sHXyCBtuZVPeE4Px8lhRTJYB+fQew4D1R
	Obuq9hpN/GzuHc0E2wwKYWyZgxTC0G3XFZO5COKMkrRtGf2usQJ7QMhom0RSNkDRiEpLJOaQZjZvx
	M47Bt8P4C5g6IZnp78n1pt6Q+FlaxWs/InFUbm2t/UZFFsXwRDnjpp4pOChvgTBK0X3HLcWJN5EWZ
	lt+9rRbCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8b7-00FI84-H0; Mon, 08 Mar 2021 05:38:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8ay-00FI6P-6o; Mon, 08 Mar 2021 05:38:25 +0000
X-UUID: f3f38d336e2349149b27631bb31f12ec-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=C/+VtsC1KHbynvja1BhTvmGSx2N0wEeKmXK19/IVtZk=; 
 b=WfA6k9f1x04CY5cr40NFVnBPEanHa/102PRZOqVt7+6mAXdU8hDEHE8zvEV6cnw291Vfkk34oWBM1Rr1w8E2frBzkkaAd/zWAD9GaTvY4z8BYlHuDt6bpTI0voq+J6tkb8OLQS1tBXsGcXIHUazQ5rHj8ltOiquA/+AIVHt1ZnU=;
X-UUID: f3f38d336e2349149b27631bb31f12ec-20210307
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1589981766; Sun, 07 Mar 2021 21:38:14 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 21:38:13 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 13:37:47 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 8 Mar 2021 13:37:47 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
Subject: [PATCH v4 02/12] dt-bindings: phy: mediatek: dsi-phy: modify
 compatible dependence
Date: Mon, 8 Mar 2021 13:37:35 +0800
Message-ID: <20210308053745.25697-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
References: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FE05A25379E27531EA4035143E5C47758A7E85BFDD9DDA7A0CEA06112A180A2A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_053822_425751_E8AA1077 
X-CRM114-Status: GOOD (  10.10  )
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
