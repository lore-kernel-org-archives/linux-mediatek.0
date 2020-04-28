Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E5EC83000
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 11:16:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0880C20663
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 11:16:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nax0FheH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XvUpf2Wm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0880C20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YN3TNuWvYomODww7L67dD36yz5Sn/tPIvLqwlcRi8dc=; b=nax0FheH4zxPkB
	0xeI15eOl9qJJ/kudOupk2ciWsj5Z88izaDm/qW1VE4f/cXhfUi2752wQhZCFMR6ljAYv7y2v06nD
	8L5Nzq8nQ921VZjAi+35SsgUasK7wsiww+fDypHSrL6Yh9lVn9WnqrG3ZRHcsobvtisXxRRZoYI4R
	VH9RAk62cf2wXC4myeSHjv5JADM3MlP5KSRvXmWlEPK1QsLV0sHktclbk850/yilkllPWmp7H9wG+
	1yTXnQt3KpWjGolKac7BuG41apvGn/ltlyMUsn1iLKDdnsUMFr3RmJXmJBGY+QUHVL7XcflhOCERb
	n7r6zk1IzjMR7LvXbTuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTODj-0002mh-PS; Tue, 28 Apr 2020 11:16:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTOCW-0007mf-7R; Tue, 28 Apr 2020 11:14:57 +0000
X-UUID: 7e200f76f5924abcb60f58acf7273fe1-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gOI57n0NCChF2mdMfypGPNHt6U2F7UjicizaaWMiXU8=; 
 b=XvUpf2WmYG5L8b/CX0IBLmFky2Yb92ymAhYSSV2AVf+QN7iD5KC0ugzRB1Fgf8vyHGpasw56eIHwB31HVrdS/IydKe9zqftEYj7i3IlA7Gyy+P4AzdJWyXDbpEUnCW9naBEOBHWAOeo2E1D7EkxVVXmh+sAw7gcjia8YYOb8k20=;
X-UUID: 7e200f76f5924abcb60f58acf7273fe1-20200428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1359582461; Tue, 28 Apr 2020 03:14:48 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 04:14:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 19:13:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Apr 2020 19:13:53 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v1 1/4] scsi: ufs: allow legacy UFS devices to enable
 WriteBooster
Date: Tue, 28 Apr 2020 19:13:52 +0800
Message-ID: <20200428111355.1776-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200428111355.1776-1-stanley.chu@mediatek.com>
References: <20200428111355.1776-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AC2CEAEB40CCCB9E644C7A17A45E30E1A5213F587BCD3BC5704A675A73F2016B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_041456_306992_1F4BAEF8 
X-CRM114-Status: GOOD (  11.18  )
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

WriteBooster feature may be supported by some legacy UFS devices
(i.e., < 3.1) by upgrading firmware.

To enable WriteBooster feature in such devices, relax the entrance
condition of ufshcd_wb_probe() to allow host driver to check those
devices' WriteBooster capability.

WriteBooster feature can be available if below both conditions are
satisfied,

1. Device descriptor has dExtendedUFSFeaturesSupport field.
2. WriteBooster support is specified in above field.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 915e963398c4..111812c5304a 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6800,9 +6800,16 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba *hba)
 
 static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
 {
+	if (hba->desc_size.dev_desc <= DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP)
+		goto wb_disabled;
+
 	hba->dev_info.d_ext_ufs_feature_sup =
 		get_unaligned_be32(desc_buf +
 				   DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);
+
+	if (!(hba->dev_info.d_ext_ufs_feature_sup & UFS_DEV_WRITE_BOOSTER_SUP))
+		goto wb_disabled;
+
 	/*
 	 * WB may be supported but not configured while provisioning.
 	 * The spec says, in dedicated wb buffer mode,
@@ -6818,11 +6825,12 @@ static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
 	hba->dev_info.b_presrv_uspc_en =
 		desc_buf[DEVICE_DESC_PARAM_WB_PRESRV_USRSPC_EN];
 
-	if (!((hba->dev_info.d_ext_ufs_feature_sup &
-		 UFS_DEV_WRITE_BOOSTER_SUP) &&
-		hba->dev_info.b_wb_buffer_type &&
+	if (!(hba->dev_info.b_wb_buffer_type &&
 	      hba->dev_info.d_wb_alloc_units))
-		hba->caps &= ~UFSHCD_CAP_WB_EN;
+		goto wb_disabled;
+
+wb_disabled:
+	hba->caps &= ~UFSHCD_CAP_WB_EN;
 }
 
 static int ufs_get_device_desc(struct ufs_hba *hba)
@@ -6862,8 +6870,7 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 
 	model_index = desc_buf[DEVICE_DESC_PARAM_PRDCT_NAME];
 
-	/* Enable WB only for UFS-3.1 */
-	if (dev_info->wspecversion >= 0x310)
+	if (ufshcd_is_wb_allowed(hba))
 		ufshcd_wb_probe(hba, desc_buf);
 
 	err = ufshcd_read_string_desc(hba, model_index,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
