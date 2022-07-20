Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF18C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 01:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y693vVg+QzUXCnMl3j4rqyQbSng/5bEvbP2T56j2yv8=; b=pdZq0Nc5GlwHMWhbD/XJ4rqTZm
	KOm1En594XF/Cc3KwvgTnhNzv6ElsM92coQY53OeQWq/JSmh/SsTEsBYYXJVnjGoN6Y+sTm+b/m8Q
	rN5tXj8TXFw9p/pHsArLVp0mOjoiLQCW7CZwEcA3HF6v7KFS2zsFsXmz+1Hl6M6zE1x2lR9Z644P7
	7ENSgxH/qWbIzasZTL1b0nOJwhDk5t1r/NQ5iicryCnB0dDuIJoLrHRBhsWo/0Ds0RIKjF1BRgbr1
	mySBJMquYAU+x/sstzeaTVry+SG5IhoPGjVUfSyk/27cMUA6w0IqWvjUFsqVtlxlQHlcuV+PCXcRx
	Q3C9bdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDyMj-00FYMV-Un; Wed, 20 Jul 2022 01:19:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDyLA-00FVnq-5y; Wed, 20 Jul 2022 01:17:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8B763616F6;
	Wed, 20 Jul 2022 01:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFB5C341CA;
	Wed, 20 Jul 2022 01:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658279847;
	bh=hFKG1bbEtQeJKNkTd5Ayfh8yCS0l9VAbsfYnJ46IJkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ogsVYQE1RZG2FiisSriCDkLId2EPII8skQSlBkL84WztApDcXwRmW3Z0vuMUZAKEj
	 Xfok36FIy0oXIwR/ElTZ9abi7RAoByapueNbPMnrTtbZK+AZdDX/148kErLLz/B86C
	 03o4viqohWgHAnH2xUoW15cS0Mwc0p7rhtiadnrsq/uqneFRv4A8p1z2NBWdV5xa2a
	 j/9h+ClgydNvyfkZxEnBBrE/7eF0H/5QnFZIMfOjWhJPn4UAQOiJDevV8JufYOPmY2
	 F00+3ZhrQC8pu9PiGPt2fmc4oJ0MeBZXsOuULqPmOPQZl42ieDd8XMcxZnaTPWLN4H
	 vITdgx6LL511A==
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
	adrian.hunter@intel.com,
	daejun7.park@samsung.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 23/25] scsi: ufs: core: Fix missing clk change notification on host reset
Date: Tue, 19 Jul 2022 21:16:14 -0400
Message-Id: <20220720011616.1024753-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011616.1024753-1-sashal@kernel.org>
References: <20220720011616.1024753-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_181728_302978_B10FDB0B 
X-CRM114-Status: GOOD (  12.30  )
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
index ea6ceab1a1b2..ba14ac9b3914 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6824,7 +6824,7 @@ static int ufshcd_host_reset_and_restore(struct ufs_hba *hba)
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
 
 	/* scale up clocks to max frequency before full reinitialization */
-	ufshcd_set_clk_freq(hba, true);
+	ufshcd_scale_clks(hba, true);
 
 	err = ufshcd_hba_enable(hba);
 	if (err)
-- 
2.35.1


