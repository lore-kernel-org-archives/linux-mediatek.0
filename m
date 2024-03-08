Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FA6C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 07:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRvFJTE87XolmTA17FRPsWDtMyq5k7pFzOf1KSJh+sQ=; b=uoT7V9OrAAX49UYHYHjOr3f3Ok
	7/54Yn4BMkGH9jv90BSBnAv7NoLIXQUTdKD5wBnU1usAyYSogzXWWtHXnGDTTmtPG96aklzJuWOWJ
	dI58NYmfkV7Dpu/sSP6oYT+oqmReBQ6rUU5GeSrauB4r92wXZys4lrvxYUe5i2J2X0i2iAQcVx0In
	OyM3iDSRx5iajdV1a7JXU4Q2iUODhAbVTzeWEs7uc4ZyFzuFyqgij6iCrwvskQTCo2P0B8mO+A4tm
	XWEAw49Q2Fsh9aLJUQH2rJjJogk/mWv0QvIxegzXHXl36PeSaHBqTuZZ5ptQRXyHYkBtz4NaJBHR8
	bkjwRgPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUGS-000000084Jm-3IiN;
	Fri, 08 Mar 2024 07:03:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUGN-000000084DZ-07yW
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Mar 2024 07:03:29 +0000
X-UUID: f1b899b6dd1911eebe6b57d01cc416d2-20240308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gRvFJTE87XolmTA17FRPsWDtMyq5k7pFzOf1KSJh+sQ=;
	b=urw0WApytIkNGtBgHhZwf4c5yG7kLJC0U0NY38L0RAI1RT2l0cELsBPZt55wzLFZ8Bwz3hOR63tUecrHg/5TKB6k8RIsgZI1lmfRjUb1GoEuw8T8WJgDu+LHIUkcv2Fm6PMY/wEKclSQIdtMhTimG3STGAORJQO2SfWvSUOMN/w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:ef270963-9797-4c8f-a6c7-c55cc4abd37f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:44f0c384-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f1b899b6dd1911eebe6b57d01cc416d2-20240308
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 913891065; Fri, 08 Mar 2024 00:03:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Mar 2024 15:02:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Mar 2024 15:02:43 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>
Subject: [PATCH v1 2/7] ufs: host: mediatek: tx skew fix
Date: Fri, 8 Mar 2024 15:02:36 +0800
Message-ID: <20240308070241.9163-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240308070241.9163-1-peter.wang@mediatek.com>
References: <20240308070241.9163-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.311800-8.000000
X-TMASE-MatchedRID: lR9wedxBitsMQLXc2MGSbIzb2GR6Ttd39Nx/wC/5BIDfc2Xd6VJ+ytoz
	beODnXpl09NQNrxIpFYBtjkcfRMmqe+c5IL6OTgO4RtSDjG+z7DKi5Jqc8KFNBqhK4nm9OcKNkf
	UjJS6Xszi8zVgXoAltsIJ+4gwXrEtIAcCikR3vq/ml/GwKJX8pke8pSYa1RYLU4AcjuzCka1q49
	6rsm52bOKtWn1dFJSx
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.311800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 333B9FAA4FAD749E22D88A49E36412FBFDE5C817EA0E25F6C0475BC3A60BA9582000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_230327_210242_606E41EE 
X-CRM114-Status: GOOD (  11.50  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

Mediatek tx skew issue fix by check dts setting and vendor/model.
Then set PA_TACTIVATE set 8

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 21 +++++++++++++++++++++
 drivers/ufs/host/ufs-mediatek.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 6fc6fa2ea5bd..0262e8994236 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -119,6 +119,13 @@ static bool ufs_mtk_is_pmc_via_fastauto(struct ufs_hba *hba)
 	return !!(host->caps & UFS_MTK_CAP_PMC_VIA_FASTAUTO);
 }
 
+static bool ufs_mtk_is_tx_skew_fix(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	return !!(host->caps & UFS_MTK_CAP_TX_SKEW_FIX);
+}
+
 static bool ufs_mtk_is_allow_vccqx_lpm(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -630,6 +637,9 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 	if (of_property_read_bool(np, "mediatek,ufs-pmc-via-fastauto"))
 		host->caps |= UFS_MTK_CAP_PMC_VIA_FASTAUTO;
 
+	if (of_property_read_bool(np, "mediatek,ufs-tx-skew-fix"))
+		host->caps |= UFS_MTK_CAP_TX_SKEW_FIX;
+
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
 }
 
@@ -1423,6 +1433,17 @@ static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba)
 	if (mid == UFS_VENDOR_SAMSUNG) {
 		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TACTIVATE), 6);
 		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_HIBERN8TIME), 10);
+	} else if (mid == UFS_VENDOR_MICRON) {
+		/* Only for the host which have TX skew issue */
+		if (ufs_mtk_is_tx_skew_fix(hba) &&
+			(STR_PRFX_EQUAL("MT128GBCAV2U31", dev_info->model) ||
+			STR_PRFX_EQUAL("MT256GBCAV4U31", dev_info->model) ||
+			STR_PRFX_EQUAL("MT512GBCAV8U31", dev_info->model) ||
+			STR_PRFX_EQUAL("MT256GBEAX4U40", dev_info->model) ||
+			STR_PRFX_EQUAL("MT512GAYAX4U40", dev_info->model) ||
+			STR_PRFX_EQUAL("MT001TAYAX8U40", dev_info->model))) {
+			ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TACTIVATE), 8);
+		}
 	}
 
 	/*
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 0720da2f1402..146c25080599 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -142,6 +142,7 @@ enum ufs_mtk_host_caps {
 	 */
 	UFS_MTK_CAP_ALLOW_VCCQX_LPM            = 1 << 5,
 	UFS_MTK_CAP_PMC_VIA_FASTAUTO           = 1 << 6,
+	UFS_MTK_CAP_TX_SKEW_FIX                = 1 << 7,
 };
 
 struct ufs_mtk_crypt_cfg {
-- 
2.18.0


