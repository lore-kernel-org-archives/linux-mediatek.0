Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96384C6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zV39akSKgTXnbIsuHdwXtYxXMFzl6o5v6caNUB0if4=; b=W/mYfkHctsAN5UVwJCjew2/bhk
	t0izGsDI3qEubcilfGXoqb8T5ypRxfr4fS2FKRa8vi1iPuq8MiKG4H5zlt9a0wjBe2DWGK6SLlKhx
	lPZVyripLtGHtOOXHKz/U6ZSdgMc+J+p/B3Spuk3NPIwFeXR3PNN/3bDpbxayzil28D48WSUTaMxd
	7RVGxao56riYV9d7sHq3ZIF98bUIAYy9dYvY9pnbcDkeBuZ3XooxyoLurNL2ct79PhxiryN6q5arE
	UVdMB/8Q1BMQykKipn28L9g79xfukWOwMNT0TBmI/vo/qIUFMZFKejhrNgaK7VbcEMeLqQebK5ChX
	VZrVHWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckjE-00G0wA-0B;
	Thu, 16 Mar 2023 10:21:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pckj3-00G0o7-2x;
	Thu, 16 Mar 2023 10:20:51 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 28F90660309E;
	Thu, 16 Mar 2023 10:20:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678962046;
	bh=t6e55TKXpWDXs7rKf1rewUoc056XoaKTiofz8DN9RjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RynW8u0Dr4ZczODzCd2SqpQk6l0qle1QQQKYJReaYbbgC/NiBVgsx8YY/z1d86idK
	 f4IQC1dpbvJM61+JNY8IKP3oQ3PpwHoBs7UUqYHCj6Hf+mpHt16S/pCwrxDVGXPCQb
	 2CpXPfrQWFani4dmmdV1QUymIn8bWPeUP6lXbkml5nQ+M2RQaejKmWT8827i8yhght
	 mM5Rc3MYdRtOp7i5UkB5BO7y3t40z1vH9I7tV5N3MeYSICkOyFEoBOcu1ZgiYofuTo
	 0K53H3tkpCB5WHdMIl6yQ8txBdOSaapyxAbhB24sRX3Q9svQ2dhqp7TneaTHHTbDLC
	 oCABAxTCASlUQ==
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
Subject: [PATCH v5 01/12] dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains variation
Date: Thu, 16 Mar 2023 11:20:30 +0100
Message-Id: <20230316102041.210269-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
References: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_032050_109155_9A2C5E9D 
X-CRM114-Status: UNSURE (   9.95  )
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

In preparation for adding new bindings for new MediaTek SoCs, split out
the power-domains variation from the `else` in the current
mediatek,mt8183-mali conditional.

The sram-supply part is left in place to be disallowed for anything
that is not compatible with "mediatek,mt8183-mali" as this regulator
is MediaTek-specific and it is, and will ever be, used only for this
specific string due to the addition of the mediatek-regulator-coupler
driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 78964c140b46..7e110751353e 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -109,6 +109,9 @@ allOf:
           contains:
             const: amlogic,meson-g12a-mali
     then:
+      properties:
+        power-domains:
+          maxItems: 1
       required:
         - resets
   - if:
@@ -131,6 +134,8 @@ allOf:
             - const: gpu
             - const: bus
             - const: bus_ace
+        power-domains:
+          maxItems: 1
         resets:
           minItems: 3
         reset-names:
@@ -164,8 +169,6 @@ allOf:
         - power-domain-names
     else:
       properties:
-        power-domains:
-          maxItems: 1
         sram-supply: false
   - if:
       properties:
@@ -180,6 +183,8 @@ allOf:
           items:
             - const: gpu
             - const: bus
+        power-domains:
+          maxItems: 1
       required:
         - clock-names
 
-- 
2.39.2


