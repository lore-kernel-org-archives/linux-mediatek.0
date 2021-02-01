Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BF6C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:10:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0915264E31
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0915264E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y9OzjL8FqVEafWBHB9UtvQEaHDPf81xmYGgUnuc4ke0=; b=bo09mK8ZWqVZGJ6Fgts69jI1M
	duBv7i0VOT+BT5gGYt3JUEfTDMbhWnhpLkvicaDhGmm6JxHZkLACL6UKrmIiQT5bdJo1NABtvpsmU
	msNeg65gsntGLblgD7VFhPmrcEAPeneAUaMbBzA9tZv7fjuPVht9OpJYiY+KQ3r3jeIQV+mw2tQnJ
	RYKltjGR2UOFJtPqx62EP9MVgO03QELjYHww1DdqXWxGa1NQ5trBtpmFsjU1gDf+y8r48rR1thAgm
	fcl4v7O7ijp5a1WUsXIJMpbehbKHjIZ6qYBQZ8/zvJzYRUPr7GsOMx13Udi6CTTxUg0QOVeugvpnX
	kexPDVlrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6TMD-0003nt-4b; Mon, 01 Feb 2021 07:10:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6TM4-0003ih-DR; Mon, 01 Feb 2021 07:10:37 +0000
X-UUID: 8aef919df9cf4b0ebf2ed7a3ceaffe38-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=eYK624hKYzP1+9o6nTUm21Bltz59rEsfLsMvs3ZxtgU=; 
 b=iuqP0nwzTSJpzT/p+vG4+buCXF6BsXd8LgEfkz5ZHwkR0nzcN+IeBNLmsAOm3F/7MYM9cm3v4oiFpVEEByBKCTyTK7+a9D6w7pU/Ph13ogrVeWtcKdDsOoDr0uCuYt3+7Quuu5zel46o5QM9nCqONlygnm6VxFj/FLJbR0Dr+qc=;
X-UUID: 8aef919df9cf4b0ebf2ed7a3ceaffe38-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1397113868; Sun, 31 Jan 2021 23:10:31 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 23:00:28 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 15:00:25 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 1 Feb 2021 15:00:25 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH next v3 04/16] dt-bindings: phy: mediatek: hdmi-phy: modify
 compatible items
Date: Mon, 1 Feb 2021 15:00:04 +0800
Message-ID: <20210201070016.41721-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 165C1A7FD15B0E9A9FA74935E53F5F751508C62CEC0D1C611E3264E2EEC8DBAB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_021036_643387_5DC38C0B 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt7623-hdmi-tx is compatible to mt2701-hdmi-tx, and the compatible
"mediatek,mt7623-hdmi-tx" is not supported in driver, in fact uses
"mediatek,mt2701-hdmi-tx" instead on MT7623, so changes the
compatible items to make dependence clear.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: modify commit message
v2: no changes
---
 .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml    | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index 4752517a1446..0d94950b84ca 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -21,10 +21,13 @@ properties:
     pattern: "^hdmi-phy@[0-9a-f]+$"
 
   compatible:
-    enum:
-      - mediatek,mt2701-hdmi-phy
-      - mediatek,mt7623-hdmi-phy
-      - mediatek,mt8173-hdmi-phy
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt7623-hdmi-phy
+          - const: mediatek,mt2701-hdmi-phy
+      - const: mediatek,mt2701-hdmi-phy
+      - const: mediatek,mt8173-hdmi-phy
 
   reg:
     maxItems: 1
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
