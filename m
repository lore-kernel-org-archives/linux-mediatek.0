Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7E0C47077
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YnYZ+9HQO7srjh6G+ugxuioYLUj69zev/NkRZhEzbo=; b=xetqkJv++yJxr6RKkqkvYLh4gg
	tyjWEZfAc4Mu+9A/HuUfFqvS3Fxj3JjYnIpknX5Zz9Lx00Z7Kc3UkkdpkafELzbpPccttn5WQ8s4b
	FaLu1eHL+0/+5WKQaZMF0FX1zmTcexzmHLh7UVU0wCisR+1E0R8NljyBqKmZabfYLSvpOR6WDNHe0
	SIGSmXBaadzkDUf+cAxW+hz+JjVcpxavGtaxrLOSyA+hnnKx4Am2Qrnk389CtFqYmxBnTJj3TOx7S
	Wjw2oZsPusJ3Aa6E7PeHV4/90X7hJQ7HL28FfBOcfoM9yKircGy6YE7we3z1pdy3A0Z31ZxVk/JJW
	VXEII5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNBPF-008GJE-02;
	Tue, 09 Jan 2024 12:40:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNBPC-008GHH-03
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jan 2024 12:40:31 +0000
X-UUID: 4058c6d8aeec11ee9a662f17bb45267e-20240109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9YnYZ+9HQO7srjh6G+ugxuioYLUj69zev/NkRZhEzbo=;
	b=aXZKAQNtYZKOH3bNT4RGB24aiokaYMoul5NfGMridaUJ9nnLxH+7fKBVUg+w0TUNwDhXiYx4t0E58Vl/lOge+c9ToMLsLFuWm4bVg1SN+CUvpaA2ee1B0ecVAHrPSE3TVCXAPX0qFRR2B4/5EYYUTZ2ys9mEPnTRNSbuYzzBkqU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:10dc284a-8f87-4735-ad02-c6ce4c093897,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:2b320f8e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4058c6d8aeec11ee9a662f17bb45267e-20240109
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1132376803; Tue, 09 Jan 2024 05:40:21 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 Jan 2024 20:40:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 Jan 2024 20:40:17 +0800
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
Subject: [PATCH v1 2/2] ufs: host: mediatek: change default auto suspend timer
Date: Tue, 9 Jan 2024 20:40:15 +0800
Message-ID: <20240109124015.31359-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240109124015.31359-1-peter.wang@mediatek.com>
References: <20240109124015.31359-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.634100-8.000000
X-TMASE-MatchedRID: ivhBngArENGAAYHsHSPDcxn0UD4GU5IquLwbhNl9B5UY0A95tjAn+4lb
	XigDnfa40/AsCkkwxo4Dcb80+9h4A294Ipa1otxo4pdq9sdj8LUK3n1SHen81WHZ+cd7VyKXFrG
	/KStN8Cgkh92jn4TMCfWwXl0A4TcEGAdnzrnkM48URSScn+QSXt0H8LFZNFG7bkV4e2xSge4JOD
	FehVdzk7cfTC05fAlZLwYE9U5/3fLkf9e0AcUBj+ulxyHOcPoH
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.634100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 408B38EB27E7D1DC6ECFE717F89F4676B026CAFDF49F764B6564A733B55A921B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_044030_072044_FB30A6F6 
X-CRM114-Status: GOOD (  11.90  )
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

Mediatek ufs driver change default auto suspend timer from 2000 ms
to 500 ms.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 4 ++++
 drivers/ufs/host/ufs-mediatek.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index fc61790d289b..1bcf75dd13fc 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -893,6 +893,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	const struct of_device_id *id;
 	struct device *dev = hba->dev;
 	struct ufs_mtk_host *host;
+	struct Scsi_Host *shost = hba->host;
 	int err = 0;
 
 	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
@@ -937,6 +938,9 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	/* Enable clk scaling*/
 	hba->caps |= UFSHCD_CAP_CLK_SCALING;
 
+	/* Set runtime pm delay to replace default */
+	shost->rpm_autosuspend_delay = MTK_RPM_AUTOSUSPEND_DELAY_MS;
+
 	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
 	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_INTR;
 	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_RTC;
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index f76e80d91729..596edadfe747 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -190,6 +190,9 @@ struct ufs_mtk_host {
 	struct ufs_mtk_mcq_intr_info mcq_intr_info[UFSHCD_MAX_Q_NR];
 };
 
+/* MTK delay of autosuspend: 500 ms */
+#define MTK_RPM_AUTOSUSPEND_DELAY_MS 500
+
 /*
  * Multi-VCC by Numbering
  */
-- 
2.18.0


