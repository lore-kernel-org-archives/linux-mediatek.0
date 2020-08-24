Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1FCC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 17:51:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C94520639
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 17:51:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xc3ETvQE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WonHz26W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C94520639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KRCGNvS5e18xIRpCCLZRuCKwSlcRb2/JuXAJZ7jGZ1E=; b=Xc3ETvQEYwxY4G+tWmUOGGsoi
	5PFceXSumLIyPBGDupmJw8No6/qs/mESfHd1preQeIiXLKDCIKEvV+PilG5R9Owsr9WivqxCsSUBv
	+YYD6YhWd7MCxttLOkp29MRdR0wJPCboWTyb3aRfjIKCQYb/NsaHQz/oqArgxFxxzhtrm0nP7+sDG
	rVzwQgKTzxGs0NBR8vHfsPEZKD029TlL9gpr1/noD2OmXMze7OMC6DWCbzSnYLZUk9AArwQ6THRN1
	5VoIpaz+8xwanR0jBxIZGNELMvkhumUxFRAKB1mKx6SbsE1EiLveuq78CBVRjNT70LKVZKuhDHxMQ
	28LyyJhwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAGdQ-0003cJ-02; Mon, 24 Aug 2020 17:51:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAFVG-0001QM-2Z; Mon, 24 Aug 2020 16:39:27 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D892422CE3;
 Mon, 24 Aug 2020 16:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598287164;
 bh=icKIwklffOVx9xPkO2wT86iWiVJSw3jCrvwcdN73xcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WonHz26WruM/AsJtA/5Ve+dqQmllTbbJMGXWw14nDg4DXeUq/mekNTTwqplLGKIRp
 xEckeWuEQXBSU/uoCoHguR71DUxLT7v2JpOUiQVhBULH+CjZP5h2kazc7iRMPYwUxZ
 oM8vMRcw3FREOvtuS4SMGC1+awkc5bmbZsyv9tqM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 07/11] scsi: ufs: Fix possible infinite loop in
 ufshcd_hold
Date: Mon, 24 Aug 2020 12:39:10 -0400
Message-Id: <20200824163914.607152-7-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824163914.607152-1-sashal@kernel.org>
References: <20200824163914.607152-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_123926_351785_DB279958 
X-CRM114-Status: GOOD (  14.29  )
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
 Andy Teng <andy.teng@mediatek.com>, Avri Altman <avri.altman@wdc.com>,
 linux-mediatek@lists.infradead.org, Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Stanley Chu <stanley.chu@mediatek.com>

[ Upstream commit 93b6c5db06028a3b55122bbb74d0715dd8ca4ae0 ]

In ufshcd_suspend(), after clk-gating is suspended and link is set
as Hibern8 state, ufshcd_hold() is still possibly invoked before
ufshcd_suspend() returns. For example, MediaTek's suspend vops may
issue UIC commands which would call ufshcd_hold() during the command
issuing flow.

Now if UFSHCD_CAP_HIBERN8_WITH_CLK_GATING capability is enabled,
then ufshcd_hold() may enter infinite loops because there is no
clk-ungating work scheduled or pending. In this case, ufshcd_hold()
shall just bypass, and keep the link as Hibern8 state.

Link: https://lore.kernel.org/r/20200809050734.18740-1-stanley.chu@mediatek.com
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Co-developed-by: Andy Teng <andy.teng@mediatek.com>
Signed-off-by: Andy Teng <andy.teng@mediatek.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 1e2a97a10033b..8144a54371c35 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1423,6 +1423,7 @@ static void ufshcd_ungate_work(struct work_struct *work)
 int ufshcd_hold(struct ufs_hba *hba, bool async)
 {
 	int rc = 0;
+	bool flush_result;
 	unsigned long flags;
 
 	if (!ufshcd_is_clkgating_allowed(hba))
@@ -1454,7 +1455,9 @@ int ufshcd_hold(struct ufs_hba *hba, bool async)
 				break;
 			}
 			spin_unlock_irqrestore(hba->host->host_lock, flags);
-			flush_work(&hba->clk_gating.ungate_work);
+			flush_result = flush_work(&hba->clk_gating.ungate_work);
+			if (hba->clk_gating.is_suspended && !flush_result)
+				goto out;
 			spin_lock_irqsave(hba->host->host_lock, flags);
 			goto start;
 		}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
