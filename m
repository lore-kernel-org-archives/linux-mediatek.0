Return-Path: <SRS0=kQJD=N7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DBEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 06:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E789611B0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 06:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E789611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bBMnCJaq5n88Caww/9D0YijFq31DMMsU0vTK4VSmcYg=; b=mlpSmPWrWDnsV/
	Zv6NKS/Sv2oHImGI+iSw20QWQNfUBSBHFrGwnZhxLJT/db4hqDfzTKzC2lQmE2cPOckN85AZV5q7a
	tqiG3BOjGPNctqcp/dpCI/H1klMrmMv38pbPt93JjOzF3ZjtNscqrzlPO7+rBNEt3RlzYTKw5aqNM
	m7MWIbfQ9rMpX2C/xXQAjJA7FTbnAc9V2REslFiq5g3vUBhzV4s3GCfjD/h5jKUgOvILv7mpzoLsq
	NZgRqc6bcp4bcj9Bx2Azxrk28vO8oZ68ZvQnDSgyhQhUouYPx03zq8Euw+7fWPop3d7x5gaN3UPWJ
	73LKURtpfAzRMV+xwH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mODyX-008O5M-AX; Thu, 09 Sep 2021 06:55:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mODyJ-008O1G-NQ; Thu, 09 Sep 2021 06:55:45 +0000
X-UUID: f3e1f4b5413c4f628c38d8dcd7c55dbd-20210908
X-UUID: f3e1f4b5413c4f628c38d8dcd7c55dbd-20210908
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 898539044; Wed, 08 Sep 2021 23:55:38 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Sep 2021 23:55:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Sep 2021 14:55:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 9 Sep 2021 14:55:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <rdunlap@infradead.org>,
 <geert@linux-m68k.org>, <wenst@chromium.org>, <bicycle.tsai@mediatek.com>,
 <jiaxin.yu@mediatek.com>, <shane.chien@mediatek.com>
Subject: [PATCH] ASoC: mediatek: add required config dependency
Date: Thu, 9 Sep 2021 14:55:33 +0800
Message-ID: <20210909065533.2114-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_235543_808959_1AAB2491 
X-CRM114-Status: GOOD (  10.34  )
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

Because SND_SOC_MT8195 depends on COMPILE_TEST, it's possible to build
MT8195 driver in many different config combinations.
Add all dependent config for SND_SOC_MT8195 in case some errors happen
when COMPILE_TEST is enabled.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
---
 sound/soc/mediatek/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a2f4667d50b..81ad2dcee9eb 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config SND_SOC_MEDIATEK
 	tristate
+	select REGMAP_MMIO
 
 config SND_SOC_MT2701
 	tristate "ASoC support for Mediatek MT2701 chip"
@@ -188,7 +189,9 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
 config SND_SOC_MT8195
 	tristate "ASoC support for Mediatek MT8195 chip"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on COMMON_CLK
 	select SND_SOC_MEDIATEK
+	select MFD_SYSCON if SND_SOC_MT6359
 	help
 	  This adds ASoC platform driver support for Mediatek MT8195 chip
 	  that can be used with other codecs.
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
