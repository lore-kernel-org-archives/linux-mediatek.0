Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEC0C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 00:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/LzlWhmSu/WS+oYokTnvzExKUPIHXSqCzz7svuQpCY=; b=tH8lcsD0gUmmyK28xq1htJcOea
	qCeXt/K4SigO7c6TtkHrPYw8WC4E59JlWQ0g6oJ5KpYkrKeP5LGsDHKjJmP1Q0dQ5elvBMRnmQpAh
	2ZmTDDpYGHXDxN3Hf5MZ8hCMPcYOZT17r7DBi+igXeuCMX7L82QvOSUDt2VdmdMiSOcyBtN7BOIwy
	zacLldTP444d7jX9uIujqV5nx+aUaT7VYSSLPokHR1LyMJ9euGip5eBtHy4jNcse5S2UAztEWpT4x
	7mXNcsYKczHXQ4+mIZtvZmNkoD1h9Hm9Bn68UXhW5z6BhpFoNjuwWPI+rDDlu564Kzdikc2carh6i
	0OgfUm/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obW9N-000gUe-Jg; Fri, 23 Sep 2022 00:02:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obW75-000fT5-6Z; Fri, 23 Sep 2022 00:00:17 +0000
Received: from notapiano.myfiosgateway.com (unknown [71.190.76.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 183BE6602237;
	Fri, 23 Sep 2022 01:00:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663891203;
	bh=/6IQ3lHwKEL60Rke+bM3N44arsfrjzRsLk9Ih45RYHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z97+6eZUDhyTF8wOugnqu9/fwFiMAAjbjL1nrdS6wzEodSgubZyuwkD7ui4mSJQgu
	 J2GN7Ww7qOAztzf1Zsk/RgYeI6rLvvwTC2MWJVD6RIKyjiXw6R0Oxva5S1CmBw62/u
	 8uwt4znb2ftflJRn0zUYHjgLigjPlcDHtt4fwLQjpBfQ5+k6mZ6Lo02o/JS9zQPeCF
	 w0nnrGBJ/xUGUr/OwLuyWLNFgk3WxNTu9G7vcSD85anyAnTX+Z+/BIxZkATVMgubaV
	 rEXg61vZYCCpLJMOR113J7RrTeLMiiCuoZrkuKn46ABsnlviaXesAJcZHhSD9MCtY3
	 LqXL0gbRoD8gg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	"chunxu.li" <chunxu.li@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/6] ASoC: mediatek: mt8186-da7219: Add headset widgets with switches
Date: Thu, 22 Sep 2022 19:59:48 -0400
Message-Id: <20220922235951.252532-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922235951.252532-1-nfraprado@collabora.com>
References: <20220922235951.252532-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_170015_406684_1C63CFCA 
X-CRM114-Status: GOOD (  11.17  )
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

Add DAPM widgets for headphones and headset microphone, with matching
switches, to allow toggling these paths based on the jack connection
status.

Note that differently from others (mt8192, mt8195 and mt8186-rt5682),
the widget here is named "Headphones" (with an 's'), since "Headphone
Switch" was already registered by da7219.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index 6f93f9dd4623..8d428bc4a3b2 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -950,6 +950,8 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 static const struct snd_soc_dapm_widget
 mt8186_mt6366_da7219_max98357_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_HP("Headphones", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_OUTPUT("HDMI1"),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL1, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -961,6 +963,10 @@ static const struct snd_soc_dapm_route
 mt8186_mt6366_da7219_max98357_routes[] = {
 	/* SPK */
 	{ "Speakers", NULL, "Speaker"},
+	/* Headset */
+	{ "Headphones", NULL, "HPL" },
+	{ "Headphones", NULL, "HPR" },
+	{ "MIC", NULL, "Headset Mic" },
 	/* HDMI */
 	{ "HDMI1", NULL, "TX"},
 	/* SOF Uplink */
@@ -976,6 +982,8 @@ mt8186_mt6366_da7219_max98357_routes[] = {
 static const struct snd_kcontrol_new
 mt8186_mt6366_da7219_max98357_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Headphones"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("HDMI1"),
 };
 
-- 
2.37.3


