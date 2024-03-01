Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B5BC5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 03:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CPu3l9H69Jhri37bGWe8fRzSRrxBLsJfYK5gBNQ9uTM=; b=UO3X7ui5jldW8BRgUseSSwNTIV
	RnH7MkXtZHct4sHuOG1Jcgd4gMggdmYETFXmCQeiZpTraPTpIOsiq3aXHq6xzeYR+1AGQ1X1Y8mH6
	DTVcLhvdJxvNgZJQdVpFfTJjkmIDvt0r+cLiUb+Suftr3bon0QKapQthwp4ftZV2SIariCscT0EV1
	7wXGtRtC0pBlHrj2Cf7xREUPXoNDNYqdI3Hg/TtxHy3aSDnr+uVXI9KnyjnrrfWNG0X6Aax5EDCLO
	1c4ZBnbaiqLldRkWRFezt8X3DyayyXzKfWUNSnihj+YW326VXtNmPveKgC9eOnX7FHkUryDUzHryR
	srkLCU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rftqq-0000000GC80-0Rio;
	Fri, 01 Mar 2024 03:46:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rftqo-0000000GC7Z-05TI
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Mar 2024 03:46:23 +0000
X-UUID: 40d9c4a8d77e11eeb5c2bb47f3c01139-20240229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CPu3l9H69Jhri37bGWe8fRzSRrxBLsJfYK5gBNQ9uTM=;
	b=Qe4aveccJrr54NB/ZyXnk3+VPznCfYUrT5OEd6rMMTnSQ3iedT4n6kUcHIn4ATLIIV0iDX6fwR1NH5wk5urIsWKpnwX5urCjnGtvLgt2HVL2IgodQ28KJEkaUSO7LN9HL9G+eaZpL1HDcQQAHDjH1xNNbOL6wXwyfJdB8qIqeIk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:24713997-f1e3-4d7e-83a1-3a88c629aebe,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:664e7b84-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 40d9c4a8d77e11eeb5c2bb47f3c01139-20240229
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1373860551; Thu, 29 Feb 2024 20:46:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Mar 2024 11:46:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Mar 2024 11:46:11 +0800
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
Subject: [PATCH v3] ufs: core: add config_scsi_dev vops comment
Date: Fri, 1 Mar 2024 11:46:10 +0800
Message-ID: <20240301034610.24928-1-peter.wang@mediatek.com>
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
X-TM-SNTS-SMTP: 4542F3BD3F18A93542461E9E6F76A2ECD8F0E86ED94C860EEEA7DBD32B326C622000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_194622_095361_9D6F2746 
X-CRM114-Status: UNSURE (   7.16  )
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

Add config_scsi_dev vops comment.

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


