Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B50C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 08:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VntHT8WzB0CAVLCelb8y6Uv9sB/qlBf5aIY+LECjOFo=; b=eoWl4lHCPVyX5Bf/d+QdWdr9UT
	JrTHtzC6QESVbc0yLDn7g+Jy4wecrrQg5RJqDkLvEXR5M7GzMiI/OFD3cBKkKo11QZaAu8COR3fxU
	5MuY+Zoz9AYaqFmP1OWUt6crvHB/B9DE4h2iSBFK0A5HhE5aNFxDDT0knTrASvxEdyYUy8iMOxzys
	bCGsmNWXviNsdru9d09I4oNPybESWjRlMpndaJQuOHPv6t7X7znQaAzDEYeFrSYfk8J7IdUQF09rS
	H/2GjKfOmPDI88IhEvP0yGWms09ls+xpkOhH+IqSJ8AZgkde61xdCY2MXghM7kHSBVqSoG1uXZKBu
	sDZHF5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsAl-002yiO-1U; Fri, 04 Nov 2022 08:35:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsAi-002yhW-6x; Fri, 04 Nov 2022 08:35:29 +0000
X-UUID: 4243b4cd34da4bbab63e7abf4d706f94-20221104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VntHT8WzB0CAVLCelb8y6Uv9sB/qlBf5aIY+LECjOFo=;
	b=QJzCpoit2uUgL5R3GGL4QB2ZGxsn37M+EtEgj2pmJg6qpQFKOwyYicGbtO4SGrivpNwakYNLe0qdLpoydEpPicaMLPaLjFsSD4UTTkPQdclBdmm9q/dkW8OuDgGQrE+fUdAYacc2ShSkvELXoFkDK+rZP65Vps05DxplXIgcd7Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:70a1fe2c-2042-40a8-bbaa-c86bc6dbf41f,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:62cd327,CLOUDID:9709acf3-a19e-4b45-8bfe-6a73c93611e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4243b4cd34da4bbab63e7abf4d706f94-20221104
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <elvis.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1478149454; Fri, 04 Nov 2022 01:35:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 4 Nov 2022 15:44:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Nov 2022 15:44:46 +0800
From: Elvis.Wang <Elvis.Wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Elvis Wang <Elvis.Wang@mediatek.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 0/2] Add gce support for mt8188
Date: Fri, 4 Nov 2022 15:44:41 +0800
Message-ID: <20221104074443.26172-1-Elvis.Wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_013528_285355_7243F031 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Elvis Wang <Elvis.Wang@mediatek.com>

Base on tag: next-20221028, linux-next/master

Change in v3:
 - remove incorrect message.

Change in v2:
 - use vendor in filename, use Dual license and remove inappropriate
   define in mediatek,mt8188-gce.h

Elvis Wang (2):
  dt-bingings: gce: add gce header file for mt8188
  dt-bindings: mailbox: mediatek,gce-mailbox: add mt8188 compatible name

 .../mailbox/mediatek,gce-mailbox.yaml         |   1 +
 include/dt-bindings/gce/mediatek,mt8188-gce.h | 966 ++++++++++++++++++
 2 files changed, 967 insertions(+)
 create mode 100644 include/dt-bindings/gce/mediatek,mt8188-gce.h

-- 
2.18.0


