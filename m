Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A1EC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 00:50:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D4AD64FC0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 00:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D4AD64FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v8ZWa74MAUNpYvXByEiR4WYbE0AEmI9fQ14niakJNfY=; b=TKKfziAyuOol5qyIT+emJ6uDb
	xWyuGWvONk8dlKdJtb2AO8NNBI2cHnEP/uSz8Z/Qee4Uxy0XHL28oOr4bfKYo3ywrG1NB95Wtl8m+
	RuykM7HQEuUTzaM8sn4mxX9rkXty8H/Sj3pTnlq22IqztOHYPqSuJMdkJV8YlVtuu17W8NCj995cA
	UiXjLOsA+qm5y9Wy2WYDeeZjJp4Bc9lRwUeF+QBOsiA3Tcn6C23o/041EcHtUg9kRru/Fwxlff3HJ
	xWzrR8IOtKFF1yzq6E4ziNo6UC9mRygL6CsnlhwurwQZoETBGmTiQkNcFk2KNZ0rd0xvJrOF7uXwo
	eWvQyIiRA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK9WW-0087HK-4R; Thu, 11 Mar 2021 00:49:56 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK9W0-0087A0-Gu; Thu, 11 Mar 2021 00:49:26 +0000
IronPort-SDR: h3dqx+b/SkExFptUmusRjpEo7yXWW+WMd3o5GbeVAgkRbVOR4d5Ik+EM/LIb3MVsuWe7CCj06Q
 9LbzTOpA+hqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="167865540"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="167865540"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:22 -0800
IronPort-SDR: BhKoyhXtdGKV5O1zd6/K9C7KxhHwbj9vnaXtmqYZmIkYx82BA/1XRFhC/c5asRys56K22Q4GZQ
 wV2iI0dMK3Dw==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370386802"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:21 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 3/4] ASoC: mediatek: mt2701: rename shadowed array
Date: Wed, 10 Mar 2021 18:49:03 -0600
Message-Id: <20210311004904.121205-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
References: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_004925_304157_4E4B1BEB 
X-CRM114-Status: GOOD (  12.96  )
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

sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:406:36: style: Local
variable 'memif_data' shadows outer variable [shadowVariable]
 const struct mtk_base_memif_data *memif_data;
                                   ^
sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:977:41: note: Shadowed
declaration
static const struct mtk_base_memif_data memif_data[MT2701_MEMIF_NUM] = {
                                        ^
sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:406:36: note: Shadow
variable
 const struct mtk_base_memif_data *memif_data;
                                   ^
sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:431:36: style: Local
variable 'memif_data' shadows outer variable [shadowVariable]
 const struct mtk_base_memif_data *memif_data;
                                   ^
sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:977:41: note: Shadowed
declaration
static const struct mtk_base_memif_data memif_data[MT2701_MEMIF_NUM] = {
                                        ^
sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:431:36: note: Shadow
variable
 const struct mtk_base_memif_data *memif_data;
                                   ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index d5cffe7a7e15..bc3d0466472b 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -974,7 +974,7 @@ static const struct snd_soc_component_driver mt2701_afe_pcm_dai_component = {
 	.resume = mtk_afe_resume,
 };
 
-static const struct mtk_base_memif_data memif_data[MT2701_MEMIF_NUM] = {
+static const struct mtk_base_memif_data memif_data_array[MT2701_MEMIF_NUM] = {
 	{
 		.name = "DL1",
 		.id = MT2701_MEMIF_DL1,
@@ -1366,7 +1366,7 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < afe->memif_size; i++) {
-		afe->memif[i].data = &memif_data[i];
+		afe->memif[i].data = &memif_data_array[i];
 		afe->memif[i].irq_usage = -1;
 	}
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
