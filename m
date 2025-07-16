Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB21C83F2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jul 2025 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lx0GhBKRDknE8K4JeiRNMVxYB7SoA83Xzs9YXSDFdDc=; b=MdGAcRZkhmql4sFC8HeNWEy4fL
	FMtUoaHHaOZ/bwFRhCTHCGnUQTOIbOCtG2MaL8wTZh1RTZ+KgRuLozdLpoFu+0lLXcwhutYtha5sc
	UI3E8a6NBmlrUtjMHKa1S+U16Y+zWYiuwP+hwc0Z47ldY8PmBxQXXjXx7FEKMgSAN/N+sfYmD+P9W
	5KK+AJh6TfuB1+6MaqAeTtOfY9lHizTs6o2JVOk8/Uven+YLaRuREY079iEGHl2xYPqL2FrKouQ/3
	0f/0yZl21/SXcpXvODDLRgIR4OSMYypgsrlk6Lk0liRjG++QEHf0S/4ABneFuZQl3coXomELbMssp
	FciFfxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvvZ-00000006v9V-3nUC;
	Wed, 16 Jul 2025 06:47:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvdC-00000006tHP-33U0
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Jul 2025 06:28:44 +0000
X-UUID: 19a20866620e11f09eb0dd999d3936bf-20250715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lx0GhBKRDknE8K4JeiRNMVxYB7SoA83Xzs9YXSDFdDc=;
	b=MCX1JKHp98euYGTZ4MzZ/8SEHjxPwyTk0GnxPXdrCTO2upVydnUMvH/uIsWIA1kmKotoUd+3Du8zezQBisf73ktmMetc4IZ6Vx0lHqc0FdNMgF+jjSNjD666uPE/4QbnZQXwMqB5PTuX2tDwyzk9NAzyC3WEVOWdmRnlVA6Fekw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:44da037c-3bbd-490e-8b2b-91bc4e5c8c5b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:b51836df-2070-40bb-9c24-dfabef7c07f4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 19a20866620e11f09eb0dd999d3936bf-20250715
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1890145739; Tue, 15 Jul 2025 23:28:34 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 16 Jul 2025 14:28:31 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 16 Jul 2025 14:28:31 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Subject: [PATCH v1 00/10] ufs: host: mediatek: Provide features and fixes in MediaTek platforms
Date: Wed, 16 Jul 2025 14:25:25 +0800
Message-ID: <20250716062830.3712487-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_232842_777109_28CB25F7 
X-CRM114-Status: UNSURE (   6.63  )
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

This series fixes some defects and provide features in MediaTek UFS drivers.

Peter Wang (8):
  ufs: host: mediatek: Change return type to bool
  ufs: host: mediatek: Add memory barrier for ref-clk control
  ufs: host: mediatek: Change ref-clk timeout policy
  ufs: host: mediatek: Handle broken RTC based on DTS setting
  ufs: host: mediatek: Set IRQ affinity policy for MCQ mode
  ufs: host: mediatek: Add clock scaling query function
  ufs: host: mediatek: Support clock scaling with Vcore binding
  ufs: host: mediatek: Support FDE (AES) clock scaling

Naomi Chu (1):
  ufs: host: mediatek: Add DDR_EN setting

Alice Chao (1):
  ufs: host: mediatek: Add more UFSCHI hardware versions

 drivers/ufs/host/ufs-mediatek.c | 326 +++++++++++++++++++++++++++++---
 drivers/ufs/host/ufs-mediatek.h |  32 ++++
 2 files changed, 330 insertions(+), 28 deletions(-)

-- 
2.45.2


