Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD354C33CB3
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 04:01:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8009820728
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 04:01:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PTSmkQ8K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QfqQN30y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8009820728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leFlWf7e9upDuSghdK47r1F2B5er2Gwu1CZLY6vv2Ig=; b=PTSmkQ8KtH9FQl
	8w8+Mu/YztXZa53IXs9Ul0Ec9knL+AgH8MuHvy5JuhuywP8mX/PZEVtoh6rE5B5aIXBGqdknBngfw
	Jp8jIqcD9BrIVYiO3k12uIMpUy9ua3+q65stMPQw5KubJlccXdERuRznA8rzXUft1X5Xm87TfVJRw
	NedQQxvDMHUTuc3zx3I4kUOqBYzUGBc3iWGDcsjtYOe5yeb9cdvLu6fdkhHJ9/wEFJe/YY1X/Ljjg
	xMi7yNP6Zn0tRiBR21Lle4ZOB3KGN81QQZJCgOGqBKauACOrpl0F2vryRoq6UWaiy+pydZEcKkDQD
	155gxUcz1roH0Nqak+HA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isIpP-0001eJ-Uj; Fri, 17 Jan 2020 04:01:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isIov-0001CT-FC; Fri, 17 Jan 2020 04:01:22 +0000
X-UUID: a3320fd2d029439e831887501f622dd4-20200116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=p2qxacDfCCVqjUwwOgx8vmOgcBiOvdFZh2JOvNF4dco=; 
 b=QfqQN30yiN5NPwUOijX/BKDmh5xRxb0wtMVKh/cRHgS+vpkRmU15dd2elGQzcgLw7yYw3qYrfhRIhiNzlV44WWwX/xHnk1YO4dAtUFTgtvlA3bU6r4C4mhmeYYdbsyJDAU5FWJytmbYRS/aGdeSkzZ0aJDg9Tvw+crpRjld/yOQ=;
X-UUID: a3320fd2d029439e831887501f622dd4-20200116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1570715849; Thu, 16 Jan 2020 20:01:13 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 Jan 2020 19:52:13 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 17 Jan 2020 11:50:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 17 Jan 2020 11:51:09 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 3/3] scsi: ufs-mediatek: enable low-power mode for hibern8
 state
Date: Fri, 17 Jan 2020 11:51:08 +0800
Message-ID: <20200117035108.19699-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200117035108.19699-1-stanley.chu@mediatek.com>
References: <20200117035108.19699-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_200117_520896_2FA0C67E 
X-CRM114-Status: UNSURE (   9.19  )
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

In MediaTek Chipsets, UniPro link and ufshci can enter proprietary
low-power mode while link is in hibern8 state.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 53 +++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index d5194d0c4ef5..f32f3f34f6d0 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -382,11 +382,60 @@ static void ufs_mtk_device_reset(struct ufs_hba *hba)
 	dev_info(hba->dev, "device reset done\n");
 }
 
+static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
+{
+	int err;
+
+	err = ufshcd_hba_enable(hba);
+	if (err)
+		return err;
+
+	err = ufshcd_dme_set(hba,
+			     UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
+			     0);
+	if (err)
+		return err;
+
+	err = ufshcd_uic_hibern8_exit(hba);
+	if (!err)
+		ufshcd_set_link_active(hba);
+	else
+		return err;
+
+	err = ufshcd_make_hba_operational(hba);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int ufs_mtk_link_set_lpm(struct ufs_hba *hba)
+{
+	int err;
+
+	err = ufshcd_dme_set(hba,
+			     UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
+			     1);
+	if (err) {
+		/* Resume UniPro state for following error recovery */
+		ufshcd_dme_set(hba,
+			       UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
+			       0);
+		return err;
+	}
+
+	return 0;
+}
+
 static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
+	int err;
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	if (ufshcd_is_link_hibern8(hba)) {
+		err = ufs_mtk_link_set_lpm(hba);
+		if (err)
+			return -EAGAIN;
 		phy_power_off(host->mphy);
 		ufs_mtk_setup_ref_clk(hba, false);
 	}
@@ -397,10 +446,14 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	int err;
 
 	if (ufshcd_is_link_hibern8(hba)) {
 		ufs_mtk_setup_ref_clk(hba, true);
 		phy_power_on(host->mphy);
+		err = ufs_mtk_link_set_hpm(hba);
+		if (err)
+			return err;
 	}
 
 	return 0;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
