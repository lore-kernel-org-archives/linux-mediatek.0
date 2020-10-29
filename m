Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022F7C55178
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:59:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 761DC20796
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:59:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WxNnHGgV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G3J5aB+R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 761DC20796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cE2pmUO3je3SUiyVOjCzStphoyD3gS6+J9jCMUE9fAk=; b=WxNnHGgVo+wDSrLAoFCWH58QV
	4zqZKKC/zTVnVJNGG/7i7TkEeJ0Jpf/EfHeE7lXv2j6V1t4zi1iNXjtRYMh9fv7vxihdjzMDo/9ZY
	ma1G9fLIL5pPWfzChcLg5Y8ruXu/iDkyfHuXKXCn4BQii8JH1cl1JeV3wuowCTpN2c1uYdJzVBRiJ
	DOW+Z2WbfPjWk8pgjZ5SdhoMX8o0+a4+otu8knyh1Rqgva8Nrqjy+HnHiHkg5IJ8HQKuopXVE05Dk
	QQ4pGNilXGYEmbyVdNCxS1BRDl9lRDMU7XftrxHWqN77Q7PE0CVacplbcQpQvIECjQ2j4ueVOVSM/
	f0ZE6duOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY6al-0006DV-CR; Thu, 29 Oct 2020 11:59:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY6aE-0005xV-TS
 for linux-mediatek@lists.infradead.org; Thu, 29 Oct 2020 11:59:14 +0000
X-UUID: cc5886ffbec0431d908feff81b661069-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=w81tqkNi8KcOCSO6o9TBab5iqr6LPY1HHHGmMqfxeO8=; 
 b=G3J5aB+RGC+u4v9nbdL7YFjWk5X8tUNypVJIXeECWfr0arEBSnEjKgjXMxcyCVWhHPk9kSdlBl/PFKCXQHbQ3ZwmIluJjaKT7S5q9NR6c1r6h18/uioxXb+F6rdw6QfDzQNtac7BUo7qFBoitqppnDjKdPCe6RsphL6zRzgjsWg=;
X-UUID: cc5886ffbec0431d908feff81b661069-20201029
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1051826521; Thu, 29 Oct 2020 03:57:54 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 04:57:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 19:57:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Oct 2020 19:57:51 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 4/6] scsi: ufs-mediatek: Support option to disable
 auto-hibern8
Date: Thu, 29 Oct 2020 19:57:48 +0800
Message-ID: <20201029115750.24391-5-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201029115750.24391-1-stanley.chu@mediatek.com>
References: <20201029115750.24391-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_075911_264482_D863A76C 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 jiajie.hao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support an option to allow users to disable auto-hibern8 feature.

Instead, enable hibern8-during-clk-gating feature to keep similar
power consumption.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 18 ++++++++++++++++++
 drivers/scsi/ufs/ufs-mediatek.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index fa7d0e4eeb0d..dda028ec30dc 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -158,6 +158,7 @@ static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
 				     enum ufs_notify_change_status status)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	unsigned long flags;
 
 	if (status == PRE_CHANGE) {
 		if (host->unipro_lpm) {
@@ -169,6 +170,17 @@ static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
 
 		if (hba->caps & UFSHCD_CAP_CRYPTO)
 			ufs_mtk_crypto_enable(hba);
+
+		if (host->caps & UFS_MTK_CAP_DISABLE_AH8) {
+			spin_lock_irqsave(hba->host->host_lock, flags);
+			ufshcd_writel(hba, 0,
+				      REG_AUTO_HIBERNATE_IDLE_TIMER);
+			spin_unlock_irqrestore(hba->host->host_lock,
+					       flags);
+
+			hba->capabilities &= ~MASK_AUTO_HIBERN8_SUPPORT;
+			hba->ahit = 0;
+		}
 	}
 
 	return 0;
@@ -496,6 +508,9 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 	if (of_property_read_bool(np, "mediatek,ufs-support-va09"))
 		ufs_mtk_init_va09_pwr_ctrl(hba);
 
+	if (of_property_read_bool(np, "mediatek,ufs-disable-ah8"))
+		host->caps |= UFS_MTK_CAP_DISABLE_AH8;
+
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
 }
 
@@ -609,6 +624,9 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	hba->caps |= UFSHCD_CAP_WB_EN;
 	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
 
+	if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
+		hba->caps |= UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
+
 	/*
 	 * ufshcd_vops_init() is invoked after
 	 * ufshcd_setup_clock(true) in ufshcd_hba_init() thus
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 0e76429f69d6..30f45dfce04c 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -96,6 +96,7 @@ enum {
 enum ufs_mtk_host_caps {
 	UFS_MTK_CAP_BOOST_CRYPT_ENGINE         = 1 << 0,
 	UFS_MTK_CAP_VA09_PWR_CTRL              = 1 << 1,
+	UFS_MTK_CAP_DISABLE_AH8                = 1 << 2,
 };
 
 struct ufs_mtk_crypt_cfg {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
