Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7F7C54E69
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 08:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATX7DE3pf+GNEBqDAhFhJVT5DKLBcrGcVoJ0/mRV3gQ=; b=4iGPPfor8tOKHilbdWExdVpLBQ
	VvG/dmbIVVDFUaZUyCpZIO7DGqH6qh5xyiSq5iIEndptlC7Ap9ZWyvhWwU5d5g7RMYJbFZtNDk7Ww
	H4DTbLt82rIv3Jxb+zOVBBqpkNviPqDxXi4dR0zLrBNyu/Wgxn2vHZmTpVjqfaubTV85XilP5mR0J
	2YFy7W7Xt6Mo2g3TAEZulvOQPePie3KGi3TCvE0P6oC85+mKq6PAWUDrTEDvMBEpI6F8+lted2ZyB
	+Ehje7qdkCH0tJqVAtY9HRzGFuN7TqtOc2QNsuHFgnEoLhyxG6qCG+wPTg/VDb3ennUDKVd9bGqCa
	FXeDkF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl31v-0000000HAhw-2CMT;
	Fri, 15 Mar 2024 08:35:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl31p-0000000HAeK-2KP3
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 08:35:03 +0000
X-UUID: e64631aae2a611ee9aa9374d6d45775a-20240315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ATX7DE3pf+GNEBqDAhFhJVT5DKLBcrGcVoJ0/mRV3gQ=;
	b=Kt3dzgX1TG+4Ny8HNgZIwKTeu9lvEIElIxvE6R0hj+ZHGK86IkcZb/ZVq0HnqwefbffJ7xYhzFLy6aLcGh/i1i/qWplbrlOXYvazRCj+O2nmU58vBpLZk2s4A1bXJ7tfqrxBI8uW5y/nAuXSX5hOx0fLyCr+LGAsLL8BmNzlBgc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:9f3820cd-d89a-4d3e-b1bf-0ddda8e467e0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:2e047190-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e64631aae2a611ee9aa9374d6d45775a-20240315
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1273614618; Fri, 15 Mar 2024 01:34:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Mar 2024 16:34:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Mar 2024 16:34:50 +0800
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
Subject: [PATCH v2 2/7] ufs: host: mediatek: tx skew fix
Date: Fri, 15 Mar 2024 16:34:43 +0800
Message-ID: <20240315083448.7185-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240315083448.7185-1-peter.wang@mediatek.com>
References: <20240315083448.7185-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.857300-8.000000
X-TMASE-MatchedRID: n/G9Jfep/EYMQLXc2MGSbIzb2GR6Ttd39Nx/wC/5BIDfc2Xd6VJ+yqE9
	PHeVbwLZeeTK1AUftLLijpjet3oGSJCoy9iDotiwjoyKzEmtrEdYN1akkye0qOkviQKjlVkeoBf
	JbWQaw4Pc3nKzIYoy4oAy6p60ZV62fJ5/bZ6npdjKayT/BQTiGtJaX40YooekqswO62qermAz8M
	fXufKgqBRTidULKtoa/IaBPoZPwlUXpWXAorqW3pG7NytUycyAZ30APAmfP3O0PdybCyoACq/XF
	oPK0hZ9dATQdtPksR+3/JiWOe6GXXSWgQ2GpXdZbxffl9hhCBw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.857300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: EC9D5EAE5EE4ED939A91AD8637D2DB819933FAB94736ED65F7E0D3C9A9A73D432000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_013501_835612_EDE0B3DF 
X-CRM114-Status: GOOD (  11.16  )
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

Acked-by: Chun-Hung Wu <Chun-Hung.Wu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 21 +++++++++++++++++++++
 drivers/ufs/host/ufs-mediatek.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 147b5286ec98..25bf5a13cddd 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -119,6 +119,13 @@ static bool ufs_mtk_is_pmc_via_fastauto(struct ufs_hba *hba)
 	return !!(host->caps & UFS_MTK_CAP_PMC_VIA_FASTAUTO);
 }
 
+static bool ufs_mtk_is_tx_skew_fix(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	return (host->caps & UFS_MTK_CAP_TX_SKEW_FIX);
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
index d0a5ab17860a..c1acbfc5568f 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -143,6 +143,7 @@ enum ufs_mtk_host_caps {
 	 */
 	UFS_MTK_CAP_ALLOW_VCCQX_LPM            = 1 << 5,
 	UFS_MTK_CAP_PMC_VIA_FASTAUTO           = 1 << 6,
+	UFS_MTK_CAP_TX_SKEW_FIX                = 1 << 7,
 };
 
 struct ufs_mtk_crypt_cfg {
-- 
2.18.0


