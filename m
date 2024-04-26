Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49ADC04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6+qDSE14v107edLDpvXgc0/yYnP6FWMTs4snMNQdhY=; b=Bn0QdNT+A1YYIVJ62odvpFpULg
	B3WWSN8ODosLfTNn3W4Evu+6BQKiGylUl7A9iaoJQAj/JvY6LtKzfSt9KRTLbPck+4VGz/fEADEW2
	WNJovrrQFwpHbpPcGhh8L4/W9Ga8lqcNRm7GXr7M0KGpZPLGRMYvjjrcKI0hPO5YNV6/noZyTOVJ6
	ZmwYte159mwccquVf2yQYC8Mo85nTbhAESUn+2RmzrDraI/gOUsdpdG9X3iTqN5VdRcx6LIRVqHpM
	brkpZNsawer4jjpjts3VGmJh3Lnu/m97uDnMlYN7TV7eMVOig5JfmKpCSUhPCIakkW/d0+C58HXx5
	Dtdbn2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HW2-0000000BoUN-0j6u;
	Fri, 26 Apr 2024 09:05:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HVw-0000000BoPR-0vrx;
	Fri, 26 Apr 2024 09:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6C2D3CE1BE2;
	Fri, 26 Apr 2024 09:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6406C113CD;
	Fri, 26 Apr 2024 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122301;
	bh=Fv58eJJ9g0/7T+qs81YevZa2aGi0MuehR4NJTOflK2I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ete9qowVjLixlXuoXYCBwwgIs1Pydbar8cLML12g4KwYYDW8/erLjq1brHFfBH+Mq
	 Hdm/Cvqsd/Z7RD44RtDFjbgtn4cgkB3mqBR160aXwVXGcQmARQvoQoWs62ViU6uK+7
	 EBgFZTMYdzkw/bS+HNlSL7TcIOAbfKjo0WEvx5SM6ZbmGSy+nfTwC60R37mjIPyWUC
	 a5lz7q5Y9DTrYhpVChTVoL6FZ0nZ3Ep7mff3Invs53CrjFpLtFLdAqpxtgEWp22/Tj
	 G5ywq6gomNAQ342vglnAh6AQuPkq9ibbuO0WaKMgVDYaySWGhR9Jxx/JI2DYexT4Yb
	 UDOTHi02QYBag==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:03:48 +0200
Subject: [PATCH v2 01/14] ASoC: SOF: debug: Constify local snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-1-e553fe67ae82@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=856; i=krzk@kernel.org;
 h=from:subject:message-id; bh=Fv58eJJ9g0/7T+qs81YevZa2aGi0MuehR4NJTOflK2I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24g8FMqyk5CcreafnICwJURXx3G/Vt1uYxPX
 DIZzjLVAGKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituIAAKCRDBN2bmhouD
 11YxD/0SAUyEFYV4mPU67fioBUbLoun6ybnfuwvrL1B88/tA0168kO8waj4x7soSQfkNXdBG9Tk
 Rz1HZ73v8oIXaJOwtxrDslVyaxBLU5HopSjZkDE7J0f+pk/sNor6WxfB6yD3ouvvSCWxxh3bhzP
 SJ4pEN192s6aSYT4cBsHRm8TnLYHCrMKa01css81vWFKvMEuKwaDic92/Ju6tbJZXY0QkNlrQM8
 Ol9oQzV7QDwSfcqNuwUx5F6ckgqyJSFMrmqQSODaoeIlwA+QPi+gYHm++/OnSBlWgQc9OuzoVOy
 xYPmVLu4Fze0JSZzF/T/2MlJfTZNrCzdk3K0yQjFBPfC3cppqrwWWsRiOzPhFawFvJg9nopMe9Y
 4euxMToOe9ngBL28cGIKWjTlGyE9z9s2GEaIJ76kEe4wW9/+KNUYDjdz+tozLb5dzM8rF49E8p9
 cH5vX9XCIe0TnAc0MUaknLm66tpqoObLiKVMWWM9uI8+Epx9UKI9lY5NPi/4xZzHbLZ7SFnHzn4
 ZSn4fXwQj0KRqP0UHtB3bitfOV5kAXbrBD4nxiycT3lddegIk5lWD4Hkh4l2bD6m3LxEZVs9DGi
 DtEeec6BbFC4q8Md9j1x+8xSrnvIx4AyT/FlkZ+vzseJWLkR1oNvCoU+ddPrJJHmUmbH+UybwpW
 HnrTY6/kxdzSxbQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020504_805972_759C49D0 
X-CRM114-Status: GOOD (  10.85  )
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
 sound/soc/sof/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index cf282c8b18af..884d85770426 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -311,8 +311,8 @@ EXPORT_SYMBOL_GPL(snd_sof_dbg_memory_info_init);
 
 int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 {
+	const struct snd_sof_dsp_ops *ops = sof_ops(sdev);
 	struct snd_sof_pdata *plat_data = sdev->pdata;
-	struct snd_sof_dsp_ops *ops = sof_ops(sdev);
 	const struct snd_sof_debugfs_map *map;
 	struct dentry *fw_profile;
 	int i;

-- 
2.43.0


