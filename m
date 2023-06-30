Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33918EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 15:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Y4U++2pVLqn5Q1HGH3hQGm5jB6WQHaJ6Bl6H3IcCQQ=; b=IIFXdpFrlJlFH2KamPL2Vplrnk
	oXwacA2m8BG3fnM4r+DK/rTKwIZxtIKhowgwa+tfC4nl4DYkRGzmMkh+1sKfs1sGOVFeW8P4JnPUQ
	nfmP2tHyZHsshG3P3B3AMECcT6ns3jbrdV4yJ2y9ayjE+h6qUaLzms7KCW7MQgL2X7l85Cfxs3Jcl
	j/pK28JKKwFmw0ywnoI790ztetLaQ2yhDdtTH/XI1vjlsdbAr7xS4QFe71KVLktqtntnAquON6/uI
	kw8Jf3kgzOG5dlOqOFP8azMVr4O2mihvUF+wDGLUVe/qEHNkU6sxaTxqZBdnRDlKXeyJOAT/qlUT6
	IYEj51tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFFpw-003uz4-0i;
	Fri, 30 Jun 2023 15:15:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFFpj-003utW-2M;
	Fri, 30 Jun 2023 15:14:53 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1B9F6606E97;
	Fri, 30 Jun 2023 16:14:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688138090;
	bh=Ud2ruCQMrs0y4/oeVi64N6XaZrL6MD3Lu7ndY/b2YiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oV4l9VwNnlA+6P7wTMtXqsaQI6E6s2cCRXZXQO2tf10jEFXNyMUcdWWQjIqnvusRC
	 Psi77XExouK9jQoH9LCginjP/8rdO8CSiF0e6wxltsNXXbrMEjckKO8wxQQujZ069w
	 v23BibgGDwPQm2AMpieYhupSFyT3Iy322lfvI1dDJXag2NjcjU4Vdklzi+FQo+BjzY
	 tOiT236bdjmzoW2OwxSz1N59WO2M5mHlqjwDWwXDHGBw8r1BfOz4uOsCT3CRHpl7bi
	 Wff51jS2bRnkHbBuYLY6Yfd8utEGF6iXHFRjNjAjYx/bLAOLthWr70K6AIv1yOsXVw
	 XaHbiDForOolA==
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
Subject: [PATCH v5 1/7] media: dt-bindings: mediatek,vcodec: Allow single clock for mt8183
Date: Fri, 30 Jun 2023 11:14:07 -0400
Message-ID: <20230630151436.155586-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630151436.155586-1-nfraprado@collabora.com>
References: <20230630151436.155586-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_081451_895992_05DFF778 
X-CRM114-Status: GOOD (  10.52  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

(no changes since v3)

Changes in v3:
- Reintroduced this commit from v1 since the active clock is no longer
  used.
- Further constrained clocks as suggested in v1.

 .../media/mediatek,vcodec-decoder.yaml        | 37 ++++++++++++++-----
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
index fad59b486d5d..1506d2693f7d 100644
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
 
@@ -88,6 +82,15 @@ allOf:
       required:
         - mediatek,scp
 
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 1
+
+        clock-names:
+          items:
+            - const: vdec
+
   - if:
       properties:
         compatible:
@@ -99,6 +102,22 @@ allOf:
       required:
         - mediatek,vpu
 
+      properties:
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


