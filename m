Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F213C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkT8et/+9fsHR4OfMLHSHSPmyTJmgtocBkTQJHJ6YHA=; b=jp8maXT8RyViOWOZayIylm9Wrs
	DqvT1f898Pkys6mcK1nj7qgPqqx0AnEUPF64sLvdDugnk7kGeG9CjYEQ2Ya2TH67AkRlN6RuuL6Dw
	sAaYTNMM096LDFgxQlT/ABfuv9Bd+NcvLg5qbt8k8MoGnp9t2gnpR4WsH/ym9N/nVkVC0pX3JGIV2
	VJfcDYnQ7dB2F2sXBS2oHYla198DV/nu0RisO/EkMvnBSCh8vV0/M9OQoFwqLCOIhPxWwdrEiC5Jd
	gBxgcI6DFh7Y6POoziKtqQ/KRi6AK3Kq+3roFJPlFWq8A99S2ZZ1OwjbVhdHUw68kbTR3oKrinVpO
	UqUgMGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUtf-00Boqt-2d; Tue, 06 Sep 2022 09:29:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUrv-00Bnuf-3W; Tue, 06 Sep 2022 09:27:45 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C3A6F6601E73;
	Tue,  6 Sep 2022 10:27:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662456461;
	bh=YDlQ+YNdqI/5kTvHBiM/B/3jPqKXRqtJVv0TyDN9v4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jUe01iz99vjxX5T1OZqszuO5NuLhZ7HOJybhSE3NubRqkA7xOh107oJhxrBscabsA
	 U/0eCBPs483WDAw8bfelr0xm1W6crl/U+jz4c6NYA7JiZv2y++LJPmvnfc+Shzchjy
	 j5TLzLqoMHNKJpogWol7MEwV0SbiTnxlUTTwxlta6zOYWt0fjo0mVB6eY4PIMvB1gL
	 s+6Fpqa2s/QpoVVZJGxXkq1VQzYQuL+IkhYQBwq/XQ7B9vPpBcAmtjjI1RPciSsDFQ
	 74JhAc0TlmV//EpD6Kfxgd5Gk29MGhfj9lqnJfz2MbF7oShABq3XHf3f0eMtVkeeN6
	 IFPussD/yOgTA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	trevor.wu@mediatek.com,
	tzungbi@google.com,
	angelogioacchino.delregno@collabora.com,
	yc.hung@mediatek.com,
	Allen-KH.Cheng@mediatek.com,
	geert@linux-m68k.org,
	chunxu.li@mediatek.com,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	kernel@collabora.com
Subject: [PATCH 4/5] ASoC: SOF: mediatek: mt8195: Add generic pcm_{open,close} callbacks
Date: Tue,  6 Sep 2022 11:27:26 +0200
Message-Id: <20220906092727.37324-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
References: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_022743_303951_01E2C601 
X-CRM114-Status: UNSURE (   9.05  )
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

Use the generic sof_stream_pcm_{open,close}() functions for the
pcm_{open,close} callbacks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 68747ee21c6f..c1590e78edd4 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -586,6 +586,10 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* misc */
 	.get_bar_index	= mt8195_get_bar_index,
 
+	/* stream callbacks */
+	.pcm_open	= sof_stream_pcm_open,
+	.pcm_close	= sof_stream_pcm_close,
+
 	/* firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
-- 
2.37.2


