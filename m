Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E2DC54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2OtmzZ0HL2KVQeLMXGeLhp1qsTevirM6cPV2wzIh1GA=; b=FkC8B/xahyUAhkvfZ6yT33nP1m
	frwm7Ko3RGzviCX16yp6kS2lPPdF0hPXvKJWWcOPlLig2Ls9Uzp27r5krv9vIaYq4+000d5ZXQRoS
	RkACQ75u46zpqCvjTQVloZfVhoQ05nfmcDvxgF0D1d+fkCUgdC7qHFuZ5EE6/t/Dp8p4v5zmVo54J
	faQANCzy/YBE7MCHGTNA8zcMzzvEBC0ydh1yNGQvvOL6M7Fm6EYytYYOHstCvzCK2e0lOi+LNTqE1
	mSM6ezuHoSU26ZS3JIkUohypE50ArGf12QEyuPItt7P15tqjZ5dNIusM5eKKlSdvsamMTy83QbN5i
	+579H40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKy48-00A9f4-4x; Thu, 26 Jan 2023 08:57:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKy0d-00A8GQ-Nd; Thu, 26 Jan 2023 08:53:29 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 409976602D35;
	Thu, 26 Jan 2023 08:53:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674723206;
	bh=HX+xRQ1MW+zhTnCO03qIVVo98R9P1arkoDNOQVwfKU0=;
	h=From:To:Cc:Subject:Date:From;
	b=BAtopgoj/QqMawnbD1SOcgdbch/1thvXqI/fRAGMel/anVgACYESLpX7hD0PONfe5
	 M+86Z4d21XQM2t5o31Awz9QjjHzj/T7gYMOkoSoWds7fhmGkQe1EgpT3+91kJrUnxU
	 dDyb9CRba9h37GHu3SNtvfOmm0Ds2qLtiTFOg6q5wz95H8s6Ha5KUq/HTra454shpk
	 Y48r1+IMxr/avlYigxSx0wxyXldpU50MKtmSvz4YFBh7ZcwzaHbrbgHhrfBRUJ/B2a
	 N/P6I9PfqNIYlFft6ZzjtXcsU/8EhVcA7yrSgx6JqPdXj35v63mGWrkCccGOhsP0lF
	 W9JV0MOVyG2/Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	edward-jw.yang@mediatek.com,
	johnson.wang@mediatek.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	jose.exposito89@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 0/6] MediaTek Frequency Hopping: MT6795/8173/92/95
Date: Thu, 26 Jan 2023 09:53:15 +0100
Message-Id: <20230126085321.87267-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_005327_941042_B3A34C45 
X-CRM114-Status: UNSURE (   9.53  )
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

Changes in v2:
 - Rebased over v4 of my clock drivers cleanups series [1]

This series adds support for Frequency Hopping (FHCTL) on more MediaTek
SoCs, specifically, MT6795, MT8173, MT8192 and MT8195.

In order to support older platforms like MT6795 and MT8173 it was
necessary to add a new register layout that is ever-so-slightly
different from the one that was previously introduced for MT8186.

Since the new layout refers to older SoCs, the one valid for MT8186
and newer SoCs was renamed to be a "v2" layout, while the new one
for older chips gets the "v1" name.

Note: These commits won't change any behavior unless FHCTL gets
      explicitly enabled and configured in devicetrees.

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=714059

AngeloGioacchino Del Regno (6):
  clk: mediatek: fhctl: Add support for older fhctl register layout
  dt-bindings: clock: mediatek,mt8186-fhctl: Support MT6795,
    MT8173/92/95
  clk: mediatek: mt6795: Add support for frequency hopping through FHCTL
  clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
  clk: mediatek: mt8192: Add support for frequency hopping through FHCTL
  clk: mediatek: mt8195: Add support for frequency hopping through FHCTL

 .../bindings/clock/mediatek,mt8186-fhctl.yaml |  7 +-
 drivers/clk/mediatek/clk-fhctl.c              | 26 ++++++-
 drivers/clk/mediatek/clk-fhctl.h              |  9 ++-
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c  | 63 ++++++++++++++++-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c  | 65 ++++++++++++++++-
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c  |  2 +
 drivers/clk/mediatek/clk-mt8192.c             | 67 +++++++++++++++++-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c  | 69 ++++++++++++++++++-
 drivers/clk/mediatek/clk-pllfh.c              | 23 +++++--
 drivers/clk/mediatek/clk-pllfh.h              |  1 +
 10 files changed, 311 insertions(+), 21 deletions(-)

-- 
2.39.0


