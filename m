Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D90C77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 11:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xPgmce2wFvYqrQbKSaSjfA2QS/aXeWyUAPC+7G7hmd0=; b=qne/L2gIroS2ybbKM5nQUoAOJE
	Z/j8+fy7NHtPxbW9xHXT3wOUziRB5Axw8fTXRk13F/zOb1J/tMSDNm0G9y1vNNP1WGLmRRq+nZvaP
	eGU627Ej0jCXDPhUc2vU/xblN60X5aou0AzoZuTINWXKbRrKmG41hNv7KtS3kwfudx7v2uP6WzJri
	JP+DUoqndcDEY8DFs3Etho4xOw3bFKKVi5cNcbOT/8XzncG9Rui+NPXKbjWyqWqCATREmr543ubnk
	G0k/VAML8K/+WBUzUGp2nwBxdFcJ9k+569desiufbqfhgjmO8JvR/R4YcnKBCBG+NhXcPZp28akvj
	uaOSA0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gAQ-003Ay5-25;
	Thu, 01 Jun 2023 11:08:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gAK-003Apj-0t;
	Thu, 01 Jun 2023 11:08:25 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C5E26606EBB;
	Thu,  1 Jun 2023 12:08:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685617698;
	bh=Sse+Q1M/NQWUrVoTeA+SiLfS8fyeSQsrOZ1ZDEDAn2U=;
	h=From:To:Cc:Subject:Date:From;
	b=lRPk/Z3FXbz2jdk5r/vUaSO1C6jjTZmtwzaAZGeFXsPn+6Dx0WyuyeJF1VNxMCfUj
	 n1VC4p+3H3MkKKmUB6WyVFbujawywFv9CMmkKe6VwikoYjjbjeSAv/KL61dXq1PiG6
	 EormIXqeimQpdSJeKy/FM2LowMeX0yOqN9+xOPESI3zBuHu6+NQH44NTvFvvE8BnZi
	 frJU1KlWKv2s4P8igJ7x6p5OmJEmOFnU1d7qBJ/s98YVq1G7Mbn9b8fqefe88kRVOE
	 mECU7d2tH7sa8ftssUXSC2QhAA6qmgl5FOD8ig99MJ5kfPdficOXYCplkJyBtRSZIv
	 4jbLR9Sj+js2w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: pavel@ucw.cz
Cc: lee@kernel.org,
	sean.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 0/8] Add support for MT6331 and MT6332 LEDs
Date: Thu,  1 Jun 2023 13:08:05 +0200
Message-Id: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_040824_471328_B5C85FBD 
X-CRM114-Status: GOOD (  12.11  )
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

Changes in v3:
 - Rebase over next-20230601
 - Beautified ISINK_CON0 comment
 - Added binding for mediatek,is-wled property

Changes in v2:
 - Rebase over next-20230412

NOTE: Since v1 of this series was sent in Semptember 2022 and got
ignored for *7 months* with no feedback, I'm retrying the upstreaming
of this same series.
There are no changes, if not just a simple rebase and another test
run on the same hardware.


MT6323 is not the only PMIC that has a LEDs controller IP and it was
found that the others do have a compatible register layout, except
for some register offsets.
The logic contained in this driver can be totally reused for other
PMICs as well, so I can't see any reason to keep this specific to
the MT6323 part.

This series brings meaningful platform data to this driver, giving
it flexibility and adding support for LED controllers found in the
MT6331 and MT6332 PMICs.

Tested on MT6795 Sony Xperia M5 smartphone.

AngeloGioacchino Del Regno (8):
  dt-bindings: leds: leds-mt6323: Document mt6331 compatible
  dt-bindings: leds: leds-mt6323: Document mt6332 compatible
  dt-bindings: leds: leds-mt6323: Support WLED output
  leds: leds-mt6323: Specify registers and specs in platform data
  leds: leds-mt6323: Drop MT6323_ prefix from macros and defines
  leds: leds-mt6323: Open code and drop MT6323_CAL_HW_DUTY macro
  leds: leds-mt6323: Add support for MT6331 leds
  leds: leds-mt6323: Add support for WLEDs and MT6332

 .../devicetree/bindings/leds/leds-mt6323.txt  |   6 +-
 drivers/leds/leds-mt6323.c                    | 448 ++++++++++++++----
 2 files changed, 352 insertions(+), 102 deletions(-)

-- 
2.40.1


