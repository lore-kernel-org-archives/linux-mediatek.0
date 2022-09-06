Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FFDC38145
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvGbJ+KC1RP80Rzn1mqrYiL/R0gbW0BhvVQJYjHpVCU=; b=exAQx84I7mmkP5Qkh6Yksqn3Uq
	wAQ8sZNqbwBNYFGl4oqV7QNzzBzzHfnty8V8tQwfgXzsiJC6cSM7ZxTK0erSQPFkiwvprQd9Se0O2
	uel/F4V4Co011sgPUbzRCm0av9+A/4QWlneld7M+qAGIcNvzAyC7mdlJcegA25mA+uVnPlsx+zD2s
	bGcgqQh0WWp+TlbJZYVmLXGtKYOYHZ0pD4YgcUcmZEnuZOwFH0yiJjAoCZ47WFJxFod8i0u7ECwVc
	YX7KM2q/yUuord2kEwV/wiP7RrWQl38ntOklNYUC69n+JkGSI0dQJozZutcADrV8A9u49tc1Xmhd1
	v0P553UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUu7-00BpG8-A3; Tue, 06 Sep 2022 09:29:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUrw-00BnwF-Kw; Tue, 06 Sep 2022 09:27:46 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A36D6601F39;
	Tue,  6 Sep 2022 10:27:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662456463;
	bh=q/pjRlc+P1EXAov84vHYYZkyXsNxDJtdjpHTIHnbw+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X7j7JJNoV/4qGA8hHzxbjp29Roe1pEwLywRePOz7quQpuSF3ELkhNFcFELz4usSLR
	 ma9qGN9glh2aoynYH44mhPSEr5MX4SB38P5Dzu2KhkvV3PP1Sled5nHEjvl3+4dkAN
	 S9d7FBvig4OAydOT3pxG5AipzTqt471gt8hspnXlkaKtFjh3mjSZIpKfU8/Q1XMiLJ
	 BNs79djZuVQXHT1FJUSqlU6zKaC9YGJqfwc3pQzc68D7EMRIpjOsLPm+zp3vXLg2LE
	 ZublxmPgPhgumD9twr6pXezF0Albz7sAyU/WPAmyuNYyuck3VVOfxwZ7L/O3c5gJ52
	 SU+2RwqRrJA7w==
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
Subject: [PATCH 5/5] ASoC: SOF: mediatek: mt8195: Add devicetree support to select topologies
Date: Tue,  6 Sep 2022 11:27:27 +0200
Message-Id: <20220906092727.37324-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
References: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_022744_863460_AEF564BF 
X-CRM114-Status: GOOD (  10.32  )
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

Support devicetree by adding a snd_soc_of_mach array, specifying SOF
topologies for a generic MT8195 machine and for Google Tomato
Chromebooks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index c1590e78edd4..8e359c296308 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -615,7 +615,20 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
 
+static struct snd_sof_of_mach sof_mt8195_machs[] = {
+	{
+		.compatible = "google,tomato",
+		.sof_tplg_filename = "sof-mt8195-mt6359-rt1019-rt5682-dts.tplg"
+	}, {
+		.compatible = "mediatek,mt8195",
+		.sof_tplg_filename = "sof-mt8195.tplg"
+	}, {
+		/* sentinel */
+	}
+};
+
 static const struct sof_dev_desc sof_of_mt8195_desc = {
+	.of_machines = sof_mt8195_machs,
 	.ipc_supported_mask	= BIT(SOF_IPC),
 	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
-- 
2.37.2


