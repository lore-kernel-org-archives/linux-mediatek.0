Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23A0C7EE31
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 02:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wKxiAjJaD2fCBU9jgKHTupnXwycEnNR8OZfzadkS1xQ=; b=4trXPp+ZADtI1Qu9l6QwQYV4ga
	0aHzual5T+FqPiKs1fV30V6w/a/nZCYJG8UK0XSGCMqjlw2sqbp66eid9rwdtctVIuSQt2wvWEN72
	MHcay3Gic+1tQF+1UIii96cGI9lL0jF0ea8mlk/d5+4v5sseHKIPFePXCjsp4QWyMg35xlasV5Sbc
	aDFScxY0Z7lug0TTDWZprp8AfjAowhmeJA8MV+yPae2ZLaJUSA0HW+jstKEjtmGGxuhmYUzzewxSH
	IYWq/tDN6EgqVQ4+NidOmuIDhtpQdd2GCDTqkM6oTqmkLdt9jivxWWGEJbyyjaokF5v7lmU9k0b7X
	eKs8zToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3pKR-00CDPd-1V;
	Tue, 30 May 2023 02:43:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3pKP-00CDP9-0g;
	Tue, 30 May 2023 02:43:18 +0000
X-UUID: b83c6ce0fe9311ed912e1518a6540028-20230529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wKxiAjJaD2fCBU9jgKHTupnXwycEnNR8OZfzadkS1xQ=;
	b=haa1p6Yia7kEZQWqt3xUqH8dahF+keedtV1I3+Lrdnc6J2s780+i1ij3qgErFPVdxeit5renIhI4SaZQlXmg2XRBY+vCL54A8PcoEIFqFjI+v6N0jJv5GdCXW78VDRQnnS1qOSg6TXaB8O2wqbx0Jsp4+TgFL9nB5FFdqqAfAMI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:72959283-263d-47c8-9029-f68d439d4d9a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:2f02c03c-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: b83c6ce0fe9311ed912e1518a6540028-20230529
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 172100679; Mon, 29 May 2023 19:43:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 May 2023 10:32:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 May 2023 10:32:38 +0800
From: Po-Wen Kao <powen.kao@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<stanley.chu@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<eddie.huang@mediatek.com>
Subject: [PATCH v2 0/3] Add MCQ support for MTK platform
Date: Tue, 30 May 2023 10:32:24 +0800
Message-ID: <20230530023227.16653-1-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_194317_257669_97046D95 
X-CRM114-Status: UNSURE (   9.99  )
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

v1 -> v2
- Introduce MCQ SQ to CQ mapping vops and provide MTK implementation.
- Update export symbol patch

v1
- Separated from topic "[PATCH v4 0/5] Several UFS MCQ Code Changes".
  Here are some changes since last upload
  - Store irq in per host array
  - Symbol rename
  - Use ufshcd_mcq_poll_cqe_lock() instead of ufshcd_mcq_poll_cqe_nolock()
  - Handle invalid irq dts property
  - Remove ufshcd_disable_intr(hba, MCQ_CQ_EVENT_STATUS) in MCQ mode.
    This will become host quirk later.

Peter Wang (1):
  scsi: ufs: core: Introduce mcq ops to config cqid

Po-Wen Kao (2):
  scsi: ufs: core: Export symbols for MTK driver module
  scsi: ufs: ufs-mediatek: Add MCQ support for MTK platform

 drivers/ufs/core/ufs-mcq.c      |   6 +-
 drivers/ufs/core/ufshcd-priv.h  |  10 +-
 drivers/ufs/core/ufshcd.c       |  11 ++
 drivers/ufs/host/ufs-mediatek.c | 188 +++++++++++++++++++++++++++++++-
 drivers/ufs/host/ufs-mediatek.h |  33 ++++++
 include/ufs/ufshcd.h            |   8 ++
 6 files changed, 251 insertions(+), 5 deletions(-)

--
2.18.0


