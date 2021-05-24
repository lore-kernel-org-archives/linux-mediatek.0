Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AFAC04FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 21:30:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027B4610CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 21:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027B4610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCodZKZwQxJCrSHTQx/XKPM9ezW7VUaq2OiMexNKGYs=; b=y4CN+SJPLHBD6v
	rAafbaa/j7leJQsgs318K1GBimIfct6ZHcYQWHEvelLKUHOSBNm6XxuWPa8uPIE5rGTw9unJfrnDu
	+1Urc7jzFJS47Vc48Cdbb9HhHMnDNc9+6nVnaW72eUWQw1y4NlGQ9tc1B2ktUqTphvbh3bDYhVro5
	KgDD+UlFbH7UDeWnim9NzfxNU7s39SiKhVw58i3tvqsnbWx7ZC9VFQdWn2ya3z/hqlgeGehj8hGof
	3ppUkew+9QPFzzuiRiTnMcfKVFlsKAov1SwIScLyf2v40Gvn8syoI74wL3TxBdY/8MRgSqL2xu2pm
	bgQyHe3oHQquLQVYHV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llI9U-001wvc-IF; Mon, 24 May 2021 21:30:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llBsm-0010Km-JK; Mon, 24 May 2021 14:48:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56AC76142D;
 Mon, 24 May 2021 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867720;
 bh=7+3A1Pukmv3Q1p12fd4IG939MkFyNpZf9mJ1LLh8o5c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J0COBcLreyL3+EI3AKAdAzDvU2UvJMJB8vfxDWAdJdd2TAfw49bEzuSvt4/2Nh4zu
 enBY3BLQ3gR+OWzsMYZcG8FnXKfPyl5W6JKVb/YsfzU10eXPIlO/WSWzPQF0w+z7FR
 lyNqL7zaj+r0bGqdAE/T2iOv3PKJTZHE7v4j2/95xqPqhrIQf1dgKyNSBW1Aq7oH0b
 bPsnJ2yuwBmyrOWo4f9F0o56gNIcJngNw6quewW38OqrYxKp/JDgq8UQ12lMqSL3c2
 FjUUeI0Gnl0UWuauYZh34dZ8yGfmRh/b352Tzp36+tB+JZFPO1VTNX0j9GwG6rL7Zz
 tsk6xs7FJ1PGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Wang <peter.wang@mediatek.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Sasha Levin <sashal@kernel.org>, linux-scsi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 45/62] scsi: ufs: ufs-mediatek: Fix power down
 spec violation
Date: Mon, 24 May 2021 10:47:26 -0400
Message-Id: <20210524144744.2497894-45-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144744.2497894-1-sashal@kernel.org>
References: <20210524144744.2497894-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_074840_676673_660EE91D 
X-CRM114-Status: UNSURE (   9.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

[ Upstream commit c625b80b9d00f3546722cd77527f9697c8c4c911 ]

As per spec, e.g. JESD220E chapter 7.2, while powering off the UFS device,
RST_N signal should be between VSS(Ground) and VCCQ/VCCQ2. The power down
sequence after fixing:

Power down:

 1. Assert RST_N low

 2. Turn-off VCC

 3. Turn-off VCCQ/VCCQ2

Link: https://lore.kernel.org/r/1620813706-25331-1-git-send-email-peter.wang@mediatek.com
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufs-mediatek.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 09d2ac20508b..aace13399a7f 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -824,6 +824,7 @@ static void ufs_mtk_vreg_set_lpm(struct ufs_hba *hba, bool lpm)
 static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	int err;
+	struct arm_smccc_res res;
 
 	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_lpm(hba);
@@ -844,6 +845,9 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		ufs_mtk_vreg_set_lpm(hba, true);
 	}
 
+	if (ufshcd_is_link_off(hba))
+		ufs_mtk_device_reset_ctrl(0, res);
+
 	return 0;
 }
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
