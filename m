Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92D4CCD192
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Oct 2025 13:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l1L6dCANxX6aUgtEXhtUXuM3yx6oct3U3laoE+p24ZQ=; b=Vq7WmGHqRNzO8wc5Oe5nWyPaCK
	Fu8KZHLqyvxLLHGkVRaSy0eOuwxPavNSPiVsXcC+GLDAAei22nAVoTvnr+I2Hw9mZOKnz5t+wZaTG
	sDfopNZD+HDQHH6ve1cVdYPrlKL6XtvTkB3/a1rDTt8XFK+0vYw2ZeEsZUN4yq+FRI+M7jSzkz1l2
	1976UC85hv37UjmHFFVVJsYZEVA0be8SLCxW7HfhJKPpLlfvAzD1MXR0RA4ZLJ3oiVkARQQz0Xx/y
	c1WcBetEMe2sPMZ8BQ/j+9Vp5Omuacw1uNF7CZJfbYudY6Ysul+L30hXjyjGfcs3i8q5Y3UCnVVia
	PaEpfvzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8euy-0000000GRqO-44DP;
	Tue, 14 Oct 2025 13:18:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eux-0000000GRqA-3EqX
	for linux-mediatek@bombadil.infradead.org;
	Tue, 14 Oct 2025 13:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=l1L6dCANxX6aUgtEXhtUXuM3yx6oct3U3laoE+p24ZQ=; b=V4U379IbMx8c50kNtRMMBs/oPe
	8FIkEHbTAuGjKZjOzxrIaZaoMtr/MesgyENt7deC8oHChx+M8YXSkWyzgsbx3Y6/2nRFCec1rXuU7
	NbG01ZX9w1+WLOi2uV0sqjhXdDOg7VBTsWEKP6tulwUHF72IvTrARQo8r9/BYe0m4Bv85T5wihN7Y
	Zq5UOE0sbCVN+XNiVKfWJyydxaIRLpTDfwk7gJH6JhkDWec8W30FgqR3/yAuAbwXUhwBTl2EtliyK
	UR3ATWAI6uaGGFV2wQEjeos8VS4CzC5dylIcLh8ZYqt9SsgYAO90dcrJfxkU7W6mCgHJxBwq2T3g2
	aL5N4GxQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eut-00000005BtY-1zr7
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Oct 2025 13:18:18 +0000
X-UUID: 36727cdaa90011f09f706fa2197c6ceb-20251014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=l1L6dCANxX6aUgtEXhtUXuM3yx6oct3U3laoE+p24ZQ=;
	b=Zx/XspCLadvqHpUk+xBJeFrYQXYhqSdacJ2yeAKVpk3mBH4+3kQicYebZTu29JJ2uIVowyC+wAKGx+K/er/spGCyDh1eck2PJOTXfq4yHSSW7oxf3Lr4QS+PElPb+gWrZUfWlxFvuxh/SS96Hy8ULedRD7jcCSaPVu7z8B8AVME=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:368e40c9-ccb2-4be4-a317-9078c4906cb3,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:cf670c51-c509-4cf3-8dc0-fcdaad49a6d3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 36727cdaa90011f09f706fa2197c6ceb-20251014
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 335102328; Tue, 14 Oct 2025 06:18:02 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 14 Oct 2025 21:18:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 14 Oct 2025 21:18:00 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v1 0/2] update CQ entry and dump CQE in MCQ mode
Date: Tue, 14 Oct 2025 21:15:54 +0800
Message-ID: <20251014131758.270324-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_141816_459243_F631B964 
X-CRM114-Status: UNSURE (   6.19  )
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

Peter Wang (2):
  ufs: core: update CQ Entry to UFS 4.1 format
  ufs: core: support dumping CQ entry in MCQ Mode

 drivers/ufs/core/ufshcd.c | 17 ++++++++++-------
 include/ufs/ufshci.h      | 17 +++++++++++++----
 2 files changed, 23 insertions(+), 11 deletions(-)

-- 
2.45.2


