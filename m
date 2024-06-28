Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0336C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 07:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=irLaHCX2zHKTSIkKOfcy2lIsUrR7jXGz603EzNUAFxo=; b=qy554fUg4LI2C+6fHpCNm/knHU
	4LF4v9nTuW1CrzzaHwMOlj+em+mWIYBKrCAkjBAEhz28RYPUnhhcEqNPMilvtQ+6ppOj4wiKaWy+I
	g4gOhJ+QtbyYrjBWJLAAud7i+WToiLd7Y0JM5Nw9qRKa+hnXXuSuLVn75+Q+JukSGYoAsD+gwl117
	bGQsQ9+1YQ1mqMglMFguFh1E56fWaCMnq0QeUhLfIEe6MlTZLbGlevFcTi92VPoHBfpdc61FYwtz4
	fylAoHITpJ09/07e4Vr8cXkzv7xKS7wfw47MGgA4+LaEtFQzqoXisS8Go4hLeSxmR810K3dbuW5dp
	hIBwnJHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN5b8-0000000CptH-2wC9;
	Fri, 28 Jun 2024 07:00:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN5b5-0000000CpsX-2ibk
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jun 2024 07:00:41 +0000
X-UUID: 1edf0010351c11efb2966dae1f787272-20240628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=irLaHCX2zHKTSIkKOfcy2lIsUrR7jXGz603EzNUAFxo=;
	b=gESS++xTlkNxY1r8WydCSW3b7XjbGuDnjAm2YgjqhUObQ42Td5Qw1C7B+9VVoce6Ma+8GE1y1fk894AY/K7VjNjqA52R/v39hcfEjn5ascisqCm0qArrXpleQYR7R5vCW9HxmJbe2wJCkRfGmplQjBV/4uMaQCq9zjiSP8p5Oeg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:c1c90dc3-6fb9-4a33-a17f-3115b8a4c523,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:42ecd8d0-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 1edf0010351c11efb2966dae1f787272-20240628
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1615277638; Fri, 28 Jun 2024 00:00:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Jun 2024 15:00:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 28 Jun 2024 15:00:31 +0800
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
Subject: [PATCH v3 0/2] ufs: core: fix ufshcd_abort_all racing issue
Date: Fri, 28 Jun 2024 15:00:28 +0800
Message-ID: <20240628070030.30929-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.428700-8.000000
X-TMASE-MatchedRID: lR9wedxBitsMQLXc2MGSbBes/RxhysDbFJFr2qlKix+7qpOHKudqc5as
	fA8Y/RCFiI8t/Y95trJix2NkmtuoxShlmALF5LHIjNvYZHpO13dKPIx+MJF9o5soi2XrUn/J8m+
	hzBStant2jkpctwKLBQtuKBGekqUpI/NGWt0UYPBkV0ySDuBhe6atgnJszNdSNvttFIXy+pKzdl
	k4phIsUlncShV1VSIi
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.428700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 07A7C2201B6794F2E8F3CC91F6D157BECF181419B27292004DFDF86857F7DD2C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_000039_719587_9B4AB893 
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

This series fixes race condition KE in ufshcd_err_handler, which call 
ufshcd_abort_all abort an already completed request by ISR in MCQ mode.

V3:
 - Modify ufshcd_mcq_req_to_hwq to distinguish cmd is completed or not
 - Split two patches and add more race description.

V2:
 - Change patch description and add Fixes/Cc tag

Peter Wang (2):
  ufs: core: fix ufshcd_clear_cmd racing issue
  ufs: core: fix ufshcd_abort_one racing issue

 drivers/ufs/core/ufs-mcq.c | 11 ++++++-----
 drivers/ufs/core/ufshcd.c  |  2 ++
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.18.0


