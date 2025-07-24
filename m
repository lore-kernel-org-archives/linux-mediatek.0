Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1171EC83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/AK8KhHoiAb8OeBcEzoStQDwa3VO//i2LZqtgPyhiY=; b=X9QChVEwUXd++V
	SdwVX+kd//vrGfnC74JfyFdACf6VXuPanDFDfdqDXxYoj3oRFbJjcfqv60FHmhghorxxTDYVAbVTS
	UqoW8NXDoKfbQsG44PO3pYfdx0NTmcV7WVpteJ/IRZeg24kOLPhMzGqdf8Ar3oK6oUpP1c8voUmdT
	EM46aTjQwSKu5x4iA3LwLAi5zP9HJehIJHcft0U1kHwwGcZBjFM6dRPYP8ndDT2Gk02wfT7NMyA/O
	foFekpeIgBJ9sRnFjDoFs3FLZr/IEANqEniICUdDXZF6R3+NGBWx6F2A0p2UZF/dMHlqmSuzKoEDX
	Ysa5fuCkWDTaA+M1jcuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesYg-000000076G7-23e8;
	Thu, 24 Jul 2025 09:48:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerUF-00000006tE7-1oQr;
	Thu, 24 Jul 2025 08:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346373;
	bh=JpQk+FGZsDFw2WNBbFKeKhta2M3RGl/yx4vMeoVONmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oOtIKsc0p7Y/dpdGR5/Mn8nvRa1T1EtOXoL59Vd5dV6TXjXHxTWeVn3lcw6mhzTbv
	 80vFyrBxNI5Hzlo7MJW/MB5jjTz76t+v0HaHX/YpfDpseR6cYhTVWrK19EZy2X5B2N
	 B1ygduk3LZTL5l2kceKyxA6i55igPGeFcy9EaCFz8BjLFp/PNnWrQeaock6NbiwR2q
	 t8VD/W7Eg5NSqFcI9/XRqyRzU2Ob/bTPPSTr1Snf7JFQAzOVrNWXDznN4Bz23aKTwV
	 4fkaj9azqpu1VQkmtBrk0kR+FNJrV3Rxmm2fG20vWxAtPOJ8SAXbw9KIqjhmNyy32Q
	 h83XdTw5L9clg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F2F9617E128C;
	Thu, 24 Jul 2025 10:39:30 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 03/38] dt-bindings: mailbox: mediatek,gce-mailbox: Make clock-names optional
Date: Thu, 24 Jul 2025 10:38:39 +0200
Message-ID: <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_013935_651226_52F52B6E 
X-CRM114-Status: UNSURE (   7.26  )
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

The GCE Mailbox needs only one clock and the clock-names can be
used only by the driver (which, for instance, does not use it),
and this is true for all of the currently supported MediaTek SoCs.

Stop requiring to specify clock-names on all non-MT8195 GCEs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mailbox/mediatek,gce-mailbox.yaml        | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index 73d6db34d64a..587126d03fc6 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -60,17 +60,6 @@ required:
   - interrupts
   - clocks
 
-allOf:
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              const: mediatek,mt8195-gce
-    then:
-      required:
-        - clock-names
-
 additionalProperties: false
 
 examples:
-- 
2.50.1


