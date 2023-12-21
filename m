Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31A1C35274
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnMnp7U7Ka2iy4vdDrI57MQqW8gqRkoFcBs89KNVKw4=; b=5CSwI828DZr+s/ioGRIt4nwpcB
	VEYU2u4jQ2AQBDzLsn2mY0ZQAHlKJ6zuuyrL92W8jkxqNyDp5hhSUUNWcjIxg0cX9xjjZw+HKKeyO
	ho4W5WysX7281PBrckA7aOuwuL/14i6H0AyLltbDonTB0OKju7wiWfZRI8I1/FxKfxxuz4jczoLhE
	eleR+8i3wvIQtna56UXA13qZW4t2Vhv70w1S0mNGqSjhWZnwrjvamDnyAuQsoEGU5uSshqsNXLq3D
	7d+t8v3p1MKol4HNopZnXK8RcAXX8tqLR/knSudQacKz2/LsmJr69FyFsoSUQj9MhLt+p1Fjhn7Z2
	wo37ktBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGGqs-002Wiw-2V;
	Thu, 21 Dec 2023 11:04:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGGqp-002Whl-39
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Dec 2023 11:04:29 +0000
X-UUID: b169a2089ff011ee958cff29c719f35b-20231221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wnMnp7U7Ka2iy4vdDrI57MQqW8gqRkoFcBs89KNVKw4=;
	b=t38WXDDH3L2cs/D+ZicJWMIfJyzqKEUuIP2anfwc94pqfqI9zn7nX7ca4eqmYqPd5TO5I7i0LEvyBa6rgQ+d6E4hDPK+KiBFeY3ZMFy0ltgRnlYLCxndoCV3qUS9L4Ic+YYQOkKgjXrHkAnzAnsVf2vgZ++dS7Nv2RfrpCS25mA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:fc029248-66e9-4e1d-bcef-d7b98efd9ffc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:3ce20582-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b169a2089ff011ee958cff29c719f35b-20231221
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1886629990; Thu, 21 Dec 2023 04:04:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Dec 2023 19:04:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Dec 2023 19:04:18 +0800
From: <peter.wang@mediatek.com>
To: <chun-hung.wu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>
Subject: [PATCH v1 2/3] ufs: host: mediatek: fix mcq mode tm cmd timeout
Date: Thu, 21 Dec 2023 19:04:15 +0800
Message-ID: <20231221110416.16176-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231221110416.16176-1-peter.wang@mediatek.com>
References: <20231221110416.16176-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.767700-8.000000
X-TMASE-MatchedRID: lR9wedxBitsMQLXc2MGSbJdc7I2df+msBdebOqawiLu7qpOHKudqc23f
	WdM9RlQ2zdj35i6vMlBEsaNCyIJWnMwdQieqpnTaA9lly13c/gHt/okBLaEo+L/A+0D1to6Pssf
	Gi2vQI7ji8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZIAxGtSO4KkmxNYNZmU4uVWS8I7bW/SATL0EJ
	yVPQ55+EuyZH7V8PCJ9SHI8VpW6bZ4HO0lhy+Lh/xHbAYq7iU2Vg3cAB57L/mAhOcaQrQ0U1GyR
	coeF18qmKP0zzpTAeGwod8xOMKmvA1Aka/KIp/p
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.767700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D14675FDA39D1B2ACBD4958B2B7A21CC02E80549EC3F625B495BD4D11A5B1E4D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_030428_019850_35BA442A 
X-CRM114-Status: GOOD (  10.46  )
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

Fix tm cmd timeout issue in mcq mode by default resume call
ufshcd_make_hba_operational to set tm cmd dma address.
This flow same as ufs init make operational after link startup then
set mcq related register if use mcq mode.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 104354a4d899..eb1934126c87 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1220,9 +1220,11 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 	}
 	ufshcd_set_link_active(hba);
 
-	if (!hba->mcq_enabled) {
-		err = ufshcd_make_hba_operational(hba);
-	} else {
+	err = ufshcd_make_hba_operational(hba);
+	if (err)
+		return err;
+
+	if (is_mcq_enabled(hba)) {
 		ufs_mtk_config_mcq(hba, false);
 		ufshcd_mcq_make_queues_operational(hba);
 		ufshcd_mcq_config_mac(hba, hba->nutrs);
@@ -1231,9 +1233,6 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 			      REG_UFS_MEM_CFG);
 	}
 
-	if (err)
-		return err;
-
 	return 0;
 }
 
-- 
2.18.0


