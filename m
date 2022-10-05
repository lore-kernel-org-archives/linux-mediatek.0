Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04627C43219
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 11:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A8MHAvEn7IYLUEh0PGQM8E1hTqyumsmm77q11kxb2v8=; b=nd78+fE8uLL+VKC5JI+4cZ+ZyY
	zth7BTBi4sBp7uQoGbKdLngEAGptfgOENaJnsy4G+CyQIkh4vYxjAuJmd3BgrQyEMpVbGDGwkcrNL
	8bCkWNK5JEqVZtuokXlIh3l8mnftPZrAZJkVAeOdFf8W7E2uxgLSpF3nTpqh8zPEzULTTQo7TZ1TF
	1scg5qt7f9lLutQdoRO6r3TYbmk59n0O3nJIUDC0FZcIJBo1VscCbRoogS09ruByR37ea5oojJhEW
	vqxN7ADaxmKqB8FoTj8+7jS9VTgIQiNWneRNsaVAcr74keJeD9DywWc91fhy3BzErgLZUDhdifkJk
	1fXdcdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2gv-00DoTo-9c; Wed, 05 Oct 2022 11:35:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2gc-00DoOz-AV; Wed, 05 Oct 2022 11:35:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E89C966022F0;
	Wed,  5 Oct 2022 12:35:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664969735;
	bh=qULQP86b4+eOLbpwlAGXJqEihDLHn7C+UcPb7jg5t+g=;
	h=From:To:Cc:Subject:Date:From;
	b=Q0yhxJbk5tyqyqWjbgBIUzlzZjuBMrTyew3wuGl1794jdF37AkJhVurw7XNMad0N/
	 N2kyyb6D74789UyOvdbRTl2YThKP8RFP5BH/id8MKWNxLRp7cI+eCMYTPlbTCTWuRo
	 kiU1uNgDtx2pQUHgYsMT6mZbYr8S/n1ZJi/K6aKbzP7oOGrBCOXZZje822OolTTUve
	 QjHUzodK7X+n0to/OZJ2TqgloJJkPN2wulPgBM1rt8kA8sUfbtAy2J7Q2BamxNNkvG
	 JFMHuPpAKg2kOq0CQmsN1ADQhB4GZAd8TckSwQR1a+1nuIxdYU/NR8fpuGrUj1wysb
	 E8dWCOA8ftrlw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	allen-kh.cheng@mediatek.com,
	seiya.wang@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	tinghan.shen@mediatek.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] MediaTek watchdog: MT6795 support and YAML conversion
Date: Wed,  5 Oct 2022 13:35:12 +0200
Message-Id: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_043538_594406_0EF1927D 
X-CRM114-Status: UNSURE (   8.90  )
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

This series converts mtk-wdt.txt to dt-schema, fixes watchdog compatibles
for MT8186 and MT8195, and adds support for the watchdog and toprgu reset
found on the MediaTek Helio X10 MT6795 SoC.

AngeloGioacchino Del Regno (5):
  arm64: dts: mediatek: mt8186: Fix watchdog compatible
  arm64: dts: mediatek: mt8195: Fix watchdog compatible
  dt-bindings: watchdog: mediatek: Convert mtk-wdt to json-schema
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6795
  watchdog: mtk_wdt: Add support for MT6795 Helio X10 watchdog and
    toprgu

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 81 +++++++++++++++++++
 .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  3 +-
 drivers/watchdog/mtk_wdt.c                    |  6 ++
 5 files changed, 89 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt

-- 
2.37.2


