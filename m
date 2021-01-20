Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9135AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 01:26:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98AC5206B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 01:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98AC5206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+VxOpm5/08T81gqK20BgsR1SMBzvDGpumUpc4wCzPoE=; b=KOBnSbSp8+WzJ1+7MNT+UySWF
	zxyxMCkbvSYXsfR+kNwC7al2lsh6CFev3wMEJbVtUfKxT0oAow+EP2x8IiMF9bLt0F4WF7OtM92Xn
	WqMjjlO+RkNdZQIpr2JFYAe464UKSQOSgRIgIom3+bwqXQr2Gee8TF6toNOy0KpsPl1E8IvJ62eKY
	QkIZOZCV23huru1ICapMcPCyhBgjJ5TSahUjxhSBfnJd+PRyRy6vBiAxOZ79ggux0/6v6WtgCsZ6j
	Tfm8WF03mUbZCny1M9BS5a/AiUnm4gunMhgdOR1ddZPaLjSIN0KL2xsUgZF6FiooRxgdu2m88cBHJ
	mkOwWYacg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22GK-0002hu-K3; Wed, 20 Jan 2021 01:26:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22GG-0002gg-Ov; Wed, 20 Jan 2021 01:26:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B05B23137;
 Wed, 20 Jan 2021 01:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611105974;
 bh=kIiqZT07QAhNej8L6TLFgKeIFuu/Q7XuyWxPXs0BqQU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nv6/qtRk0fah0BuFN6r+/aKIVcmYxaFxmQLDLkn06tZCyxv4a0C+qeIVDTvgJXETu
 4l9q3xFsCEVJASwdjU+yYUoQ9uqYDDv6qmUKIc4aTftRop57lp1naKGVdDblkpljyG
 f+rkr9lNxc4oV0C5ZJx/ZEN4BEdjx4k2rFyPvLkeKbn67T+2fBukIJbe/9TRXRmOUz
 gmAVeksAr1ASQmtNFJ22wodfsXEKQMjsZdmRdtR+BmRO1m5RMvrgxPxr+7rRAZ34R/
 jhnUMF+FlrDKPlXu57jdgm3lrX7cuAfAJ0kk6CqGEc646apPNboK5GxK/QI14efndF
 eRAghLmTBfyjw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 09/45] scsi: ufs: Relax the condition of
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
Date: Tue, 19 Jan 2021 20:25:26 -0500
Message-Id: <20210120012602.769683-9-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012602.769683-1-sashal@kernel.org>
References: <20210120012602.769683-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_202616_887401_CFB78B01 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org,
 Can Guo <cang@codeaurora.org>, linux-mediatek@lists.infradead.org,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Stanley Chu <stanley.chu@mediatek.com>

[ Upstream commit 21acf4601cc63cf564c6fc1a74d81b191313c929 ]

UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL is intended to skip enabling
fWriteBoosterBufferFlushEn while WriteBooster is initializing.  Therefore
it is better to apply the checking during WriteBooster initialization only.

Link: https://lore.kernel.org/r/20201222072905.32221-3-stanley.chu@mediatek.com
Reviewed-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 7558b4abebfc5..cc0aebf54b079 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -283,7 +283,8 @@ static inline void ufshcd_wb_config(struct ufs_hba *hba)
 	if (ret)
 		dev_err(hba->dev, "%s: En WB flush during H8: failed: %d\n",
 			__func__, ret);
-	ufshcd_wb_toggle_flush(hba, true);
+	if (!(hba->quirks & UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL))
+		ufshcd_wb_toggle_flush(hba, true);
 }
 
 static void ufshcd_scsi_unblock_requests(struct ufs_hba *hba)
@@ -5353,9 +5354,6 @@ static int ufshcd_wb_toggle_flush_during_h8(struct ufs_hba *hba, bool set)
 
 static inline void ufshcd_wb_toggle_flush(struct ufs_hba *hba, bool enable)
 {
-	if (hba->quirks & UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL)
-		return;
-
 	if (enable)
 		ufshcd_wb_buf_flush_enable(hba);
 	else
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
