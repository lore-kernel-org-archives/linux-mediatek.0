Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC854C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 06:57:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 806EC61A12
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 06:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 806EC61A12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=he2yW8A2Twgpou/a3sYJ2Co8OHe4ZJzEZEmGP/SVBW8=; b=M+pALLs0esTxXK84n8CtQuC4d
	cehMHDO2h5bW/yrYj0IhgOBtfY6Lx5gJCux/EJuI++eG+0qnSjWy5yYugTFVMapVeVktzMl20W1sy
	07yuqQavQOpuToFSTvAQlcY+8m6YKKaBmpflKmVdgk6NQEXlvcU5O7rFUYiAE/w9ABxzF3yS1wiEx
	vUZDLGUiWeYaN4A+CCxuZhk11DZ5YVjm0buij/Cd8UEMOkL7bgTA1RhYOdiczNmLqhRHQSsrJS88t
	5u0S1ZZOOR2x/CBrXnoIex5tI+ktlonnSRvqatqPLD6sCWR6UE2bVIkxzATtzTQIjQQ/mYiRSCJZj
	h0NujOw9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPJvb-000hXx-1L; Thu, 25 Mar 2021 06:57:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPJuU-000hCp-1k; Thu, 25 Mar 2021 06:56:05 +0000
X-UUID: d03236c363af4bae8906f8a03e4a33fd-20210324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PtaFZce8uZUxKP6ffJhXZZZmideOcfAjInTyZNOML7U=; 
 b=LURqL5b9HIm32GLUthD1AzwOEi2E0lNa7ogYlZA8zQEBwDuxt938FWXqI9cjD5NO1JRkFREBqb3ERYa/DeR99AMp/qu+WL1UdaNTda9nloseCPUItGG3qcehD64T4utrfOXjJpk0Q2x10j4aRl0MqAw0sFMlJS7SK319y7blByc=;
X-UUID: d03236c363af4bae8906f8a03e4a33fd-20210324
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 411707838; Wed, 24 Mar 2021 22:55:18 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 23:55:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 14:55:08 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Mar 2021 14:55:08 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH RESEND v5 02/12] dt-bindings: phy: mediatek: hdmi-phy: modify
 compatible items
Date: Thu, 25 Mar 2021 14:54:48 +0800
Message-ID: <20210325065458.43363-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210325065458.43363-1-chunfeng.yun@mediatek.com>
References: <20210325065458.43363-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FC0B76A885BCC9078CDC46FC45985E3B9576C03E263F21951A7AD15498934E752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_065603_404771_E3B4EDC9 
X-CRM114-Status: UNSURE (   9.67  )
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

mt7623-hdmi-tx is compatible to mt2701-hdmi-tx, and the compatible
"mediatek,mt7623-hdmi-tx" is not supported in driver, in fact uses
"mediatek,mt2701-hdmi-tx" instead on MT7623, so changes the
compatible items to make dependence clear.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v5: no changes
v4: add acked-by CK and Reviewed-by Rob
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
