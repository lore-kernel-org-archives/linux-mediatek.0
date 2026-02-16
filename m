Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49C5E81A3C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Feb 2026 16:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srYlY+UBKbck4YZkSnxZ2WyELTpV/5G0eCzsk4tYfvE=; b=pWVhNBnizaKZ7XNUJ6Q83cnAp3
	n8TRXTQZRjIcvy53VmtiZ1RaywqcLgxcQ9zVFJfg8G6AKno8HXp+suFqgRbc+YcNZ4WslWDapcVS2
	fHIiH9iJVS0Ss3D+hnrR580S44Y/SLOx9iFk6nipjvz0CgklISYDGMx5WVgEkl9JATq2g3hD8NLUF
	DebFsJ6a7kV1mPULBzUST4mvXFN8NiaKfQWNzVOzxFvfK6N2vGfvLNMkEdyULuBMYPZRcp77AEivw
	mRTeulXyJ4V7fFHnLQq/KELV+CYsVxgGwgygQhdAygIsfOZDRifl3nxfJmiA3QRMYELa71BM+jJzb
	isDFHJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1PF-000000070zT-2185;
	Mon, 16 Feb 2026 16:25:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1P8-000000070pr-3by4
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Feb 2026 16:25:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4362c635319so3372327f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Feb 2026 08:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771259097; x=1771863897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srYlY+UBKbck4YZkSnxZ2WyELTpV/5G0eCzsk4tYfvE=;
        b=PFhOl1bC27zrQijEmHGwqd7iUP+nQv9LWYkKCDJXoF/e+QQLZqDKyojPlz2WItZ2ph
         S3rN7TjpDGL5hPVN3Mx60aRdq8CwVIraSR4adAWjcg4I+ud68HsgUnuTFBh0bji7Get7
         8NrKfcnB/itCA+tv+9tyrrJKASkEhwSSw3XE60i/tA8O68z5v2Dbd/noGEp4wtRoS32K
         OtT6hmtCMKs3dH6bvACTHBh3ZBUoIUaGSjFzXRMEbGG5Tw4fm5jjv/FQaOSqMcpL5Jul
         JszF2Tvq1fSLtzhpEV/BOANFC8z0QZEkeLYfuvlbOmRXqR5Ogct61vMgO+DrWrkl+jhZ
         q1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259097; x=1771863897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=srYlY+UBKbck4YZkSnxZ2WyELTpV/5G0eCzsk4tYfvE=;
        b=XZF8/YXy+8RGyjPaI714ruV3wGWr0GhKl/8r2sdT0bGwen5T/kttLnEMuqR4dx4N1T
         kE2D5SL6Ccw0Ys5W7evI2KLh5ic1+ZRFtyal9QieCMsjDzROBFUHaVBvdYsgZv7fIUrF
         qc7oCWQPK1V/1wlHtvJDWy3IuQbiraBRY+EsLp6gQiI8XnL4OWgsCbKKeyVg41NWKhIT
         26NivVaB/gBrffR5QEt1hpOOLPzn+Qz8X5RnyuDdkZQPCEVgVSBlu9rGOVTt/yl2y1eO
         aj726OhIzz9v/xY7QZFKjIAp6AlF5psTKhc64UEQHtchsHF3lk15RczeYdXT100Mi9pb
         nyNA==
X-Gm-Message-State: AOJu0Yy6jSqGUERnXTo6Bv14bDli+w0UTF06r6XsstyfuH2eWPXyzKGB
	quwEEZpKKKQYuF39hzY8VWaOIgTzzaM75JQlz3R1W3VqDojut2v26YyrI44zow==
X-Gm-Gg: AZuq6aKa7VD4gRfsj1SkN5OYU0Uz1DM/lD9/UuJKe6IqOFr0J5RnTPynCUwXqo+xkN2
	VaUVvPMO5QGYgYRAIOGkFbU1cgTb+1n3p6XJEDKFZXakavCxJCrTyRjuq4qBNh4jUOaguIjZePs
	cf82ZjACWamaSwSyN3qaWFqzBifU16dUrEt9AyCR+e3kQq5M4YZyolrpiRY2KYL4HqDsxajb0jx
	L3idQVvjsQ+xhMXpJUeh8OwsmwQVbxnd52sdx0vhmjWPwtHfHydzpqsEWB5BalkfeMwnTQHxENu
	HrftjmAqBHCiN3blefQ/rGt89OCJgzxnvpMtsdZP3SjtY/fSE9QLbkYstuRVaLJdOKMtwc3AIDa
	gHVAky88wqLYytZk8cRcAgQycUbbJd3uegCbiSSlZ9HMADRPCwi2IdcNmhqwxGUVan5PNmuf/BG
	p0NWnkfzECOZtzjgeUzUaEHXywzuMYpA==
X-Received: by 2002:a05:6000:4014:b0:436:3563:499c with SMTP id ffacd0b85a97d-437978c75d4mr14802043f8f.8.1771259096696;
        Mon, 16 Feb 2026 08:24:56 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a6desm28775962f8f.10.2026.02.16.08.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:24:56 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct compatibility for mt8167-dsi
Date: Mon, 16 Feb 2026 16:22:14 +0000
Message-ID: <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771258407.git.l.scorcia@gmail.com>
References: <cover.1771258407.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_082458_968217_8AB8FAB9 
X-CRM114-Status: GOOD (  12.40  )
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

Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
describe it as compatible with mt2701 instead. It is safe to do so because:

- Bootloader doesn't rely on this single compatible; and
- There was never any upstreamed devicetree using this single compatible; and
- The MT8167 DSI Controller is fully compatible with the one found in MT2701.

Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 27ffbccc2a08..bcbde16648c0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -25,11 +25,14 @@ properties:
       - enum:
           - mediatek,mt2701-dsi
           - mediatek,mt7623-dsi
-          - mediatek,mt8167-dsi
           - mediatek,mt8173-dsi
           - mediatek,mt8183-dsi
           - mediatek,mt8186-dsi
           - mediatek,mt8188-dsi
+      - items:
+          - enum:
+              - mediatek,mt8167-dsi
+          - const: mediatek,mt2701-dsi
       - items:
           - enum:
               - mediatek,mt6795-dsi
-- 
2.43.0


