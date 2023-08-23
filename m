Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C516EE49A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 09:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vo3+V+eMV1OAqifmmQMhpDL/h1ukA0z3irk/9OPLQqo=; b=t11OqZ1spG/piwUqe7e9K2F/9l
	iEo1M5r5avIU2KkUNNbqGZJ3V+25h1nugydH1yTI130TjY/tt1IqlxJ+E3HNyOp1/Kr1j34dBAfnY
	ehDmYPAC8irH9rch+pBF0uxe7f5IJ0E6xlrPcQ3KjDbBaLnq9yr+yADzVEDG56tMLdjWDZnBXWZRL
	FjDfiiW5vHMD1Uhu2gtREyok4dP84f18IQPjd2mgVe3cKO/V90Ax5pnxk24/p7j3C6IcHLkm6Vkav
	RTewlLE2Xat7Sf9MhXMXTTFQyRPZ3Ixd4Bekmdq6FvAXo/hzI8ao5b3L4vlXKlg+pxsGBM8DYkQ/I
	TJKkIHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkCY-00041w-2f;
	Wed, 23 Aug 2023 09:30:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkCV-00041C-0u
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Aug 2023 09:30:56 +0000
X-UUID: b80c9c1c419711ee912e1518a6540028-20230823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vo3+V+eMV1OAqifmmQMhpDL/h1ukA0z3irk/9OPLQqo=;
	b=S0Skr4KGYErFXrdAdE0q9NmsX9aKDK7oFCLKU1Olrccv9gnKNbZ4AhsAhfa1A/hgowW9PIrD38U8nI3giwYM5Ne0Wey6buWSVujTsQd19RteY8Xw65B7r6PN6YlNetlOC7GHv80QzsnUGOaYt2P5A/8xcy4jNwAl3C1SNF6umt4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:ecd31b33-5438-4834-9afd-740441bcecbc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:5dd71813-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b80c9c1c419711ee912e1518a6540028-20230823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 242694968; Wed, 23 Aug 2023 02:30:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Aug 2023 17:29:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Aug 2023 17:29:50 +0800
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
Subject: [PATCH v1 0/3] Fix abnormal clock scaling behaviors
Date: Wed, 23 Aug 2023 17:29:45 +0800
Message-ID: <20230823092948.22734-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_023055_349210_E1A30185 
X-CRM114-Status: UNSURE (   6.29  )
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

This patch fix abnormal clock scaling behaviors.

Peter Wang (3):
  ufs: core: only suspend clock scaling if scale down
  ufs: core: fix abnormal scale up after last cmd finish
  ufs: core: fix abnormal scale up after scale down

 drivers/ufs/core/ufshcd.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
2.18.0


