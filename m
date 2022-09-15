Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDDCECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aiwZ1TbKygtOrMqJX5Gb1M0eYhv0kdImtj7sD5h4WA8=; b=jA2O5+q1VzwsCrW4DtJdm5DuRC
	trayNGkTuLG16RsIgZrLSvPhL10d7Rh9pTrBg1Y0qBbLiZ6cqEcFirzk83kdJrLU2CZjZM1jYBmtf
	lp7xiRoDZeXE55XZmuTDjxj5NdbUugMub3O2+kLJD1HY0xyCWwIVJ8QEG9TETXXiLVgXkaYnIDovQ
	pMfHaurx3KOeNjBT3aZhxOqbKiYgvQ050ac1wov/s+GSp35Dfy7yW3qvtVwPGNR/IKs5xQb1uBDFk
	O0XuoPqLLQ35QFvMpgp4tFBemhH4vs8Trotz2grMC7IS9mpgjMuzU/NCeaU+2EnuEVbthOsgFT9Dz
	UXAYJLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkvx-004uRD-KV; Thu, 15 Sep 2022 09:13:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkv4-004szs-7a; Thu, 15 Sep 2022 09:12:27 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A2206601DA4;
	Thu, 15 Sep 2022 10:12:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663233142;
	bh=VA5VB4z2NgVxbPr8bvpxhyy2+avv1eayxIuBDflOGCQ=;
	h=From:To:Cc:Subject:Date:From;
	b=YzPowdGT5a0pDpkwJFuRkfR6DTqkF9H7FUq5rj/Gf0iltU133tiBi1cgjGXRHZpbL
	 c1DH7dZoCZsUWk+4fHYC+ks1TiBby3HmrQ3ngA4zqPtYhrcWaERJEgPYPO7J+jCoth
	 VEKoYzemxBP0IAgQcB9dQs+vDtyknmsmmHmhoHwlXmZgVZJhEkAQc/rRnx+4RceqLl
	 OWeEOzyFYKBsCgeonnynUXar0w1Yt6PigY/DpY+qXx3StqhEjlS2p6M5odGOqjdVhB
	 bb5xJmpJAhPi4viGnBXjTcRkyPYM+/TgS4nSL8/D/sfKfmwcKsJ6cxufwsxGpqkAZK
	 4TeR15Zub03nA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@mediatek.com
Cc: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/7] Add support for MT6331 and MT6332 LEDs
Date: Thu, 15 Sep 2022 11:12:07 +0200
Message-Id: <20220915091214.59673-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_021226_453176_4A630A01 
X-CRM114-Status: UNSURE (   9.97  )
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

AngeloGioacchino Del Regno (7):
  leds: leds-mt6323: Specify registers and specs in platform data
  leds: leds-mt6323: Open code and drop MT6323_CAL_HW_DUTY macro
  leds: leds-mt6323: Drop MT6323_ prefix from macros and defines
  dt-bindings: leds: leds-mt6323: Document mt6331 compatible
  leds: leds-mt6323: Add support for MT6331 leds
  dt-bindings: leds: leds-mt6323: Document mt6332 compatible
  leds: leds-mt6323: Add support for WLEDs and MT6332

 .../devicetree/bindings/leds/leds-mt6323.txt  |   5 +-
 drivers/leds/leds-mt6323.c                    | 444 ++++++++++++++----
 2 files changed, 350 insertions(+), 99 deletions(-)

-- 
2.37.2


