Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D8ACCD193
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 02:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FpQ1sqYlcYyeJd1gub7sZa/OhHsSH5Mep2/th2vBbmo=; b=Sp5FnOexG/ddrD3J0kx4fax5AG
	awGK7Yxpn966DzOQw35g9DXoduZ0j5AHkgs0Du+xfQXY0IsSPmZa1NzVtUUvjWHjuo/DJaYCQESiL
	h+qeAqM63YWL7A4ZBKY7G28OUszTpnUvnKtirnJh4gDChofesa9GAiCygnWLtto4mo0FyV6YQL5qk
	DWx/u7jWCchlf8EvvBtk8NjBtfpAKIV8EVS7gOgUBjHTAiZWKJEeMi9FJl4YPwfiWWZYBy4+QZCLH
	QT5i5+Oqd59d5xpHBCRi3zG25YJH96Uyn61PVFnZibwMm0gPfgCf+bIPVZteP7/boi91+q7jQDM0P
	KO6+8VTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Dpp-00000003JN4-0hsb;
	Thu, 16 Oct 2025 02:35:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Dpj-00000003JLe-3oUJ
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Oct 2025 02:35:17 +0000
X-UUID: bd08df58aa3811f09f706fa2197c6ceb-20251015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FpQ1sqYlcYyeJd1gub7sZa/OhHsSH5Mep2/th2vBbmo=;
	b=uhmFzUP+YOD2t+l8BEpG0ZiMvN3FrlBRRRZtElGTSbS0q1hjQFZlnqsxDUXN/LiCbpJQo3J+NbR55gYvetqk1/6N7RknEBl6avdWGREpw9d50ARIEgU/EPbSEoERHyWiBXSM+njsdURBeE2aVZlQf6ZxM38RzVzo1jwc3Ot+DRQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:ad6b854f-41a3-4f20-97b9-76aed3e475eb,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f34038b9-795c-4f99-91f3-c115e0d49051,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bd08df58aa3811f09f706fa2197c6ceb-20251015
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1383594485; Wed, 15 Oct 2025 19:35:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 16 Oct 2025 10:35:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 16 Oct 2025 10:35:08 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v2 0/2] update CQ entry and dump CQE in MCQ mode
Date: Thu, 16 Oct 2025 10:32:30 +0800
Message-ID: <20251016023507.1000664-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_193515_960190_014C945A 
X-CRM114-Status: UNSURE (   7.19  )
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

Update the CQ entry format for UFS 4.1 compatibility and
add support for logging CQ entries in MCQ mode, enhancing
debugging capabilities.

Changes since v1:
1. Add big-endian support for cq_entry.
2. Move CQE dumping outside of the dump function.

Peter Wang (2):
  ufs: core: update CQ Entry to UFS 4.1 format
  ufs: core: support dumping CQ entry in MCQ Mode

 drivers/ufs/core/ufshcd.c |  9 ++++++---
 include/ufs/ufshci.h      | 22 +++++++++++++++++++---
 2 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.45.2


