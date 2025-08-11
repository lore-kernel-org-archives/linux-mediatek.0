Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1BDC88CB9
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 13:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zE7VaC4MONDwK4PE8r0v7fr0w4FR+FHjUHLbyoOF2zs=; b=L0aCaheea5lnmxiC6aYqDkB+n6
	j69PVP/QsaFMVxfkTm/8csdkZcje14p9JfPIJ4NAU1HIUhiz+wM2e790sQdRN0W+g06cl0LjVXt3w
	Rm+3aA9XvrtA/Tv43BhFnkTzgtm1e7Ymm7hFaanx845rlGEMxH5SHCPkMDvyrjL5klfppKXGZhZuN
	FZqdQ/Dhx39XvrjvruBKWpHrdHu54SIC3t2sMJSYSiuNTczG7i4FUeDqGaXwIKV3CAHSwASda5lCm
	/KubUq6d8A+WLfJYXBbR9faBFsI5X0b09c4Ear6MHfpG/7oQqnY5/o1H2ah6OR486ui9VYA5VkTBV
	2GgGgFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSS4-00000007nRg-1Fd6;
	Mon, 11 Aug 2025 13:20:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSMC-00000007mik-1Cf4
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Aug 2025 13:14:33 +0000
X-UUID: 1b7a80a876b511f09f706fa2197c6ceb-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zE7VaC4MONDwK4PE8r0v7fr0w4FR+FHjUHLbyoOF2zs=;
	b=d8WGCaNdZGKemkIrv6UWaJNogDLixsyW5SdiS5uRWCoH74PUhHpLd6WwUcFh8/PGrpGDpcW05z2m/dkMXleLXQzw4MFdfr0oWLeAX5tWDn6vu9QAxHjPbUWWWmq0oZquflX7opbhdIhlRVNSa1t0S7Kcp78AjwDhTOeQxjNjLJU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:4de026bf-4a5a-42d5-94d8-cd7dbe43d08e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:69db4fa1-1800-4e4f-b665-a3d622db32cf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1b7a80a876b511f09f706fa2197c6ceb-20250811
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 45114408; Mon, 11 Aug 2025 06:14:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 21:14:24 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 21:14:24 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v1 00/10] ufs: host: mediatek: Provide features and fixes in MediaTek platforms
Date: Mon, 11 Aug 2025 21:11:16 +0800
Message-ID: <20250811131423.3444014-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_061432_331058_EDC2C5B2 
X-CRM114-Status: UNSURE (   6.02  )
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
  ufs: host: mediatek: Simplify variable usage
  ufs: host: mediatek: Fix auto-hibern8 timer configuration
  ufs: host: mediatek: Add debug information for Auto-Hibern8
  ufs: host: mediatek: Fine-tune clock scaling
  ufs: host: mediatek: Fix PWM mode switch issue
  ufs: host: mediatek: Optimize power mode change handling
  ufs: host: mediatek: Fix UniPro setting for MT6989
  ufs: host: mediatek: Change reset sequence for improved stability

Alice Chao (2):
  ufs: host: mediatek: Assign power mode userdata before FASTAUTO mode
    change
  ufs: host: mediatek: Fix invalid access in vccqx handling

 drivers/ufs/host/ufs-mediatek.c | 185 +++++++++++++++++++++++++++-----
 1 file changed, 156 insertions(+), 29 deletions(-)

-- 
2.45.2


