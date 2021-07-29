Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412F5C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 15:51:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF73C601FC
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 15:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF73C601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uM/DHJY1RY72PWgvUmVkWFmXgNZeplvbcK9AabUANM=; b=loh3Zmn0WuPISU
	y4EbNExK1TLxwmFEKfebGbZ5vyRap5eBwJw8p0tPE/tH3EvNeEMm8qyjn1z8QuY5vb4rmgo7Vm9t0
	zls+pcjFHUidgpHC6m03LFxmk4syv0DLWwrs+l0QcLEYzWI0qHayv0+OG6PMITNKJ7W6TJ6FgoEgL
	hAzhGrKmRgfzeH3POX+XjsMsyAlAjGDbmc+qWZeNmMTaHvc/14nh0AUwEIUM2opq4/J8zRHYYmRsY
	W8qY/Rv5iFw4YYcRm0T/kF6ErLNax94hW2bz3+3g8Mb2TFT9XAbzP75L6SjyO8HcO+KuKRLe5xO26
	rGYVEkrGQWUh5dgdHolg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m98JQ-004pQK-BC; Thu, 29 Jul 2021 15:51:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m98Hs-004ovX-2Y; Thu, 29 Jul 2021 15:49:35 +0000
X-UUID: 0c0a4d4db84548efb59dc6245981291f-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=17jBXrTkXRY3GWP94PPNHMy9c654uhsLxzr/Cvs3/Fc=; 
 b=OlwVy3nccdoreEsVIBn0R870w4aYjXyIPGztttg18HH4MKE4CFPtxzpcunTafKWHiPcSYy846go4JEhgYyz8DM6WaVswHa4JIRRgOOwFQ3tyCBZ9oE+7oiYI0WYEQFRrFLcTZVZ9sIYDZKP6e8Qq/05Dg5w8JZjDQWMerK+XRug=;
X-UUID: 0c0a4d4db84548efb59dc6245981291f-20210729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1537235434; Thu, 29 Jul 2021 08:49:22 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 08:49:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 23:49:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Jul 2021 23:49:13 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Enric Balletbo Serra
 <eballetbo@gmail.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Fabien Parent
 <fparent@baylibre.com>, <jason-jh.lin@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/5] dt-bindings: mediatek: display: add MERGE additional
 description
Date: Thu, 29 Jul 2021 23:49:10 +0800
Message-ID: <20210729154912.20051-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210729154912.20051-1-jason-jh.lin@mediatek.com>
References: <20210729154912.20051-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_084932_202884_65E25228 
X-CRM114-Status: GOOD (  11.74  )
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

1. clock drivers of MERGE
   The MERGE controller may have 2 clock inputs.
   The second clock of MERGE is async clock which is controlling
   the async buffer between MERGE and other display function blocks.

2. MERGE fifo settings enable
   The setting of merge fifo is mainly provided for the display
   latency buffer. To ensure that the back-end panel display data
   will not be underrun, a little more data is needed in the fifo.
   According to the merge fifo settings, when the water level is
   detected to be insufficient, it will trigger RDMA sending
   ultra and preulra command to SMI to speed up the data rate.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,disp.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
index f01ecf7fcbde..f16ee592735d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
@@ -227,6 +227,9 @@ properties:
     description: clock drivers
       See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
       For most function blocks this is just a single clock input.
+      The MERGE controller may have 2 clock inputs. The second clock of MERGE is async clock,
+      which is controlling the synchronous process between MERGE and other display function
+      blocks cross clock domain.
       Only the DSI and DPI controller nodes have multiple clock inputs. These are documented
       in mediatek,dsi.txt and mediatek,dpi.yaml, respectively.
       An exception is that the mt8183 mutex is always free running with no clocks property.
@@ -260,6 +263,15 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [8*1024, 5*1024, 2*1024]
 
+  mediatek,merge-fifo-en:
+    description: MERGE fifo settings enable
+      The setting of merge fifo is mainly provided for the display latency buffer.
+      To ensure that the back-end panel display data will not be underrun,
+      a little more data is needed in the fifo. According to the merge fifo settings,
+      when the water level is detected to be insufficient, it will trigger RDMA sending
+      ultra and preulra command to SMI to speed up the data rate.
+    type: boolean
+
   power-domains:
     description: A phandle and PM domain specifier as defined by bindings of
       the power controller specified by phandle. See
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
