Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 01:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heeBRzG/xrluUNcy1T/+XPJKlXkdXgvizFTyB+yxNTw=; b=abnp6T9rYHDivkD1+8nuleT/d0
	+U4XJF3niidl+lOK1RLv8DjouIQgDLzDy3Fgb1njpp4PfVzcQfK1Zon7c7m5relUdT8QrsRtLctxv
	ChO8F1vW0iYxgWkiCxwsVLtzaG+J019PMmzarGwrYhmion1T1kAFHrjaglUI+gHJAYuXpqqI/iHtX
	ZCBaF/9nG/fQdhgtEhLKxFsabGFGxVetoflU390YMxBEvogOwlPJ+6YDSTy1xZib3NGdWoqA0Klem
	CxaVfRPkv3TGj/5DRv2R75SY7KpzPdVTMgDibvVRUAkr5RJE5FjInZaMplvxaDKabS7EJWFBS0FDR
	K7bxVMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDyHm-00FQmn-J7; Wed, 20 Jul 2022 01:13:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDyHW-00FQKC-92; Wed, 20 Jul 2022 01:13:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D81CE6173B;
	Wed, 20 Jul 2022 01:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C782CC341C6;
	Wed, 20 Jul 2022 01:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658279621;
	bh=hfXrYoJbZy3WFQVhswLlOQu9fJJYWOb3Bffj/Ux6OhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=npSDVP3/yIbq1ATdwxzSiyU7ay90Vg8/YnGMiQPl7Z6n7Bty25iw+9ic91ymcDFxG
	 Rabylkt9NoDcU2uqZ+S4RzuR0HYS9fGHuJwoiR0zLSN6hcve9B/TzWauO9SjUu0oK7
	 BOBiM//UGaIV1s0v5Lrv74dip208pcRqg/O4cftNWFovRnWVjzZ5tyDxyhioVB0xGR
	 cUNg4ZcVRwTHqyrIYw3/KDemND7t10pbOMPdFYFJiD/An86PnIzlCspFnhUag2s5uE
	 xalx5+pea9aGE8MEXBD5a+lgAWlvV6Q1xAvrt0oJ5aybwHGWhVOCc/3XHMSOTj6qn4
	 zTo4oyuD+1ADQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Po-Wen Kao <powen.kao@mediatek.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Stanley Chu <stanley.chu@mediatek.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	beanhuo@micron.com,
	avri.altman@wdc.com,
	daejun7.park@samsung.com,
	adrian.hunter@intel.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.18 50/54] scsi: ufs: core: Fix missing clk change notification on host reset
Date: Tue, 19 Jul 2022 21:10:27 -0400
Message-Id: <20220720011031.1023305-50-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011031.1023305-1-sashal@kernel.org>
References: <20220720011031.1023305-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_181342_493544_3CCDA3F7 
X-CRM114-Status: GOOD (  12.21  )
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

From: Po-Wen Kao <powen.kao@mediatek.com>

[ Upstream commit 52a518019ca187227b786f8b8ee20869a97f3af4 ]

In ufshcd_host_reset_and_restore(), ufshcd_set_clk_freq() is called to
scale clock rate. However, this did not call vops->clk_scale_notify() to
inform platform driver of clock change.

Call ufshcd_scale_clks() instead so that clock change can be properly
handled.

Link: https://lore.kernel.org/r/20220711144224.17916-2-powen.kao@mediatek.com
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 4c9eb4be449c..be7b03a90cb3 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -7235,7 +7235,7 @@ static int ufshcd_host_reset_and_restore(struct ufs_hba *hba)
 	hba->silence_err_logs = false;
 
 	/* scale up clocks to max frequency before full reinitialization */
-	ufshcd_set_clk_freq(hba, true);
+	ufshcd_scale_clks(hba, true);
 
 	err = ufshcd_hba_enable(hba);
 
-- 
2.35.1


