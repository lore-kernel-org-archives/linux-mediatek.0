Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF653C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 12:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2TIJMErXL1voY5rnOvpXiIITTZjglWXtr1x27DZZH2I=; b=rmRwbBppyZZjMo1KN86qmqENwE
	P9J3BEGUCjq8UtfxYQDYGEmc1XH2IC8j0SFlb0CQEVIYwcSgN8b4qlLAR13lHg/Kb1L1wwTB8qKP4
	Lg30qV10taLO4BmQyDDAgD+ZeWBrC5a/uxsxM78Wm+LAUvGO030XI5I6JkMruZ9Aw1iBKiVZ/gvQQ
	HxkGJ7+V9CHf+0FJi+Ti/gmDJXqFVQ9PZsk53NCHSU1thnKoZ0VGHTCVFOuCNNUPJnP8+NdmwhScn
	O7tlFToAAYge2Iu226WucwSkTTQVxyB8JYW2Bv4Yt4UrI5SW4kNTxpxlHf8JMt3+n2TxUoROyOTeb
	9syG3O+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odskJ-003078-Eu; Thu, 29 Sep 2022 12:34:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odsfJ-002yB0-Ep; Thu, 29 Sep 2022 12:29:23 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D5DB266022AF;
	Thu, 29 Sep 2022 13:29:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664454557;
	bh=mzK4A3nEDonQc1BysjBR3ZM8qwhDzgu0x5HwihbvINE=;
	h=From:To:Cc:Subject:Date:From;
	b=WGk7GeP5J30XARJXA0uxmgaX80EAmE4INj3OclXjUNrmnEiOChJhU2L6efDMWBgLW
	 rqmXtokk6Xt8vuBpsZWsJ1bB3aTyLMXLz9KkCIPhuxJyYgmZztqP7nd9n47TFri5qM
	 aLmGQyazgCc1Tqk2yHDezW13uTvaWd/jR/91c0nQ3XVTZFNYYnFRURNKt8uuLDp25i
	 Cluxn2EpQC4tz0Lqcl+ovAKlnM+U6ADO0WCzPpXNDE0UW4+QDAP0U4LcE/3AkZCBxH
	 OS1LCRExew+PntfbDPAAOE2aSqOvfBTLDIdWSDVShcEB6Z88xLM0F7ErH+BnMkWdDG
	 4wUXz3OIRFNzA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: daniel.lezcano@linaro.org
Cc: tglx@linutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] Convert mtk-timer to YAML
Date: Thu, 29 Sep 2022 14:28:59 +0200
Message-Id: <20220929122901.614315-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_052921_781752_99BBBFB1 
X-CRM114-Status: UNSURE (   7.98  )
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

This is a conversion of the mediatek,mtk-timer.txt binding to schema.

While checking the schema validity, I've seen that mt7629.dtsi was
declaring two timer interrupts while effectively there's only one:
removing it was also necessary to be compliant with the new schema.

AngeloGioacchino Del Regno (2):
  arm: dts: mt7629: Remove extra interrupt from timer node
  dt-bindings: timer: mediatek: Convert to json-schema

 .../bindings/timer/mediatek,mtk-timer.txt     | 47 ----------
 .../bindings/timer/mediatek,timer.yaml        | 86 +++++++++++++++++++
 arch/arm/boot/dts/mt7629.dtsi                 |  3 +-
 3 files changed, 87 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/mediatek,timer.yaml

-- 
2.37.2


