Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCF5C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 07:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oRIkCLdWrQlhnbidxcm+dGsnJ2O1z9FZNdM4iSXedfg=; b=O6nSuvJbPdB8HdofdyuZdljDwA
	4o/wufwCF+YRV1V/hUIksiPPJCsJqJwzzjtk0KHt8+F7589Zi6f7Sv64JYaHZ6GfGZa7bcMIWyTmq
	Mjj/OuxHdXRC0c3PDPsAHlqFckXXjyLtxggwjpHASB4XeAju03mwF3HG7cktCTjIgj/eKANkvbTkJ
	1eHPDHObNk4KknAP33i2IH2ZCzsxyPZOwTsS4j57RdkolL3w4a0L3ZWtpITta+mI+XoS2vYcTg8vO
	puzIXweyi1kmaCShOZXazEOlL5lngpQYzjoa3BakpgMBhk2MKg2+RtkzuJGfE1OXwqjkDPXA1XBM7
	tkcVNEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwd1U-0000000BC3w-1DYQ;
	Tue, 16 Apr 2024 07:14:32 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwd1J-0000000BC07-04zW;
	Tue, 16 Apr 2024 07:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713251658;
	bh=+zKYfmzXbGIYWT2KiYkWwX9RneJE/QPprhjzqj7y6+A=;
	h=From:To:Cc:Subject:Date:From;
	b=zbAcp02LmfkSzjsrxMNdT2tVPBkCWmohr7Gw7f42juNuNJyTaMv3q7Dhtd9y5GFgu
	 ZOKLWKfnHu+gH3tPMX86k72RFSbc5hOeTIOuwX5kycDpEn5pY+5BA98OVRB8yvvuJL
	 Fp0l1ix2jk3e8ktxpsUxLh8MIgGtSutgmAnDKpxl451NjA39rg9XLX3Xl9ecCCs0vq
	 yt7LG45ygQ1CSbq9Yc7JvphKK5QAdy9gqX5vjaPp+kMrmlzSD40PoOAkIRECVHWLCs
	 VHxjEIn6vLPMxI1bJVdTdgycmrOzIM3HQc+n8qtQNXPJzcdyiusKm/aBbYI0KC32Nf
	 qK4P+D7yxQR3A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4233B37820F9;
	Tue, 16 Apr 2024 07:14:16 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: wenst@chromium.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com,
	shraash@google.com,
	amergnat@baylibre.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	dianders@chromium.org,
	frank.li@vivo.com,
	allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com,
	claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com,
	jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	shane.chien@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 00/18] ASoC: Cleanup MediaTek soundcard machine drivers
Date: Tue, 16 Apr 2024 09:13:52 +0200
Message-ID: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_001421_282171_428CE714 
X-CRM114-Status: GOOD (  15.62  )
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

Changes in v5:
 - Cleaned up MT8186 soundcard migration commit which erroneously
   had leftovers from development
 - Changed the mtk_pcm_constraints_data structure to hold pointers
   to snd_pcm_hw_constraint_list, as to really reuse the const data
 - Tested again on all of the listed MTK platforms.

Changes in v4:
 - Rebased over next-20240409
 - Dropped the first 4 patches from v3 as were already picked by Mark
 - Fixed W=1 build issue

Changes in v3:
 - Added audio-routing names in enum in all yaml files
 - Added mention of disallowing old and new properties together in
   commit message of bindings patches
 - Fixed validation errors with sound-card-common.yaml inclusion
   due to missing model property in examples
 - Removed `else` enforcing headset-codec/speaker-codecs requirement
   if xxx-dai-link not present to avoid future commit noise as the
   deprecated statement will disallow deprecated properties as required

Changes in v2:
 - Bindings: Changed link-name/codec/clk-provider to remove `items`
   and leave just the enum
 - Moved .*-dai-link pattern additionalProperties after `type: object`
 - Added ref to sound-card-common.yaml
 - Fixed dai-link-xxx -> xxx-dai-link typo in example comment

This series performs a cleanup of most of the MediaTek AFE drivers and
soundcard machine drivers, reducing code duplication and setting a base
to be consistent with their devicetree bindings, as many of those are
using different properties and nodes for no good reason.

Summarizing:
 - Commonizes functions and ops where possible
 - Adds a common probe mechanism, increasing maintainability of
   soundcard drivers for older MediaTek SoCs
 - Migrates all drivers to support the new bindings
   - Obviously retains compatibility with old device trees
 - Reduces machine-specific parameters hardcoding in drivers
   - Can now set machine-specific params in device tree
   - Uses the `audio-routing` and `dai-link` nodes like some
     other non-MediaTek SoC sound drivers
 - Imposes consistency between MediaTek ASoC machine soundcard
   drivers bindings
 - Reduces code size and greatly reduces the amount of code that
   will be required for newer drivers (retaining compatibility with
   the old bindings was costly in terms of code size, otherwise
   this series would've removed ~1000 more lines, or something
   along that line).

This series was (manually) tested on MT8173, MT8192, MT8195 and MT8186
Chromebooks.


AngeloGioacchino Del Regno (18):
  ASoC: mediatek: Add common machine soundcard driver probe mechanism
  ASoC: mediatek: common: Constify struct mtk_sof_priv
  ASoC: mediatek: mt8188: Migrate to mtk_soundcard_common_probe
  ASoC: mediatek: mt8195: Migrate to mtk_soundcard_common_probe
  ASoC: mediatek: mt8192: Migrate to mtk_soundcard_common_probe
  ASoC: mediatek: mt8186: Migrate to mtk_soundcard_common_probe
  ASoC: mediatek: Add common snd_soc_ops .startup() callback
  ASoC: mediatek: mt8195: Migrate to the common mtk_soundcard_startup
  ASoC: mediatek: mt8192: Migrate to the common mtk_soundcard_startup
  ASoC: mediatek: mt8186-rt1019: Migrate to the common
    mtk_soundcard_startup
  ASoC: mediatek: Add common mtk_afe_component_probe callback
  ASoC: mediatek: Use common mtk_afe_pcm_platform with common probe cb
  ASoC: mediatek: mt8186: Unify mt8186-mt6366 machine drivers
  ASoC: dt-bindings: mt8195: Document audio-routing and dai-link subnode
  ASoC: dt-bindings: mt8192: Document audio-routing and dai-link subnode
  ASoC: dt-bindings: mt8186: Document audio-routing and dai-link subnode
  arm64: dts: mediatek: mt8195-cherry: Specify sound DAI links and
    routing
  arm64: dts: mediatek: mt8186-corsola: Specify sound DAI links and
    routing

 .../sound/mt8186-mt6366-da7219-max98357.yaml  |  131 +-
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  120 +-
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    |  139 +-
 .../bindings/sound/mt8195-mt6359.yaml         |  134 ++
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |   42 +-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |   45 +
 sound/soc/mediatek/Kconfig                    |   24 +-
 .../mediatek/common/mtk-afe-platform-driver.c |   18 +
 .../soc/mediatek/common/mtk-dsp-sof-common.c  |   15 +-
 .../soc/mediatek/common/mtk-dsp-sof-common.h  |    1 -
 sound/soc/mediatek/common/mtk-soc-card.h      |    7 +-
 .../mediatek/common/mtk-soundcard-driver.c    |  199 +++
 .../mediatek/common/mtk-soundcard-driver.h    |   42 +
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c    |   14 +-
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c    |   14 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    |   14 +-
 sound/soc/mediatek/mt8186/Makefile            |    3 +-
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 1189 -----------------
 ...t6366-rt1019-rt5682s.c => mt8186-mt6366.c} |  578 ++++----
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |   21 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |  203 +--
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |   25 +-
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  301 ++---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |   21 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     |  487 +++----
 25 files changed, 1597 insertions(+), 2190 deletions(-)
 delete mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
 rename sound/soc/mediatek/mt8186/{mt8186-mt6366-rt1019-rt5682s.c => mt8186-mt6366.c} (72%)

-- 
2.44.0


