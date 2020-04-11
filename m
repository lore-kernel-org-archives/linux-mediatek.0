Return-Path: <SRS0=Ks85=53=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2541EC2BB86
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2020 23:24:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF7CD2051A
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Apr 2020 23:24:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MTYY4Srz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGBqIBLK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF7CD2051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJavaXDyUhL3ImO+klsSOVAkRLK0I3zqlgAlKZB6C04=; b=MTYY4SrzxTpfE5
	6MjHj3rEg7QEW0YqqchmWFNMmK6lc8xV5a9Sizrw//Bne/S4RgrQwBky9Qb5wT85EOpK+iAS2nlX7
	FNBtFX24aoY3C973S2lw238b6whMzWUBVVt/0W8NZ9iwpkgCQQWzOLcrtuq4n3tR535xed4AvBWap
	y4A/+vDDx901UObGW2Be6Va9O90MHdFxCtpbUWZqvB+Ynn2agVPxFa0ToB92Bx1qJvx2Df7j8Yah0
	7rWdsI8O/ag1x44zYIp9vKsitImWCMdvCnp1JK4RwP+8+6ESMAhI45Dbbij/S7qxJGsG0X4Z6qVpr
	GvbHgk5MljYPtI+bQZ3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNPTu-0007Iq-MN; Sat, 11 Apr 2020 23:24:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNPLB-0003TX-3n; Sat, 11 Apr 2020 23:15:11 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F42D20757;
 Sat, 11 Apr 2020 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646907;
 bh=4MNDq5JIfNUOVoGypVOfJ3S7koSKgHGx/rT77mOia/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EGBqIBLKIjxLCr1uGTkkzOTVguoEbt5ITYqhBETodNHFjFkqClTF51xY1ZIJfxRVN
 H1vdUvmxx7eAbkMYYykJBb4yBR0Dt62KtGIr94eC9ei0qfgUr2tDeixxLIx2dlbuzo
 Ka2B+iiZzZObDOnYiSA45k3zozzc47LDzi6VGk/M=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 16/16] scsi: ufs: Fix ufshcd_hold() caused
 scheduling while atomic
Date: Sat, 11 Apr 2020 19:14:46 -0400
Message-Id: <20200411231447.27182-16-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411231447.27182-1-sashal@kernel.org>
References: <20200411231447.27182-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200411_161509_380112_A9557B8F 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Asutosh Das <asutoshd@codeaurora.org>, Can Guo <cang@codeaurora.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Stanley Chu <stanley.chu@mediatek.com>, Hongwu Su <hongwus@codeaurora.org>,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Can Guo <cang@codeaurora.org>

[ Upstream commit c63d6099a7959ecc919b2549dc6b71f53521f819 ]

The async version of ufshcd_hold(async == true), which is only called in
queuecommand path as for now, is expected to work in atomic context, thus
it should not sleep or schedule out. When it runs into the condition that
clocks are ON but link is still in hibern8 state, it should bail out
without flushing the clock ungate work.

Fixes: f2a785ac2312 ("scsi: ufshcd: Fix race between clk scaling and ungate work")
Link: https://lore.kernel.org/r/1581392451-28743-6-git-send-email-cang@codeaurora.org
Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 19f82069c68ac..bc7f8d634c805 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -595,6 +595,11 @@ int ufshcd_hold(struct ufs_hba *hba, bool async)
 		 */
 		if (ufshcd_can_hibern8_during_gating(hba) &&
 		    ufshcd_is_link_hibern8(hba)) {
+			if (async) {
+				rc = -EAGAIN;
+				hba->clk_gating.active_reqs--;
+				break;
+			}
 			spin_unlock_irqrestore(hba->host->host_lock, flags);
 			flush_work(&hba->clk_gating.ungate_work);
 			spin_lock_irqsave(hba->host->host_lock, flags);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
