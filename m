Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B39AC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 11:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grRf+KoemhP4X0pqwMsBxmyOYUueeNQcK7F6cxmuwiw=; b=mbi4+5htI1zzN3khEDJAKmM3E0
	5PvC9LGakWiaSoptM7r1UuEbDKjbyM2GhMZR8pefO+tU5R4hCdpFo0Qbyyq/VVsRfGi+ZGQeqyHFR
	7Ht9YDd5dyeDKebaKsin1mKEu3viZm5EfKSKkOJtXylAj0iVsbQxgAufUDHjsv2QnBqdUGg0Z4afo
	t0dAUAzExm86Gc5ybWNl4MkoUUqVBzGpb/Y9UWgZ9ShvCUK9EHBN4LV6OtpDfXjEGr4b4t0Ei7aE+
	CBoUe2leIdluXZz8LlsFY0+Da5rmzgIEABYhWcN6uU7O4Y7UPjcmQMG0w1UfVpbLycnQcSV/hLu4M
	w6KM2CqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2V3K-0000000CZUY-07bH;
	Thu, 02 May 2024 11:56:42 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2V3E-0000000CZQb-1wHS;
	Thu, 02 May 2024 11:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714650995;
	bh=3XmqRbJJ+6Xm4vCkKTXcFr+ki230AzYei44k0LgLG5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N0Z8OZIck6+4ADleMnXW2At4y7Y90h5hz/oh8kjLP9uVW/1MNZCM8x7JfRrxvYEcu
	 3rar8vu6/BQslRhR7U5RIzSr1OI2sT6zwtuSzPD2TibOEk1CeeP6QLQvPuXforw2L2
	 WHJSgkfCRNz7DACLRtYDTX3QR5weW7UfcEu8hngaX0HOpjGz+1hy6WLDBLi2W/P7Kt
	 TuMANBnMyxlE92LGT4KisLi1iMaqbvXf4ox4xWHM+NoxF6h1h39QslBgL9TjdN0PlG
	 8irY6FrtG7H4/kzZx8BQ8ZXOwCDkUnyvrn2ikow8YWzr2l7gZLpbl1ObQAx8MnVIa3
	 urenvoWD5uyBA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D0C233782108;
	Thu,  2 May 2024 11:56:33 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	shawn.sung@mediatek.com,
	yu-chang.lee@mediatek.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH v3 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path
Date: Thu,  2 May 2024 13:56:21 +0200
Message-ID: <20240502115622.248456-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240502115622.248456-1-angelogioacchino.delregno@collabora.com>
References: <20240502115622.248456-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_045636_655046_12377943 
X-CRM114-Status: GOOD (  10.83  )
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

Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
per HW instance (so potentially up to six displays for multi-vdo SoCs).

The MMSYS or VDOSYS is always the first component in the DDP pipeline,
so it only supports an output port with multiple endpoints - where each
endpoint defines the starting point for one of the (currently three)
possible hardware paths.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index b3c6888c1457..4e9acd966aa5 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -93,6 +93,29 @@ properties:
   '#reset-cells':
     const: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port node. This port connects the MMSYS/VDOSYS output to
+      the first component of one display pipeline, for example one of
+      the available OVL or RDMA blocks.
+      Some MediaTek SoCs support up to three display outputs per MMSYS.
+    properties:
+      endpoint@0:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the primary display pipeline
+
+      endpoint@1:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the secondary display pipeline
+
+      endpoint@2:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the tertiary display pipeline
+
+    required:
+      - endpoint@0
+
 required:
   - compatible
   - reg
-- 
2.45.0


