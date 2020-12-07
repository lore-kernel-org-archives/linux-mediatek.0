Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFC0C4361B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 06:00:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6094229C5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 06:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6094229C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ivNJpoZFxkAnmpirXH4NFoS8PXaxtfjkW3+3iPhyXuU=; b=qf3s6FLXfVZRDmKwyPhTOZkgJ
	FjK/XsGDIGyErwZO7kPPxVEUpWejvAYHFRqKbc3LbMAxOup7O/0MLDmDYJqvR7tTZxoXNvjLEXc1l
	MK0Kh1UVjlYgpIfjA85XYD83pHhWPNguivGlTeyiabVyjCXPpBSCsed/IbLcdtix91tYfe201fI+K
	q5zGWHLiC4oAfFgVBmVW7sbHjZtQnO6+XhGLjfrmRBmiUWAPG9ALCFjhsNxNPVAyklf/KmQw/Fxjf
	V82fUCr19N07Az1kaT4VGVb9ZBOzGc2qF6kRRQRfwhkETl8K1Qsco03+NWjpZEDwe3NCBM4GkXjF+
	f1jY5ZlNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1km9ZG-0006GJ-VU; Mon, 07 Dec 2020 06:00:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1km9Z6-0006Di-QX; Mon, 07 Dec 2020 06:00:06 +0000
X-UUID: e4ac86cf42734269b0496748287e5802-20201206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rAbYJk8MKUDhuqCGizvK8XdfQbsG7h2GcqaEx27M30g=; 
 b=f8a4vE5YlbSiPW0ZfiQD2Vrz4y+VVYwVmIqSrklk8OH/DJY3UpOJ/vTHClnBwQY99hc5meuwZDgBg11rBo7jwQfeAoqRHk0IxTPUX6oAoAE+jiy+QkXFjfYWeKKlRWBqBBuEl5Ajyt6gRH1nL8oYcSuY+GEhP2W1DzuUoJ0FARs=;
X-UUID: e4ac86cf42734269b0496748287e5802-20201206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1725595057; Sun, 06 Dec 2020 22:00:01 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Dec 2020 21:49:57 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Dec 2020 13:49:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Dec 2020 13:49:55 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 2/2] scsi: ufs-mediatek: Keep VCC always-on for specific
 devices
Date: Mon, 7 Dec 2020 13:49:55 +0800
Message-ID: <20201207054955.24366-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201207054955.24366-1-stanley.chu@mediatek.com>
References: <20201207054955.24366-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_010005_099543_ECA6CA68 
X-CRM114-Status: GOOD (  11.80  )
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

For some devices which needs extra delay after VCC power down,
VCC shall be kept always-on in some MediaTek UFS platforms to
ensure the stability of such devices because the extra delay may
not be enough in those platforms.

Reviewed-by: Andy Teng <andy.teng@mediatek.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 21 +++++++++++++++++++++
 drivers/scsi/ufs/ufs-mediatek.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 3522458db3bb..80618af7c872 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -70,6 +70,13 @@ static bool ufs_mtk_is_va09_supported(struct ufs_hba *hba)
 	return !!(host->caps & UFS_MTK_CAP_VA09_PWR_CTRL);
 }
 
+static bool ufs_mtk_is_broken_vcc(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	return !!(host->caps & UFS_MTK_CAP_BROKEN_VCC);
+}
+
 static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
 {
 	u32 tmp;
@@ -514,6 +521,9 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 	if (of_property_read_bool(np, "mediatek,ufs-disable-ah8"))
 		host->caps |= UFS_MTK_CAP_DISABLE_AH8;
 
+	if (of_property_read_bool(np, "mediatek,ufs-broken-vcc"))
+		host->caps |= UFS_MTK_CAP_BROKEN_VCC;
+
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
 }
 
@@ -1003,6 +1013,17 @@ static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba)
 static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 {
 	ufshcd_fixup_dev_quirks(hba, ufs_mtk_dev_fixups);
+
+	if (ufs_mtk_is_broken_vcc(hba) && hba->vreg_info.vcc &&
+	    (hba->dev_quirks & UFS_DEVICE_QUIRK_DELAY_AFTER_LPM)) {
+		hba->vreg_info.vcc->always_on = true;
+		/*
+		 * VCC will be kept always-on thus we don't
+		 * need any delay during regulator operations
+		 */
+		hba->dev_quirks &= ~(UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
+			UFS_DEVICE_QUIRK_DELAY_AFTER_LPM);
+	}
 }
 
 static void ufs_mtk_event_notify(struct ufs_hba *hba,
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 93d35097dfb0..3f0d3bb769e8 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -81,6 +81,7 @@ enum ufs_mtk_host_caps {
 	UFS_MTK_CAP_BOOST_CRYPT_ENGINE         = 1 << 0,
 	UFS_MTK_CAP_VA09_PWR_CTRL              = 1 << 1,
 	UFS_MTK_CAP_DISABLE_AH8                = 1 << 2,
+	UFS_MTK_CAP_BROKEN_VCC                 = 1 << 3,
 };
 
 struct ufs_mtk_crypt_cfg {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
