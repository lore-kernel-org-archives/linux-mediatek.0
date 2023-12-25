Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DAEC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Dec 2023 09:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qtc/UT0sxKoldwIN+ov3bFvbcaNDnm1oh+icAmEqNDI=; b=e2fCGQJAN/7o+pQ7pgosH34LR2
	powYbdH/b/Xh82c/J2y3mPM+7/gZSQ6mPWgo+YGkD3IGvuC/2xqZ7Zo74Sozs1IO5AN3UaYidUK3M
	LF6Og5g6nWsPWK/jCow1YLGfJzK/JaULx+h2TP51g+WxFrXsZe+91kC3WeklBpavXsMFNweOEVBkT
	NRd56aKpIhziEchEi7uB4qmFfq+ZxYeogXY/K3Hg7Mw32+3Ai2WL7BfdbsrwsxAEvMMKNMQKUhzFa
	KzOKZWFSFu9KcsbMZ0kDFS/Q/JjdG1QmBa+z4T+ZnGwzwjIrRzIhEcZ7gNJeUH4bQQ+lIJueXuiST
	DS31yWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHhQL-00ATsy-0i;
	Mon, 25 Dec 2023 09:39:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHhQI-00ATsZ-1N;
	Mon, 25 Dec 2023 09:38:59 +0000
X-UUID: 68cc75d6a30911ee9b09ad09c76753c8-20231225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Qtc/UT0sxKoldwIN+ov3bFvbcaNDnm1oh+icAmEqNDI=;
	b=mYNF7VsRRurLSLTIcHRZPcVfT7XKTDOIhhqYvQu5/kSZz56sEm2JX63fF9Z8D9cDVh5bhHvgvXoDryvdnVsOa4qREpSAaOGJHu6uZqvzKf3OENAnknup8olyFr2fKzN+B4qPoYhT9uu07zktpHjmBKy35YMSUsS++5NBChjgv78=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:7a12fff8-d24e-417c-b44e-e007bae48ff0,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:5d391d7,CLOUDID:f7728b8d-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,D
	KR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 68cc75d6a30911ee9b09ad09c76753c8-20231225
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1055132949; Mon, 25 Dec 2023 02:38:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Dec 2023 17:38:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Dec 2023 17:38:46 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <ulf.hansson@linaro.org>, <chaotian.jing@mediatek.com>,
	<matthias.bgg@gmail.com>, <mengqi.zhang@mediatek.com>,
	<wenbin.mei@mediatek.com>
CC: <yangyingliang@huawei.com>, <adrian.hunter@intel.com>,
	<avri.altman@wdc.com>, <vincent.whitchurch@axis.com>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/1] mmc: core: Add HS400 tuning in HS400es initialization
Date: Mon, 25 Dec 2023 17:38:38 +0800
Message-ID: <20231225093839.22931-1-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.214900-8.000000
X-TMASE-MatchedRID: K5X4qC6dTGXHO8eAxCOj9g5KPhGIg0MRmdrHMkUHHq/d1Nq3SV2z16PF
	jJEFr+olAmPpbGBYlhvkwjHXXC/4I8ZW5ai5WKlyUbuU0PqmIHzXf6gk5EUc2PO6QeGRZiXtToE
	IiXyM+vCS0844xDjSIhz+PhojlLUuev0YPTN868QBqq+/+aGCsQhzL04Or2eZVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.214900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6200C6012DED93DD56A71F42AC0FB3308455ADF6E74D051D7356F2AB2D2A06A92000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_013858_472400_3B939A81 
X-CRM114-Status: UNSURE (   4.67  )
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

change v3
1. remove mmc_retune_disable() and mmc_retune_enable() from
   hs400es initialization.

change v2
1. remove hs400 tuning from mmc_retune.
2. remove mmc_retune_enable() from hs400es initialization.

Mengqi Zhang (1):
  mmc: core: Add HS400 tuning in HS400es initialization

 drivers/mmc/core/mmc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.25.1


