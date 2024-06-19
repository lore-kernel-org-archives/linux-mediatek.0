Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3009C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 08:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkwCv/NAd1otzpxBNRzVpUVM0gBC7GVmS/jfDm1Brro=; b=YfBlbCztEY5YTAJWATM7u78JZh
	/dJxZKsToEoWeBUxe5SS/PVOjjA9+T84liGUKRQ9ZFwS47CrNmfgModW8a0do1jStrZOzZafu5/cc
	VkIEDXQsNCj11Dk2UpzfHkOP6rCFMsnFeAXi6BuD7cWuRa97IDgZUTXmicyBXh+NvOljmudQ1Sakf
	2seJmQXFmyniGohpnzJdxso0AWt35eIJqbYEQLME+Lhb8fFIWFOO997nE7+II/en8aPAYEcPWNouQ
	KXXrTdq4eMVjbA/4fXhiGw8Z82vftd+ktpUZbluhYssbtyBu1KUBEaJgsDLPEzgYOV5DX9fI29qYm
	eS+yOXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJr4b-00000000Sif-1Joy;
	Wed, 19 Jun 2024 08:53:45 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJr4O-00000000SYf-0jnR;
	Wed, 19 Jun 2024 08:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718787210;
	bh=lCfHohG63RrD0UHXY1pyKLOU1ws6R6MqoXkdOh2BC74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=or7SDsQjpGnftM5Fo97nnYxjwHXbRR+Pgk3Pab1sbX4RJ7O0A1LncnW8xGZsoc4Tw
	 /GLKPK77f1yiu6VQAp32/oZMNecKgVceS/iVoDVaO8hO3UaYVO6f/rPhthgU4mZHIk
	 089vocbVpfBSSvIoGbDZPt4zJmHaQEfFRzmpcI8X+eqG4BCG0dAVYroAS5EUPyq5yI
	 KevjOlH0W9c1ArFRL/Q5KWE0sz8fRwMznpW+ShIVVEmUllicvS8kmvnwg6gBBzHbrd
	 s0Acm4ZVqH+98WbbBvVLjHlrt2z6XH1WROgJc5GnvQy3exEo/u+46wQx02JZq22TKY
	 CJhSOq/rxNWuA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8331C37821C3;
	Wed, 19 Jun 2024 08:53:29 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jassisinghbrar@gmail.com,
	garmin.chang@mediatek.com,
	houlong.wei@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	Elvis.Wang@mediatek.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/3] dt-bindings: clock: mediatek: Document reset cells for MT8188 sys
Date: Wed, 19 Jun 2024 10:53:21 +0200
Message-ID: <20240619085322.66716-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
References: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_015332_412004_5EABB4B2 
X-CRM114-Status: UNSURE (   8.91  )
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

The MT8188 sys clocks embed a reset controller: add #reset-cells
to the binding to allow using resets.

Fixes: 1086a5310f9c ("dt-bindings: clock: mediatek: Add new MT8188 clock")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
index 4cf8d3af9803..db13d51a4903 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
@@ -39,6 +39,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
 required:
   - compatible
   - reg
-- 
2.45.2


