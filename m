Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF17C46CD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Dec 2023 06:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WJRbxASauCmb1KyNcmBLMhUdg4GwhqhjK/hcVDdoH8E=; b=j7scWk2ohRVY7bMDVLM8sIRGr6
	qRwZhkAICB8KxoaqSNQdHaJyQQGfwJE7hZjTksd0I++XTwzKlT7YDaBGAoyZyfgIuivoWasRuvkcP
	ChEJ/fRZrLIePSspTmGdU+mQ+YfWLdYET2xZqdBFrm3r4W0pA1dqn+EnQmYqV6D3C/9igApuEau63
	MMcnqeVC0J2Pnc+gm9SVXwocwvWdotZHicKr+uRZjbasWXSjT6qacabHldxbZUpKvtPeoa+gx0KWm
	3qIPfyBdA3PfUOck9GXNDQ7arf+dumM7/mPBEnXpJO/CS6tBRq99N+/XDFDu5L7mWl5RUjnl0Tgef
	UR5qL5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYwL-0054AT-3A;
	Fri, 22 Dec 2023 06:23:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYwJ-00549p-0a;
	Fri, 22 Dec 2023 06:23:20 +0000
X-UUID: 94a46f98a09211ee9b09ad09c76753c8-20231221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WJRbxASauCmb1KyNcmBLMhUdg4GwhqhjK/hcVDdoH8E=;
	b=M2h9Kyym6CGvy4fcqPcCAdj3L2uwBQiSYdoKR0iGSxO7rvK2uh62Z6iw0Gdhdu0C0IbbY2f2Se5Jz+L/sMfdoCftEP4YnbiVHbUycUK1wYCz0NiovWNXY2Q4cm96GWzx56v+ge0CfyW9pstkfMdHCdSg+j26edZilFDOD+xT/8E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:e74846b5-95c0-484f-af63-d2fed05f9672,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:5d391d7,CLOUDID:cfb00d82-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,D
	KR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 94a46f98a09211ee9b09ad09c76753c8-20231221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2020172721; Thu, 21 Dec 2023 23:23:11 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Dec 2023 14:12:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Dec 2023 14:12:33 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <ulf.hansson@linaro.org>, <chaotian.jing@mediatek.com>,
	<matthias.bgg@gmail.com>, <mengqi.zhang@mediatek.com>,
	<wenbin.mei@mediatek.com>
CC: <yangyingliang@huawei.com>, <adrian.hunter@intel.com>,
	<avri.altman@wdc.com>, <vincent.whitchurch@axis.com>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/1] mmc: core: Add HS400 tuning in HS400es initialization
Date: Fri, 22 Dec 2023 14:12:19 +0800
Message-ID: <20231222061220.26270-1-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-1.769600-8.000000
X-TMASE-MatchedRID: rrQSwUHHCeTHO8eAxCOj9odlc1JaOB1TMZm0+sEE9mu6SmGkMbaxzqPF
	jJEFr+olAmPpbGBYlhvkwjHXXC/4I8prJP8FBOIaq7gCN/wjpYsFwAumiEQt0Lc75ozeC0gH/yA
	s+Hbv3NZsfmvnlCx6y21Rjoup2VCcWve+eVz4Pp5Vk5utmQ1VlGVF3+d9rnoxXRPYWkcrg25WXG
	vUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-1.769600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6772C341A827DC8CCB34E55DD71CF475DE73743B2AAF1CDC5C2495D2621491812000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_222319_221163_263021FA 
X-CRM114-Status: UNSURE (   5.53  )
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

change v2
1. remove hs400 tuning from mmc_retune.
2. remove mmc_retune_enable() from hs400es initialization.

Mengqi Zhang (1):
  mmc: core: Add HS400 tuning in HS400es initialization

 drivers/mmc/core/mmc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.25.1


