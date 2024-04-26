Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188EDC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBQL+PIIAc3lvQwDm4oZiBE1MBMYDUy1K+mFDFX+Bbw=; b=nk1JrQYRskilpvxrHRFYLgdMuW
	HBmUQOX3IQvpIvksm/JwNpQOE5HN1NwDHtHLwc2NY65Ax0BieLCUvYRHMpZqtGgLZyEgTuQmpktP/
	J/l8tFcOlSkjcuGRxBNDhkN5G8a16Clnqi2Q4F9Ai/CwB4D67KBl2QnmtMxhm5LOi0MEqQTu0rkRa
	jvJT7mbjn+Voz2EisuEquq61TTcSq6c+axu10uk4aHT5RzWVJT7rI5gXLFpXuhsfz7mpaBkFxgQeo
	GVUdgiDs2xPO6azKZsU8t5X4RDunFuV3O/xz3WsBdJ7hGp6lxXPM1awD7nPKz01UjzN+S1sJkiUeY
	0PkqkzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HWT-0000000Boka-1e3F;
	Fri, 26 Apr 2024 09:05:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HWD-0000000Bob9-3RIZ;
	Fri, 26 Apr 2024 09:05:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9B42CCE1BF3;
	Fri, 26 Apr 2024 09:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231EBC113CD;
	Fri, 26 Apr 2024 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122318;
	bh=3FmRYO79LY+xNUmE2P8IE0NUNwTY/hvuU6kWmtqG8wY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RSRx2iX7UDZAao7e4t2ttR+Y4XGmcflLdnDnK7p92EgQ62pOyEUsZcfgv5InIs9Na
	 Rh0+b2jo/DXnR9qpx9YYuNJ5uyOChACYPYfuQluTz76xZfRjqN0Qa8q5jJd/NRAdgp
	 9L5ysuuAOGqrZX5NkGN2xPFX4fwecyJF/r9a4K7xYC+1F9+1iLin9dbPCOaILSh7A2
	 RrGaVx05BU5bQMMvRu+VEa5qy3W8Qkc/k7n586t4eZW+FaYgfnZopcWgCKljsHMhth
	 cN04QLDtzF0bfOe2Ajz1Stt+00OdtKibqO8thoBZC4fknbZBzDdoFgh1iIIBA1ZBGW
	 R+IpaBto/JrEw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:03:50 +0200
Subject: [PATCH v2 03/14] ASoC: SOF: pcm: Constify local snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-3-e553fe67ae82@kernel.org>
References: <20240426-n-const-ops-var-v2-0-e553fe67ae82@kernel.org>
In-Reply-To: <20240426-n-const-ops-var-v2-0-e553fe67ae82@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=956; i=krzk@kernel.org;
 h=from:subject:message-id; bh=3FmRYO79LY+xNUmE2P8IE0NUNwTY/hvuU6kWmtqG8wY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24hwck8oGj89p/Piv/3ziUOfz42/slpYmY37
 WRFPnobD+mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituIQAKCRDBN2bmhouD
 19tmD/9ClP7BOTVKiZb3wV6kaqQNwRuSVgy0PFEG5BuZXR4fkipojXK2OV2gab7dvR4udfp72/n
 OIqMZIM6IuqENmtjGiB8vt6fbT6Alq2ZbTR/ynp/bqPf8E3q/CXl56AS08e3O/FH3uKCBvTNJuL
 RI1jBdv5Ogkjb0CcvItMRCndDJ2JH6VCMwU4fzjgLyZNn6Y/zWqAUQizzmXEcxUVbgK2JnhoyNU
 RztNRIUWK2nzcpSs7gDZVTIRbK6ZmqQiSD1lHfgUbudnp67W/IZg8f6LPoope/iKzLoq013m6Ot
 g4y/9aAmhrK4gmU0Xh0P1iO1nXMJoH+3K7Qb8K5bX6icIGDgOC1ZQDlb5oq4FZisM4IVbqeS43A
 +EwN4ylLCNhh6gLL4xuF7UrOILzvwY7yUxYO/fLuRvpY0dKagoLJcLZcrfVh0s+iIm42uMvKStg
 Y7K+Yfz2ZA8WjY+FZJe+rQivTxXTVYEOGYHACJdLVLy0voezBU5RPGXH8ZWokud8mayDvPgvg4X
 yyPo776FyhIe+A5auCJDqWnGozZcVoDuReYRjUMqTVcrLhLBUpfgofV4Kffsq2iTvzuv6/TmmOH
 ASO+wV+u8TOaGzytEdDo5cEKaY2GPtDcbKlnKDX52OkKMokZ0Dhh79PfoR28h0HN2O5Lp0xIt/P
 2oCVADZAEnEo5sw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020522_291757_0A991C28 
X-CRM114-Status: GOOD (  11.06  )
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

Constify the pointer to 'struct snd_sof_dsp_ops' to annotate that
functioon does not modify pointed data.

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/sof/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 8fca4b0d63de..cb774e011e31 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -423,7 +423,7 @@ static int sof_pcm_open(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_sof_dsp_ops *ops = sof_ops(sdev);
+	const struct snd_sof_dsp_ops *ops = sof_ops(sdev);
 	struct snd_sof_pcm *spcm;
 	struct snd_soc_tplg_stream_caps *caps;
 	int ret;

-- 
2.43.0


