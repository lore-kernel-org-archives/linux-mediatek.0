Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FCAC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wao4bnF66ZRBpFdRO9JeX86Zt05HoVjIJlD2GwDDhf4=; b=K5NeqM1f5X+L3TSLr+FPSuaYUR
	VN6+IzZeFeLSs3M4NDAQGhTjhUfx3CvDzoePyJNBsWAc8Kej+0aEW8tNpxwXbV5ZpzeTVRVRQLMoe
	/4YXFU1rDdcIUKCy9gOFfTmIyLjywbKjFNOIhqfHNRRzi8JLsVpcGGQYR1cZscUXUznE3Wc4VZRFT
	magUTno0yFKTNgKJEp5UInX26zd2tGq6heG9tsQ10+5lcnLvbhUbf03l80uiSQWnkpXxoLbIk+4GG
	x0pmV4v7+q5M4G9A93GEWSnrQDgRVqTENHhY2AbdOxNWtJmxuWJL5QeeoKlsq+sNGGz4qShWRLVyc
	jPamwRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNUV-004A70-Jd; Fri, 29 Jul 2022 10:45:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNUF-0049uV-9x; Fri, 29 Jul 2022 10:44:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AC0A96601B51;
	Fri, 29 Jul 2022 11:44:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659091491;
	bh=AQdqE1GO0V3rreFgAXtrSDeQLlxnOolBtnCZSijQhOM=;
	h=From:To:Cc:Subject:Date:From;
	b=ejPq8DpUJ8FijUY0HCE1hwqrRnGZkQmBiPhNJ55XL1sQXbHsVMgjGe1BCdP+qI76Y
	 ewXDYk3rAZk5Wvt3URjsXZ527wjn580VKlMj0Cs1nvepNKKXM2MqtWDQyjkKuBvvnQ
	 fePyS983PRiJNWfYwEntuI/T3T5SKEf6UbP1aK2GyDz6hfoY9YpEhlt9K5s10T99fm
	 eXYPUHUdo2yrzYHNodmG/i+SbKZVmShsbXNYfXV+DOCI24usdP7esV8m+7qaDLB1LF
	 mQMUuJ1Hn2RgwUs9pGHW9aAYphmUDslW2I1i2AXz2G1d113krfwj6pWw+pbNdYYHxj
	 nYAo9akqERQxg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	fparent@baylibre.com,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	long.cheng@mediatek.com,
	wenbin.mei@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 0/8] MT6795 Devicetrees and Sony Xperia M5
Date: Fri, 29 Jul 2022 12:44:32 +0200
Message-Id: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_034455_583277_82A23EE5 
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

This series brings some more support for the MT6795 SoC, as it
adds support for basic clock controllers (and resets) and all
of the mtk-sd mmc controllers.

While at it, since now it's possible to get the "first signs of
life" out of a MT6795 smartphone platform, add a basic devicetree
for the Sony Xperia M5 (codename "Holly") device as to start
preparing the ground for a gradual bringup.

This series depends on [1] my mt6795 clocks series.

P.S.: Thumbs up for the first MediaTek-powered ARM64 smartphone
      going upstream! :-) :-) :-)

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=662165

AngeloGioacchino Del Regno (8):
  dt-bindings: dma: mediatek,uart-dma: Add binding for MT6795 SoC
  dt-bindings: mmc: Add compatible for MT6795 Helio X10 SoC
  arm64: dts: mediatek: mt6795: Add topckgen, infra, peri clocks/resets
  arm64: dts: mediatek: mt6795: Replace UART dummy clocks with pericfg
  arm64: dts: mediatek: mt6795: Add support for APDMA and wire up UART
    DMAs
  arm64: dts: mediatek: mt6795: Add support for eMMC/SD/SDIO controllers
  dt-bindings: arm: mediatek: Add compatible for MT6795 Sony Xperia M5
  arm64: dts: mediatek: Add support for MT6795 Sony Xperia M5 smartphone

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 .../bindings/dma/mediatek,uart-dma.yaml       |   1 +
 .../devicetree/bindings/mmc/mtk-sd.yaml       |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    |  90 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 107 +++++++++++++++++-
 6 files changed, 197 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts

-- 
2.35.1


