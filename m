Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AC3C38A02
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 17:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXS7XYXgHAQNROMH/gcyw3RlXa8PwXV8LYYbdM9KSpk=; b=PQUUmY2HdoDmW0
	OBO776iQuNX9JlwFYY1sqQr+GnqY44V8WGrI4yE7OhOYSm/AA9egd5T3FJ6JurfWleGDeD5ezQPHK
	EgzE6xra1hmprkgd2ip6gpIBye9Tyt0TVhXrUbS7/Wpn7zEMahMGhZ+5JyeavsjPQQUXyHjwl3WWv
	z4C8shII1T6vh0hi/4+XTeQAVB3o0ejwLGl35VY5krZ16oei7ly2ugQLPTHV1G4RL/lSmzjQisl52
	T8Cyu/sOxwxdk+4if80mRdIRFFGRFRYmjsM7/WbjAAOpynI7v8ctrvvDbg5AnbdrUrXCUktxKmbq7
	r6Bs0i3/1fAZfFEEMsWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq6I-007lse-5b; Sat, 29 Oct 2022 17:58:30 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq63-007lXC-Cs; Sat, 29 Oct 2022 17:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667066289;
	bh=/287IqXU2M48jGY5dOJDRNgS48sMz8IqBXXdIAdLiD0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OEZ7vXKHFGYr5iTatp0Mwf0R/6aU69uMFAJ5ju25G6w4WNCPHeP5if4FQOOfzEtuI
	 d8jZaYQ2TmMQI+mrwx5TJtNU09L6frWZy/lcvgHfb0yZEs1qbI9LSoNBYOa6OxPkQA
	 toR9N3hdSMgptBhWiNZzHsJoKCllTBxDac92atC7eAm6ytGiP+hEAy7Nk8rtjPkn/E
	 ycg7248ChumOo8rJv4BmNrEtxTWCoNicRgJx0pRup5M4MCL1E5FnKZtfGC7CM94Dwx
	 sRuUKZlKGdcOBVGUuuJRnPC7zas7EE7FWMvv9b/q/Z+C1NrHE9HqgB8PvoS2lyXO92
	 TPnvvxdJNsg8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from frank-G5 ([217.61.156.178]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hvb-1pES5G0Iq7-011fuP; Sat, 29
 Oct 2022 19:58:09 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: add SoC based clock config
Date: Sat, 29 Oct 2022 19:58:05 +0200
Message-Id: <20221029175806.14899-2-frank-w@public-files.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221029175806.14899-1-frank-w@public-files.de>
References: <20221029175806.14899-1-frank-w@public-files.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zso9H8enCAQo27e7CXSDU6tiEbUwr+oh4l121T5GOU6gypCw1bz
 obMOVr7UT7T61f1vuFU5NEB1PwDhAtl0hbJdW4KHDYjifaLfIG1sDYsJywK/UBTsA4ZazSv
 XuJpMUVxI+IEMFS7IctXkKz8U+ROOYwbFec9rcuQcvdiUppU9PyDASeZjjUnfjVbzt70TVu
 D+DPgSZXHbiK7s2Qcv0bw==
UI-OutboundReport: notjunk:1;M01:P0:eBhfvPLFTQo=;FLS16h8ZKYNCa1REsLbs4YmgLXd
 BxyznKfkvOrtHJ+EB/5UNKypilJICWAr5ddekbECiCLagVYLE/Sjq6nHifwKlN6gdAxExgFLu
 svW/r88bAvcTLu/Lmp/4dRce0QLr8wQufXUh7hb3RnZHwJ3R1wJnOygUDEZjgHnKWF6mgvBHm
 /xQNZu3wcRjAS0OnAOovAuARG0MYUMq4QL56mGK5SgvedV/ol1vSonm5uhLy5pPQS71BFC15g
 +A57rZRTTTJn0+YQbyN0hifyuxEA9MOcZir3vM0HJXtj6or3fNWFpK4cJOldbYw7LpvnKBFty
 CcX6Pmi4N53+kj8KYwytJQkffETIP5S6hfVKy/rTpJawAmnaHCs5c55Gfx+KRGqw85yC57ncj
 yINgUV4TAIE8Afm+3sL8LcikYIpxFLnKiNzQBnR2kc+DOshJBFVZZF4ELmTcmQN6NAwix557I
 ITI1eNc7n7HEK3XKeGx5QH0pBwM4BXJa6q+9XG9nY0pgegLCtsa5EW1zX9Ta1FKKs7qqIp/DK
 qvPSBUgxWHdlZ0kaBB1XJMDV3Db5Cg2SZ3JKy/ylx8cUKMBZhrEgMwrlc40qwL1fnhtefauI1
 lP71wjygV/9RNgrCGS54SN2t68nO1Jd5pcwcHfbTz68K+DhQzVf2rzP2hEuqdWyghHfuhuAv5
 /pqE+hRGwHlZO8Es22jmqz3IZeNrqQBxiOuFiYg4pR+NwJ07m571HSLYGMbtJ+9RfgCfZgbVf
 YECdfS/46oTaacI2q1IfuGZby8f8lELP9NyfGG9+Lmq2ssWrYQlrOMZzpdWJv6UEx6B3JER1J
 5FjfRjnOxrPHIwEhnI/emJJaRQEATY8MZsPXQMJyo8qWVsZNioOJGgOn/Fnhng1IcSLTy1u/U
 VuLUo90OVhBeEpTRSXuLZ6UtZD3tXRb3vtoeKs1g+SRE44tRwsYkY+CdyctMjA0Hib1UdtUsA
 6TGArqpqdfe6BElLVc/rBQJEo5E=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_105815_741876_CF3001B7 
X-CRM114-Status: GOOD (  10.39  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The PCIe driver covers different SOC which needing different clock
configs. Define them based on compatible.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
=2D--
v2:
- fix typo in mediatek,mt8192-pcie
v3:
- remove contains to match only if compatible is no fallback
  tested with series "Add driver nodes for MT8195 SoC" and mt7986
  pcie-nodes, dtbs_check is now clean
=2D--
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 47 ++++++++++++++-----
 1 file changed, 35 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml=
 b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index c00be39af64e..5d7369debff2 100644
=2D-- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -43,9 +43,6 @@ description: |+
   each set has its own address for MSI message, and supports 32 MSI vecto=
rs
   to generate interrupt.

-allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -84,15 +81,7 @@ properties:
     maxItems: 6

   clock-names:
-    items:
-      - const: pl_250m
-      - const: tl_26m
-      - const: tl_96m
-      - const: tl_32k
-      - const: peri_26m
-      - enum:
-          - top_133m        # for MT8192
-          - peri_mem        # for MT8188/MT8195
+    maxItems: 6

   assigned-clocks:
     maxItems: 1
@@ -138,6 +127,40 @@ required:
   - '#interrupt-cells'
   - interrupt-controller

+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt8192-pcie
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: pl_250m
+            - const: tl_26m
+            - const: tl_96m
+            - const: tl_32k
+            - const: peri_26m
+            - const: top_133m
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8188-pcie
+              - mediatek,mt8195-pcie
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: pl_250m
+            - const: tl_26m
+            - const: tl_96m
+            - const: tl_32k
+            - const: peri_26m
+            - const: peri_mem
+
 unevaluatedProperties: false

 examples:
=2D-
2.34.1


