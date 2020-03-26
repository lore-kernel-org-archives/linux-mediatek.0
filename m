Return-Path: <SRS0=woo5=5L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796EDC2D0E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 15:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4479720737
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 15:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BfzJn24p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="smdJJXAy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4479720737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFAMYnIqU9GKTW2tqd1mD4ked5R2x8S1SQ6l99fO8EA=; b=BfzJn24p3esfBA
	b/+zVzNgdCg6jhJ0pYuz5Y+QXqcaZOvHrn77dHepybvxfEpudRmu6yrLo6ttSfBpCK5tKzaURD5/s
	HpgS+ZqK5SkcWy6v6badGoBwNb4YVwcQGTgW3P2Qw0zS6caZOFDDxrjzswQ3Gl0/q2ZOKZ5tIa3K6
	NKZWcDoVZFLz7tjY4RL76S4AXdKINzcfGAdRwbaFPd7dy+oDYvTKuE/7q17KdHmWDPsxuD5KklQD/
	yi4RtLmqSrawtmgQhWfAFMqTD07RcJlAL1a+6pozK3/Mj+TKl+/Xe3hobdo6jrDoJvCEFUxc6xXtJ
	f0hw6GGJUCJ4q5WcYiFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHU7O-0003nU-Sm; Thu, 26 Mar 2020 15:08:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHU70-0003Nc-PB; Thu, 26 Mar 2020 15:08:04 +0000
X-UUID: 475b2721ddb8413ea0cc69399ba54374-20200326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yQugDcuRyb957RsLnPG3IKLpweXB8rZN0SNQlnD0C1s=; 
 b=smdJJXAy/w6mJDa9/kUHZJKAtzyfbBB4WcPniaADCleOLrHoLXqif3xBJU5NNCnqepxM0Sqya/uvSMS15eD1sSIkBI4IFRnMZSCJiQYJq7mdyPcAjN4HHZLIDi3i+tUBmTzRLYJyFMWpX3nKdbMe0Ujm7OM6yElTUKHH+NNClBE=;
X-UUID: 475b2721ddb8413ea0cc69399ba54374-20200326
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 462161996; Thu, 26 Mar 2020 07:07:58 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Mar 2020 08:07:56 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Mar 2020 23:07:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 26 Mar 2020 23:07:48 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 2/2] scsi: ufs-mediatek: add error recovery for suspend and
 resume
Date: Thu, 26 Mar 2020 23:07:47 +0800
Message-ID: <20200326150747.11426-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200326150747.11426-1-stanley.chu@mediatek.com>
References: <20200326150747.11426-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_080802_826199_13D092C2 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, bvanassche@acm.org,
 andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Once fail happens during suspend and resume flow if the desired low
power link state is H8, link recovery is required for MediaTek UFS
controller.

For resume flow, since power and clocks are already enabled before
invoking vendor's resume callback, simply using ufshcd_link_recovery()
inside callback is fine.

For suspend flow, the device power enters low power mode or is disabled
before suspend callback, thus ufshcd_link_recovery() can not be directly
used in callback. To leverage host reset flow during ufshcd_suspend(),
set link as off state enforcedly to let ufshcd_host_reset_and_restore()
be executed by ufshcd_suspend().

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 3b0e575d7460..2384e35ac85f 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -486,8 +486,15 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_lpm(hba);
-		if (err)
+		if (err) {
+			/*
+			 * Set link as off state enforcedly to trigger
+			 * ufshcd_host_reset_and_restore() in ufshcd_suspend()
+			 * for completed host reset.
+			 */
+			ufshcd_set_link_off(hba);
 			return -EAGAIN;
+		}
 	}
 
 	if (!ufshcd_is_link_active(hba))
@@ -506,8 +513,10 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_hpm(hba);
-		if (err)
+		if (err) {
+			err = ufshcd_link_recovery(hba);
 			return err;
+		}
 	}
 
 	return 0;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
