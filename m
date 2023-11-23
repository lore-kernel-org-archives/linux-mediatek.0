Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE124C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 08:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=soV6n0kljVYOCJ0bHLE3hW7cypLULnNOYmL8nI/8jaE=; b=WwUdf1IvdeUffhD/EiNYytPjOb
	wy8pE5TDHarHKyPH6Ckb+TuQjdh04Q8VKoLazt6AjZ6S/2jMEbj97mxN6Niuv23ybkAIn5GRXzmCS
	TFYGf9rGVcRSAjhwv7Au7xW6/XSbIjjXmVoUik95hk5IKJWuAJpXSxlJ7TNc9fEbyhYC1oqaTmNRI
	3RYwfbFKQCtMCOiUzigeXP+7Uv0A4cGB+SV0BuMYf6E6PkzHw8qCjsLySErQ6UCsYkgdP/tRdl8Oq
	TjSgz2jl1+b3ZpS2gaP6L9zJZk6q05+owwTr14bRqF+orT7F+OorCBe5strNhJB+hdZvMgxMwv4gY
	dSJhSS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r65Kt-004B2b-1r;
	Thu, 23 Nov 2023 08:45:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r65Kp-004B1x-1t;
	Thu, 23 Nov 2023 08:45:21 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A22D46607377;
	Thu, 23 Nov 2023 08:45:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700729116;
	bh=pEBjnfCzPZOMm5mjeyRN3TyyyC1b+Njse8wt4P34EZg=;
	h=From:To:Cc:Subject:Date:From;
	b=dJWtsHaKQEwT234V/aE9m5DOUBXvUuPPx3/Itz3czdkuNf1aj+dbMLI3le64hfv1r
	 ZYzMsQjRoubiuULRs4armVtyT8qOAjRFJxpPNX4NPT5CEUY7IQ0UM3S157MKCZnANM
	 CFVfkG4Kj4VU9pVmpHhBDoSInS7UJY8Ighr53UPgkOb95NuvuUmpw5RtCSratJ3YGe
	 WGU5qTEt+VotXm3TvyG8G8+hx/ot/DxlSb99PpuNfT327sfiOQxrwZcsmTSlbb0eqb
	 0EIoHzytREL+6Ox2wa3r4zA7kR9/rduPTuiXuDEvursK2OHTGWBfPUPsWHjXxClTZx
	 gOqk5khQNPpZA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: pierre-louis.bossart@linux.intel.com
Cc: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	tinghan.shen@mediatek.com,
	u.kleine-koenig@pengutronix.de,
	kuninori.morimoto.gx@renesas.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH] ASoC: SOF: mediatek: mt8186: Add Google Steelix topology compatible
Date: Thu, 23 Nov 2023 09:44:54 +0100
Message-ID: <20231123084454.20471-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_004519_828437_01DCCC25 
X-CRM114-Status: UNSURE (   8.48  )
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

Add the machine compatible and topology filename for the Google Steelix
MT8186 Chromebook to load the correct SOF topology file.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index b69fa788b16f..e0d88e7aa8ca 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -597,6 +597,9 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 
 static struct snd_sof_of_mach sof_mt8186_machs[] = {
 	{
+		.compatible = "google,steelix",
+		.sof_tplg_filename = "sof-mt8186-google-steelix.tplg"
+	}, {
 		.compatible = "mediatek,mt8186",
 		.sof_tplg_filename = "sof-mt8186.tplg",
 	},
-- 
2.42.0


