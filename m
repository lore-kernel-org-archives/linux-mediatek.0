Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BEDECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDj+3jeCqCcaeTvzPHxQEqBQy4Ab6T3C2f1XrCtCwA0=; b=IIJZzXRfLMEDmG
	b0fWUph3yJY+srTRUJnsCFx/6ThoBZ2WR547pb6CeCP4Hn2oywWh+QfhuHqBrb9blJu5OEPdrdPcq
	NXS3QR6xlOi1JobSxL6utZ8sZ6h+Zu4uACVgUvCN7gfBc2bJazHD41hnTn2GvDmBqJjs8XQlJW2lK
	I4wcPliOF0szOh8LAAKxrgqbopiSdTJmA7aVRdooX9T7vU/+5lZkqfH2wUXG/1k4zefjh6NhNTa6t
	3ieBn1wEjRy0KK8VGwpTxOmv27JSLwX4g41MAzyUS2ADZjIxBWU/3QmHE270LON5pKV7vQLrgMz0T
	g3u3iIlDnxFDB9N4hXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omX42-00EmIv-Rf; Sun, 23 Oct 2022 09:14:38 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omX2i-00Elbz-VJ; Sun, 23 Oct 2022 09:13:19 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 60D6F5FC39;
	Sun, 23 Oct 2022 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666516391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JDj+3jeCqCcaeTvzPHxQEqBQy4Ab6T3C2f1XrCtCwA0=;
	b=RRfjCUWBMEhto+cDXh0RUPXtNVen8lXp88tVQwu6h24gptDD1yaCcNVtbB8T848DAIUhTV
	B1/eptn3ZnNVIox+5zG0liRrlT0YaSrSTX1pI1WV1JlWTglLK53ziBE+T/6+UgTi/0aPnw
	VuVOp2/t8fquuWpyMa2jtIfXeyPyEjk=
Received: from frank-G5.. (fttx-pool-80.245.79.234.bambit.de [80.245.79.234])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 9FC6010031F;
	Sun, 23 Oct 2022 09:13:10 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/7] dt-bindings: mmc: mtk-sd: add mt7986
Date: Sun, 23 Oct 2022 11:12:43 +0200
Message-Id: <20221023091247.70586-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023091247.70586-1-linux@fw-web.de>
References: <20221023091247.70586-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 1f513a30-b000-40b2-a634-bdc6344441f7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_021317_174104_AD017369 
X-CRM114-Status: UNSURE (   7.79  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add SoC specific section for defining clock configuration.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

---
v3:
- drop assigned-clocks/assigned-clock-parents
- fix clock description
---
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 31bb6dc329d2..17b346a60e4c 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -228,6 +228,29 @@ allOf:
             - const: source_cg
             - const: bus_clk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt7986-mmc
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          items:
+            - description: source clock
+            - description: HCLK which used for host
+            - description: AXI bus clock gate
+            - description: AHB bus clock gate
+        clock-names:
+          minItems: 3
+          items:
+            - const: source
+            - const: hclk
+            - const: axi_cg
+            - const: ahb_cg
+
   - if:
       properties:
         compatible:
-- 
2.34.1


