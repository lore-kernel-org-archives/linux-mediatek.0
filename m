Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D079FC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 11:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Bwu/KiE7IZ+EVdW3WwpCDfjQ3GV/AFOUh+OhmN90dQ=; b=ADyArEvk3L8tudu2RjeCQb1E58
	tDrBTuMG5rpVGxglZblE1ZRevTrbASLTDstTiWVhR7sDFfBFfP+PkHZyjBTjXgKQhe+fXf41+ekcm
	VRvl+IRKgoZodeI17TIvDK6OZiDdZ8dDSompbH6dlyAjiYcBNI+60C0kEqqDyTbB6oho5WhGcvU/1
	DGg12D2Gg7M/Qmz00AnHkJxyeDVCbF9FgD63ouYxLYpCFeBSc5Js18qmeqDRfqYqatcHZaDoQYUxE
	/ZxMJZekuq7tMr888BqLg7F64QzZy4oTbFkxXKYIvpnuEOMaq9JZ0mvEn9ID7B3FWoa+ge/GLnc57
	wkzPsRlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIodd-00Gg1G-1D;
	Thu, 28 Dec 2023 11:33:21 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIodI-00GfoL-0n;
	Thu, 28 Dec 2023 11:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703763177;
	bh=8UVn3bqlJ8hPorONnus5laiB1PvUXo1CSznLEpz4ZA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=raq68Je83mcITqxOybvgxYCVSoMJ7WIAJhff4NUTXg3gLq+PK4x3U04LS7YWb8l7M
	 GE6AGzmPGodTx0+56r0TXCRU+nuG8wltyQBNPD+wFICW5D9W70vgvbyKdQDbtLTmO7
	 V4BQpop7tAN2vu0PQYRUCyEDJ4+kui4HCUY8NTBVUhRFt82Y9NSVUKrRKdwWUkFg0B
	 j5kylonE6ATE9Mf8WFz54m53MvP052WSh71vQIpBBliUuNn9kZiPsT6Q/A9YQRLr62
	 Tnh53chX3c+tX+WEEszAlmx9tGbiLsdx3tSsLQpkYD99BWrdc3gYnj6PtK26xqPEvW
	 pxgF+QbUFlHVw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CE75237813C4;
	Thu, 28 Dec 2023 11:32:56 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org
Cc: eugen.hristev@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	kernel@collabora.com,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/6] dt-bindings: media: mtk-vcodec-encoder: fix non-vp8 clock name
Date: Thu, 28 Dec 2023 13:32:41 +0200
Message-Id: <20231228113245.174706-3-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231228113245.174706-1-eugen.hristev@collabora.com>
References: <20231228113245.174706-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_033300_505916_7D8B9100 
X-CRM114-Status: GOOD (  10.76  )
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

Looking at the binding it makes sense that the `-vp8` compatible has
the `venc_lt_sel` while the other bindings have the `venc_sel` as name for
the clock.
This was also mentioned in the txt version of the binding before the
conversion:
 `
 clock-names: avc encoder must contain "venc_sel", vp8 encoder must
 contain "venc_lt_sel", decoder must contain "vcodecpll", "univpll_d2",
 `

So it is easier to check for compatible that includes vp8, since that's
just one, to have the requirement for the clock name property as
`venc_lt_sel`, rather than for all the others, some of which are missing,
thus for them, the requirement is wrongly `venc_lt_sel`.

Reordered the if/then/else to match `-vp8` and have all the rest of
the compatibles using the other clock name (`venc_sel`).

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
- collect R-B
Changes in v2:
- new patch.
 .../bindings/media/mediatek,vcodec-encoder.yaml       | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index a2051b31fa29..849721c0571a 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -109,10 +109,7 @@ allOf:
       properties:
         compatible:
           enum:
-            - mediatek,mt8173-vcodec-enc
-            - mediatek,mt8188-vcodec-enc
-            - mediatek,mt8192-vcodec-enc
-            - mediatek,mt8195-vcodec-enc
+            - mediatek,mt8173-vcodec-enc-vp8
 
     then:
       properties:
@@ -122,8 +119,8 @@ allOf:
             maxItems: 1
         clock-names:
           items:
-            - const: venc_sel
-    else:  # for vp8 hw encoder
+            - const: venc_lt_sel
+    else:
       properties:
         clock:
           items:
@@ -131,7 +128,7 @@ allOf:
             maxItems: 1
         clock-names:
           items:
-            - const: venc_lt_sel
+            - const: venc_sel
 
 additionalProperties: false
 
-- 
2.34.1


