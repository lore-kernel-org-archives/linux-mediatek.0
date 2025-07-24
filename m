Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF48C87FD4
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dO2rc/2LtRYsBMmWavtb04O2DZdhIr+62uA6x/Dqxo0=; b=ddQMMHyjWRPGPo
	UubRrYASybRaBRxwATs4C2QrnmbRnzzabZ9oJG/HGWOyJSqDFXkMOSCqLks29so3kaGjtwrfde1Wi
	FKpqXx/m9KuCJiNtN2KBpML35OSFb0xXs7+OWqrdiGCnntVxXwsKq2t9+dEe42Fieud4VyLe4rbQW
	RHAeQBJfdzqzBTGAS0ArqILb8Pd3pmmiDcNi3a/IDCvesS04z5dCf5RXB7cs2UIBQVeTVrUPTnvqb
	EsWgef6yX0APCh6nf9tssCBWyZr7VFAFJBA71Ry0XIFjQx6EmqmXykhxn+2impVyx5UnaqMhuutcm
	ZXVeME1x/NHJna/wzIsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesYi-000000076JZ-1yuf;
	Thu, 24 Jul 2025 09:48:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerUK-00000006tH7-0AXI;
	Thu, 24 Jul 2025 08:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346378;
	bh=6CgbYs3SG2IR6WIZz01cZuVTz2VzyFQJdQsRvlhNBo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CmSfABGEc8SQw0UJmpA97+uocr/ZovezaTEshYPAzq55rdKnILTp02leZFhic30z3
	 cEZMbLP47944DCFUF6i5hI3ulQ6p3hP2CXBQqtSTH9WyfHjaJqfQdgD/1jkxOg4K0y
	 ivNDqW4PrzDlDnVh8RbG5CTNHbf4S1e52ykLUeMwhQk5ZG10tmXT/kF2Xl3VAOT8Sb
	 5Qwy5Hpw0T0eJoipf68Fm84rCeWcLNGbJnDUQ8l4IvK+FV5zvw33JDLSCUwhXyDDaY
	 0i6lz2f2l63t0ZHd17QgS9tyn8gI/yEUCZ2dvE2gcvA23e0D1LLQ4MsqMnSe2PxrWh
	 xziwGKfC63Lyg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4679617E129E;
	Thu, 24 Jul 2025 10:39:36 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 05/38] dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs
Date: Thu, 24 Jul 2025 10:38:41 +0200
Message-ID: <20250724083914.61351-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_013940_235714_64F9786D 
X-CRM114-Status: UNSURE (   8.75  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Not all IP implementations of EIP97 and EIP197 have the EIP and
MEM interrupts hooked up to the SoC, and those are not required
for functionality as status for both can be polled (and anyway
there's even no real need to poll, but that's another story).

As an example of this, the MediaTek MT7968A and MT7986B SoCs do
not have those two interrupts hooked up to their irq controlller.

For this reason, make the EIP and MEM interrupt optional.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/crypto/inside-secure,safexcel.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
index 343e2d04c797..22025b23d580 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
@@ -26,9 +26,11 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 4
     maxItems: 6
 
   interrupt-names:
+    minItems: 4
     items:
       - const: ring0
       - const: ring1
-- 
2.50.1


