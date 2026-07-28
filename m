Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15491C54EFC
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 09:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=; b=Q9abmRwOGDu7gBc8HW5DCwEI67
	twrM8OXU3quBh29hXcTb787zqR8eI4NG8mTR/BKetrlYzoLxxVohAM+hH0u6SzFIAG/fmoGEbJl1V
	tz5SDIdRlB3660pAb3t9tGrmaymxj6dDexP74r3vawMwZHw9IYaHDhY0GzaGQc9lXk6mGN5jIxpEe
	LQCLtKlLCCdwHWm0GXS8/sCppkgVrSXqE2U5SrbiywhL7t3EKHmEgApP3EfmxO4L0fcyhRAPTRFuZ
	2fRJAi6Z1oyX8oik9jtdUMrpZ+ekv8YCh6msa0+QPcmqm8DqKfsbuSAeZfIDW431RY8bI46nW4VgK
	adDBgRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxO-00000004n5T-48pm;
	Tue, 28 Jul 2026 09:18:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxH-00000004my5-2Hpl
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 09:18:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cfff5f88dbso17615955ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 02:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230310; x=1785835110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=lDHZ9mSt17rtL366xE3A429dZkHbDVd0Gen9DibDX0T+x2YKlLCfqgHgJH0szVZp9m
         rmdML/urWOAdpXTtwJqI2bF6p99e4Or9bj6XY/IL3G2Im7P18oDoW2ctuaVINluu9tEy
         Q1pNrjK8PUvtjckeAcNVyPX4CIVHWua1FTTHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230310; x=1785835110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=McMi3vORJ9/oPlirz2bNeHhf7dngu3ZMomwiD0rStya+LUG8HK2dNtrOb1a/z2byN6
         /7I1817VcH1ekYTRPSesCJCmpX5EwEvw3OBY5KUBkJwiyxbHG61e627AlpQqnY08kPyA
         /khciAdJhc1GJkI5O0cuPiRFBkOQi1BGrn0Qzw8wOwHgrF+hQzwdGI+D25NWGHss+eEp
         8FGwOFIg3bGuq0tsHRQyDwY1voTOq3bfoTtMocUlMXYQx6+oROaZ/Kyi5NZz2Gg3Z1o5
         qGdPdPp1/YdPQ0PujjrFNQg+jI3PS52rwybbBmNz5AAW1fqugJA/yASLPkffVPFw+F3r
         FEPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrymFUIOtTbF84GGGzbZQPqVEukXGoMQ+O9kcQ4OS3rDsiX2Lp+hhK0N3bxjwjXlWHqARAAzhvHppygs0cP8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVvZzxlD3jTpGPk1kwoH2fdDaDaRCPvTWv55XYglIwQ7LmAu3N
	mBd1J0bGnPFDOQJjRrl+CZEasOnefWO3n8D//TywGrYhbQziYH6cXdREyb5ry0cSiw==
X-Gm-Gg: AR+sD11MgoNAfYPkEwa4zpsLX1VF2a641a/Bx4q2baypANZx7F16gy/Umvo1Ki+Jo4e
	2faBTDm1Hrf2rmq4G6bOADBJEeV6xUR62x59LzFiFyWrtUEGn2OBcxQ+/pjo0gOKfCu5+DN/Nxf
	CtlFISo+bRpLGbz8TaWOXueEwNOKVJ9ce/U+Y1OxKrosbJbAbxzPdBOifnXho5z5n0ar9mRD+p4
	kd5NJAQm+jnbcZeydyTi8vqXpDbYhIhmlPvy+aSs9PZWZTpjqZzXFqnMpUgjBEHyDArorahkKye
	mY3o1JdcMqla8D/v8+owuMf1w/MWnfuBE3sQHNCkVifNjl0vsv4QGQGC3hQLP6C7SiALsHUyVjr
	baQp4kfpyocl471d5rezT/REH7WYo8vqvGoeXSYOGoaux9QIA2URXlkDX/br2cN24job8nFtteF
	N9MdxSarOV/CczWmWapCtZ3NVdtPwqEbSJCstdt3V8wIKB6Nwq+hDSj45S65bT/WKDeMZZS8a+X
	jRf1qHbywnqEhCV7wXz9lH820N+NLNzYl85BtB94dGDjw==
X-Received: by 2002:a17:903:124a:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d015ace749mr18293065ad.7.1785230310643;
        Tue, 28 Jul 2026 02:18:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Tue, 28 Jul 2026 17:18:01 +0800
Message-ID: <20260728091804.382753-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_021831_602680_B1DE61AC 
X-CRM114-Status: UNSURE (   9.15  )
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
of the Series6XT GPUs, another sub-family of the Rogue family.

This was part of the very first few versions of the PowerVR submission,
but was later dropped.

[1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a6bccb600a57..e9218e0f363d 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt8173-gpu
               - renesas,r8a7796-gpu
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
-- 
2.55.0.229.g6434b31f56-goog


