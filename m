Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3F3C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 00:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMnusdYjNn2+Inz4LP2G6rSPfasDhg1utYFn5ihobqM=; b=aj2ryIFSGj8Qry08r8Mv65Jwl8
	tW5ZKOO0bBWwcFvVXPGFrkyO1L4lLGynMdu65EzIOa9HQkynuLQUy06D91h7p0OBRBa9KCKNDnZk+
	h1tPcvwrq30aJ6t3fY36UULBFm/XCZpBf03QJoj/tCXmIHODqfOz3KAiB273rO0q/z9hBKydMI/ir
	IIDOILIABLhgawGJyIEHXxk855QpRiTqUZZlfRBBO1OPn1uevT5RKQuPq0OcirQLsHE8DlFT19n7t
	ZCyQT62/YR+1BbqM2oSZFuxWn9EXg41rvKMCQfTgevsLZJ7fmtPgJMVFBa9h/yQa/VEb+EmgZ+GYa
	ARawDBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obWBQ-000hS1-JP; Fri, 23 Sep 2022 00:04:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obW77-000fXw-De; Fri, 23 Sep 2022 00:00:19 +0000
Received: from notapiano.myfiosgateway.com (unknown [71.190.76.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D83D56602239;
	Fri, 23 Sep 2022 01:00:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663891207;
	bh=4W7RqvT+c8OW56kJzLV7Sc/CQ72XqC5XURtmz6cKxB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cbePx0+8KHszAj8rs78HcGfthzz3DzfHTPIWjGNyeo43Y/hJYLTZGfLPhnkBGuZtW
	 nABoilHcoJ0h9aDZt9ceefksz44jlR98aYm35A/pp/9K/Q5k1h3kAqZfwlpc/bvnJg
	 4HCnO0ybTZ58O97Tuwd+9qLEGhSkriilKwksQ64vx2yC0TfTyu9H0sWZFage0dufsy
	 NJhLZlWM6S4txisEGk+NpYwVSVkrGC3rGnkgfZO2SAuTY++VJnN+D8QIaYDm6jyEC4
	 bVxYAzCPHGQaIoQEGqZbRwQtOS8xyUSauuJNX3a6FC6xhvIMTi4yvGC11CNe/844s4
	 PVHi9P83ylapw==
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
Subject: [PATCH 5/6] ASoC: mediatek: mt8186-rt5682: Add headset widgets with switches
Date: Thu, 22 Sep 2022 19:59:50 -0400
Message-Id: <20220922235951.252532-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922235951.252532-1-nfraprado@collabora.com>
References: <20220922235951.252532-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_170017_687142_9F58B0A5 
X-CRM114-Status: GOOD (  11.18  )
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

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 247f20f594d9..4360871bfc44 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -926,6 +926,8 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 static const struct snd_soc_dapm_widget
 mt8186_mt6366_rt1019_rt5682s_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_OUTPUT("HDMI1"),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL1, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -937,6 +939,10 @@ static const struct snd_soc_dapm_route
 mt8186_mt6366_rt1019_rt5682s_routes[] = {
 	/* SPK */
 	{ "Speakers", NULL, "Speaker" },
+	/* Headset */
+	{ "Headphone", NULL, "HPOL" },
+	{ "Headphone", NULL, "HPOR" },
+	{ "IN1P", NULL, "Headset Mic" },
 	/* HDMI */
 	{ "HDMI1", NULL, "TX" },
 	/* SOF Uplink */
@@ -952,6 +958,8 @@ mt8186_mt6366_rt1019_rt5682s_routes[] = {
 static const struct snd_kcontrol_new
 mt8186_mt6366_rt1019_rt5682s_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("HDMI1"),
 };
 
-- 
2.37.3


