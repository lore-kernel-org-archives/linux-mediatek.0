Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C285C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 05:50:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF3C923A63
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 05:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF3C923A63
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W6nWKy5Q9qeO8V+G/ZxsuoXJycDD4PKlFBZI7EHqYK0=; b=o/NvoRjoV2WITEm/omL8M1fs6r
	2v8hv4lfInhlbPbRtrsfEvnExR+tUv59q0vRzQP5Yrp0tc3XJ5yXN5aIfQA/3fS3ZIxNTZ1tJz343
	fCeoLjNbDjE9bXPlQd6DRIWWiXmQH2oj0PStDZi9Fn8M8ZJzRahoiBkzkNNMFcVTU7euMNb4fzQvz
	QpgJMfWpdgZ6BtJeNy22EksZ8wjoJhZ3+UYxoVqGRnPm4FkqCcnBgj7W5e5UqNKUjLIZrUNDfVw1l
	PT9r27jwfZ/fvo0zcy5YnHdQf9K/6zsPQudfEYXQw8HzirDzzZaLx/924K22PChJhV7NtapetaK5Y
	7okR0mGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmVss-0007tq-Ke; Tue, 08 Dec 2020 05:49:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmVsn-0007tH-L3; Tue, 08 Dec 2020 05:49:55 +0000
X-UUID: 1782b116692a446f8a7f2a870f5fbfb2-20201207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+ZgTMF9/72i3UHEWTWoct9XbkMWHILBD/xFJC2Q533I=; 
 b=rNkZUrZFZl8Kp/Iob9BLeWZLpVaR5s9hc6BBJ38vePS09gwmVIJ/6SBSUEkXULMeZizyFVWzyHUgpZqWg7Kr9F0A7uHRfYnC9SFXJR91q/Ddn9mHuXc7wAdBrUz3d8vLjaWwzsqaT95hiQNYWGIY/nd8v3ClFc9kkHtYGbj0rBc=;
X-UUID: 1782b116692a446f8a7f2a870f5fbfb2-20201207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2007556661; Mon, 07 Dec 2020 21:49:47 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Dec 2020 21:49:44 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Dec 2020 13:49:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Dec 2020 13:49:42 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1] scsi: ufs: Ensure WriteBooster to be re-enabled after
 device reset
Date: Tue, 8 Dec 2020 13:49:40 +0800
Message-ID: <20201208054940.1855-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: EE9471868BCE6F5EBDE13344911B30D28E13E0E7A3F5D3E610102976C6D9DA642000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_004954_469251_B29965C5 
X-CRM114-Status: GOOD (  11.19  )
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

UFS 3.1 specification mentions that below WriteBooster flags will be
set to default value, say disabled, after power cycle or any type
of reset event. Thus we need to reset those flag variables kept
in struct hba to align the device status and ensure WriteBooster
related functions being configured properly after device reset.

Without this fix, WriteBooster will not be enabled successfully
by ufshcd_wb_ctrl() after device reset because hba->wb_enabled
remains as true.

Flags required to be reset to default values:
- fWriteBoosterEn: hba->wb_enabled
- fWriteBoosterBufferFlushEn: hba->wb_buf_flush_enabled
- fWriteBoosterBufferFlushDuringHibernate: No variable mapped

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 7a7e056a33a9..c22887bee788 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -1218,8 +1218,11 @@ static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
 	if (hba->vops && hba->vops->device_reset) {
 		int err = hba->vops->device_reset(hba);
 
-		if (!err)
+		if (!err) {
 			ufshcd_set_ufs_dev_active(hba);
+			hba->wb_enabled = false;
+			hba->wb_buf_flush_enabled = false;
+		}
 		if (err != -EOPNOTSUPP)
 			ufshcd_update_reg_hist(&hba->ufs_stats.dev_reset, err);
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
