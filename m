Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEC9C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 07:29:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 355FF23124
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 07:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 355FF23124
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+3SYkiGUJr+yDuNZ7n5gg9Nl1m0dlWN676p8kNEvQ9E=; b=wVzdv8KmtsARYG4CguaWdihXX
	0PFzv2ZGe/NrmP0iNSAOfXw48mbU2PNO5LqRWD6c70sZDhk96Btb824SC+oeOfT5+3WgoD454kMTZ
	VuHI4sfCoAPfANJCjn9ZRo+cpp6CJHJOzsWSi05j4EgFe7S8LKoNh5BxomBTeG0NLYFwCWgr+5O0n
	gp5fN6CmdXtiau0LgDGE/ZAWngpv5XrbjgoYiT7MFyc3hca+jG1r7dBp5yUnhYOW/V1258U5b9g+3
	Wqd6rA6gF5GuEy2NXhNy+teH2Yazwy4gaozU7HIoTlfbCVe08Y5demPqhJDwxpzWRRGp/mJXkFVVN
	uZwe7CDhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krc6q-00028b-L5; Tue, 22 Dec 2020 07:29:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krc6j-00026K-7R; Tue, 22 Dec 2020 07:29:22 +0000
X-UUID: 216dce039fc34d82b5a14d6580b25e6f-20201221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=thZuMole2Muf7YfptlmHmFAGVuqqglmdYMUHC1CPq48=; 
 b=nTemLHVa95JdKakUWIHe+xCSxVYg2obPK34iyzSnSGeKrGtG2bj4PZxCriVDMSbUqm+ERpSfQT3kCIUM3ZyjqvfUjlYXaGxHtMUlsFoKQXLTTHybKG4b480TQL1B+bBzmMDQRyzKZP5R3Ri1MEWnaX/C1HggHsLccWy4aK/Hb9I=;
X-UUID: 216dce039fc34d82b5a14d6580b25e6f-20201221
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1482617911; Mon, 21 Dec 2020 23:29:11 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Dec 2020 23:29:09 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 15:29:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Dec 2020 15:29:05 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 1/2] scsi: ufs: Fix possible power drain during system
 suspend
Date: Tue, 22 Dec 2020 15:29:04 +0800
Message-ID: <20201222072905.32221-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201222072905.32221-1-stanley.chu@mediatek.com>
References: <20201222072905.32221-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F0EAABB76E452A13F2540CD0F980F108AA7D99BB3014DC64699FA1307E8A9B912000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_022921_410867_0D3979DA 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently if device needs to do flush or BKOP operations,
the device VCC power is kept during runtime-suspend period.

However, if system suspend is happening while device is
runtime-suspended, such power may not be disabled successfully.

The reasons may be,

1. If current PM level is the same as SPM level, device will
   keep runtime-suspended by ufshcd_system_suspend().

2. Flush recheck work may not be scheduled successfully
   during system suspend period. If it can wake up the system,
   this is also not the intention of the recheck work.

To fix this issue, simply runtime-resume the device if the flush
is allowed during runtime suspend period. Flush capability will be
disabled while leaving runtime suspend, and also not be allowed in
system suspend period.

Fixes: 51dd905bd2f6 ("scsi: ufs: Fix WriteBooster flush during runtime suspend")
Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index e221add25a7e..9d61dc3eb842 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -8903,7 +8903,8 @@ int ufshcd_system_suspend(struct ufs_hba *hba)
 	if ((ufs_get_pm_lvl_to_dev_pwr_mode(hba->spm_lvl) ==
 	     hba->curr_dev_pwr_mode) &&
 	    (ufs_get_pm_lvl_to_link_pwr_state(hba->spm_lvl) ==
-	     hba->uic_link_state))
+	     hba->uic_link_state) &&
+	     !hba->dev_info.b_rpm_dev_flush_capable)
 		goto out;
 
 	if (pm_runtime_suspended(hba->dev)) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
