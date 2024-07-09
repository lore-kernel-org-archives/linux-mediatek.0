Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E0CC3DA42
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jul 2024 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F8LbkaZZ5T6LHWP6MpgVpaTLNOg4FoESQlLvyA41iYg=; b=hVxqGlSXKdEK1r
	efBS8zD0EpPgXkKGcXQNz6FBHlzcgsmQSW4cv+XBgacsGfKBaV+6CVDqSq4cor2BUZr2+lbnHeB1R
	TF0behRQG1N2Sb29YAYQTk15rsyqR2gVOeTBUeD3PbMSNBVrH5jvLIZlrVKV3tjz6Lki8UzDZwuAF
	B5ND4rpCvdEzSpRVab57SS9OPLIBUQHd1ziTEtCC8GuHlA87OkU6F8dBqopmoJ1KbF2S2JQAmbEID
	FSat9XNT1DdOo4qMTTheBiPIX6xf+2dhP49WeWfRqSG4lU4DouWDyKh3gof5jSCRMGIa30QandGmq
	XF/5C2Yq4v6K9XodjQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7rL-00000006lvY-3Pys;
	Tue, 09 Jul 2024 10:14:07 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7qr-00000006ll1-0GsY;
	Tue, 09 Jul 2024 10:13:38 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id C76C6419EB;
	Tue,  9 Jul 2024 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1720520014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F8LbkaZZ5T6LHWP6MpgVpaTLNOg4FoESQlLvyA41iYg=;
	b=gM37yGtmYrRd0oPE/NhgKI4bYc+KF1mXFND4kfNJVpcN0S7smJX7LP1WSBoE6IprfVmK5g
	PYBrvDkJErbQjnwqrsuGoAfi4Tz2wZosxR3h1HWSgmmc8KtdWQcDYuuKVxJoo9Fy8jBdo6
	uAW1nH4xaj+/F1/BKtR2vyqo0tiTgQs=
Received: from frank-u24.. (fttx-pool-217.61.149.221.bambit.de [217.61.149.221])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 90D21100756;
	Tue,  9 Jul 2024 10:13:33 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v1 0/4] add syscon requirement for mt7988
Date: Tue,  9 Jul 2024 12:13:22 +0200
Message-ID: <20240709101328.102969-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: cc04bfa3-18a0-4142-97ac-21d0a30ec603
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_031337_281382_4D636F50 
X-CRM114-Status: UNSURE (   7.32  )
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Some nodes require the syscon fallback at least in u-boot when using
OF_UPSTREAM.

This is because uboot driver uses syscon_node_to_regmap in mtk_eth.c for
"mediatek,toprgu", "mediatek,xfi_pll" and reset pointing to watchdog-node.

Frank Wunderlich (4):
  dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988 syscon requirement
  dt-bindings: clock: mediatek: add syscon requirement for mt7988
    xfi-pll
  dt-bindings: clock: mediatek: add syscon requirement for mt7988
    ethwarp
  arm64: dts: mediatek: mt7988: add syscon for watchdog, xfi-pll and
    ethwarp

 .../devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml | 6 ++++--
 .../devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml | 7 +++++--
 .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml     | 5 ++++-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                  | 6 +++---
 4 files changed, 16 insertions(+), 8 deletions(-)

-- 
2.43.0


