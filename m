Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F5DC7EE25
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 12:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e0lvAdIDLby6JB6qUu9I24E8X7bnJ8KDE8MTuuQfEq4=; b=qxbBN86gcJbfHyvShwM1u24/WG
	UT97KvCBC2qV7s4e1oSln4m2SSiUtrAvITeY0HZOoYLNToX9Ybp5ym1XuDlzfufXZkptDMGzg927k
	cUWcqr8LpDeytHMlRPVhg5139QrFUsq+Wz5cICYGllAIXcurg50QhIspSsESyWfCT26mOouX7Bzlp
	p+ooUUV8KM0p53EPkmz0dbHR+BWHRDwjAU5DMjTeWaU7gb6qd/JiLhIJ/QdYQNyVRHeSswQMC8nVR
	emzCWcLAF46yZnkMkglZ8UbvSI5MR2MZIntNA7OlLttyZ2+DSSd3xchOK7+xGYqyxV3ur3DSC+3av
	xVTN2HBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ry7-005m4n-1K;
	Wed, 07 Jun 2023 12:08:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rxw-005ltp-2o;
	Wed, 07 Jun 2023 12:08:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 43E0763410;
	Wed,  7 Jun 2023 12:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF3DC433EF;
	Wed,  7 Jun 2023 12:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686139718;
	bh=ajWdmE+oEITOfGOM0DiF4YY95IS+tAiw8M8wSeFjfJc=;
	h=From:To:Cc:Subject:Date:From;
	b=Bi+Wp+C6tbHnzgHh1p+180dQ/zx9IUMtY1VfKbsF+Z6NcjawkF67gfhSgdhHTpAPy
	 K/+O9EkvHkxjVf8Va3NjQUEkwAfD3NKQkywYkVXXdHO3agZsQJ5ep0O3v82jqjxoMd
	 DgsOe7DtWJjJes8wCRxqJIZ5l+jLK4GIORNxAUWEv1Qgs/KuyMsy9Jp9PtghSfHphS
	 31S29SmnQ1uIFM1z4Uco4AzI8ppCeQ4yDaRZOkLlDVrVZBcN18fTfItUrJC82TpIHB
	 jRAqUAmruppRV96n5IsNE13ScmceWymV5DOSGPtUY/xUXiv/PEFdDANPLFLISbTtqN
	 Pb8HNcN+6mFjg==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8188-mt6359: add i2c dependency
Date: Wed,  7 Jun 2023 14:08:15 +0200
Message-Id: <20230607120831.3587379-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_050840_978061_D612271F 
X-CRM114-Status: GOOD (  12.34  )
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

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver is missing this dependency, causing a possible
build failure:

WARNING: unmet direct dependencies detected for SND_SOC_MAX98390
WARNING: unmet direct dependencies detected for SND_SOC_NAU8825
  Depends on [m]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=m]
  Selected by [y]:
  - SND_SOC_MT8188_MT6359 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_MT8188 [=y] && MTK_PMIC_WRAP [=y]
aarch64-linux-ld: sound/soc/codecs/max98390.o: in function `max98390_i2c_probe':
max98390.c:(.text+0x514): undefined reference to `__devm_regmap_init_i2c'

Fixes: 9f08dcbddeb30 ("ASoC: mediatek: mt8188-mt6359: support new board with nau88255")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 4ea012342b522..90db67e0ce4fb 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -223,6 +223,7 @@ config SND_SOC_MT8188
 config SND_SOC_MT8188_MT6359
 	tristate "ASoC Audio driver for MT8188 with MT6359 and I2S codecs"
 	depends on SND_SOC_MT8188 && MTK_PMIC_WRAP
+	depends on I2C
 	select SND_SOC_MT6359
 	select SND_SOC_HDMI_CODEC
 	select SND_SOC_DMIC
-- 
2.39.2


