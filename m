Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39461C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q1xVPgyjNzrGEirYEr+nq8Zk4ZTr7PDzTq3MciNODW4=; b=2f+KdoFGzpkS5SjwTPczd2e4gp
	62kpGUXUcZ3E2a6Ep+Ov7Qi7J8QU38txiBU9rebfagJEFAmXzsSYOfjube4q7isvACKa2RdBWWs48
	F0GzuzYSgSXXs0LFzAMsNzpAaHXhLosraz/vW+zatOwlGlzLNe/ZfqfWlub07u59CYmK3Z9lYxiKn
	r50XOKWFF/2CIc/XGsMhCXlXbRL/VtsMMX/yBpO8bCRavo8BZSgJWQDJHLz13GZbbY6YMW5Za0A5S
	5HIWtKL2MppvflF5EaCn8ZPZhfbGkkkUmpUbM8b9tSP1XP55elUwHeLcarOOpc84WSoOXkhfTSZr9
	1vsJIAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onb1h-008PRO-AJ; Wed, 26 Oct 2022 07:40:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onb1d-008PP6-H1
	for linux-mediatek@lists.infradead.org; Wed, 26 Oct 2022 07:40:35 +0000
X-UUID: 842aa3a2177d43e3b87f3b67855b1734-20221026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Q1xVPgyjNzrGEirYEr+nq8Zk4ZTr7PDzTq3MciNODW4=;
	b=Xgg/Awwe9reCbl5pmQ4H1DJQdVq8baozhEBwtDUHopbQhSyg/HtYRrRqAUM7fQ0U3Snk9Kmaw0bxgtWoXwqmrgPS5qe0Ixtdc2hOhPJ41se2VhSFKvs0S02z4gk/S0XkgCk4x/CZSekPYKlYfPyqxy7tJIlIPLE7EshblybA+ns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:f54befb4-c3f0-401c-8535-9c162b0d74b9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:16c22d27-9eb1-469f-b210-e32d06cfa36e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 842aa3a2177d43e3b87f3b67855b1734-20221026
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <eddie.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 600255852; Wed, 26 Oct 2022 00:40:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 26 Oct 2022 15:39:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 26 Oct 2022 15:39:50 +0800
From: Eddie Huang <eddie.huang@mediatek.com>
To: Asutosh Das <quic_asutoshd@quicinc.com>, <martin.petersen@oracle.com>,
	<stanley.chu@mediatek.com>, <bvanassche@acm.org>,
	<linux-scsi@vger.kernel.org>
CC: <avri.altman@wdc.com>, <liang-yen.wang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <cc.chou@mediatek.com>,
	<powen.kao@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH v1 0/2] Add Mediatek UFS Multi Circular Queue
Date: Wed, 26 Oct 2022 15:39:41 +0800
Message-ID: <20221026073943.22111-1-eddie.huang@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_004033_585146_9B946E4C 
X-CRM114-Status: UNSURE (   7.79  )
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

This patch support Mediatek SoC UFSHCI 4.0 MCQ (Multi Circular
Queue) capability. The implementation is based on "Add Multi
Circular Queue Support" series [1] by Asutosh Das, and provide

1. Customize MCQ register resource vops
2. Mediatek MCQ porting

This series test pass use FIO on Mediatek platform

[1] https://www.spinics.net/lists/linux-scsi/msg178322.html

Eddie Huang (2):
  ufs: core: mcq: Add config_mcq_resource vops
  ufs: mtk-host: Add MCQ feature

 drivers/ufs/core/ufs-mcq.c      |  3 +++
 drivers/ufs/core/ufshcd-priv.h  |  8 ++++++++
 drivers/ufs/host/ufs-mediatek.c | 37 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-mediatek.h |  7 +++++++
 include/ufs/ufshcd.h            |  1 +
 5 files changed, 56 insertions(+)

-- 
2.9.2


