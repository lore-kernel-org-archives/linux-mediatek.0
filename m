Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC428C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 03:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BAEa7l2oGQw9zXGiwIVtdSmUwlfnsdgEHjZhU17NTXc=; b=DGuzj5YTVj5wL2vCRR14FGLL+W
	l961ppnOpjUWzCMgIGGsGAMcyGYUxseQJTTdhRPIYrFA+D6xCc4z0gY9WBH1DtuIZSbxjaWcWoIeo
	1xg9M+grtfNxQ+sRMv+ByyyD1qGsOQUAOqEri6aBwvROrUVqmnzDvw3ob1g06M/k37HEmp3ke7tmQ
	jmh7wCCyYGb5YGWifxbiOJ5snhhXdONVGmQWsvsmHVnYHzMgPocOjTlUQFmeEvMyCyVIlWSkiA40S
	UI+TNO9RcS7nqFlr4QMGolM8S+LqtRKXGy+CKa6I+P8Dbt574r1fUqSNnfGsIMwO5taMEetTB4yIT
	AHYvuHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pep3u-00EQQA-1t;
	Wed, 22 Mar 2023 03:22:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pep3r-00EQP5-0a;
	Wed, 22 Mar 2023 03:22:53 +0000
X-UUID: ceba776ec86011ed8687db9d93187ff1-20230321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BAEa7l2oGQw9zXGiwIVtdSmUwlfnsdgEHjZhU17NTXc=;
	b=Zo8SWvGq3IQXqZLzINQlNkdDZWERH9tzvL1A30MI3zvxOHFGKtc8FDbIVue8g2ffC6JFxZFlP7vYdaWoYnYCM8OCCK16T6+E+ofmTAdF745RyZv/eu35h0Y3IOTHw1A+bhrsaaMU8ezengpXLeNsSCFcKITq/SVBHjeCSDM2ySo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:e2624296-b743-4ad4-9435-3aa586a48ffb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:c32cf9b3-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: ceba776ec86011ed8687db9d93187ff1-20230321
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1699640513; Tue, 21 Mar 2023 20:22:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 22 Mar 2023 11:22:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 22 Mar 2023 11:22:40 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Singo Chang <singo.chang@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Shawn
 Sung <shawn.sung@mediatek.com>
Subject: [PATCH v1 0/2] Add reset control for DSI0
Date: Wed, 22 Mar 2023 11:22:00 +0800
Message-ID: <20230322032202.12598-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_202251_235624_30D5886B 
X-CRM114-Status: GOOD (  10.05  )
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

Add below patches to add reset control for DSI0:
[PATCH v1 1/2] dt-bindings: reset: mt8188: Add reset control for DSI0
[PATCH v1 2/2] soc: mediatek: Add reset control for DSI0

Shawn Sung (2):
  dt-bindings: reset: mt8188: Add reset control for DSI0
  soc: mediatek: Add reset control for DSI0

 drivers/soc/mediatek/mt8188-mmsys.h       | 1 +
 drivers/soc/mediatek/mtk-mmsys.c          | 2 ++
 include/dt-bindings/reset/mt8188-resets.h | 3 +++
 3 files changed, 6 insertions(+)

--
2.18.0


