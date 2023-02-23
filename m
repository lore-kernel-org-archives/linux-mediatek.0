Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB54C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s3/P1Hn196in5IMopHLnxnhNxF1bQVuQKHL9yPxcHb4=; b=iYqb/67U6/BFxZ49KsrLCT5Fjp
	RORbZ69ET2nEIxGvIQiuVdlHK/l5YYeSmBZGp7QMuHXwdKuCZIFqA7C1XxQgJfXuihdmxdrtf0Lzb
	kx7p06Zp5AFG86fUvMKHNjJ4kvmsTcjLa2KCo+aBOryjIzhuv5QjEbwSQhQtYQ0x65SWyeReJvZ3n
	T85H2FqZ+g8SIpB5J9XfHIgLXy98Cvu1gLvjuIhdyac9abgmXfrxCeXET8XYDXKNMDtKlB2W2wJwn
	8JlPag9SQSTSCq4DRx0dTaolhyry7zljg+3MRAlMB+0uv9eL8Qb6+uVTcUk7tVfzJt/N5cBkJo5ef
	4PXYaOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVD0V-00GtwL-LZ; Thu, 23 Feb 2023 14:55:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVCzU-00GtTT-7g; Thu, 23 Feb 2023 14:54:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ED7576602215;
	Thu, 23 Feb 2023 14:54:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677164074;
	bh=LLTzPuRFN+0pSbDG6Kkh/Csyc+/dUcma135aklDWzWc=;
	h=From:To:Cc:Subject:Date:From;
	b=D4PyWZAI957HM5iZBYJ1CROMDtLSIR6aaKLhErvyJyooR/gDUhX48SnoHuSKzwkXI
	 098Ahdc8nPAE0XlmOLnjM8OfT5KGKOAfBMTMli2Rj4CQtG3iI0jn3+q6uFMNFMMVCC
	 3ze3KspldXTeQQdjTmvbV4CcaoeWWx3+4xFV2e0dkptgAABcFWiRa5XseQBa3HYQBn
	 ChiUT76MHJ55wF6lycrmAtW1r1B0FkpFTm0xh1l8X9OrZC57ddD9zA13pDyMjZpYXW
	 khn8/Sn7QLk/vDANu/gB9NngBEgAUhH37GF+Op6KsVm7cCPdS0fMgflTgYVl8ezAiw
	 CNaVRZHm7+k+g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 0/4] MT8195 Cherry: Enable PCIe/WiFi, add PWMs
Date: Thu, 23 Feb 2023 15:54:22 +0100
Message-Id: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_065436_452081_23F8A07D 
X-CRM114-Status: UNSURE (   8.87  )
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

This series enables PCI-Express on MT8195 Cherry Tomato Chromebooks,
making it possible to use the MT7921E WiFi card on PCIe bus.

While at it, I've also added the missing hardware PWM nodes for
MT8195 and relevant nodes to get backlight support in all Cherry
devices for the internal display.

!! Please Note !!

This series applies on top of [1], [2] and [3], even though it does not
have any real dependencies on them.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20230209105628.50294-6-bchihi@baylibre.com/
[2]: https://patchwork.kernel.org/project/linux-mediatek/patch/20230209105628.50294-7-bchihi@baylibre.com/
[3]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=724363

AngeloGioacchino Del Regno (4):
  arm64: dts: mediatek: cherry: Add platform thermal configuration
  arm64: dts: mediatek: cherry: Enable PCI-Express ports for WiFi
  arm64: dts: mediatek: mt8195: Add display pwm nodes
  arm64: dts: mediatek: cherry: Add configuration for display backlight

 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |   7 +
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 173 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  23 +++
 3 files changed, 203 insertions(+)

-- 
2.39.2


