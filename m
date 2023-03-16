Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AC4C6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9kJVsxcim4PLtHe23b8aBLEQQUlMpe/iSUKuiqOVtA=; b=0BIZayLRY9B8qECRtaXKdo4Dwt
	Yhc2HZwHi4G6QoQlDwWq/X27fqRgCjF3T+P2WgpIAdADtrj7AHOS0i5EPwisS0zu2l1iGDtpAMH9y
	Bm2OoZjTOANGNg0iabyg2qDSdNNF2AytcmQS3bdpkyPZybGT84bFstwdiOIrsv1UFdGfe4Ex3gATW
	dxIJIOXrlrJ9zcuUGlMAv7TYIb6JRxRAyhtf0LbCYHAbC/Ymxglx5c2g4a4KRh6tbl+1IhU4f5C4h
	BUQ6OgGsryCkyAT1/K9NXtyCrfRaSHE54eR+72xXBFrW55l8xCdnEyKgZRIXEYX2FwryatN5jLzUd
	rlf8kTGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckjK-00G103-33;
	Thu, 16 Mar 2023 10:21:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pckj3-00G0oH-2x;
	Thu, 16 Mar 2023 10:20:51 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E845C66030A0;
	Thu, 16 Mar 2023 10:20:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678962048;
	bh=vym02gfUeFtMkZA43yUlFdqpHJiV8QIzeChJfzjI5R4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kpuX2RQEQblFvVlA7uJOEnSjVUFXexzWEE/YHcNPmudmm7wBcVbhDyeCcz0HytihH
	 QYyQvyV1KUPfBuFYVRXjYBWitRc1/PDQVEoJ3NwwBdlagUZLljRznoSR9VBltb115K
	 sSIb8uAvevtYftC68I6ie/HvBHpjGLp3GDzeN7VwZC6QKZwBs4Tt7akIlqvaMdGgYg
	 9wUqlcy4JrZGu5PCvcsn45YWj80jUHqUoSXEnH5CVmUYUyB+TJ0mXOdlNvGbaRPTqq
	 i442BMbVucu3fEyfzp45+wMpBVdKbUA54NgVaZfU3/d60oaM7ykeJnezgsvJAa97lk
	 5ZmtnXLNoHEhA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 03/12] dt-bindings: gpu: mali-bifrost: Fix power-domain-names validation
Date: Thu, 16 Mar 2023 11:20:32 +0100
Message-Id: <20230316102041.210269-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
References: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_032050_110141_F282C1E7 
X-CRM114-Status: UNSURE (   7.48  )
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

Commit ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
incorrectly introduced power domain names for MT8183, causing
validation issues.

Add power-domain-names to the base schema, allowing a maximum of
five elements; since platforms having a single power domain don't
need any actual domain name, disallow that for each sub-schema.

Fixes: a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 5b7f1c9d2b30..7c61524aae26 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -65,6 +65,10 @@ properties:
     minItems: 1
     maxItems: 5
 
+  power-domain-names:
+    minItems: 2
+    maxItems: 5
+
   resets:
     minItems: 1
     maxItems: 3
@@ -112,6 +116,7 @@ allOf:
       properties:
         power-domains:
           maxItems: 1
+        power-domain-names: false
       required:
         - resets
   - if:
@@ -136,6 +141,7 @@ allOf:
             - const: bus_ace
         power-domains:
           maxItems: 1
+        power-domain-names: false
         resets:
           minItems: 3
         reset-names:
@@ -186,6 +192,7 @@ allOf:
             - const: bus
         power-domains:
           maxItems: 1
+        power-domain-names: false
       required:
         - clock-names
 
-- 
2.39.2


