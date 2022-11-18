Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B05C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OnvI20sHujXOUhD95iGzttvd6aewDqGbx7A4jm3vXKc=; b=mVg/teTojUCqdr7+iqqnBP/Lmo
	KdsV7Velda/PGwjcduGYzQEtoeqFQEaUiy58SrOKoNqRf8cpgm7p/tany698UzHAsdNkMUIdTFH6j
	RCwQwvum4HsRe0+/V6ZjxNuiEujmiMIpxzBSuqsZ4tEwEUgWlxnV4iiAPRUn1//gfWALa/VJ3eHnL
	UQAlz2JgGVXJ83Vj6MkTz0AtWtLs2/fv5EiFvva56/0+Ew4kGcd8Y+QwP9fBqc4NgkvY9vxOCTKXa
	2RXuhZGX27eGLBSE17apmNixGQz+TqOnW72ar7wi2BdjEXinPWhz1+00Q626Yu3QTYLrTk2/AgEKQ
	YD0hKlOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyHD-003HzV-9c; Fri, 18 Nov 2022 10:07:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyGr-003HtO-V9; Fri, 18 Nov 2022 10:06:55 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D3C556602A94;
	Fri, 18 Nov 2022 10:06:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668766008;
	bh=gNMF9FUnsHl1tClZCnynz5bAOkfDS1T9IfVFHk+eg0A=;
	h=From:To:Cc:Subject:Date:From;
	b=KfO8rte2j+APGO/WGZA16lqXuuA0MD8OW+xMTmUBmaL53n1QaAdsRbFqVLeTL5V3O
	 gFrCylI/34JWH5AbcTFEfNMYOnad+pNVBXssX8KhfsBPIKPplesXF+4apIDn2LZVjv
	 tGGE8fsPwcYj5IGG5DzUtD3tKDWw8uBhrwrTDt0J/zaXvfu8aYInqcdlXAPhYPwGqp
	 N4fmsHCawQf+PKkbBsCbFCMANdGhPRaPPqsF4JtWk+nPjjcfxulYznG6WGVkSQl/+j
	 2C74Zmm5/Ix/34qH2hPL561OWzGPAe7y1ze9kadkFVDrgWd7I3L5nRlHqzoR1MqZAE
	 gDYZyF+K+pbAw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	youlin.pei@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 0/4] MediaTek CIRQ: new register layout and schema
Date: Fri, 18 Nov 2022 11:06:35 +0100
Message-Id: <20221118100639.33704-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_020654_252491_72408FE5 
X-CRM114-Status: UNSURE (   8.58  )
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

On newer SoCs (like MT8192/95 and also other non-chromebook chips), the
MediaTek CIRQ controller has a new register layout: this series adds
some more flexibility to the irq-mtk-cirq driver, allowing to select
the register layout based on a SoC-specific compatible.

While at it, I've also performed a schema conversion .. because why not.

This was tested on MT8173 Elm, MT8192 Asurada, MT8195 Tomato (where
the latter require devicetree work to actually make use of the CIRQ,
not included in this series).

AngeloGioacchino Del Regno (4):
  dt-bindings: interrupt-controller: mediatek,cirq: Migrate to dt schema
  dt-bindings: interrupt-controller: mediatek,cirq: Document MT8192
  irqchip: irq-mtk-cirq: Move register offsets to const array
  irqchip: irq-mtk-cirq: Add support for System CIRQ on MT8192

 .../interrupt-controller/mediatek,cirq.txt    | 33 --------
 .../mediatek,mtk-cirq.yaml                    | 71 ++++++++++++++++
 drivers/irqchip/irq-mtk-cirq.c                | 81 ++++++++++++++-----
 3 files changed, 134 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml

-- 
2.38.1


