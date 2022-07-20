Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142F5C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 01:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uxQ1mlubOijCpqX8MqrSkTrHy8pFnXPadfzl4cw+iI=; b=L2QfsL8tl4QRFx2QajsuJKI20W
	3I9PmxQZ0oes99F3B7XiH1+7nq0OgafdWdoa6WflOJbkVs/zt0Uw7h0a+OoMfvILn6SqNaZIRIWvK
	qvKT9h1Q4rhdQmWqpWdGJTXnqKtzqGsLFvmmQdQM9HdSkjXe2ELaGbtp5a1VDWAmXqMUdDtrJRhEf
	iW6DO5HpHPohNX0IDeKsNLEnJV27U4fZR1AF3ZrGhxzy+ZxNH1wNPFzCapnOOICzT2s4W/gJs9s24
	0z/EN5Igv20tcQf6sNzSWKAUfPy12gd1zDmojNGixWkFT7bRykrqE7Z3bRIF2xbH7Yu1NK7dNwuzX
	JEw6Zyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDyKE-00FUTG-Jy; Wed, 20 Jul 2022 01:16:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDyJs-00FTit-JC; Wed, 20 Jul 2022 01:16:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 167E661800;
	Wed, 20 Jul 2022 01:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1C1C385A9;
	Wed, 20 Jul 2022 01:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658279767;
	bh=sEl4qH64NgMI4EgpkCU53pw0i4nw6pt6UDHxRme/ow0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fo2HmYE8IzmHOtL5gzQIB36UuvCY4hn+cCti3/7TGYOL6bky4duRNf+AdRaU2Bac7
	 4MsMZUt5WmhE248jJ86OD7deS8y3tvhGzyWxxeyFu38D6HzkurDHymVE49dI/O9CxI
	 GvhPJzNUBt+TOL6Uxr7pGNsbWn1h/RkDUBbRTcw7P92U+AJCyTekShrwVBCp2P2yaS
	 jLt0M2pKvG+BMDm+5rqk1ZBdj6QZHrBm2fsNFLbUb/NYMSS6NP7Ev/Ix4aA7UOV35j
	 54d02T/8vID0UseZUvp+jVXPw5QDz3a+nK/NopERaNlxeLxyH/i56L+VxV7Y83V3uc
	 wb24vom1ZjcpA==
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
Subject: [PATCH AUTOSEL 5.15 38/42] scsi: ufs: core: Fix missing clk change notification on host reset
Date: Tue, 19 Jul 2022 21:13:46 -0400
Message-Id: <20220720011350.1024134-38-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011350.1024134-1-sashal@kernel.org>
References: <20220720011350.1024134-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_181608_737998_698D5165 
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
index 5c9a31f18b7f..a2eb54d51418 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -7060,7 +7060,7 @@ static int ufshcd_host_reset_and_restore(struct ufs_hba *hba)
 	hba->silence_err_logs = false;
 
 	/* scale up clocks to max frequency before full reinitialization */
-	ufshcd_set_clk_freq(hba, true);
+	ufshcd_scale_clks(hba, true);
 
 	err = ufshcd_hba_enable(hba);
 
-- 
2.35.1


