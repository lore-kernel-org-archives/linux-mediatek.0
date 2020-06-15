Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD7DC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 14:33:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97BAB206B7
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 14:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kkuGYZNJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UFyGNRZG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97BAB206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPoEZcSmf94xJwG4ppR53EjxfUG2r6GiZ9znljIDzSU=; b=kkuGYZNJLI7UVL
	mCLh8wAgakzpb/muVlWejHx3lq0v1UzTaEOjj9O+OWup+aWQ3sJcxSN4W0sjo6K15cn/QQzPAvqVN
	bnVK2i9yEtUI1KAK3oUFJDyxRgW357VhhnfQeDuqFpE50xfRHb3tgutIQ8laMjTT9EEtafqzVXWa9
	3PbgxugTjeuJbC+iB0rotWyrzx9mR7NtfpoziGBKtV80rkOpyEaP/GP+27deZ7MM1h2MSzQ98ofna
	RJaNJHhHmhRpuL6Ea6hFMMgF4FitBBe0hOAcQGKndY9JwlsI4ii5PnpjC5incfOO/T1vO/5uc7B+o
	R/VKRcl+2pghHETrBAkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkqAP-0001au-5X; Mon, 15 Jun 2020 14:32:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkq9I-0000UV-AQ; Mon, 15 Jun 2020 14:31:45 +0000
X-UUID: 491d86ba799d4bdc9fef71ec94716264-20200615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kr2jM3RF3TtcKfmiwQa78Z5GzGFPEkqB/QqVcBMG3TY=; 
 b=UFyGNRZGPWnOhHUMVcxkDzOBNOvjTOmWdC2yqHnkqjzo7aoy/Xwyt16jObOfYMqVIr6pdd6DLM5ET2X0QCZLYfA/rLVXAiuW6RsjkZUJXISYMcQMOUPnz1guSQ12yMK+X1Vf0HI1pytWpnG/mlHw+Q1johWc2lpKoy7pVjl4TR0=;
X-UUID: 491d86ba799d4bdc9fef71ec94716264-20200615
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1916784615; Mon, 15 Jun 2020 06:31:40 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 07:31:38 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 22:31:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Jun 2020 22:31:22 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v1 3/3] scsi: ufs-mediatek: Print host information for failed
 supsend and resume
Date: Mon, 15 Jun 2020 22:31:23 +0800
Message-ID: <20200615143123.6627-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200615143123.6627-1-stanley.chu@mediatek.com>
References: <20200615143123.6627-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8EC26055AF32B427709C81554C49B22046A151F1F85C4188A4CE82C53D9714202000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_073144_369490_820839BA 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Print host state and register dumps while suspend or resume flow
is failed.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index d56ce8d97d4e..b0f626f6f9fe 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -469,22 +469,25 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 
 	err = ufshcd_hba_enable(hba);
 	if (err)
-		return err;
+		goto out;
 
 	err = ufs_mtk_unipro_set_pm(hba, 0);
 	if (err)
-		return err;
+		goto out;
 
 	err = ufshcd_uic_hibern8_exit(hba);
 	if (!err)
 		ufshcd_set_link_active(hba);
 	else
-		return err;
+		goto out;
 
 	err = ufshcd_make_hba_operational(hba);
 	if (err)
-		return err;
-
+		goto out;
+out:
+	if (err)
+		ufshcd_print_info(hba, UFS_INFO_HOST_STATE |
+				  UFS_INFO_HOST_REGS | UFS_INFO_PWR);
 	return 0;
 }
 
@@ -494,6 +497,9 @@ static int ufs_mtk_link_set_lpm(struct ufs_hba *hba)
 
 	err = ufs_mtk_unipro_set_pm(hba, 1);
 	if (err) {
+		ufshcd_print_info(hba, UFS_INFO_HOST_STATE |
+				  UFS_INFO_HOST_REGS | UFS_INFO_PWR);
+
 		/* Resume UniPro state for following error recovery */
 		ufs_mtk_unipro_set_pm(hba, 0);
 		return err;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
