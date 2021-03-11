Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F61C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 00:49:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29D1D64F7B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 00:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29D1D64F7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YW4XggfAzithLsecrFGCeaeylX0DxJBTudiBiwN+KA4=; b=oSAcPbNEkVYU8ZUH2zDiSDIP9
	6pTXzedzyEA4TTU0UvYE2Cv3VmPlByJJiAUK2FEG9Un0ryl/BnwrwfeB2+Oks8VJvriyuWdnazOVJ
	cKCCiXzs6Nkn/FMt5PWbxvINOghp4VEtQ+vdnj/0hVOGuDGrTu3xxW6DgCKjYRmLpSL53SLeoWVBm
	IfU2Z9YzzAcFybBH5lg6xHGfUq8/zwaqjnaU2vGCncFZtoW6+HbNTeJtcwArJWE8h3y0PlmTN4sir
	vk6HwTnzxgG3jzmV1v5gk5qzIvKjdV1kOkzAugX9J68iehewifBvDMWDA+x6qVzbpQh0iMI9eXfBq
	a9Od7LRpQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK9WE-0087D2-BS; Thu, 11 Mar 2021 00:49:38 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK9Vv-00878h-Pe; Thu, 11 Mar 2021 00:49:21 +0000
IronPort-SDR: kNTZ/cwbWIpLdV+WyxuhEQrL8KMFmAbCTk2Ziav+53YZy1GaFcBodKcLTDpaSR0+jiTeP40pQE
 GQjSkIydd68Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="167865532"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="167865532"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:18 -0800
IronPort-SDR: J9Y1cPxBOqkMSqBlXVxAyMKHdXz3bOTZ6QWhFCYOJFXIkotC51XUhFBTXSIS5uELwiYy1VkrGk
 BC79uQFsu+/g==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370386789"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:16 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lumi Lee <lumi.lee@mediatek.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 1/4] ASoC: mediatek: mtk-btcvsd: remove useless assignment
Date: Wed, 10 Mar 2021 18:49:01 -0600
Message-Id: <20210311004904.121205-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
References: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_004920_267933_518BE41E 
X-CRM114-Status: GOOD (  11.11  )
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

sound/soc/mediatek/common/mtk-btcvsd.c:783:34: style: Variable 'avail'
is assigned a value that is never used. [unreadVariable]
 int written_size = count, avail = 0, cur_write_idx, write_size, cont;
                                 ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index a554c57b6460..f85b5ea180ec 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -780,7 +780,7 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 				    char __user *buf,
 				    size_t count)
 {
-	int written_size = count, avail = 0, cur_write_idx, write_size, cont;
+	int written_size = count, avail, cur_write_idx, write_size, cont;
 	unsigned int cur_buf_ofs = 0;
 	unsigned long flags;
 	unsigned int packet_size = bt->tx->packet_size;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
