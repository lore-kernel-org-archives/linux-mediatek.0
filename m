Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D553C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 07:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tGdFh0m67zb8bDSQx4Wxrj44BMyEhBmOABcaXOyRiPY=; b=Y6y1oTtnUbnZB4r6saRTAn3QAR
	31qF6OxRwPtQXDjRFiyGw86Lz+HiITA5Uof9YkgJecmAXA9ydBcbI6Xp4aJLAS15aHK/LfbuIMKUv
	tQ2UvgUvu/PJP8s9Ob3hXp/ybfl2wKHmw77qLTQoMSw8R6XD50xXq9LQ0gQdkW0CPQRxZMRot6WAA
	Tui7wdsUCnFNdkghFGna7YH7j06Mm8hWGR+iub0yQLxPkaDlMCcMtdPrvcy4BfkGKiLDdLFxx+rCY
	kxm/w8NvicNw+vlnos0niSb4iMlGQCfG6n22RMZbF3Fo4jwrupVnWZW0LrShWy64+UKlyHrNCliSZ
	N+cx9ddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7s6T-004JTf-2s;
	Tue, 28 Nov 2023 07:01:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7s6Q-004JT3-2I;
	Tue, 28 Nov 2023 07:01:51 +0000
X-UUID: fc0e58fe8dbb11ee9b7791016c24628a-20231128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tGdFh0m67zb8bDSQx4Wxrj44BMyEhBmOABcaXOyRiPY=;
	b=BHNrrIAHOC8pkUWdmOBligFNFsZeEc6G1T+h0EzihQHuV5bMqRN+bxJUiMDDVrhauSmwlrqGPLxEo9RomDRVSVazmzmk6Z7daVAE7O0JIIPhEo8jhcJZER/p0adaAYaN0ghsU82VJns8kEbakpQyGrf3bjcGTw0tMeI2lNSCaLM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:fa605bc5-f67f-4a95-9442-29dbd26c73b2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:abefa75,CLOUDID:b06f2773-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fc0e58fe8dbb11ee9b7791016c24628a-20231128
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 697738615; Tue, 28 Nov 2023 00:01:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 28 Nov 2023 15:01:39 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 28 Nov 2023 15:01:38 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wenbin
 Mei <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Axe Yang
	<axe.yang@mediatek.com>
Subject: [PATCH v2 0/2] mmc: mediatek: add support for 64-steps tuning
Date: Tue, 28 Nov 2023 15:01:25 +0800
Message-ID: <20231128070127.27442-1-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_230150_763763_51C53E10 
X-CRM114-Status: UNSURE (   8.87  )
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

Change in v2:
- move the change made to document to the front
- change mediatek,tune-step dts property type to enum for better scalability

Axe Yang (2):
  dt-bindings: mmc: mtk-sd: add tuning steps related property
  mmc: mediatek: extend number of tuning steps

 .../devicetree/bindings/mmc/mtk-sd.yaml       |   9 ++
 drivers/mmc/host/mtk-sd.c                     | 135 +++++++++++++-----
 2 files changed, 106 insertions(+), 38 deletions(-)

-- 
2.25.1


