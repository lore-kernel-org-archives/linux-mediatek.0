Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ED8C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 09:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwE9fx2tS9oduVfTIs9Hd6/Fb9a+3JIsjdgPxEZuCWk=; b=jkB30zgKPnn3/5
	AfOUIeNHJkX5KEcTkZI+7IFnzi8PzWSqDGbuoX0HANCJMixLaO0Dehs4ECs+amb+vgX9va0+xco3g
	nxWWb5AP/zleohJHzvfM7Qngn/dEt+iaSybXgaxkQW3fVxvQ1058PnSVA4eMar3utw3f3wjmVnx1T
	zR4BUf3bHQMFAQHdJwva35Rr2uUJVsqMykNCdWRlf0mtwPTxveU9qe1SQSGnLqvLyNIFjDyRreZ6p
	qsU02C2GfofjYQmpGsug4aIQ9Mc1fRsCKGhUuwAKrz1QCh0puynMqWSPUScSHD3cHM0j5DdjK30nf
	z154aVXfWSho2lRpWpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omASv-00BtSv-HK; Sat, 22 Oct 2022 09:06:49 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omARq-00Bsxv-Ay; Sat, 22 Oct 2022 09:05:44 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout1.routing.net (Postfix) with ESMTP id 8AA8A41A25;
	Sat, 22 Oct 2022 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666429540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwE9fx2tS9oduVfTIs9Hd6/Fb9a+3JIsjdgPxEZuCWk=;
	b=G1xnd0RAP2vFdUQcNsw9U+lz+xRBas2yonC7dKl/xdx4sQpNoL0h2wCEjl4zSw/hjbN97h
	XqXubJCBuU3O8GVbLOnfbLZ8regoUcyCtf/Iinridt3NAixHPzUNZHPfCHH4313o5u5VVv
	IXlpKKROuQzbWa7VeD+offVODzc0hm8=
Received: from frank-G5.. (fttx-pool-80.245.73.148.bambit.de [80.245.73.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id CB46C40690;
	Sat, 22 Oct 2022 09:05:39 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 5/5] dt-bindings: mmc: mtk-sd: add mt7986
Date: Sat, 22 Oct 2022 11:05:30 +0200
Message-Id: <20221022090530.16265-6-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022090530.16265-1-linux@fw-web.de>
References: <20221022090530.16265-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 2ff8b4a6-6a4a-400a-8436-ce86973b8370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_020542_541565_59C45497 
X-CRM114-Status: UNSURE (   7.88  )
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

Add compatible in "not" section to avoid override the settings again.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index c7bcf0c3dd5d..9df63c461f1f 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -229,6 +229,33 @@ allOf:
             - const: hclk
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
+        assigned-clock-parents:
+          maxItems: 2
+        assigned-clocks:
+          maxItems: 2
+        clocks:
+          minItems: 3
+          items:
+            - description: source clock
+            - description: HCLK which used for host
+            - description: independent source clock gate
+            - description: bus clock used for internal register access
+            - description: msdc subsys clock gate
+        clock-names:
+          minItems: 3
+          items:
+            - const: source
+            - const: hclk
+            - const: axi_cg
+            - const: ahb_cg
   - if:
       not:
         properties:
@@ -237,6 +264,7 @@ allOf:
               enum:
                 - mediatek,mt2712-mmc
                 - mediatek,mt8192-mmc
+                - mediatek,mt7986-mmc
     then:
       properties:
         clocks:
-- 
2.34.1


