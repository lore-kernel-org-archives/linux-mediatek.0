Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C9CC88E6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0AY+gePrW59hf9RdRVw+cOuM7T7UqFZxJBc4kVKXZYM=; b=xY2I6g0PDL7BdTFGUsGNrE/y5U
	+bXfEPy+8BKXExp4ARz4rSibnECyBoS9m4XeUFldC9T+Uzcq/lonEQO0aC/ink11Q/xXAkZIY7lAc
	NjcOjeQ4Vrad4r9+BUl9qIHgVmhGZ4IlyILioji//923jNtCeOREBKdWnHCyudTFB/U+RDLbnrDop
	nJNVfAfRnuvwnYeg1URRMLLMm3nqvHdwz64GwBOuiMMwjLAvpKdb3t6c2Yvy6brXYlDFojRxh9j41
	YbLeChpeVfqVXIGjTLbZVFHqR6l6MvdaVMavR5kiGUIfGo/Ijk3srQR61ArI1tK0jUZFr7CyYhhed
	+vAQ2LfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Pz-00000002pVr-2woI;
	Mon, 14 Sep 2026 08:52:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Pw-00000002pSt-1ixl
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 08:52:01 +0000
X-UUID: 87e00062b01911f1afed4741b24580c9-20260914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0AY+gePrW59hf9RdRVw+cOuM7T7UqFZxJBc4kVKXZYM=;
	b=GwQCKcaIxh2kTdBSJPx1lGZtmxB267JAQjacZmemkLAHzoLpmKsH+8Vf5UCPZ36+Jj+HkzEjBb4yNtK13sXHRVs/igczG2tFJ9H33LW4L3AXDG4HB8eJ+kZizYiPJ+bV3BCaineFXWBZEGH3FAXzc56MgGacPxRpdphyVIbpHLo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d9dba6bc-bc84-44f9-99cc-bd74999c2709,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:b97c3d0c-027a-4b0a-91ab-050fa8cdb9b0,B
	ulkID:nil,BulkQuantity:0,SF:102|123|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 87e00062b01911f1afed4741b24580c9-20260914
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 368236170; Mon, 14 Sep 2026 01:51:52 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 14 Sep 2026 16:51:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 14 Sep 2026 16:51:49 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@sandisk.com>, <alim.akhtar@samsung.com>, <bvanassche@acm.org>,
	<santosh.sy@samsung.com>, <h.vinayak@samsung.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Subject: [PATCH v2 0/2] ufs: fix POST_CHANGE pairing and AHIT race condition
Date: Mon, 14 Sep 2026 16:49:23 +0800
Message-ID: <20260914085148.136429-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_015200_463108_06451E81 
X-CRM114-Status: UNSURE (   8.55  )
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

Patch 1 fixes a bug where POST_CHANGE was skipped on a failed gear
switch, leaving the host in an inconsistent state if resources acquired
in PRE_CHANGE were never released.

Patch 2 fixes a race between the sysfs AHIT update path and the
MediaTek host driver's power mode change path. A mutex and depth
counter are introduced to serialize AHIT register access and ensure
AHIT is correctly restored after the last disabler completes.

The two patches are related: patch 1 guarantees POST_CHANGE is always
called, ensuring the depth counter introduced in patch 2 is always
properly decremented.

Peter Wang (2):
  ufs: always notify POST_CHANGE even on gear switch failure
  ufs: serialize AHIT register access between sysfs and host driver

 drivers/ufs/core/ufshcd.c       | 22 +++++++++++++++++++---
 drivers/ufs/host/ufs-exynos.c   |  4 +++-
 drivers/ufs/host/ufs-mediatek.c | 16 ++++++++++++----
 drivers/ufs/host/ufshcd-pci.c   |  3 ++-
 include/ufs/ufshcd.h            |  8 ++++++++
 5 files changed, 44 insertions(+), 9 deletions(-)

-- 
2.45.2


