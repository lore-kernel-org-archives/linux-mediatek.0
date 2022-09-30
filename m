Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F08C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3oUSdorY1iUy0g7JUWPQIoK/saXauUwkw9QgJJn51gM=; b=O2Jzxlo/mLUCYCql6yeipS3jSz
	vt8bkNBd4ZqsJ6+HjwIMnlYnq4XxegFa+wkw6osXFEZAlW56Zg4SOGEU79KsybCaiumJJvePAQ7TM
	GUDjc82/kr97BXgjxARS56erYEICxr3HFRvirK2ZpZSawC5UNpL7yV/iJoFzn3d9t/TVGWuBdbOBJ
	QMnXowe8W6n0HjdHaRvXLJ3GF4rM+fedQbLFegB1sX4ej6qx+TBcxAsdmk0dkOiumu5OAs0jTO+PG
	Z6+8zvlpg77Px/d32wnHjtF26S6Dj6KTdOUyAf6QR1ok3P8oqZA/yQjZqgKF5Fi+kF6g2bRvJ8td4
	yV1LE0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeF2e-0097dK-DX; Fri, 30 Sep 2022 12:22:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeF2b-0097bo-JJ; Fri, 30 Sep 2022 12:22:55 +0000
X-UUID: 8e1d139f084542e58ee04b7fcf52a17c-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3oUSdorY1iUy0g7JUWPQIoK/saXauUwkw9QgJJn51gM=;
	b=AnIxh0i6BED1Xr+tbiV8FV31sNHmJ1yiBxpS7tTCCwldOKz8cnyAkjhg+KmJt5W1Eqqw5MdgzW2AvILQ8cG9pi8HMDpMh9RMszNVhbx5c8PO8pO9jBQt8RpgHy6f+ghCiqEMV5TsKzoY2Vt/rl3qCLmInRSusifiRdeSVWl5Upo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:31030370-753d-4268-b6ab-9133b0093d31,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:b6169607-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8e1d139f084542e58ee04b7fcf52a17c-20220930
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1533254840; Fri, 30 Sep 2022 05:22:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 30 Sep 2022 19:22:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 19:22:40 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 0/2] Add vcodec lat and core nodes for mt8192
Date: Fri, 30 Sep 2022 19:22:35 +0800
Message-ID: <20220930112237.14411-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_052253_787141_4C275E2C 
X-CRM114-Status: UNSURE (   9.26  )
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

This series is based on linux-next, tag: next-20220929.

Change in v3:
  - Drop `vcodec_lat:` and `vcodec_core:`

Change in v2:
  - Add a dt-bindings patch for changing "vcodec" to "video-codec"
  - Rename child names for vcodec lat and core nodes

Change in v1:
  - Replace node names with video-codec
    [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]

Allen-KH Cheng (2):
  media: dt-bindings: mediatek: Rename child node names for decoder
  arm64: dts: mt8192: Add vcodec lat and core nodes

 .../media/mediatek,vcodec-subdev-decoder.yaml |  8 +--
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 60 +++++++++++++++++++
 2 files changed, 64 insertions(+), 4 deletions(-)

-- 
2.18.0


