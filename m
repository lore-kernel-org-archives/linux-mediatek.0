Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6C8C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:58:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F2EC207BC
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mB5TbX/7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Gf0xcGIC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F2EC207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YipKeN1OLGlU3zM4zpeoWjLH25b1MZUNezcq5AFGAKI=; b=mB5TbX/71D2akq6rXjVlqj4mC
	idnyUmuIMRNx72WKOhH6wM/rEo9BbF1uVOet0fRPWXKF33Da454h2/0sf7rMDrLCeifFPljle6LzT
	UADdNFuRm/6JAdIlO8LsiduQgjT0tUbntWSUJJ+5l0IcgXy5PBFXE3U62k0cZT5E+xDuckml70nBD
	drAHK58EzE2452sbw7+oHzA4wnrdEe2hi8oj/KA7Ul7t1LTM2qMCdb8JzQBcJ8vlYrged2enGhVwG
	UIp8RGdjqK8EEtWkYXREKhgpPD2gHFwqQowpBIYFO91bHQTcdXkp4W4f5WbVI6dXlpz4iJ2qz72o5
	jpIyjnZoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY6ZV-0005g6-Rj; Thu, 29 Oct 2020 11:58:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY6ZD-0005Xu-C6; Thu, 29 Oct 2020 11:58:08 +0000
X-UUID: 4507c62446244dc6ba551e9bc86811a2-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6kyqsGAFYyWgMWynHNq3rypwVy6bJxyAVIGT2lwY3Cc=; 
 b=Gf0xcGIC+jIdVR/nkA3/szmlPWVW7g4+VQYP34vmGl7is/swno43HYuN70ez1IngDSO8QVd10ZeTv5AkLBrbT6uA6g28BAcggMxJLyELI9fcJ0QawYWJpX1MGfpFqt6wTb2jdyer/8V/0lev664SwDq9OdVhRvihcFiDtJneqcg=;
X-UUID: 4507c62446244dc6ba551e9bc86811a2-20201029
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1955527522; Thu, 29 Oct 2020 03:57:54 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 04:57:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 19:57:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Oct 2020 19:57:50 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 1/6] scsi: ufs-mediatek: Assign arguments with correct type
Date: Thu, 29 Oct 2020 19:57:45 +0800
Message-ID: <20201029115750.24391-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201029115750.24391-1-stanley.chu@mediatek.com>
References: <20201029115750.24391-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_075807_584526_93608F82 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 jiajie.hao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In ufs_mtk_unipro_set_lpm(), use specific unsigned values
as the argument to invoke ufshcd_dme_set().

In the same time, change the name of ufs_mtk_unipro_set_pm()
to ufs_mtk_unipro_set_lpm() to align the naming convention
in MediaTek UFS driver.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 8df73bc2f8cb..0196a89055b5 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -639,14 +639,14 @@ static int ufs_mtk_pwr_change_notify(struct ufs_hba *hba,
 	return ret;
 }
 
-static int ufs_mtk_unipro_set_pm(struct ufs_hba *hba, bool lpm)
+static int ufs_mtk_unipro_set_lpm(struct ufs_hba *hba, bool lpm)
 {
 	int ret;
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	ret = ufshcd_dme_set(hba,
 			     UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
-			     lpm);
+			     lpm ? 1 : 0);
 	if (!ret || !lpm) {
 		/*
 		 * Forcibly set as non-LPM mode if UIC commands is failed
@@ -664,7 +664,7 @@ static int ufs_mtk_pre_link(struct ufs_hba *hba)
 	int ret;
 	u32 tmp;
 
-	ret = ufs_mtk_unipro_set_pm(hba, false);
+	ret = ufs_mtk_unipro_set_lpm(hba, false);
 	if (ret)
 		return ret;
 
@@ -774,7 +774,7 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 	if (err)
 		return err;
 
-	err = ufs_mtk_unipro_set_pm(hba, false);
+	err = ufs_mtk_unipro_set_lpm(hba, false);
 	if (err)
 		return err;
 
@@ -795,10 +795,10 @@ static int ufs_mtk_link_set_lpm(struct ufs_hba *hba)
 {
 	int err;
 
-	err = ufs_mtk_unipro_set_pm(hba, true);
+	err = ufs_mtk_unipro_set_lpm(hba, true);
 	if (err) {
 		/* Resume UniPro state for following error recovery */
-		ufs_mtk_unipro_set_pm(hba, false);
+		ufs_mtk_unipro_set_lpm(hba, false);
 		return err;
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
