Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B752C0219A
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Feb 2025 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9P7/wKz7LVAPwtYVbSKf70e789kM9BvyeB6cnxCHqgw=; b=BsSbmVbFB8h+2bIehYQCKiu040
	PEby0sn2VANMHK++qVMyzbF2bH69GIa9mjfVzM4iamJAacJdVwIQ1mh6ozGZZSjiiDbpj+uhGt0/b
	O2F38pd4QqgVhQkPbECayPfp05A1Rx0ZkhxxMnHU1eGP4ICpk+1J2XabIRw1VTwah2j+36Zxz+UJg
	u8BFFbBGhbQp2Nuz6kqTuzsNH+XGXOs3cFeaAF4AjDH2am3RRzvyhK2zTLI2qyiRiTGARykoBr2tl
	ABlBEGLcVxdhw+4rJRlbt/WRxZDFH2yCeuab7EWJLsEakjXlGCFSJa3Cx7pOHKRttQKMPqCxGNFFp
	V3DN1x1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLCF-00000000sWJ-280w;
	Tue, 04 Feb 2025 15:50:43 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfL0b-00000000qmm-00Lk;
	Tue, 04 Feb 2025 15:38:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738683517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9P7/wKz7LVAPwtYVbSKf70e789kM9BvyeB6cnxCHqgw=;
	b=uaTfxH0EoY8gZDNZu0+ATwtuZXuYWyK92npFC74jGNgWcNSAnqlP/1/C0vZSmcnO3qDWzS
	JjlesU2Dhf4Eir7+qSHye9860H3WIHA7RuRpvaAem4m/O3WdA3O7C9JziOGBXCDCWEZkdg
	/skAsoEpKBBLXHLjkG9jCSCcsj6JT/o=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: SOF: mediatek: Use str_on_off() helper function
Date: Tue,  4 Feb 2025 16:38:04 +0100
Message-ID: <20250204153806.3587-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_073841_175301_0FF54A98 
X-CRM114-Status: UNSURE (   8.73  )
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

Remove hard-coded strings by using the str_on_off() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195-clk.c b/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
index 7cffcad00f9b..2c2c4cd323fc 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/string_choices.h>
 #include "mt8195.h"
 #include "mt8195-clk.h"
 #include "../adsp_helper.h"
@@ -114,7 +115,7 @@ static int adsp_default_clk_init(struct snd_sof_dev *sdev, bool enable)
 	struct adsp_priv *priv = sdev->pdata->hw_pdata;
 	int ret;
 
-	dev_dbg(dev, "%s: %s\n", __func__, enable ? "on" : "off");
+	dev_dbg(dev, "%s: %s\n", __func__, str_on_off(enable));
 
 	if (enable) {
 		ret = clk_set_parent(priv->clk[CLK_TOP_ADSP],
-- 
2.48.1


