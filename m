Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24094C38A02
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 11:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MlvE0L7cd3lm91P2MV6idaMzQZMyf1eSL6US2lP229Y=; b=FdmPkiEx/rqmVRzePw0Ayc5iBs
	ZeNoBhqwtB05bNfiH/25O6JX2dqsLbt7rbg1WrT/XweKz9nBGerD6j68ZhcCS7UXWZaN3x++ZLuvx
	YhpIMXi0Dayq0gL6494LkqiCdls5y3rl1tJnzAuYgUwlSFitSHvGj8418+3qDForddcaEmqmPkoYB
	iHlgeXKG6WIO4tMknBraNBEG/pS2uiI6ju6oklKbelQnGJDfB5lth/0rXw6WnIuw/vu7HvEoxBOaC
	lsnXMvdfAVDv9EtLppLj+7x3cKfE+Sjz5x8lHGHj3q+g/Ee0eg2g31woQfv7iQw1I+FvCs4H/b4TH
	34jmv2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oojjb-005tum-5J; Sat, 29 Oct 2022 11:10:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oojjX-005ttt-Te; Sat, 29 Oct 2022 11:10:38 +0000
X-UUID: 01d435a6579447b682941acc3c4657e8-20221029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MlvE0L7cd3lm91P2MV6idaMzQZMyf1eSL6US2lP229Y=;
	b=eazdlizq4H3/XyoHYynvnqYLZSi5Hl4YieaX7ksr+vWc1srMv50tukh6hiXlVqnNuhK92DLW/i9p4MJo9TagERNOVaFCt2FpOcYiwzg4y7yP+xTX0rKrQLxY5PsEMknSez8HVwroyNuO+4anNuvg7eDLTUe76KimgoEVVvs2qak=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:137c0c9e-a5a4-4ffc-b92d-9ab18924298f,IP:0,U
	RL:0,TC:0,Content:35,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:35
X-CID-META: VersionHash:62cd327,CLOUDID:1675f88f-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 01d435a6579447b682941acc3c4657e8-20221029
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <elvis.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2083964189; Sat, 29 Oct 2022 04:10:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sat, 29 Oct 2022 18:50:23 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 29 Oct 2022 18:50:22 +0800
From: Elvis.Wang <Elvis.Wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Elvis Wang <Elvis.Wang@mediatek.com>
CC: Houlong Wei <houlong.wei@mediatek.com>, "jason-jh . lin"
	<jason-jh.lin@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/2] Add gce support for mt8188
Date: Sat, 29 Oct 2022 18:50:15 +0800
Message-ID: <20221029105017.20734-1-Elvis.Wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_041035_991174_EC7E9461 
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

From: Elvis Wang <Elvis.Wang@mediatek.com>

Base on tag: next-20221028, linux-next/master

Elvis Wang (2):
  dt-bingings: gce: add gce header file for mt8188
  dt-bindings: mailbox: mediatek,gce-mailbox: add mt8188 compatible name

 .../mailbox/mediatek,gce-mailbox.yaml         |   1 +
 include/dt-bindings/gce/mediatek,mt8188-gce.h | 966 ++++++++++++++++++
 2 files changed, 967 insertions(+)
 create mode 100644 include/dt-bindings/gce/mediatek,mt8188-gce.h

-- 
2.18.0


