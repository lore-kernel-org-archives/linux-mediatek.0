Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E49C3A59D
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 17:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWQAyMiyLzRjICRckdk9i8etw2ozKINbfjBDA1F++Do=; b=yCt20svIBkEb40
	gl1ujOxmrRmNNc5t/+L9MCRRlP2XPV4mCvl9KrVO1omk6H47iLWkGAH5nfzkpbf2Upc5SzZXP8BFS
	q8rQg/QB6noqAAKgyFWHaEWIOz+XDt3mc93XKXlRAHFeg3xxxXf1dEOe9XrqcCkdBPJECy6du1B5H
	qS12cS4Fg1rRV/RlJeN530KgT/66cvrF+VsQ/RpmO4DAYUn91C/omxK1BUH5rO5j3987t3Lw0vsNE
	/vIEp4vp7SpEaznmuZXBp+TWQDmsd8ZBjX+nfFuoVRh2/hEZVdQpN9RoiBQgLEvdg+HJgx0O0zzdy
	SyQYUTZygyt8YgrmxOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omeNm-00FmUo-UD; Sun, 23 Oct 2022 17:03:30 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omeND-00FmJI-Ek; Sun, 23 Oct 2022 17:02:56 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 5DE374026F;
	Sun, 23 Oct 2022 17:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666544569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eWQAyMiyLzRjICRckdk9i8etw2ozKINbfjBDA1F++Do=;
	b=YpLBExZbOZiWWo4PCJib0wv7vZGXwRFeIvhqjrwDGbwI20KyvCqWOs+7KALnjuMK8YkkVf
	0K2TX4DNbVQcNOevXi0BPkkYjbpfUZAc4kiuVklwwRuUsHVxPFJXYTEEUvBEj5k9Oxpbdi
	/QvL4Rx4b0p4KFzX+b+8sCOpI2Mazc8=
Received: from frank-G5.. (fttx-pool-80.245.79.234.bambit.de [80.245.79.234])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 803AB100671;
	Sun, 23 Oct 2022 17:02:48 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] dt-bindings: PCI: mediatek-gen3: add mt7986 clock config
Date: Sun, 23 Oct 2022 19:02:34 +0200
Message-Id: <20221023170234.83621-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023170234.83621-1-linux@fw-web.de>
References: <20221023170234.83621-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 4dd0b3e8-60f4-4111-8ab6-3e4dc2df3d56
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_100255_654801_0CAA3279 
X-CRM114-Status: UNSURE (   7.20  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

MT7986 needs 4 clocks for PCIe, define them in binding.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../bindings/pci/mediatek-pcie-gen3.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 3662422b38ea..e6020e684c00 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -79,9 +79,11 @@ properties:
       - const: mac
 
   clocks:
+    minItems: 4
     maxItems: 6
 
   clock-names:
+    minItems: 4
     maxItems: 6
 
   assigned-clocks:
@@ -162,6 +164,20 @@ allOf:
             - const: tl_32k
             - const: peri_26m
             - const: peri_mem
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt7986-pcie
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: pl_250m
+            - const: tl_26m
+            - const: peri_26m
+            - const: top_133m
 
 unevaluatedProperties: false
 
-- 
2.34.1


