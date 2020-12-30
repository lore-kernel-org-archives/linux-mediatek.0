Return-Path: <SRS0=HztP=GC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADE4C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Dec 2020 15:44:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96BA420725
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Dec 2020 15:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96BA420725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k6dh/LyDjl6P06RkXgCOWG2To+1EZdxPbxNRUK8vybY=; b=jYamrBnot7TFNIZnWTLTdM1vCS
	K82B7pCebasZZxg/UIzA6jHylSUl0LCn6yKp2gOSpymMb/lEWaaFgm9yuWcTdG4iKXkcTuwvY3cq/
	vOvt/5BFlXsldAA9BcfKy615zkqbSGw7hphJZmTvAEPXqNj1cAF4RUzrlX/thh6+nKOvHNsRDbzeu
	nhYLPw9LPplU1AB+uBWseVfcKlhBijltAwQg+a0dCiy9SoHg6oW7AhbwA6xbpooi9tNfpoy2ISSaO
	vrvM5tc4ZpNFT8rS2TpwG+B3ojCIhWI/rHzGN2atbmthJJpQZQkvv0A5l+BUSrX9qN/wTSwU37U+5
	rIjea3cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuddq-00057B-0Z; Wed, 30 Dec 2020 15:44:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuddf-000555-E0; Wed, 30 Dec 2020 15:43:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4871021D1B;
 Wed, 30 Dec 2020 15:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609343030;
 bh=Dr9mLOW7dfuWMVS7lwdbQQhz8bsyb9ZknSWmQdtAQ50=;
 h=From:To:Cc:Subject:Date:From;
 b=pBY3tylFQvxqVhAaPPVFQMbq7vsGkynLjJ2rQxOAB0mcU8ct4N5wvdsEVCAttFypy
 AGsSpDqAV1abFnbgf/XgfjTmDMsiJocZolFIeb7Pro1rrDYC+kbsDYeM/DdrwAGnIK
 2D6uD0J6nWDcWRKXoNsikkmhiHoq8/d8hGlsgerxei3aSMwH9oPNMVIiU3x4z/JcJa
 71rrsftnWPirApCsts7sp889RZg8H3VkWoSn3q727UQIqDeOkrnhQcEmUavGxM6eT6
 KATY5Cu2nnu03RLafpxYqiJPFbiiDe2sja1nLRpUSCK/k3hPHE3G1Mb8MLQBPqspjC
 R0SMwOgQppTdg==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mediatek: add MTK_PMIC_WRAP dependency
Date: Wed, 30 Dec 2020 16:43:34 +0100
Message-Id: <20201230154345.639122-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_104351_582979_F30ABC9A 
X-CRM114-Status: GOOD (  12.18  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

Randconfig builds often show harmless warnings like

WARNING: unmet direct dependencies detected for SND_SOC_MT6359
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MTK_PMIC_WRAP [=n]
  Selected by [y]:
  - SND_SOC_MT8192_MT6359_RT1015_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8192 [=y]

Add a dependency to avoid that.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 8d3dcfb6a580..effdb76369e4 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -172,7 +172,7 @@ config SND_SOC_MT8192
 config SND_SOC_MT8192_MT6359_RT1015_RT5682
 	tristate "ASoC Audio driver for MT8192 with MT6359 RT1015 RT5682 codec"
 	depends on I2C
-	depends on SND_SOC_MT8192
+	depends on SND_SOC_MT8192 && MTK_PMIC_WRAP
 	select SND_SOC_MT6359
 	select SND_SOC_RT1015
 	select SND_SOC_RT1015P
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
