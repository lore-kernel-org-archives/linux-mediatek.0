Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D9AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btzUoxsrMI65GVSKT203tHt0zpVs6Or7kp4GaVmkxtI=; b=AmO3w5Pm/dfhaUDj9+mC+1RNXl
	f7W3lz2xhNWXXj2/3nPenxmO79Y8+XHKDDZQmnkC2V6O6AZoVz6iJY2KJa9nKW20El8puodc6Nd/2
	RJU1KhDq2Lk7wxmJTkvp/2rXmjavA2VeNcTlPtjha+O+AahMnKDHt7Lo4GcxE7awNJo/zSfR3PMEg
	2hV6AS6Dj9J5Cpwl/vbJaKjEtr0ts58wQAWzRBqXGIDXe/Ym9qDtt0Jvm0YJJ4iPtx58cMqPn9QYV
	7so4wM3Puvq9TwYu+tYxUG4CAXNz9jTD4ZlOQ6L6wHsFdKrjC2UE5taOjqu2F9uU0uzXNGc6C68Jp
	MmFAd2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odskV-0030DT-Hm; Thu, 29 Sep 2022 12:34:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odsfJ-002yBK-Eq; Thu, 29 Sep 2022 12:29:24 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E9B666022B2;
	Thu, 29 Sep 2022 13:29:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664454558;
	bh=zimh9DQh381qWK4MyyRtrNlPLzCtssF+BcWOFc+p2UU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QySTqrCyqCBVBU4OFHxW7HKe0chZQhzYjyJ+XQycfcZcHI4nn+wxRJoq7j3z5gs6u
	 1EgFpeqtIvuudLMYvz/SYuZz3yeAPxOVjmLhKb0KlVw+VImZ65mB0WtnKqZM7nCLpa
	 8g37zC4czA+UabkChv7nMwvFe7JABszCjBRFNaMH4U14am6tugbO8oRB9IYpX0H4oR
	 CG94SWLkP8EoMA8Ywa75CQG8q/Xy5FEwqB+97Ih5JXHfe7090j8zSV4tqw/QSVJuya
	 QDe1si8t2/PSt/H/0pg1HjbcEqhYMbbRbN8/LBmlqdbumZG+dIh1lZwbHhNIXUrkBy
	 tAsQNPKDkiDQA==
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
Subject: [PATCH 1/2] arm: dts: mt7629: Remove extra interrupt from timer node
Date: Thu, 29 Sep 2022 14:29:00 +0200
Message-Id: <20220929122901.614315-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220929122901.614315-1-angelogioacchino.delregno@collabora.com>
References: <20220929122901.614315-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_052921_828852_1E57D207 
X-CRM114-Status: UNSURE (   9.00  )
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

There's only one system timer event interrupt.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/mt7629.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
index 46fc236e1b89..acab0883a3bb 100644
--- a/arch/arm/boot/dts/mt7629.dtsi
+++ b/arch/arm/boot/dts/mt7629.dtsi
@@ -106,8 +106,7 @@ timer: timer@10009000 {
 			compatible = "mediatek,mt7629-timer",
 				     "mediatek,mt6765-timer";
 			reg = <0x10009000 0x60>;
-			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk20m>;
 			clock-names = "clk20m";
 		};
-- 
2.37.2


