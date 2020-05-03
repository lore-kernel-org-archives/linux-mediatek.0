Return-Path: <SRS0=D1Kh=6R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE9AC28CBC
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2020 06:07:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B29D2075B
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2020 06:07:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S0QvAxd5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QUWQr+4Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B29D2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjB+agzavUBxfcIz90yZVpCNRkiJiVkC/J+vJ4N2B8c=; b=S0QvAxd5ZndXP8
	7Nx3zSKN19pDirLaQYC4nzdW3TjFtzE64YA+3/gEkjXCDf0MyTgEpgCWvBzMc9/rE4ujwu0vklOqS
	MgOAeYOqdfirP8OeDrXByHuq/cTIsK52Pjhy3wCFd05ONky7Z13bx//ea6VAO/w2JVU0S8ofljT5y
	qJcfsAMOqDSZFoFcQQLg9tvtCagEoiKnL9hzGuo4L2Y51xdyvvdiFY2j8zrYkLt1P6wu9QkKC6vL6
	HxLxoo6S15L3uzPGTNBg1UineafZ2SsvdJmPVIG1HiPhHkvYfrEBZaABXfyA60AoRnqLy83yWDnVu
	XJazJnjpb0PTv8p8UqVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jV7mK-00077S-UZ; Sun, 03 May 2020 06:07:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jV7jZ-00027b-S7; Sun, 03 May 2020 06:04:16 +0000
X-UUID: 5dc4ea458d7a4dd0b1c88555f181bbf1-20200502
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=axYdivepqlgkjKZMDc+q6wcYI5dYnIuDFbudgz9mHU4=; 
 b=QUWQr+4ZUEdFHI0yt4kIZbvR6XHYwLTMEcrscEqFnk4Ig1dEtzaA+ZKeDWK8e3UNjaPkMD2DnkjBr/h+PvzUMqisp/Hg33MkuxPMHRO1WpBMcMJoQtU4k630Vs6E98wn3ALmzURQDbsqAU4DQOzXfwBsxe3hhBHUmyaFt3mpLtk=;
X-UUID: 5dc4ea458d7a4dd0b1c88555f181bbf1-20200502
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 54188663; Sat, 02 May 2020 22:04:11 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 2 May 2020 23:04:09 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 May 2020 14:03:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 3 May 2020 14:03:54 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v4 2/8] scsi: ufs: introduce fixup_dev_quirks vops
Date: Sun, 3 May 2020 14:03:45 +0800
Message-ID: <20200503060351.10572-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200503060351.10572-1-stanley.chu@mediatek.com>
References: <20200503060351.10572-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_230413_948288_5F24084B 
X-CRM114-Status: UNSURE (   7.66  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some UFS deivces may have required device quirks or have non-standard
features which are enabled only on specified UFS hosts or for special
customers.

To not "pollute" common device quirk list, i.e., ufs_fixups table for
those devices mentioned above, introduce "fixup_dev_quirks" vops to
allow vendors to fix or modify device quirks accordingly.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 1 +
 drivers/scsi/ufs/ufshcd.h | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 04ddfb15e858..da7b375709b6 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6899,6 +6899,7 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 	}
 
 	ufs_fixup_device_setup(hba);
+	ufshcd_vops_fixup_dev_quirks(hba);
 
 	/*
 	 * Probe WB only for UFS-3.1 devices or UFS devices with quirk
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 056537e52c19..5fa03e0f3bd1 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -336,6 +336,7 @@ struct ufs_hba_variant_ops {
 	void    (*hibern8_notify)(struct ufs_hba *, enum uic_cmd_dme,
 					enum ufs_notify_change_status);
 	int	(*apply_dev_quirks)(struct ufs_hba *hba);
+	void	(*fixup_dev_quirks)(struct ufs_hba *hba);
 	int     (*suspend)(struct ufs_hba *, enum ufs_pm_op);
 	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
 	void	(*dbg_register_dump)(struct ufs_hba *hba);
@@ -1085,6 +1086,12 @@ static inline int ufshcd_vops_apply_dev_quirks(struct ufs_hba *hba)
 	return 0;
 }
 
+static inline void ufshcd_vops_fixup_dev_quirks(struct ufs_hba *hba)
+{
+	if (hba->vops && hba->vops->fixup_dev_quirks)
+		hba->vops->fixup_dev_quirks(hba);
+}
+
 static inline int ufshcd_vops_suspend(struct ufs_hba *hba, enum ufs_pm_op op)
 {
 	if (hba->vops && hba->vops->suspend)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
