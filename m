Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A647C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlpL7OZ2jal9w3qkOowTjk1VY3EaZfms6C1wTuJNWfw=; b=nxldcJJ3VlIE5adryHiaK4HWpV
	s5U5wFE2kdlFmW/ZZCSLOm8xi5lvAUgC2+S9mNmtxgVAIyv+5yRiccIFIx8eTfJRE2djj5+rUmgkK
	aA+0UR1ePbxkclxEzJkVpBfUsBM6MyNf5nikVOBFNBEwejAQ+TZbjlcBRhGOG33jRv45oCbTu4niY
	nDyzi+RH04tlHiZWuBy4kP73ZBGjwJVMQAzu6Wj9P1mea74BqpLR5wUMDxxv2Vg1FBrcgO3sJVHmF
	pHH8qbWxHISSaDlBLj93AAc1mUbUJwh4jXNLgchmDsaYbdIGLWkS5CrOhIxOWtRI67fn/eUrmAKMo
	MKNbwtrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CxX-00G6H8-2I;
	Mon, 05 Jun 2023 16:21:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CxT-00G6EC-2P;
	Mon, 05 Jun 2023 16:21:29 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 51F236605840;
	Mon,  5 Jun 2023 17:21:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685982085;
	bh=ATz/rOCQK/30QpZGojesEllhUcbCxgG6yCEU3vGr3XY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AUdKxlsBSpoteFxUFwz5M/rh+iK0lAMHfnQTu9vVSa4MmYwD6UIW5J5kdH0UOcKgV
	 mvA2puSQ0KrQXzt5QqpYefEbBoCXtb7uDrINRj04CEaAhKMbAK4x0APzlEQosIthFO
	 IkPpQg0xlMHsty2D/qCp/RiT2TMETjYZx9Xq0DZvTVvHpSQqV84kGen81Pi12dowNW
	 3aSyP8DCPv+l6yFbb8F3jEjQRw7SxSoKxS8LxvtqBZSf2E5QoLf1mdmh0RkdgQqhSj
	 j7iiRiozlSOjqzgGAaG584JoRxZWKDfvigsFB1RJtxqomAXNWlxf0A03GYRo5I7Asd
	 rhlHlpNqKK3ng==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
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
Subject: [PATCH 1/6] media: dt-bindings: mediatek,vcodec: Allow single clock for mt8183
Date: Mon,  5 Jun 2023 12:20:25 -0400
Message-Id: <20230605162030.274395-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605162030.274395-1-nfraprado@collabora.com>
References: <20230605162030.274395-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_092127_916954_61C0682B 
X-CRM114-Status: UNSURE (   9.08  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8173 and MT8183 have different clocks, and consequently clock-names.
Relax the number of clocks and set clock-names based on compatible.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 .../media/mediatek,vcodec-decoder.yaml        | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
index fad59b486d5d..57d5ca776df0 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -27,18 +27,12 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
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
+    minItems: 1
+    maxItems: 8
 
   assigned-clocks: true
 
@@ -88,6 +82,11 @@ allOf:
       required:
         - mediatek,scp
 
+      properties:
+        clock-names:
+          items:
+            - const: vdec
+
   - if:
       properties:
         compatible:
@@ -99,6 +98,18 @@ allOf:
       required:
         - mediatek,vpu
 
+      properties:
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
2.40.1


