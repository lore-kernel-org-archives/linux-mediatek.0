Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC3AC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:04:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B63E23A5E
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B63E23A5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Acs1juxsf3J/xWYfcyDYO2J3WRkEpnhepq9wBMTLOhY=; b=B5vWqGDAPjg2y0CYVUx6nu5B7
	Nr4/XRfEj6Af8/ygn+Kneg68UmIfvksmkpOCB/UOz2WePLK4COjAAHZwoMk6NMwxGvLxRTkwU+/bR
	6W/OE7/BhX3WqkkyQtXuzvIAhCAiI3789n3oIvlBCdvuNlwOO8X3CbKTs14d937I+vZot+nnanMcY
	xMmsn4CVLrFUoJsAX0YrR9KvdgaKug//Uh+EQchKAlmuE5Ukec1unUFgSF8IB4MTOzjrZJ9MTs/Lv
	u5khLvLgHs4JaKWTCOpKoFZY6wE6hkA3IXTsdU0OaDdSKEDHpRjUva9Y46U+TA0r/9FXqiHHSOjlW
	8Cp8dW79A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2vAd-00053r-C9; Fri, 22 Jan 2021 12:04:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2vAN-0004wT-Cq; Fri, 22 Jan 2021 12:03:52 +0000
X-UUID: 802d6ffef48d468787641a0868679362-20210122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xdROprIdh/cM9sBOmGFqugjqZEh2e8FkV7LBr1Y63m8=; 
 b=NTau7G4UIvOy6NxRiMl7dxenWYpSQIKBUqKM9VnDM2xR5zrxhxJ48SHpmWfP36A6gPT7u+t9NPjsiRFXeMeRqXIUIz3PoN6jFGK7MsFWQJb0HqpLJhqsPeK4X5wQyZxWvZr08KhvBfpJhLmfJdnALYJwUgzPtgqkjHV9YpBEKLU=;
X-UUID: 802d6ffef48d468787641a0868679362-20210122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1974523839; Fri, 22 Jan 2021 04:03:42 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 04:03:41 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 20:03:37 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Jan 2021 20:03:37 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH next v2 02/17] dt-bindings: usb: mediatek: fix yamllint check
 warning
Date: Fri, 22 Jan 2021 20:03:08 +0800
Message-ID: <20210122120323.4337-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
References: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B9106B7E9588D51D31A1A2591C4DC47A5E623353823F156C61F674A7140978572000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_070351_577204_FF53B878 
X-CRM114-Status: GOOD (  11.75  )
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

Fix warning: "too many spaces inside brackets"

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml          | 2 +-
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml    | 6 +++---
 Documentation/devicetree/bindings/usb/mediatek,musb.yaml    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 38b1fe18aa79..a3817f3af59d 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -139,7 +139,7 @@ patternProperties:
     description: The hard wired USB devices.
 
 dependencies:
-  wakeup-source: [ 'mediatek,syscon-wakeup' ]
+  wakeup-source: ['mediatek,syscon-wakeup']
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index f5c04b9d2de9..66d78f534722 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -172,9 +172,9 @@ patternProperties:
       example if the host mode is enabled.
 
 dependencies:
-  connector: [ 'usb-role-switch' ]
-  port: [ 'usb-role-switch' ]
-  wakeup-source: [ 'mediatek,syscon-wakeup' ]
+  connector: ['usb-role-switch']
+  port: ['usb-role-switch']
+  wakeup-source: ['mediatek,syscon-wakeup']
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
index 790efe8b6274..a515c9f30b96 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
@@ -66,8 +66,8 @@ properties:
     type: object
 
 dependencies:
-  usb-role-switch: [ 'connector' ]
-  connector: [ 'usb-role-switch' ]
+  usb-role-switch: ['connector']
+  connector: ['usb-role-switch']
 
 required:
   - compatible
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
