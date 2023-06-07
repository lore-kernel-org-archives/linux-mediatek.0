Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA92FC7EE25
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 20:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0kUTW1X2LD/vaTSEV+auHRO+g/5nCHy44H0Bfj2zH8=; b=IWO9XppFsr1L/c5V+KLBtNjEuG
	lCS4LSUMgVskKF5zxzxD2BJVghS1nEZ0kqt0qlyv6e+CVgIb2KVmP2+CK8PkZBN6VZvmhVZO/4Ab+
	Nd7uW/do1mSQl/fUZXZfMt6svy7o2GyurFPbLCjyEQbNEnjKIWwfUqaIPwEF91uSrd6IsTkVZdnfE
	L3vFjYgKjnx+GL3cTY6fUQ2FgcG77+RV1fTTlhjm7ZSE1mpjmAS3uztiIbU1+SIXrAyqO71M+/r5Q
	fgab0OytS9LmYr3hfi6xCivUv63mmfp155zOZy+41jjNa5XxCO1z6T+zH6LhOVKiDJRlknWQSurOj
	K5HK/spA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q70Du-007DQz-13;
	Wed, 07 Jun 2023 20:57:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q70Do-007DLC-0I;
	Wed, 07 Jun 2023 20:57:37 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 95F0D6606F08;
	Wed,  7 Jun 2023 21:57:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686171454;
	bh=p/U679O+aC/H7H+CqRcp2tK9NBFgpymNdt1qg5tXhR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qprx3F0+l6LD4cltZLZV0ciBVQ/u2OvCFwQpiknLGaVxcKthB1EVzOCkm8Cj/5xEu
	 pDGxNi2JrjK3TopSoRVL4p6LPQaDMk08urVEm8zxJcUEXR081L76orRRBwWNgMECbD
	 3Z5GoVcvACdO5QARlrPqfLNYT81gCnld2oEqwqi1hXhKugJst/47ztOWDIRapFBl+w
	 94LSoET34wMHWtBnMA9fzcev4RKN0A143IsJseGsL9dIjq5Y9HwGtfvrDhQkWr2RSl
	 Bl5+JgQkgFRG55z8OVrikywtttnO9d0fq4RkukevUnCurLsan/XMq19nJFY1Kh0Ghf
	 rsR9ybQexDRTQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/5] media: dt-bindings: mediatek,vcodec: Remove VDEC_SYS for mt8183
Date: Wed,  7 Jun 2023 16:53:39 -0400
Message-ID: <20230607205714.510012-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607205714.510012-1-nfraprado@collabora.com>
References: <20230607205714.510012-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_135736_391049_91C9D112 
X-CRM114-Status: GOOD (  17.25  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The binding expects the first register space to be VDEC_SYS. But on
mt8183, which uses the stateless decoders, this space is used only for
controlling clocks and resets, which are better described as separate
clock-controller and reset-controller nodes.

In fact, in mt8173's devicetree there are already such separate
clock-controller nodes, which cause duplicate addresses between the
vdecsys node and the vcodec node. But for this SoC, since the stateful
decoder code makes other uses of the VDEC_SYS register space, it's not
straightforward to remove it.

In order to avoid the same address conflict to happen on mt8183,
since the only current use of the VDEC_SYS register space in
the driver is to read the status of a clock that indicates the hardware
is active, remove the VDEC_SYS register space from the binding and
describe an extra clock that will be used to directly check the hardware
status.

While adding the active clock, split the mt8183 clocks since there are
less of them than in mt8173. This is done in this same commit to avoid
changing the number of clocks twice.

Also add reg-names to be able to tell that this new register schema is
used, so the driver can keep backward compatibility.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

Changes in v2:
- Merged with patch 1 (media: dt-bindings: mediatek,vcodec: Allow single
  clock for mt8183) to avoid changing number of clocks twice
- Added maxItems to reg-names
- Constrained clocks for each compatible
- Reordered properties for each compatible

 .../media/mediatek,vcodec-decoder.yaml        | 63 ++++++++++++++++---
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
index 63be42560948..2b29748b1d22 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -21,24 +21,23 @@ properties:
       - mediatek,mt8183-vcodec-dec
 
   reg:
+    minItems: 11
     maxItems: 12
 
+  reg-names:
+    minItems: 11
+    maxItems: 11
+
   interrupts:
     maxItems: 1
 
   clocks:
+    minItems: 2
     maxItems: 8
 
   clock-names:
-    items:
-      - const: vcodecpll
-      - const: univpll_d2
-      - const: clk_cci400_sel
-      - const: vdec_sel
-      - const: vdecpll
-      - const: vencpll
-      - const: venc_lt_sel
-      - const: vdec_bus_clk_src
+    minItems: 2
+    maxItems: 8
 
   assigned-clocks: true
 
@@ -86,6 +85,33 @@ allOf:
       required:
         - mediatek,scp
 
+      properties:
+        reg:
+          maxItems: 11
+
+        reg-names:
+          items:
+            - const: misc
+            - const: ld
+            - const: top
+            - const: cm
+            - const: ad
+            - const: av
+            - const: pp
+            - const: hwd
+            - const: hwq
+            - const: hwb
+            - const: hwg
+
+        clocks:
+          minItems: 2
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: vdec
+            - const: active
+
   - if:
       properties:
         compatible:
@@ -97,6 +123,25 @@ allOf:
       required:
         - mediatek,vpu
 
+      properties:
+        reg:
+          minItems: 12
+
+        clocks:
+          minItems: 8
+          maxItems: 8
+
+        clock-names:
+          items:
+            - const: vcodecpll
+            - const: univpll_d2
+            - const: clk_cci400_sel
+            - const: vdec_sel
+            - const: vdecpll
+            - const: vencpll
+            - const: venc_lt_sel
+            - const: vdec_bus_clk_src
+
 additionalProperties: false
 
 examples:
-- 
2.41.0


