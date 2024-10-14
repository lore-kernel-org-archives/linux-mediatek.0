Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E062CFC503
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 08:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+ghuzRySs3Rlk+pvyNj+Nml0+xvv3jeX5LPqOUlAOo=; b=qySipXPKFN12ul0ghT17XACEO5
	Dv2okhW92e/2gWFD23MPVQ/kZtuenNhdxpfLsNfiFTigGUwtBuZIoCcd2XKq4aT3rvwnaOXQwjrmB
	j+H9olGCeUnT3QyxTENVyVV2tNBdipcmtPcZHTlKQR+Kk8grGWC6GautGF0kVbjtHlYK2HxFf0EaN
	keodm7GIwoby7TE5cPb4ItSOuPWVa200edgSWMFJvlxS0dtlEzTngLENcLk+R0klKx1vSMvSdOFnz
	lxdjoAOlsu+iS4ldwe1AwcnYEhW8haC9ojv+T5vSeJBoSlfGuf9bJfYeGpSCUVbJX+dsjzF/4dYqv
	RozAI/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GrZ-00000004Nts-3let;
	Mon, 14 Oct 2024 08:55:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Gnz-00000004MS1-1kzp;
	Mon, 14 Oct 2024 08:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728895913;
	bh=Cq3dZsX1iPH2sUqY98fTwu1oiCm4WlLKa+tNu4ZQhh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qUQQ6ZBDl7dXYCL1LCklwm2eJYb5hK/CphXwxtvitwg0EZbOp4TBDd+0ag0krkc+G
	 JFEacNAfsxwbOJf2IssQ613a1RRZ1FV8qsJu4yk2sbcw7VSoaZecHtcby/84bpxAiv
	 tjk7ochIIhHlSXTIpaNv1GDuxuxDmZ4KYwAcZafY3xFRvtCK7T7bpzuVhsjM+XPk6T
	 FEQihqTw1uTU45itNEUg3cf8RSkikqGZzW6FQHzJyQFxYPytQO0SysR3xPXEpuBRVf
	 BqQxeI1SrZBv0FeFPqNWWSyV8c5XxmD/i4EarSuenkwfpIG5topRap/5fmqpDurbkO
	 jHJntU+vaNdag==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D9AAD17E11FA;
	Mon, 14 Oct 2024 10:51:52 +0200 (CEST)
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
	kernel@collabora.com,
	sui.jingfeng@linux.dev,
	michael@walle.cc,
	sjoerd@collabora.com,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v12 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path
Date: Mon, 14 Oct 2024 10:51:47 +0200
Message-ID: <20241014085148.71105-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241014085148.71105-1-angelogioacchino.delregno@collabora.com>
References: <20241014085148.71105-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_015155_743360_7A25A4A1 
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

Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
per HW instance (so potentially up to six displays for multi-vdo SoCs).

The MMSYS or VDOSYS is always the first component in the DDP pipeline,
so it only supports an output port with multiple endpoints - where each
endpoint defines the starting point for one of the (currently three)
possible hardware paths.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: Michael Walle <mwalle@kernel.org> # on kontron-sbc-i1200
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index b3c6888c1457..3f4262e93c78 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -93,6 +93,34 @@ properties:
   '#reset-cells':
     const: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port node. This port connects the MMSYS/VDOSYS output to
+      the first component of one display pipeline, for example one of
+      the available OVL or RDMA blocks.
+      Some MediaTek SoCs support multiple display outputs per MMSYS.
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
+    anyOf:
+      - required:
+          - endpoint@0
+      - required:
+          - endpoint@1
+      - required:
+          - endpoint@2
+
 required:
   - compatible
   - reg
-- 
2.46.1


