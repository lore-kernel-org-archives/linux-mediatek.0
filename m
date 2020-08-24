Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A44C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 16:39:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0006522CBB
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 16:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v1AsZA6/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Zmmxo1av";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="L338VFWq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0006522CBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+DOPJrCZmzVIeHcHyE11IOZig/ea5oh2Vtg9lgOAa6E=; b=v1AsZA6/PHDZNXTSf2XgJpw0u
	mHgkdwIOHweYR7uoJvI5SI4j9/N42CCSIf24ilPOTtEJQvoexWwoSLiTuIKNI8HDlmg+MKmN8QV54
	HvYMgNxDlWWiMcxKKiJChuf+vcbZcc9rN9N/5kdV7JCighOmy5xkcDK5FKqbB4+LwsIWOzlVC/0I6
	/wo9w3mWZvnpHZuzdfdz/ZZ8fpEe0GWHMu9ulaHQ22ttaccgzvMT/9WmvlYDuWoARs+tYcCrYcsEx
	pCteKatQRI+azxuFnU7eOF4RNsVLWuaDbWvU4fb9TD1qLzpPLfOpqUqhYaWrkn+12qn1LjWsaNbHG
	d8Y/a9yQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAFVE-0001Q8-LR; Mon, 24 Aug 2020 16:39:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAFSu-0000JN-0U; Mon, 24 Aug 2020 16:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Gh+SqVJmYl+iuLOJwLjyZh/jFJGgRn6wMNweB5KW2bM=; b=Zmmxo1av33erxWmyG5ErcFgK6u
 SamxQPjQ/JNofV8LcugwLiODjGfhJWbFmHBos+/+ihhbtltbwdPTDYHN1/vQCaNB0J1//Q+UxufI+
 qzAIiVvjajXhwCL22xGv6DIJ/0phnLCx6STFv+zaT1RWkJIv6G9RqHnYZcf607tBLa8j4X9Oatzd/
 vw7u3Nqw7zuP6XLhkxLB9n2V6PRe3v459KDweUYJZI56+3GmSn1UQ6E5JPa+jIq3PjAZYEy8com4y
 vd8Wu5mYgCaEQTlPE+LujT6ADGDnU3CpGeuh9+lSXvdDfekanVRs5tMDr4bn4bdNnVZSxbAtd+8bz
 VgMeEeQg==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAFS2-0000YC-T6; Mon, 24 Aug 2020 16:36:11 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 065D422D02;
 Mon, 24 Aug 2020 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598286957;
 bh=iko1cVkcks4eJF/tsESV//trlKvUBqx6xMAyNEqxTXA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L338VFWqta5F5fsolrg/d8jgXb+KZxfXQlyEkHkjFDQTgiqo5LZkxAEpQMyuk9k9Q
 AbDhlCmtPXZ+Z2p2HvNOd0LXOKi1S8oNTz6LnOi3Je2Qsun4DouAOl10miqrQNSIvy
 P+nrs9L6oHVa0VX3KxPet9EIP14DFEIXSmlyOmLo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 39/63] scsi: ufs: Fix possible infinite loop in
 ufshcd_hold
Date: Mon, 24 Aug 2020 12:34:39 -0400
Message-Id: <20200824163504.605538-39-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824163504.605538-1-sashal@kernel.org>
References: <20200824163504.605538-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_173607_211014_39332F33 
X-CRM114-Status: GOOD (  13.57  )
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
index e412e43d23821..8185ab3b41c9b 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1557,6 +1557,7 @@ static void ufshcd_ungate_work(struct work_struct *work)
 int ufshcd_hold(struct ufs_hba *hba, bool async)
 {
 	int rc = 0;
+	bool flush_result;
 	unsigned long flags;
 
 	if (!ufshcd_is_clkgating_allowed(hba))
@@ -1588,7 +1589,9 @@ int ufshcd_hold(struct ufs_hba *hba, bool async)
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
