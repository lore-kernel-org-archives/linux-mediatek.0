Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEA1C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 00:50:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310B064FC0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 00:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 310B064FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qeBIG4VZjEcZZ7LmauuTQ0xdEyVBkUX0iUy5007EIHA=; b=TfpWiXMy79XkXVyij6yUUZHgK
	1uNiaARowPh51SMiIoaa/pJjudTY9gktiQmXbpZHx1WS4puRueNVwqobb3wpdfnKeQKgQ23q0cm58
	4/TzAay+34Syvw6nH4uPnaDyKZZH+wXaRo54fy29dO8QYsYD4QA/vMNMBABxYkbtuD58EBcCLfqRL
	nG7YLTPfnvxwF42qmkF0ia4xNSt/GQFqFSDYlTSieYyvncu1UHoyf05dV6UJlr8ijPVr4SiJQBCh4
	QvduiW4MShzr+0BQZ2SvaeNSudYaYGp43fMkg4C+sp9FXyRyCiQcbbNvvY0GXbGoYQFONVLl2K7Ps
	X7cK91O2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK9Wg-0087LE-8F; Thu, 11 Mar 2021 00:50:06 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK9W2-00878H-4T; Thu, 11 Mar 2021 00:49:28 +0000
IronPort-SDR: OElhUN1/ca8E1+XUtNVI8Df7EFN0FG5RYJPGeFDzZYQRYH2SRvbbSGxs0CPkf85B1oIWCuVXxx
 7VEF6Z9/JaKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="167865544"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="167865544"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:25 -0800
IronPort-SDR: FSbU1mY7rxBkyn+H5OVD7Y273ef/naAw+b1hkifbnAIIoIsy6sJoCNqQo/iLmPA3hbZZA4rijd
 rl09/87K6A6Q==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370386809"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:23 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 4/4] ASoC: mediatek: mt8173: rename local irq variable
Date: Wed, 10 Mar 2021 18:49:04 -0600
Message-Id: <20210311004904.121205-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
References: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_004926_673434_D644FE91 
X-CRM114-Status: GOOD (  12.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

cppcheck warning:

sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:929:28: style: Local
variable 'irq' shadows outer argument [shadowArgument]
  struct mtk_base_afe_irq *irq;
                           ^
sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:914:47: note: Shadowed
declaration
static irqreturn_t mt8173_afe_irq_handler(int irq, void *dev_id)
                                              ^
sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:929:28: note: Shadow
variable
  struct mtk_base_afe_irq *irq;
                           ^

Not a great idea to have two 'irq' variables in the same function...

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 685f4074b4e0..6350390414d4 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -926,14 +926,14 @@ static irqreturn_t mt8173_afe_irq_handler(int irq, void *dev_id)
 
 	for (i = 0; i < MT8173_AFE_MEMIF_NUM; i++) {
 		struct mtk_base_afe_memif *memif = &afe->memif[i];
-		struct mtk_base_afe_irq *irq;
+		struct mtk_base_afe_irq *irq_p;
 
 		if (memif->irq_usage < 0)
 			continue;
 
-		irq = &afe->irqs[memif->irq_usage];
+		irq_p = &afe->irqs[memif->irq_usage];
 
-		if (!(reg_value & (1 << irq->irq_data->irq_clr_shift)))
+		if (!(reg_value & (1 << irq_p->irq_data->irq_clr_shift)))
 			continue;
 
 		snd_pcm_period_elapsed(memif->substream);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
