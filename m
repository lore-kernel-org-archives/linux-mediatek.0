Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F09C19F2E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2025 13:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WF+WnuoEAmqiMqKkWFSdlb/we8IR4F2IFUrpx+PjxVw=; b=RRUCNLfyhsdswe8fl+uzcltB9t
	RU/p8Gq0YNvar7Tn6ASmSekN1ROwGw23Z+RvWpouRR/QndR7vHv84PcutoW2sUQeDa1BNB0n/0tJx
	TRgaCMwpRoVXL3XN/71d6/HtW+lttw6jrFG349rnm+uAmFvXPKUzRCtXR7Rkp3Pxaqw4RYUmPedBF
	UpeytduGsvhY/YS7iR+XuuLsUkXHlWpuR668M3w+2/WyDpw8ccyP0i7xvT4N1qnapyb1bxY+qgb4r
	brb1jqwD9rZfmSLjkyh2WTpKG6djeX1fWcr8M9lUBStK6xlSv/VCrMEaNMoQz8wiXPgbbJ6Bo2FJI
	BoEtj/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndwG-00000007X8n-3Gxu;
	Thu, 27 Feb 2025 13:28:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tndnm-00000007UzP-47Q0;
	Thu, 27 Feb 2025 13:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 772255C5884;
	Thu, 27 Feb 2025 13:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C302C4CEE7;
	Thu, 27 Feb 2025 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740662386;
	bh=nW5BiIn0YY0mTP99cWvGx5b/yVrftP8IeddADOYqBGs=;
	h=From:To:Cc:Subject:Date:From;
	b=YUzIF0swFxoup6z6QOJJrcJn1JjDsL6QInSriI61Pf/0VegFMk6tDcJT1zJEJkTFo
	 ed+CujGahHYepR+8jK4o/1IVlTdEpgpbAlhQRFfixz0Hr4zLaWVBQre3YrbPqO85Aj
	 HS9TjEuWpdL8aKMDXb5kdlTGtxqdVUMRFTFr2a2frvxby8vNaDhkgzDVHFeM7YGiUg
	 F4hlXpVB2bS/GOhqUPYp5iRjDqzaoYPwfx97C9GyFYYxoNRtSoGag4QxCvHsmVnAm4
	 CAX20iulNsI/YyQ1JgXYr7OBm8eNDQjuhs5VIufCY8tx9buHuA2jvZz+Baxfd4EY4G
	 /KXk10eol7QCw==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	parkeryang <Parker.Yang@mediatek.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8188: avoid uninitialized variable use
Date: Thu, 27 Feb 2025 14:19:01 +0100
Message-Id: <20250227131939.1040168-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_051947_072393_1983F212 
X-CRM114-Status: UNSURE (   9.15  )
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

The 'msk' variable has no initialization:

sound/soc/mediatek/mt8188/mt8188-dai-dmic.c:311:4: error: variable 'msk' is uninitialized when used here [-Werror,-Wuninitialized]
  311 |                         msk |= PWR2_TOP_CON1_DMIC_FIFO_SOFT_RST_EN(i);
      |                         ^~~

Set it to zero before the loop.

Fixes: c1e42ec04197 ("ASoC: mediatek: mt8188: Add support for DMIC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/mediatek/mt8188/mt8188-dai-dmic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c b/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c
index 4cfbcb71d2d9..adcea7818be2 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c
@@ -307,6 +307,7 @@ static int mtk_dmic_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		/* request fifo soft rst */
+		msk = 0;
 		for (i = dmic_num; i >= DMIC0; i--)
 			msk |= PWR2_TOP_CON1_DMIC_FIFO_SOFT_RST_EN(i);
 
-- 
2.39.5


