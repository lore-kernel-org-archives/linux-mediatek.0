Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F67C67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i1J16o8a/AiIgBIYW2eQoMmauzTJFPFFwzLx0A2U3Tk=; b=QcWZ763W0Ua67mDomT07Bpfg8H
	l344/TXektY/35cHzOOvcwEZ4STNEaAYzyBw1aFYB8lyDqgETPXm9MskMWG+e5awelD85sfhR7bls
	rNN61mbzQ32LroilwPCgO9QjIXQ0j7gv/QoIt3ggGSZJgz/8FnNDNK9d9YscjzEnL+8rJWXA556Pk
	WTiROZuZUOuuklktJFEeQw7pnQazxhMtPy+oim15YiOehzRwtLi3jhMWn33lgxxXSASHg3/jlwOv/
	jmKT5X2z3wwKEI98vvmOWK4jpc1+ONaD/XZxLdGqU9ndlv4LygDxyCudxAygA2j48Mq1ZG/y/Rcq5
	dadsDFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkjc-0000000Eygq-1xIJ;
	Mon, 08 Apr 2024 08:52:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkjZ-0000000EygN-0RoK
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Apr 2024 08:52:10 +0000
X-UUID: 44aabc84f58511ee96d5dfc950b7243d-20240408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=i1J16o8a/AiIgBIYW2eQoMmauzTJFPFFwzLx0A2U3Tk=;
	b=jKfh0WiCNQEfEfQMlSu3X9hQKqVM+6P8ju0ktY/u7mNZPJQbdz3GMc770e5eBU5ZZgp9VUuGu4FSBXbQ2My/ElS1NArr6hPOC4A9b/VpdWfpFwVkkUgXFW/FHwjWeylsBiRJ8f+q49xLTjpDfn1gR2OQyHmqDssls0qPSTgGVHg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:dde0bb2d-a9b8-4ca8-872b-4c618632ac1c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:9a36cf00-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 44aabc84f58511ee96d5dfc950b7243d-20240408
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <joe.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 387799752; Mon, 08 Apr 2024 01:52:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 8 Apr 2024 16:31:25 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 8 Apr 2024 16:31:24 +0800
From: Joe.Zhou <Joe.Zhou@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, "Peng .
 Zhou" <Peng.Zhou@mediatek.com>, "Sophie . Wang" <Sophie.Wang@mediatek.com>,
	"Wey . Zhang" <Wey.Zhang@mediatek.com>, "Yijian . Jia"
	<yijian.jia@mediatek.com>, "Sharp . Xia" <Sharp.Xia@mediatek.com>, Joe.Zhou
	<Joe.Zhou@mediatek.com>
Subject: [PATCH] mmc: race condition between "sdcard hot plug out" and "system reboot"
Date: Mon, 8 Apr 2024 16:31:29 +0800
Message-ID: <20240408083129.10973-1-Joe.Zhou@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.893800-8.000000
X-TMASE-MatchedRID: ap0A7F3ACGmvVT6bfkFW/ocU/ASc4KydJD5ItWH4fSKUvX/ci5TjsqP6
	lEvEjaSAqvr4KXCXxhMNdZsOPCvd7LuIV2AVynTksyNb+yeIRAohpWQUitAWG5kd+ko3Vgxl8U1
	60P1TrZB8lDLz8Vr1zLZMGUUyuIF5lwV2iaAfSWcURSScn+QSXt0H8LFZNFG71sULACB0qRK3w0
	zYp5paHBWWQc7nMyfajmf1aTSVjafGaSwoCc44AzgimdyLHn0XlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.893800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C168F5B7E52570B8D53C927A26F7F4F5AE96964151EEE345049876363B2010762000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_015209_179105_2C025927 
X-CRM114-Status: GOOD (  11.02  )
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

In mmc driver, a race condition may occur between "sdcard hot plug out" and "system reboot".
How it happen?

sdcard hot pulg out:                SyS_reboot:
CPU0                               CPU1
mmc_sd_detect()                    _mmc_sd_suspend
{                                  {

......
#Step1: detect SD card removed
if (err) {                          ......
    #Step2: host->card is NULL
    mmc_sd_remove(host);
                                    #Step3:_mmc_sd_suspend claimed host
                                    mmc_claim_host(host);
                                    #Step4: use host->card(NULL pointer)
                                    if (mmc_card_suspended(host->card))
                                    ......
                                    }
    mmc_claim_host(host);
    mmc_detach_bus(host);
 }
 ......
 }
we can prevent it occuring by add claim for "host->card = NULL" and add "host->card" validity check in mmc_sd_suspend.

Signed-off-by: Joe.Zhou <Joe.Zhou@mediatek.com>
---
 drivers/mmc/core/sd.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
index 1c8148cdda50..38c0b271283a 100644
--- a/drivers/mmc/core/sd.c
+++ b/drivers/mmc/core/sd.c
@@ -1593,7 +1593,9 @@ static int mmc_sd_init_card(struct mmc_host *host, u32 ocr,
 static void mmc_sd_remove(struct mmc_host *host)
 {
 	mmc_remove_card(host->card);
+	mmc_claim_host(host);
 	host->card = NULL;
+	mmc_release_host(host);
 }
 
 /*
@@ -1702,18 +1704,19 @@ static int _mmc_sd_suspend(struct mmc_host *host)
 	int err = 0;
 
 	mmc_claim_host(host);
+	if (host->card) {
+		if (mmc_card_suspended(card))
+			goto out;
 
-	if (mmc_card_suspended(card))
-		goto out;
-
-	if (sd_can_poweroff_notify(card))
-		err = sd_poweroff_notify(card);
-	else if (!mmc_host_is_spi(host))
-		err = mmc_deselect_cards(host);
+		if (sd_can_poweroff_notify(card))
+			err = sd_poweroff_notify(card);
+		else if (!mmc_host_is_spi(host))
+			err = mmc_deselect_cards(host);
 
-	if (!err) {
-		mmc_power_off(host);
-		mmc_card_set_suspended(card);
+		if (!err) {
+			mmc_power_off(host);
+			mmc_card_set_suspended(card);
+		}
 	}
 
 out:
@@ -1729,7 +1732,7 @@ static int mmc_sd_suspend(struct mmc_host *host)
 	int err;
 
 	err = _mmc_sd_suspend(host);
-	if (!err) {
+	if (!err && host->card) {
 		pm_runtime_disable(&host->card->dev);
 		pm_runtime_set_suspended(&host->card->dev);
 	}
-- 
2.18.0


