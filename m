Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CA5C67871
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=86Lpq9s3jQXEVamhSrBZOdjoq9UKCWGvqbUAh817F+M=; b=Z0fBGIMd6/YqDuy7Ze2ecAF4fi
	gMony4UMpcEBbZe6LbNRoU1ZWvbjhTAEUHYxMe7dgr6vJ5LxhrQMqD7zbHK2ZfTsDh827cOxVL14v
	HsInVwQB+jitalXxudCS3tWlvB3PwFgBQRrAuL4jz7DNMnajqIr+GowXylIkEhA4UUMy9V5rvJoIC
	1hAkQLdxWwGwCWpLlxrAXkeG3qj7r0EsVJKAn32ieWH87JZFyiqtf3Ach4GSPkRqODris4ZyPt312
	gZlJNWLTdtYaGgGxXaEuaZDM7z0oMHmq+akPvvIBfTgGJekXZzhRaZ00vcb7nd+5R70WWM77mscGx
	bWS0e0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzcF-00CgQS-0s; Thu, 27 Oct 2022 09:55:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzbX-00CgAk-8o; Thu, 27 Oct 2022 09:55:20 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 16B8C6602549;
	Thu, 27 Oct 2022 10:55:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666864513;
	bh=E41IAV6f0YFdwiPzJRKjlleB+gic/fg4oOMysY+X1RI=;
	h=From:To:Cc:Subject:Date:From;
	b=KRWPu4lQEtR2fjCvGAakP8NjFXEMXxOMxnSVv9jbGasPU61c4xBuBAFXxmu3Oxqxv
	 uxfKaqCPdVmNVlXqBJ9oxGsCKjE4cPKDFgrQUirNQ2zKEEr4aGoN8loirPtKhT8DVk
	 3V8hcpdYQFCkaQRglxgL+N6LY3BsEGU+mRnTjBDyWZayOtvFgelM7gOQBoaGxkE+1k
	 Jy7qwBRc9q4poRAEbeuLqfA7jKp7SXaPVmZy4znrKG3cO/uOgxnGOqT7TeyeZTdg3i
	 sz3vpcSUbZkiya4rjWjUDIEoLOaK1R8Jc5EPsLhSodQWRmfk/psgvqvXk8/6Bq/nhK
	 Lh9eIhbhATh1g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sam.shih@mediatek.com,
	andrew@lunn.ch,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/6] MT6795 Devicetrees and Sony Xperia M5
Date: Thu, 27 Oct 2022 11:54:58 +0200
Message-Id: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_025517_950028_5A246348 
X-CRM114-Status: GOOD (  10.02  )
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

Changes in v2:
 - Rebased over next-20221026
 - Removed "mediatek,mt8173-mmc" from mmc compatible strings
 - Added clock and reset dt-bindings headers inclusions

AngeloGioacchino Del Regno (6):
  arm64: dts: mediatek: mt6795: Add topckgen, infra, peri clocks/resets
  arm64: dts: mediatek: mt6795: Replace UART dummy clocks with pericfg
  arm64: dts: mediatek: mt6795: Add support for APDMA and wire up UART
    DMAs
  arm64: dts: mediatek: mt6795: Add support for eMMC/SD/SDIO controllers
  dt-bindings: arm: mediatek: Add compatible for MT6795 Sony Xperia M5
  arm64: dts: mediatek: Add support for MT6795 Sony Xperia M5 smartphone

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    |  88 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 109 +++++++++++++++++-
 4 files changed, 195 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts

-- 
2.37.2


