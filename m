Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A78CD11C2
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nfaX76Rg7Uw2+FYK3+ErTxdylcZvj9Ul0mHJhjv5kTY=; b=pRn79pBOTchm1UQYvCduKSW1Uu
	PruhRk2E7tiBBI/FKWRnrOEeaPCh4PVO8MBZ2LkbQHlfzDFdXaaIB83S63lwogQxUsUgyNKdGABbN
	++xjzW9PrDrzTkVlhh19sIVoLnS7C9Q8A4bU5SzGe2AkfCcoD0odbz6hPn2VGpQOyNi03G7LlWrPP
	YLRO6IHDCytOqiS6rufUCRV2SVFjvei9wdXyYgIGhgd/YT3CZZd521q1G0IglEgiM7L37U2j3zOwg
	/oAVLtPG2gND4qf7kp84HR38upGmZwygldcvMB59c66FYt/JGUnVu4wWMGjM3AHfzpvW+35a1szDm
	ojyQEZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtSK8-0000000CcP8-0khq;
	Sun, 07 Apr 2024 13:12:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtSK3-0000000CcMS-3n4M;
	Sun, 07 Apr 2024 13:12:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 457FDCE0AB2;
	Sun,  7 Apr 2024 13:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905E6C433C7;
	Sun,  7 Apr 2024 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712495553;
	bh=P+UxFT2T+w1OLW0wC5WPBqcbH06FUbYSjIraon1J7KI=;
	h=From:To:Cc:Subject:Date:From;
	b=jUMsHp7HiCirZgTedL+MgIMEU4AIO5sAL0KDd1myHtGa+joFPzPAS/2unAYOBZEVR
	 4YUoxFQF7YJ0LFI//1HWelZm/9nuey6da7ym3LO6EYJ45fWKQwBTBMOrfmyFFyru2g
	 SJqrDi+xgfQE9Tp2oDeSB1DTIBqfgQdVWfIcbggDYXfPQgjTKRgLSoKI028f4jYCer
	 FQZ/p5RreICN2HS5h/6040gMH0RwO/NHqvFHxdz5vrL/dy0AsYsjex2p8RlodcysTF
	 Kd/Ef0cu4Y+uIJAzT/jsT3axKhcbIqIhh+xVtiv6W/PHco5c7lVnu/JTH8z0Js/hA1
	 Vg6H7MpOMsXkA==
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
	powen.kao@mediatek.com,
	quic_nguyenb@quicinc.com,
	alice.chao@mediatek.com,
	yang.lee@linux.alibaba.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 01/22] scsi: ufs: core: Fix MCQ MAC configuration
Date: Sun,  7 Apr 2024 09:12:00 -0400
Message-ID: <20240407131231.1051652-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.25
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_061236_174815_22C1DC09 
X-CRM114-Status: UNSURE (   9.02  )
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


