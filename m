Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAD2C48285
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 08:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qE95oGfl7ProVsPiOjQTscdIBUELif1esnax4VQCGIk=; b=DHwvIj81viZv/p99YWXEn9pCBG
	PIkFK4zlkuO8VFjdkxoRxSfZ6bpqP1MSQ2ocrDxYUBnnSefwVGnd6i8L3FNvRJhAzD1jPGyOGJ7ME
	SBSvliDDpbRQFshCkRBCEknGVZUMxpe8ifXFWm6digTZPNkOdqJLlLOZPe5R77JuH1W9bcxIIaKkf
	Y54F6GCWcC6JgtJxWWRmWZJ09zaUugEAa071jAOfh+VwRUfdHQnR+a7E2i8jCnZyYmzmeYms6Aaz+
	rv82dPxUJpzYsGxztlDJ6yGCQpahZvjZMR0AUmrLIHlME8x1r9r2KZtUNONKhldBO93Ue454WAxgO
	T7SC/ksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTeHa-00000007AXU-3Kmh;
	Sat, 27 Jan 2024 08:43:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTeHW-00000007AW5-3L0B;
	Sat, 27 Jan 2024 08:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706344991;
	bh=8dRsLzcjxuiEqHzBiXW/6CBdzTfn9KdLsULhFxOyGP8=;
	h=From:To:Cc:Subject:Date:From;
	b=p0X6hNJ0/FNbHA3OoNK9VWsNQk1wTfyIk7rVN5WxanigwvN3uMMNOy+NbhOFePM+Q
	 f3oG0AhM7w4NI8jCaIJjZKVgeapnd4i2FDK0z+TUH1WpLYmV6bsAnm1h8HgiabB9qB
	 YmUB7LAN/0ZfJWFcX9y4XAeBTue3leCepR5Z2/9frosmd+l1cqEu1r2zOQEPFhdt1r
	 4/Yq2e6rdDMZgG6xxC9XzAEDeHg+4fa/68DtBZkeCPk126eyb6qeIpbhCbQlI1hb/u
	 rMi4WKI61iFLIM0poe6SqENgedUxqXHar+CMB3MuAGXkx0mIcTS+F/6TTVdDkSCG38
	 29WBSqkdpARVw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 21F1D37809D0;
	Sat, 27 Jan 2024 08:43:07 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	bin.liu@mediatek.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	eugen.hristev@collabora.com,
	matthias.bgg@gmail.com
Subject: [PATCH v3 1/2] dt-bindings: media: mediatek-jpeg-encoder: change max iommus count
Date: Sat, 27 Jan 2024 10:42:57 +0200
Message-Id: <20240127084258.68302-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_004319_022655_0A4BD45C 
X-CRM114-Status: UNSURE (   8.63  )
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

MT8186 has 4 iommus in the list, to cope with this situation, adjust
the maxItems to 4 (instead of previous 2).
Add also minItems as 2 to keep compatibility with current devices.

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes in v3:
minItems changed to 2.

Changes in v2:
fixed typo in subject

 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 37800e1908cc..83c020a673d6 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -38,7 +38,8 @@ properties:
     maxItems: 1
 
   iommus:
-    maxItems: 2
+    minItems: 2
+    maxItems: 4
     description: |
       Points to the respective IOMMU block with master port as argument, see
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
-- 
2.34.1


