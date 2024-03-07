Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFE0C54E49
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 11:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0PGcRwlZmfr0MWHcozlQ+u0gJ6SnQtl/al+rHBE6m0=; b=bXu4kD+vZNcXHOopXncSsVYXb3
	pjPvWutKblM8+P+qonOk+v6DvLM2koSbIqE2BpC2+y1EyZROTmoPPoQe2hTYh4fKKAkZxbvoTxa7U
	KXmozyljYLQuF6xbg4q3GAqtZmv0C8vOiz4UAqjesNCOd+gz44w13ZBIFOrL+ce2GWv6o3Jy5Efbs
	DhQFLCyCUkOBdP9lx4Czs/ZniNV7UlILNk2PRZ4pbQgmJrClS6WNH3Uaxu/uWwo36bQCFt11eniQG
	5E0Lh2ONK5tVlQdXtDxDSWQ3ztOOu0CLDzs0IstEbqN2YB3FtPcb8LUGK2W60DkjJMbjzjhLJ9wyp
	gE7qMkvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCBf-00000004Npu-1iRm;
	Thu, 07 Mar 2024 11:45:23 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCBL-00000004Nag-4BEF;
	Thu, 07 Mar 2024 11:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709811902;
	bh=/pS8nnncjy2TDDWZ2CUchnxDIc/k7Kdx/uqwdwe7Xs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SFka2ONl+IW1KD+u2U5you9zacfumzJ0PTggp7r10/VXjdt/m6dS9N6ShYk6Nyh55
	 M1lQcQwPyAswbBsyhozWMpKjf0OQ+0F5YUR2TXgdJGkuqxgivzxXxN8rXojVhTV8Vc
	 bew0iaiL5+jBDdbDdNoXDVwkp08EQBSqmSC3VVQBN3dDpTFmopQtB0pKvC814O8pEr
	 1DtWA+9cdNU6B5wyEC8RT+tBlXXcHK1vB0qQ0G+OyCyJn9NCyNrwBaAFdI7Le5Bj//
	 9/MTe/uk1uYMSZ7BqyprEHrk2Lq7m0dggzVB/qd/2wZqzjUzn2uDjiNJN0kOWMlEsD
	 7ZJGp3+p6kosQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7279C37820ED;
	Thu,  7 Mar 2024 11:45:00 +0000 (UTC)
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
Subject: [PATCH v2 04/22] ASoC: mediatek: Assign dummy when codec not specified for a DAI link
Date: Thu,  7 Mar 2024 12:44:27 +0100
Message-ID: <20240307114445.196981-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_034504_611610_4C53BF0D 
X-CRM114-Status: GOOD (  11.60  )
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

MediaTek sound card drivers are checking whether a DAI link is present
and used on a board to assign the correct parameters and this is done
by checking the codec DAI names at probe time.

If no real codec is present, assign the dummy codec to the DAI link
to avoid NULL pointer during string comparison.

Fixes: 4302187d955f ("ASoC: mediatek: common: add soundcard driver common code")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index a58e1e3674de..000a086a8cf4 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -22,7 +22,11 @@ static int set_card_codec_info(struct snd_soc_card *card,
 
 	codec_node = of_get_child_by_name(sub_node, "codec");
 	if (!codec_node) {
-		dev_dbg(dev, "%s no specified codec\n", dai_link->name);
+		dev_dbg(dev, "%s no specified codec: setting dummy.\n", dai_link->name);
+
+		dai_link->codecs = &snd_soc_dummy_dlc;
+		dai_link->num_codecs = 1;
+		dai_link->dynamic = 1;
 		return 0;
 	}
 
-- 
2.44.0


