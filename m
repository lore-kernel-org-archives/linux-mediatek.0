Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5447C54E41
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=US1AZlWB4XWSCrS/zunSnKIl4wPRKQLfiiA+beXnKrs=; b=A+ZLyNfV883j8P16xDmMCJE24c
	fKMAD76P1SXc4eRyynhuxw1wP1wdUIRDY3c7y2ZWVm/bCSnmzwzzdvn/J5U+4aX3iyM8mCIvq8TOj
	VbjXT7wPcZoG8wMiiOZssN7Ef5MXeYaJhHM1UJph15mie/ARUWlRy3hWeGcek0jlgBMikrwWa9cIl
	QwOXFx4Hq0ZDvAPcylbtTakHIbmEAnZhme+DvfXntx2TxslJ/AdbUXLsm762+OPGE4xgjst+aaBkZ
	Sy60RBRSo1f4ckKEv+sahQzDVY7bQX9Leuq41RQ2htbfOK5ljxWASNIrkktrNAla5cS8FqapRC/cV
	HaCJJ9cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbPw-0000000CZeY-0SQl;
	Thu, 29 Feb 2024 08:05:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbPt-0000000CZe0-1jp9
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Feb 2024 08:05:22 +0000
X-UUID: 47a6440ad6d911ee999fed2339b27864-20240229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=US1AZlWB4XWSCrS/zunSnKIl4wPRKQLfiiA+beXnKrs=;
	b=XbwJXJyKbiuoEqDeo9bownBscugy5q7XlNeBRqQ1j2aH1sTeF7uGiw14vM+q8lraDO3xjvNMvToQNZEl5Wsx/Jff1t7KCW23xd8jDpk/tMae5UHPsLTGB+qySfLWmwHaG3Qz5NUk+yl0aVXEKhYohz9gqCy1fAygX6ayz5Sbqqc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:dc5aef93-0acc-4b0e-aac6-bddb0fb30ab5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:0dc0d88f-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 47a6440ad6d911ee999fed2339b27864-20240229
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1531791522; Thu, 29 Feb 2024 01:05:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 29 Feb 2024 16:04:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 29 Feb 2024 16:04:37 +0800
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
Subject: [PATCH v2] ufs: core: add config_scsi_dev vops comment
Date: Thu, 29 Feb 2024 16:04:35 +0800
Message-ID: <20240229080435.6563-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.435400-8.000000
X-TMASE-MatchedRID: MACTyP4PrdMMQLXc2MGSbFz+axQLnAVBTJDl9FKHbrm7qpOHKudqc/mv
	83Rzid1phgjat2+RfEfdRIKCUEZlk49oUcx9VMLgFEUknJ/kEl5jFT88f69nG/oLR4+zsDTtjoc
	zmuoPCq1ze+i+Dlv5ABEG8YoH0A3pTlOaLF8YOD+mDC7RQmDzf6yO1uMZNQBO
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.435400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 67EA079068FEE011FA50AA4FCA0B72E2AE908FF2D6C4ED72EF36C8667C54E9482000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_000521_462533_7942FDFC 
X-CRM114-Status: UNSURE (   7.40  )
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

Add config_scis_dev vops comment.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 include/ufs/ufshcd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 7f0b2c5599cd..a19d87e7980f 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -327,6 +327,7 @@ struct ufs_pwr_mode_info {
  * @op_runtime_config: called to config Operation and runtime regs Pointers
  * @get_outstanding_cqs: called to get outstanding completion queues
  * @config_esi: called to config Event Specific Interrupt
+ * @config_scsi_dev: called to configure scsi device parameters
  */
 struct ufs_hba_variant_ops {
 	const char *name;
-- 
2.18.0


