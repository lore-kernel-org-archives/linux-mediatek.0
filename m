Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8D5CD1296
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 13:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nfaX76Rg7Uw2+FYK3+ErTxdylcZvj9Ul0mHJhjv5kTY=; b=YzLi3lVW/l6WicP5mLnOE2AhUK
	bNCM3X+kVqGcMVlSJhc2JAy1e2ANqO7vXjHjiYRooJZ0vo2bfqFRCHLTAp8P9nW8Fql3TK4cUCE4K
	jT5c8nBNSo9x+oaxdQN2z+GgOTWdsTG4aQgZhQ/yS10IdZh3I2vVDOIgtA3KuyBq1XXupKxpDTn/M
	EphbFyw82uyqDO5IME5ITUUa2kceYQRUR3EeGiRxSabBXdPVeMTIP1YYJXOGcFIJmEzqCd+MxUzza
	TmKxGUk8xjiMMQqUjfjhMjtYbSrHow5GAgBrF1eSsRY6K/K66k5EpN69YL36viIgPrD4sxvEXfjY4
	7YHh3JLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtSJ9-0000000CbyT-1OvC;
	Sun, 07 Apr 2024 13:11:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtSJ3-0000000Cbvl-4539;
	Sun, 07 Apr 2024 13:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1BC560C19;
	Sun,  7 Apr 2024 13:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE7AC43394;
	Sun,  7 Apr 2024 13:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712495492;
	bh=P+UxFT2T+w1OLW0wC5WPBqcbH06FUbYSjIraon1J7KI=;
	h=From:To:Cc:Subject:Date:From;
	b=W7qkFHHVCfVNU5GQS1Cyl2lYtfz0NFAbiPvTW4HhNo5LkUmj3ycQwqaoWDVTLOKpF
	 0DWoZFJSgI5IM3TESMQuPWwbAVi4R3X9CCRaQnD5/N/O0TntFl5cA85V7iMLdpYKXC
	 Z4nSwetza6/O/5F6edQs1rkTS5dgbgapJCvP11oOrsQtlYs0l/+lCfKHFSooK52wXk
	 OaNDllYUSs2hxIYPqmIY8J5KPzVCOOj9XhgpEtcco93pcoTR9M9PzIZQwL/aGCMKYx
	 qz66bSBhhD+WMdUfR8wTU8sikbODA6GGxW5JcmF+JVPBaIGLmSoN9K055ABWcBSd1c
	 i5jZu/HimXa5Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rohit Ner <rohitner@google.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Can Guo <quic_cang@quicinc.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bvanassche@acm.org,
	stanley.chu@mediatek.com,
	quic_nguyenb@quicinc.com,
	powen.kao@mediatek.com,
	alice.chao@mediatek.com,
	yang.lee@linux.alibaba.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.8 01/25] scsi: ufs: core: Fix MCQ MAC configuration
Date: Sun,  7 Apr 2024 09:10:49 -0400
Message-ID: <20240407131130.1050321-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.4
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_061134_112647_BA277673 
X-CRM114-Status: UNSURE (   8.92  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rohit Ner <rohitner@google.com>

[ Upstream commit 767712f91de76abd22a45184e6e3440120b8bfce ]

As per JEDEC Standard No. 223E Section 5.9.2, the max # active commands
value programmed by the host sw in MCQConfig.MAC should be one less than
the actual value.

Signed-off-by: Rohit Ner <rohitner@google.com>
Link: https://lore.kernel.org/r/20240220095637.2900067-1-rohitner@google.com
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufs-mcq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 0787456c2b892..c873fd8239427 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -94,7 +94,7 @@ void ufshcd_mcq_config_mac(struct ufs_hba *hba, u32 max_active_cmds)
 
 	val = ufshcd_readl(hba, REG_UFS_MCQ_CFG);
 	val &= ~MCQ_CFG_MAC_MASK;
-	val |= FIELD_PREP(MCQ_CFG_MAC_MASK, max_active_cmds);
+	val |= FIELD_PREP(MCQ_CFG_MAC_MASK, max_active_cmds - 1);
 	ufshcd_writel(hba, val, REG_UFS_MCQ_CFG);
 }
 EXPORT_SYMBOL_GPL(ufshcd_mcq_config_mac);
-- 
2.43.0


