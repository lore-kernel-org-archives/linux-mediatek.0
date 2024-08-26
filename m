Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93225C5321D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 04:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dZIiGVvIpecQWnYLZ08Qp1lFuCr4iZEaRdK87m+BHHI=; b=tVSAjz4bwWJE4lI1W0MU9tfWzZ
	t9wwYMUQ/uMxx7hmT9p/bHD+8jIhQySXxW0syjGUyfkbeOcheeCAeiJStPxGg1TbyiZH+bK/3Aq1V
	7i7Bb31IvaoJo8KVYyGnSPIiiqfoEFnlcwKEKdaqz6jReYmYa1zwzPaB+CE5N0T/d5WiB1bxFAJnY
	XJmgfcj3czT8kghmbCURc+29ENTEyAT2ERzi08/WhuJ9gU47xxOL5RcfPH28SOaKk6ZowWHSJBnp+
	76L2isf2nO448CSEKWDceXBk3DxPkvOLKsBy0tqyke7JrdcHSWlgIRB9KX/Pe94tWmUJr9qDIRtad
	sNwJ2nEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siQyn-00000005jBJ-4AVz;
	Mon, 26 Aug 2024 04:05:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siQyl-00000005jAq-0hwD
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Aug 2024 04:05:20 +0000
X-UUID: 65a22a78636011efba0aef63c0775dbf-20240825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dZIiGVvIpecQWnYLZ08Qp1lFuCr4iZEaRdK87m+BHHI=;
	b=SXo08ZR5IwvsLO1/EivT2pTmOCUPdp9pRF/GCTgmCJo9dvlT2wf0KGVkTsYBoWZGkE9g7CxhwkTPzCQS0rwehbtqVa8M3JYla4HLq2Kx9Km04UJC/nc0t3A5ViPTGrrWmKkTRmdK6SxYmNe9FJgQ60FWrIT1vXULmGjbwqJAGyI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:063cfdcf-5153-4721-81b6-702e44ef6c03,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:add22acf-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 65a22a78636011efba0aef63c0775dbf-20240825
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1744686241; Sun, 25 Aug 2024 21:05:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 25 Aug 2024 20:45:10 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 26 Aug 2024 11:45:10 +0800
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
Subject: [PATCH v2 0/2] ufs: core: fix err handler mcq abort defect
Date: Mon, 26 Aug 2024 11:45:07 +0800
Message-ID: <20240826034509.17677-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_210519_224045_CA32D25B 
X-CRM114-Status: UNSURE (   6.60  )
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

This series fixes ufshcd_err_handler abort defect in mcq mode.

V2:
 - Change patch description typo.

Peter Wang (2):
  ufs: core: complete scsi command after release
  ufs: core: force reset after mcq abort all

 drivers/ufs/core/ufshcd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.45.2


