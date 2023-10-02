Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0F9E7849A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4z9PV7w12o3GAx4YkiV5q9qcQx6hVdNqJvH8okWlsdE=; b=fAP8i5hONzNoCe72kur5Mk9OyQ
	FXevGNHe4Z35U2K8O5VIAtRfxySnSniq3sTrFKzaC1AAjNt7p8UNTCY7GelZ0oLxrz9FmERqDXQ89
	0F4Mxf4wHxAWDu8WGvtehhvU2E2WWvk0005Ctgp2oxdAdANzXh86/yEwVgi7mz+e5GB+9aaYvK40D
	ubf/zZwTmWzaNSHGRRNMpBnk8I9QjYbvXT9emDnodEKIVLoA9WltEW8Je39x7mp+kNEqMZSVOct5x
	4fBhfT+JjX3Pkbv557KNvUF6V/TZZmVbgpCZJRYp27FndNiuM6kPzkJY4xGiOuzBtxFSkjKySE4ME
	ZXBfbe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnIT3-00CkK6-0i;
	Mon, 02 Oct 2023 12:56:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnISx-00CkJU-1y
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 12:56:08 +0000
X-UUID: 079caf9c612311ee9b7791016c24628a-20231002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4z9PV7w12o3GAx4YkiV5q9qcQx6hVdNqJvH8okWlsdE=;
	b=MTosoPy6l0P4WPZVT4wuFK7YCCcEjSWg7+i5GMr85YC0HcchfPMofO98lQ+1bssCyPBAYwdRbqAoUSYykOupCRztmjtnIfZ1wcdnhUlVt2tGSRA0+jlG3+gdnkWL+LX0WA/KwIBCNeZmRYVxqIbNEf6Kz8Jg0uf1zlNLKDW9BEY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:1b966aba-6400-4d2d-946f-26510eb0ccc2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:8eb07ebf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 079caf9c612311ee9b7791016c24628a-20231002
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 777246433; Mon, 02 Oct 2023 05:55:57 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 2 Oct 2023 20:55:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 2 Oct 2023 20:55:53 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>
Subject: [PATCH v1] ufs: core: correct clear tm error log
Date: Mon, 2 Oct 2023 20:55:51 +0800
Message-ID: <20231002125551.15111-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.598200-8.000000
X-TMASE-MatchedRID: MACTyP4PrdMMQLXc2MGSbJYsKSXWWrsHgRykyfrH1xmjD9XxfoENjlO4
	BD7nLMxnThbvLLI8RvOlEtDJyVR88h8TzIzimOwPlpYqKNmWxsHZs3HUcS/scCq2rl3dzGQ19+9
	ZqEp9FTgMRp1yjzc3MYyx7cKwZaTJhe9WvmjO8k68IIUoQpinswK7wCAFf2mWN3hI4FCRnp+AnC
	WEQLX2YUGxMNO0eeeUXHQjdJ7WbjcXRoPmWO3jekxwdkPqCq7vDEyN+J8hd+jCS9WgDXVPCp6oP
	1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.598200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5A4E20DF73A16538204AD6BE2395AD7994DD5E2247609A90B787DD6234936E202000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_055603_657185_B8CEB42A 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

The clear tm function error log is inverted.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c2df07545f96..4095d88eee44 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6895,7 +6895,7 @@ static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag)
 			mask, 0, 1000, 1000);
 
 	dev_err(hba->dev, "Clearing task management function with tag %d %s\n",
-		tag, err ? "succeeded" : "failed");
+		tag, err ? "failed" : "succeeded");
 
 out:
 	return err;
-- 
2.18.0


