Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823D4CA0EFB
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QCbZZ+HLARh/+zhHKGYSQ1ZKICknsRWOTY5EOhqpK0s=; b=bi+vgIm7XtTjn0AzThzZmjVaFa
	adJJtBb9oTsyP83y732rmZ+kdsqR/c6qV7lEDLM88ff65OB2bfmU3Gpk346zimfvni9PGDXGkXVks
	5Fp12YMwcJFdlQztVcUG6Y84KCyUOFmCKnsulz0seOavOD1r12YV8L+GzPwYmrTE0WNjZE2K3wuW5
	sOGRROl+TxxoPvBaErfJNM74+sZpg2VzLs+0a9aa0EcztAlhyQT2PWvnAnMIevGJB2yu/AE17HV1a
	+CNS3j2o4KXwBfdL5/3ppx/qLMkYfRyuXmAKJzyVDNsb2vnFrAkg/3K3ntnsvmrl0BthFumKGYPNm
	nZkieA5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyCn-00000005cot-0VVU;
	Fri, 30 Aug 2024 09:46:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwJW-00000005BEi-25TU
	for linux-mediatek@bombadil.infradead.org;
	Fri, 30 Aug 2024 07:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QCbZZ+HLARh/+zhHKGYSQ1ZKICknsRWOTY5EOhqpK0s=; b=RfVMEqW8UjNVrlwxBgX64M2jhu
	sZSJ9N0+fUvhgmJDPHW26j2pOYsap6I7WDZyztVt2Nud9krLUoymysKxVv4EWtuZpve5lFk8pAuba
	HAwj7t2p8FSZbqWhJV9+dHQ65wryLJJ/f1TKwKaWYP/xRsz0qcsUm8ii6pqbuOBH4lPUdlzqNyoPl
	NWhvOyF25YRLzhAwqeNl62rnFzMPT74La8Lae3Hc0YpL0sTyjbkhSFqL7oncQzRZpHhUm2sR97E2q
	CWLSgGiRUsnt/5G03GLQA/RwJ6UTn93QIppHjdXivzAP8ObhWvMrXNt+c9VXa0IERYwmmKQctjFmv
	AzGhVsvQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwJM-0000000BayH-2FHP
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 07:44:54 +0000
X-UUID: b0fba0c666a311efba0aef63c0775dbf-20240830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QCbZZ+HLARh/+zhHKGYSQ1ZKICknsRWOTY5EOhqpK0s=;
	b=pD2sWegElDxnMkKLqSxyb3t/KdziKoM0eLDpblUPPiJKEhzWDklibSJE86+uCe7VJe1ZWtaJJ9bMZAAL9gtSX3OjoQCwAWV7GnVgDVhqBMSDS291St7kXKwCgX99duKyrBUntoDUXtS8qJ+OK2KS1UTVq9WKA2O3OOndwvlN304=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:90a6ea22-3b92-470b-8012-2c75a96ff3ca,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:c88c0a15-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b0fba0c666a311efba0aef63c0775dbf-20240830
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 202662359; Fri, 30 Aug 2024 00:44:30 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 30 Aug 2024 15:44:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 30 Aug 2024 15:44:28 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v1 0/2] fix MCQ abort defect
Date: Fri, 30 Aug 2024 15:44:24 +0800
Message-ID: <20240830074426.21968-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_084453_325208_418D9260 
X-CRM114-Status: UNSURE (   6.80  )
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

This series fixes MCQ abort defect.

Peter Wang (2):
  ufs: core: fix the issue of ICU failure
  ufs: core: requeue MCQ abort request

 drivers/ufs/core/ufs-mcq.c | 10 ++++++----
 drivers/ufs/core/ufshcd.c  | 21 ++++++++-------------
 include/ufs/ufshcd.h       |  2 ++
 3 files changed, 16 insertions(+), 17 deletions(-)

-- 
2.45.2


