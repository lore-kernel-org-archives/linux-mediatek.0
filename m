Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D6BEA3F11
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 07:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EQSKw1Zxqh3yfhQJOprXxiikhgbHS7MU4joIUwR58+8=; b=KIGr4nSdX0C4Zb2RYRjeurpZQN
	KnQ04wneu9cRaT9EO9B2iyMMI+DQzqaJLtZyzrFvHsO6XJxdjCkMPn1/xiYdLawqxxrORE531PEJ4
	aeusqAFs4xqwTXqYfhjmnGYW5i9uUfhfLcCDCZi3gHx7tF4DAM12LzDRLtOKX1vYDIIvRHcZAcvhk
	Ts1oecgmM3DBJLTU8GP+MKh8c/+4NJF/Y5e9RHDh6syy8pVBuh9Mi0+VQIHUYng+1COTxZIOjP9OA
	5ZeThBZ+p+3p6c24yQHuaSpyvM3/CZriAZbN8X31A4nht9bbqXwQgT4oEAVt5q9eJvHNZn3naz5Eu
	BamLlRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphrg-0000000GZmL-3RDA;
	Tue, 10 Feb 2026 07:08:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphre-0000000GZkg-0bhx
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 07:08:51 +0000
X-UUID: 54e398a0064f11f1a16f0188aa809bee-20260210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EQSKw1Zxqh3yfhQJOprXxiikhgbHS7MU4joIUwR58+8=;
	b=N4Y+zYHGajOR1QIUHkhWoALEfjqmZftZqRNOEa+l+eYPrt8b9tidJGpBA80CJqA/5wVjbZKOFdYUDny4XbP3EKYeS5xkYqIEk2jMO7SBY7nl3RHLVwvFR0pcHQZq8U908b1+tuU4ZtsLhfTEQMTDwPM1On2FuLvCl5pDXMhwswA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:f85e0d14-8e40-4cc9-9556-6e9a29d0bbbc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:034bca7a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 54e398a0064f11f1a16f0188aa809bee-20260210
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1523466415; Tue, 10 Feb 2026 00:08:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Feb 2026 15:08:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Feb 2026 15:08:40 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@sandisk.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v2 0/2] add debug log for command timeout
Date: Tue, 10 Feb 2026 14:41:42 +0800
Message-ID: <20260210070837.1820710-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_230850_183580_FA7C5833 
X-CRM114-Status: UNSURE (   7.82  )
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

Add some logs to make it easier to debug after a command timeout.

Changes since v1:
1. Fix typos in the cover letter and commit message title.
2. Improve log clarity.

Peter Wang (2):
  ufs: core: add debug log for uic command timeout
  ufs: core: add debug log for mcq command timeout

 drivers/ufs/core/ufs-mcq.c | 2 ++
 drivers/ufs/core/ufshcd.c  | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.45.2


