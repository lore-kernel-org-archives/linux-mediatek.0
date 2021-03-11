Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C08C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 00:49:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 097C464FBA
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 00:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 097C464FBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BWTFWEBThSdKAuw8aq8oD4iD1UhXbOk20zNYm0rKR7w=; b=CO2MeFqjcnH0Cs/hQoa+0BivEQ
	tU+veLnluHlZmJex8gvlnzoWjYJp9HIrIan03DOixacTcsgZs1R2ydWl6EFNilQdkUYnZEaNJ0nNF
	4FQJTkUbeKzik2i3jFFcH7NF8VehpSd7rAkvujL7E3liZI/GCh1CoiS1lqeBEFpRsKN9vqtuL/3Le
	i7MwUjheg7yg8kTWHF9wl8hcKBrZsFd3L9Zv4/OPHcSrufWw6GGvBOwKM+91SsGboUnZk7xsvq1T4
	ey564IeOcqlIL+jnU2KT52p+WXoD5h0Gkg9QDKQkfGl/RKaD4AnlTeokSJLs83RnKRHFLziJ43gbG
	iN892LhQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK9W6-0087BP-Iw; Thu, 11 Mar 2021 00:49:30 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK9Vv-00878H-2B; Thu, 11 Mar 2021 00:49:21 +0000
IronPort-SDR: MYdk6s0Bnbq5vX+i4TD0uKyNnXnjZqet6FGBeHHznoEJEtdVwVyjy7xAcx2eit19WHQCG3qki7
 EP0C74UoCbTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="167865528"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="167865528"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:14 -0800
IronPort-SDR: hDjsuncF8llssoUHAl8uU/QMI4xyFcq7TAK8JfSQYqi+YH2A1WFKueuFGF3ERBxayd/b+aD6Ze
 W/XcEmU17a3A==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370386779"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:13 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 0/4] ASoC: mediatek: remove cppcheck warnings
Date: Wed, 10 Mar 2021 18:49:00 -0600
Message-Id: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_004919_612667_21BF6755 
X-CRM114-Status: UNSURE (   6.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There should be no functionality change, this patchset only fixes
shadowed variables, prototypes and removes a useless assignment.

Pierre-Louis Bossart (4):
  ASoC: mediatek: mtk-btcvsd: remove useless assignment
  ASoC: mediatek: mt2701: align function prototype
  ASoC: mediatek: mt2701: rename shadowed array
  ASoC: mediatek: mt8173: rename local irq variable

 sound/soc/mediatek/common/mtk-btcvsd.c            | 2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h | 4 ++--
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c        | 4 ++--
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c        | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
