Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AA7C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 01:59:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21AF622229
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 01:59:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lq0v4Un5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="isCpelr4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21AF622229
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGpSWqUVDhJ8kQG5ti5/psf0bSZ1a5GbHyLosjdC3mE=; b=lq0v4Un5ERQ43V
	Om+UU3HyHMMKtOkmh7bAxZAai9ksJGE/vu5R3s3l5CR5eJPnLzjft/mhNcFzjctpW82YPCek4KbnT
	aShCJmfaI+e1KQ2ffMsZBVYpm7DGM6K2juEqkVFYlLvvXUdN/y64QyOL3eJtIqt6BzAKfqJRO/E2g
	qiqK75P7WpKROssx+LO1Kb6vBey2UNvRlY24jnRpNlQZUo9Jto3DnsKYJzt1bJN6crLT6sQTZsI72
	sNqX+Wsk4V/goBIbaqIn34oNB81LGkwPH0LwXD4RjGZp/em9mFmRw2MXGs8I3TTAVF0ChDL1jY3yO
	jyquy7ObSmaYdyv9iUYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jljpN-0003UG-El; Thu, 18 Jun 2020 01:58:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jljIr-0001Ke-OW; Thu, 18 Jun 2020 01:25:19 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 144CE2075E;
 Thu, 18 Jun 2020 01:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443517;
 bh=b54IEHmFz7bmWQszzKimOy7e6xhMHWb9MYvGLvxm254=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=isCpelr4kq4myJdI3J3gIXGWqo73fVydZ4NyRaMfLLqod+itkaD0+KZY6y86floct
 mkmfM7iJU/CcjKXIt5R17Mxd/3zxSBuBFgtAwdPsgT/AHB+JwVY0qe8QFlr57I3oqG
 yrbMYh2nbuNMrnSYEKCYJRzGNsWXq9qqS5Sn82Uc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 140/172] scsi: ufs: Don't update urgent bkops
 level when toggling auto bkops
Date: Wed, 17 Jun 2020 21:21:46 -0400
Message-Id: <20200618012218.607130-140-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012218.607130-1-sashal@kernel.org>
References: <20200618012218.607130-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_182517_956305_2E97B696 
X-CRM114-Status: UNSURE (   9.56  )
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
 Can Guo <cang@codeaurora.org>, linux-mediatek@lists.infradead.org,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Can Guo <cang@codeaurora.org>

[ Upstream commit be32acff43800c87dc5c707f5d47cc607b76b653 ]

Urgent bkops level is used to compare against actual bkops status read from
UFS device. Urgent bkops level is set during initialization and might be
updated in exception event handler during runtime. But it should not be
updated to the actual bkops status every time when auto bkops is toggled.
Otherwise, if urgent bkops level is updated to 0, auto bkops shall always
be kept enabled.

Link: https://lore.kernel.org/r/1590632686-17866-1-git-send-email-cang@codeaurora.org
Fixes: 24366c2afbb0 ("scsi: ufs: Recheck bkops level if bkops is disabled")
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 803d67b3a166..bd21c9cdf818 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -5122,7 +5122,6 @@ static int ufshcd_bkops_ctrl(struct ufs_hba *hba,
 		err = ufshcd_enable_auto_bkops(hba);
 	else
 		err = ufshcd_disable_auto_bkops(hba);
-	hba->urgent_bkops_lvl = curr_status;
 out:
 	return err;
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
