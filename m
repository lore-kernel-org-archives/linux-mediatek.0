Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C13C87FD6
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQe3gVpB7ORvRfs0E3QkqPTBzjHLUJIaoBZr2CGHMIA=; b=iQVl1iQze5sGRE
	Uh2C8CzP70xWvWbPXAwMmOR/yLA5s6dhqPFVUOpmCKZghPVeXj3VloeFlATtFvIjYUtdMGTlFPBth
	FNk6llxRkaHGh8hzuL7Zsy8sQCICNcXlDUwTyvAtnqnGbfqpntLdEk6aWSGkF3C/3NGtVzrdqWwL5
	H8eGc1TqPUB4bsyki1sORlZtuoiGaZwnjRxXs4j6hgJnZroDUF1tsQCplqq7Ntap48occKp4hHMLG
	eLULk1RuFlHyFtqHWBtB1Qloa4U/WOs0RKv+4u/b3WnmBfmUuusj9gzIWeusRE1FuUutj9uO7Wb+7
	REld7WlTQ8I45Oqx+CWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesYk-000000076NC-2E0Q;
	Thu, 24 Jul 2025 09:48:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerUS-00000006tOF-163S;
	Thu, 24 Jul 2025 08:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346386;
	bh=jjLUE5HdPRZzn/E9l0Gx0a05LnILHnJ7+pTe/jrPRJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FQufsu6051wTm6fdYu0USqifJaXEeaojrxuyjpx9ESnaHdZ9dxjUDJ5fDPs7dra8H
	 Q11J84GLCUpHk1LR3Qi/ctJTsqKIVmH3Msnra34UCBMopNVkuTov9XlwhddeRiJm5U
	 eC7Wgag89tzveIoL+kUo1GL8URd+uIhC4UhMBcPMlRWMiZgy67lMgXzahxQfNCTA6T
	 hNBd2UIP6iF6/UuFMpD5th209wioY40Ly6guT99csiRQ0kv2Cl5Al81FBD2Ea9apy/
	 b7p0+hNCKpQSGxA7BQTbTIEqxTeYki6DJKYitFgbTZpTZhzK2rP13nVKw3Rnmuxrm3
	 l4VibTq/R4Big==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 399A317E0FC2;
	Thu, 24 Jul 2025 10:39:44 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 08/38] dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing base reg
Date: Thu, 24 Jul 2025 10:38:44 +0200
Message-ID: <20250724083914.61351-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_013948_481023_9A6FAA0A 
X-CRM114-Status: UNSURE (   8.18  )
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

The pin controller for both MT7622 and MT7629 need both a "base"
and an "eint" MMIO like the ones found on other MediaTek SoCs:
while devicetrees have always been correct, the binding is not,
as it only allows an "eint" reg.

Add "base" to reg-names and increment maxItems for reg to two.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 57b19031925d..a6a1d321bb26 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -19,10 +19,11 @@ properties:
       - mediatek,mt7629-pinctrl
 
   reg:
-    maxItems: 1
+    maxItems: 2
 
   reg-names:
     items:
+      - const: base
       - const: eint
 
   gpio-controller: true
-- 
2.50.1


