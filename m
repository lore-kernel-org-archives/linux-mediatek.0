Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15441C87FCF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6G6M5yfJJh3tqzro8aR2ikupItCKnxTgSwaxs8QY1A=; b=vMymz4ZiZ3T79m
	LGPgIq+UTDFrX/PbbbXwv7+SkaQCpWu7Dph+uP09gXtDs42iPgfFtCGM2Kk7B6iyQOKu9R0jtJLD6
	uWKrW/pwcJnIJhZ6yNOe5x/YW84ZQOkU50v/y3BMUyMCtInkhrT8AhI2TAPJYk9+UW1/6uFhSFJ7n
	GASSu4vXXrg/Fz7gQ6EhJIslrREm64l05eq84zwmpkgcgT9wCKWmdhinZjOjijQxHBhRuPHbFONiE
	Bp8zBoRytReF6iTJdLn05MLziVqGKm98sGt2/0Q4mgtAhtRsnKDbwlzqiunkTpFgKMRbx2F1Pbzcy
	0XCCkqX1VvRAR2JqCR/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesYo-000000076V8-40Pp;
	Thu, 24 Jul 2025 09:48:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerUh-00000006tbY-3sys;
	Thu, 24 Jul 2025 08:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346402;
	bh=esBSalMVnvl0Uf4eNeIJU2nxBczdBlqdpwKmxJ5zN5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B1EOpJ3Eqbl29y8r6oaLBY7j7IrxKo1uw6DqBtdSpcprT97dX94NoRrGNqs799uv/
	 OlimjamnTTT+8gY2wRdNRZ61pzdyEc5ZsC2/h8sOsefn52CyCAh8Okvd13e/RohBSU
	 /U2dzL1B9O13FUb74tiGJVyrJROoMLC692X8aHLNG7iTD+/VkyxFHkhP2HO1qZcOoC
	 svwb0ewQQTNn88/QLa3MxNv8j5v3URZ0oAYlOcBu9R8It5pyByyOjo2LH9yR+TwLTE
	 kT5ZYUhHvKJ/dyMfr/OYikieVSmpbRoFefLoFGl2vCmQaABALWN8dIXuVPOam2bd9T
	 Ytcqr2afnyM+g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C67E17E11EE;
	Thu, 24 Jul 2025 10:40:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 14/38] dt-bindings: media: mediatek,mt8195-jpeg: Allow range number in node address
Date: Thu, 24 Jul 2025 10:38:50 +0200
Message-ID: <20250724083914.61351-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014004_132426_68AE5599 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The dual and triple core jpeg encoder and decoder (respectively)
on MT8195 are far apart: the only way to have this to make sense
is to split those in multiple address ranges in device trees as
one big range would overlap with other IP in at least the MT8195
SoC.

Change both the jpegdec and jpegenc bindings to allow specifying
children nodes such as "jpegdec@0,10000", "jpegdec@1,0" or for
encoder "jpegenc@0,0", "jpegenc@1,0" to resolve dtbs_check issues.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml      | 2 +-
 .../devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
index e5448c60e3eb..935f124a9c05 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -36,7 +36,7 @@ properties:
 
 # Required child node:
 patternProperties:
-  "^jpgdec@[0-9a-f]+$":
+  "^jpgdec@([0-9],)?[0-9a-f]+$":
     type: object
     description:
       The jpeg decoder hardware device node which should be added as subnodes to
diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
index 596186497b68..d7a8f2e3bc1a 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -36,7 +36,7 @@ properties:
 
 # Required child node:
 patternProperties:
-  "^jpgenc@[0-9a-f]+$":
+  "^jpgenc@([0-9],)?[0-9a-f]+$":
     type: object
     description:
       The jpeg encoder hardware device node which should be added as subnodes to
-- 
2.50.1


