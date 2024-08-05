Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE21C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Aug 2024 17:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HZRyWuQrZPOf6zR+8zMXRcTfho0ZIMqAqbn5d3hPW4=; b=vL/xf5Mmft008g3LrshwMW0NMG
	CH9zzO+7Z3+cGkkSicgd8X8pVt4U9oQDXgdmxHshckpP9YBX8eezxfDkkdlPacltq7Lipc1Baez3L
	h3ZJ+71qtR10pJM5wH71OS+BSzP0mwYrDAa5sskQNuhblxzdL+UZoodH7hVJIyK8CIwoEpY7kKQ06
	PRGldVT7Jnxq5YrO9IQPqie4zFBearoyew58Cq+e+76ISLtXVc22QIaOoTk1bOepB7UMoZsc7Gt5Y
	RRt/pPaG+jzR640Ndj0elbR3G8sX1TntXiiXvs/mSg8f69Fn7+jcQwXdVQa6mcyrsupGIhN18ZR2/
	Cp3oYfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb1zM-0000000Gmba-02Pg;
	Mon, 05 Aug 2024 17:59:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb1yn-0000000GmQ7-2aUV;
	Mon, 05 Aug 2024 17:58:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8FE6DCE0B79;
	Mon,  5 Aug 2024 17:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CA7C4AF0B;
	Mon,  5 Aug 2024 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722880722;
	bh=bIZe5Jvq1zs/7HsxziOkORbDxZYEuv1y3vFfSPzIUpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YHsKDxgqWZhJdABtZ5fNwO23z2dRDO1b/pp94rkJO6l2ZqFHd+FILt+5zmwF+kAcy
	 Ir7vImLmyL/iG7LFSArULYA8wjOYBRxysfmjItk5hiB5+cvf4N0AMM6yBZuxSWo0c4
	 RUt4bdbUnU83XERJyBb0i9bezyRaT9SagW3M4xH/vu0R5NhHVdIWFywGAJliPvnnn2
	 Q0ZXJG9r7HXR9zNkYALQ9jofzrPYUB3WPFg4U9HPN0M1JQ8wq3fRG2+xy4grSkuKAk
	 5F3M7dybcdvvll57R1VuQNlSj5aTk3eGbQvnO1nm5gjn06tDdLwW198FDI0x7Sx0x2
	 x9sc6BGQw3vVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Wang <peter.wang@mediatek.com>,
	Bean Huo <beanhuo@micron.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	James.Bottomley@HansenPartnership.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	manivannan.sadhasivam@linaro.org,
	avri.altman@wdc.com,
	ahalaney@redhat.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 2/5] scsi: ufs: core: Bypass quick recovery if force reset is needed
Date: Mon,  5 Aug 2024 13:58:25 -0400
Message-ID: <20240805175835.3255397-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805175835.3255397-1-sashal@kernel.org>
References: <20240805175835.3255397-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.103
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_105845_859728_32DD0777 
X-CRM114-Status: GOOD (  10.99  )
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

From: Peter Wang <peter.wang@mediatek.com>

[ Upstream commit 022587d8aec3da1d1698ddae9fb8cfe35f3ad49c ]

If force_reset is true, bypass quick recovery.  This will shorten error
recovery time.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Link: https://lore.kernel.org/r/20240712094506.11284-1-peter.wang@mediatek.com
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 5922cb5a1de0d..aba1f239099c2 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6302,7 +6302,8 @@ static void ufshcd_err_handler(struct work_struct *work)
 	if (ufshcd_err_handling_should_stop(hba))
 		goto skip_err_handling;
 
-	if (hba->dev_quirks & UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS) {
+	if ((hba->dev_quirks & UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS) &&
+	    !hba->force_reset) {
 		bool ret;
 
 		spin_unlock_irqrestore(hba->host->host_lock, flags);
-- 
2.43.0


