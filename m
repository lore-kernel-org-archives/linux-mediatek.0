Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE78E6FE49
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Sep 2024 20:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7H5loooV/zDsI81/Saia2/i83nub5Yi42cBeDfDzx4M=; b=FZttZ8EMm12AngjpGMboxDQX1v
	qxV7v7bqFgyrP5G0kRo0wdQ9MJPj9duGwPi+qq09ygPCf3aqMrhVUkgCfgCYKR0zcW5XQUZYdeWqQ
	aZh6zg6bL1twKJEMG5XYd2pUlZ8auZU3xGNQflvlQSuhyTEk7UsEwXuu9bD2QGx1g1861IgvgKx7m
	M6Bo71qN2OJE50/jpCkll/cyBDahBKBojQxxC9o3towAxv+EZFBiqHiY09fv6i31ajYngS/MKDgsc
	EQIOI5CVzJ/nX6d/WwJ0HJzCJszH4nBTCtyLU70/hdNznO4MRCDUTQ4hKzJ8SLd4iHdQCajPIwMut
	328487GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snONG-0000000HOzw-2ozQ;
	Sun, 08 Sep 2024 20:19:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snOMF-0000000HOt3-0hoP;
	Sun, 08 Sep 2024 20:18:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B1915C0F4D;
	Sun,  8 Sep 2024 20:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF378C4CEC3;
	Sun,  8 Sep 2024 20:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725826680;
	bh=cO0VA8sPCHSdvNTRaAgPs6NicHsgD6AL7kQaFUvXJBA=;
	h=From:To:Cc:Subject:Date:From;
	b=cZBMt+B8eG+8kL6yhFWRP1OiZyxxqgIG04xCyMaBhgoDw4rpmDAal1d9t459Ac5SH
	 T7FXM5+nSB0jYdhZTLo31IdE7SB+RghmlE4ys3ZGpPSA/sv6b9cu0fR9sZcW+LLT4X
	 F/wGmSh/AxnEuakZsr7pe0fT9KVyvRexuf5QKRYpjFPNv76jMruuDrgO5bW2m9lAnp
	 L3F9YnZ4smPRugvULJM0GlPiR/FY18bHWqX4uZqIgOYNprMlmTBBH5pUvs2s+lDWxJ
	 BG3rEMUdIv5mPGJzpjd0+uh2Ods/zwKwL81BPm95/lMTa/ayWs9xbvRgW6wggUoNHf
	 I/j5E0HP35iNw==
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
Subject: [PATCH] ASoC: mediatek: mt8365: include linux/bitfield.h
Date: Sun,  8 Sep 2024 22:17:34 +0000
Message-Id: <20240908221754.2210857-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_131803_301044_BEB4F35A 
X-CRM114-Status: UNSURE (   9.21  )
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

On x86, the header is not already included implicitly,
breaking compile-testing:

In file included from sound/soc/mediatek/mt8365/mt8365-afe-common.h:19,
                 from sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:18:
sound/soc/mediatek/mt8365/mt8365-afe-pcm.c: In function 'mt8365_afe_cm2_mux_conn':
sound/soc/mediatek/mt8365/mt8365-reg.h:952:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
  952 | #define CM2_AFE_CM2_CONN_CFG1(x)        FIELD_PREP(CM2_AFE_CM2_CONN_CFG1_MASK, (x))
      |                                         ^~~~~~~~~~

Included it ahead of the field definitions.

Fixes: 38c7c9ddc740 ("ASoC: mediatek: mt8365: Add common header")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---

This started happening after I applied "ASoC: mt8365: Allow build coverage".
---
 sound/soc/mediatek/mt8365/mt8365-reg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-reg.h b/sound/soc/mediatek/mt8365/mt8365-reg.h
index b763cddc93db..4ebbb94ff02e 100644
--- a/sound/soc/mediatek/mt8365/mt8365-reg.h
+++ b/sound/soc/mediatek/mt8365/mt8365-reg.h
@@ -10,6 +10,8 @@
 #ifndef _MT8365_REG_H_
 #define _MT8365_REG_H_
 
+#include <linux/bitfield.h>
+
 #define AUDIO_TOP_CON0			(0x0000)
 #define AUDIO_TOP_CON1			(0x0004)
 #define AUDIO_TOP_CON2			(0x0008)
-- 
2.39.2


