Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D336EB64CA
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 18:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JaZHywHnUEGU1CiZx3WY2OGSJ/wsLWAzzr9U/RNAnbM=; b=QuAu7PsaLxYBCnCwttYvUoCs0z
	IMmENEpCgCwihnZZM3caA4f88ThgYiKsKy2num/VUx1RM1K/Vgw9IO5QmAXSyM6xVWR2lzBJIP/2p
	d0kq910aCGlu49b0MB64QZiqIAUpnR64RuK19u78j/NKqzk1l5mAuuekLjb2ncQ0hxTBg4A9cvXBe
	/sCaBJVUnmxzKdLo5OxwixFRUx9VDsaj4hkN1hEH+z6DHX87N8u34v5vVXx3F6fdaKoTctDSL0t3e
	7pxao6zfCK9sZKGSnDrIiwbM/TDEatQJSq9q+BnVRgMRq5vlf53159yQpHM7XfMRBnoOJ+gL6D/90
	xrvZ7cxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smzlA-0000000FPZA-18h3;
	Sat, 07 Sep 2024 18:02:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smzk9-0000000FPTZ-3PTP;
	Sat, 07 Sep 2024 18:01:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B2919A4081F;
	Sat,  7 Sep 2024 18:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0F6C4CEC2;
	Sat,  7 Sep 2024 18:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725732063;
	bh=Mv6kZrJv/bwLcYzdrAAeBS2GRlYFUpBzbrl5z92vyCI=;
	h=From:To:Cc:Subject:Date:From;
	b=N1UNP+ZT/W0cRRK9h9TJ1sFXGw7CVe+SC6IIrJwU1X/PuMOkxDrzozGYfkV33GQ9R
	 PjZ0/BUxcInEi1WPSw5LplbVgq0vqm7k35owy4ps8NDFyggnFheOHh67AMUpFC49/t
	 r8EaFsfUqNx/7/Wqi9TGi06X0tilOOw13/5bgFhX7IXZo7cxZ4OBWewHU9iujf1wyB
	 ydDHboQnilo2j6R4p+Xpttmqd596iYZi1dl/bZGkk/DsjOKzEoV9Ia7nWjQLeGoSaN
	 ZlFaUWEm4Qg3BLQbMlOIyaWeXZ/FCF7S2uhqGhca5/C41lOEwPVclnZDhWg1p7KSNB
	 oNDgorq+YdIPg==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8365: remove unused mt8365_i2s_hd_str
Date: Sat,  7 Sep 2024 20:00:38 +0000
Message-Id: <20240907200053.3027553-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_110105_944419_AF80837A 
X-CRM114-Status: UNSURE (   9.89  )
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

From: Arnd Bergmann <arnd@arndb.de>

The mt8365_i2s_enum and mt8365_i2s_hd_str variables are not
used anywhere, but cause a warning when building with C=1
or when enabling -Wunused-const-variable:

sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:781:27: error: 'mt8365_i2s_hd_str' defined but not used [-Werror=unused-const-variable=]
  781 | static const char * const mt8365_i2s_hd_str[] = {
      |                           ^~~~~~~~~~~~~~~~~

Remove these for the moment, they can be added back if a
user comes up.

Fixes: 402bbb13a195 ("ASoC: mediatek: mt8365: Add I2S DAI support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index 6b4d8b7e24ca..3482d8f8b4e7 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -777,13 +777,6 @@ static struct snd_soc_dai_driver mtk_dai_i2s_driver[] = {
 	}
 };
 
-/* low jitter control */
-static const char * const mt8365_i2s_hd_str[] = {
-	"Normal", "Low_Jitter"
-};
-
-static SOC_ENUM_SINGLE_EXT_DECL(mt8365_i2s_enum, mt8365_i2s_hd_str);
-
 static const char * const fmi2sin_text[] = {
 	"OPEN", "FM_2ND_I2S_IN"
 };
-- 
2.39.2


