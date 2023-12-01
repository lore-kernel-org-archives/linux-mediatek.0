Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FAFC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 03:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V6tB0+EPwP58rkLDk+28AFubYUauyeii7M29/hehUYs=; b=N6nP5ZwCJavQewkEp64aoZwlaR
	/MpBs1FOfFDUeHvgnEG4ZCG7dypQ9L8BGqFIWGeDQa5BSfIb9SBeHsE4NnJcdlMUffVo8rDGq3n/y
	bqT8vkHx2ii+42TCoIdJwBg26oaZrL4tyGhcPdNzcrdC3MOQOTtwLvRQP0RHqK/jhj927BXUhRYcJ
	fNGDjUylNMGfbmh+cmDUfzYuhV8afOE8BxaobBYDiorolKheCtAuQO4953JoOy47CH2Le578vHCIE
	YnmPTZ+m6la6bRqB2O99UlklKFs6CzGyEhTQoBvtuhorSupjYEbfnYkVBiILz66tfhhDolvsX010D
	9AX0EvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8tqt-00CU4x-33;
	Fri, 01 Dec 2023 03:06:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8tqq-00CU3o-2D;
	Fri, 01 Dec 2023 03:06:01 +0000
X-UUID: 8b264e028ff611ee86758d4a7c00f3a0-20231130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=V6tB0+EPwP58rkLDk+28AFubYUauyeii7M29/hehUYs=;
	b=EUXqhj3uGctZF3i91gdn8mOboWsOnN6J6tyIByRU+WKNYkL4ecVR+03r4CFLodOSgzyoBY1aSL3fCI4NQvAtxJbi+sZ/+qj47FRlmGkSKno1ZpdaHHSy4iNnRBLuo7br753QWL9t2aUqLwTaxmfE7fndrBHEftMlxM/sBeGuHBU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:c6b8a7d0-152c-4b93-a758-2aaae9c0a181,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:abefa75,CLOUDID:6fb228fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8b264e028ff611ee86758d4a7c00f3a0-20231130
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1909760605; Thu, 30 Nov 2023 20:05:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Dec 2023 11:05:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Dec 2023 11:05:51 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <ulf.hansson@linaro.org>, <chaotian.jing@mediatek.com>,
	<matthias.bgg@gmail.com>, <mengqi.zhang@mediatek.com>,
	<wenbin.mei@mediatek.com>
CC: <yangyingliang@huawei.com>, <adrian.hunter@intel.com>,
	<avri.altman@wdc.com>, <vincent.whitchurch@axis.com>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [v1,1/1] mmc: core: Add HS400es support in retune and initialization flow
Date: Fri, 1 Dec 2023 11:05:47 +0800
Message-ID: <20231201030547.11553-1-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.374400-8.000000
X-TMASE-MatchedRID: u+tUW9pLem+E9zgVMk3pXlz+axQLnAVBesw8RnBRGwos/uUAk6xP7COq
	qvcT7F2IzPzCmwZdi63lN7ZYHc5mSoHcC7KYYAdE4pdq9sdj8LW6hgVvSdGKo9+SMh5eC/5eX9O
	/HRQux9fi8zVgXoAltsIJ+4gwXrEtwrbXMGDYqV+i5u/VvsFaHVKff8AdaJ4QWCFsQ87yaDPHOM
	6xNrBNq9wOJnkbFuha6cT8eWH2891TL0wCs6Mukdps4qxiIeUJBloh3ZuLeBtvBeUWxunLtaMnT
	JRI0XInfXwUEm1ouDzLDYxFC1/7rn6GdNk4NWmA
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.374400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 55110CD927814B2C0F23ADD29D1383873685FB918AEEA5574DE1D7E2BCFF1A092000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_190600_737922_4B67B243 
X-CRM114-Status: GOOD (  14.32  )
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

In HS400es mode, when we enter mmc_retune(), we will be forced to
the HS400 mode instead of HS400es mode. So we decided to add support
for HS400es in the mmc_retune() process.

Additionally, during the initialization to the HS400es stage, add
hs400 tuning as an optional process.

Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
---
 drivers/mmc/core/host.c | 11 ++++++++++-
 drivers/mmc/core/mmc.c  | 10 +++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 096093f7be00..4bddbbb3d539 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -179,7 +179,7 @@ EXPORT_SYMBOL(mmc_retune_release);
 int mmc_retune(struct mmc_host *host)
 {
 	bool return_to_hs400 = false;
-	int err;
+	int err = 0;
 
 	if (host->retune_now)
 		host->retune_now = 0;
@@ -194,6 +194,15 @@ int mmc_retune(struct mmc_host *host)
 	host->doing_retune = 1;
 
 	if (host->ios.timing == MMC_TIMING_MMC_HS400) {
+		if (host->ios.enhanced_strobe) {
+			if (host->ops->execute_hs400_tuning) {
+				mmc_retune_disable(host);
+				err = host->ops->execute_hs400_tuning(host, host->card);
+				mmc_retune_enable(host);
+			}
+			goto out;
+		}
+
 		err = mmc_hs400_to_hs200(host->card);
 		if (err)
 			goto out;
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 705942edacc6..9760eea2c104 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1823,7 +1823,15 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
 		if (err)
 			goto free_card;
 
-	} else if (!mmc_card_hs400es(card)) {
+	} else if (mmc_card_hs400es(card)) {
+		if (host->ops->execute_hs400_tuning) {
+			mmc_retune_disable(host);
+			err = host->ops->execute_hs400_tuning(host, card);
+			mmc_retune_enable(host);
+			if (err)
+				goto free_card;
+		}
+	} else {
 		/* Select the desired bus width optionally */
 		err = mmc_select_bus_width(card);
 		if (err > 0 && mmc_card_hs(card)) {
-- 
2.25.1


