Return-Path: <SRS0=RXhr=DS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96656C433E7
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2020 09:20:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34981207FB
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2020 09:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N95SvZk3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fyvMBRpm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34981207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FIgKZsEnMCco8y3h1RrX0E0KzGw/kSKQ6eXrGzvE4I0=; b=N95SvZk39Swc18XWoZTis33Ki
	uwYCY1ivgMQjorAUSzrUdamZ6c2MRFwqAb6cQTqtS7rAZzmWsdPD8S24w9vuojJwzt/EztMrL67d7
	6knNKQmamNcuCtiW9w83IF3yOafegKIWqCV0nGlvm+lE3k831ZO7akJvBPkc54UAJ1BcU4+m7hukd
	nFHihDcfIck7ajKJvlrXM3wQX3FMM2OH/ei6Wee1eEa0OuTNOsCDA8hLrO8FO47nfrx06PNGKdfol
	dbJ8pfObed9S7Z5p3tjbVGzcMyECtyK2LiJFR18p1tvmoOjMbqnwZ4i9ai90fU3I2kZWRH26xfq9q
	eZRa8Ak9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRXX9-0002wh-M8; Sun, 11 Oct 2020 09:20:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRXX2-0002uY-Fn; Sun, 11 Oct 2020 09:20:45 +0000
X-UUID: e08dfcd8b8f84c48867315f8084a1931-20201011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AAnU5PlJeTlT3eOu0s04k2n54q0uEvfmgyB1oE18Bvs=; 
 b=fyvMBRpmG2shqQblhXATZZatE52NJvxiW8/3BoF7TrYwUZgETfQHzzjNh8wvBgbFcvmM8N4lAzBe6E65Fw6oSv8c5dhZfobWPUfScedQ3nSEvDyJBHOTFDDlXhUbjP8JIXmK4z93PqpfiIPWsKlMBQ7AShFRXCfQx0dsw2V+XKA=;
X-UUID: e08dfcd8b8f84c48867315f8084a1931-20201011
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2027514557; Sun, 11 Oct 2020 01:20:36 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Oct 2020 02:10:35 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Oct 2020 17:10:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 11 Oct 2020 17:10:33 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 2/4] mmc: dt-bindings: add support for MT8192 SoC
Date: Sun, 11 Oct 2020 17:10:28 +0800
Message-ID: <20201011091030.28547-3-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201011091030.28547-1-wenbin.mei@mediatek.com>
References: <20201011091030.28547-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_052044_751397_695B0088 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: devicetree@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8192 mmc host ip is compatible with MT8183.
Add support for this.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 21a2fce5b7ba..093db1c33653 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -29,26 +29,37 @@ properties:
       - items:
         - const: mediatek,mt7623-mmc
         - const: mediatek,mt2701-mmc
+      - items:
+        - const: mediatek,mt8192-mmc
+        - const: mediatek,mt8183-mmc
 
   clocks:
     description:
       Should contain phandle for the clock feeding the MMC controller.
     minItems: 2
-    maxItems: 4
+    maxItems: 8
     items:
       - description: source clock (required).
       - description: HCLK which used for host (required).
       - description: independent source clock gate (required for MT2712).
       - description: bus clock used for internal register access (required for MT2712 MSDC0/3).
+      - description: msdc subsys clock gate (required for MT8192).
+      - description: peripheral bus clock gate (required for MT8192).
+      - description: AXI bus clock gate (required for MT8192).
+      - description: AHB bus clock gate (required for MT8192).
 
   clock-names:
     minItems: 2
-    maxItems: 4
+    maxItems: 8
     items:
       - const: source
       - const: hclk
       - const: source_cg
       - const: bus_clk
+      - const: sys_cg
+      - const: pclk_cg
+      - const: axi_cg
+      - const: ahb_cg
 
   pinctrl-names:
     items:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
