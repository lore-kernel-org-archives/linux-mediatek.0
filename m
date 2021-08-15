Return-Path: <SRS0=EFw0=NG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5889C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Aug 2021 14:57:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F70F6115C
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Aug 2021 14:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F70F6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRs+CxcPoOePHE6xXEDpAFB19t4d5YTxeXXJd6Gvv4Q=; b=IVBHBZq7e95Mgm
	HD8bS/Lu8NNodEs1FddZV+gz90Y/AbWGCK3wiD56/EzjCgMP5oLw/I6kKhN0XkAZXOJow9/kRzJxp
	zFG4OGE/il5SFRLQNI9hj+ExiqWBIiqho6P7VSxWWwonfsEMC0wXHkTchdm5WqksxFk0jhAThHggX
	vzkEZs+QRPsVqVq4dyJGWX3oijNCpxArQOJv/ZMQVRtnGqajH35OLf4XEA8Ivzj7qyL3EEEOIZNRX
	dZn7l7yVZCANpbzUx47Nj2asM8elNiE7uGQJxK1xnvzjuBe+vfrQ7FmjwjbcStGMl25mE/2x2BS8q
	dCoBXjdz+J6RgOj3Uxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFHZ7-00FLej-FQ; Sun, 15 Aug 2021 14:56:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFHYn-00FLVR-72; Sun, 15 Aug 2021 14:56:29 +0000
X-UUID: dcf3c85b684c438ca56806133ef357b8-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YPhylwXY0Tzd4BJEIiU6wvO7rpUCkJtjIWS7nFo+DCc=; 
 b=KgF1AwI06OaEje3GHwE83rfZ/Y6vdgNgXjfGE1kiB42AUWoWW2kM1GhArPNvg5OYHEfZ3SyQZ+yFOejb7YIBUwzaSB7rCRGk3Den2ugph4BAoz3oealxbHXres9A2D6mG6/+UyjD4+h5CmZN2Tmvn3L8s9HAN6cui8n+zSvIQ60=;
X-UUID: dcf3c85b684c438ca56806133ef357b8-20210815
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 475406808; Sun, 15 Aug 2021 07:56:18 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 07:56:16 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 22:56:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 15 Aug 2021 22:56:15 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Fabien
 Parent" <fparent@baylibre.com>, <hsinyi@chromium.org>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 01/13] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC
 binding
Date: Sun, 15 Aug 2021 22:55:58 +0800
Message-ID: <20210815145610.2050-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210815145610.2050-1-jason-jh.lin@mediatek.com>
References: <20210815145610.2050-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_075625_310875_FD26D1F9 
X-CRM114-Status: UNSURE (   9.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. There are 2 mmsys, namely vdosys0 and vdosys1 in mt8195.
   Each of them is bound to a display pipeline, so add their
   definition in mtk-mmsys documentation with 2 compatibles.

2. Add description for power-domain property.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 2d4ff0ce387b..68cb330d7595 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -30,6 +30,8 @@ properties:
               - mediatek,mt8173-mmsys
               - mediatek,mt8183-mmsys
               - mediatek,mt8365-mmsys
+              - mediatek,mt8195-vdosys0
+              - mediatek,mt8195-vdosys1
           - const: syscon
       - items:
           - const: mediatek,mt7623-mmsys
@@ -39,6 +41,12 @@ properties:
   reg:
     maxItems: 1
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier as defined by bindings
+      of the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
   "#clock-cells":
     const: 1
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
