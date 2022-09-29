Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE47C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=STCDn5QB+UXKv417LvXk9TQm3f2P+5X47QlKUCTyQiE=; b=4lYia453TV06tEqebCqp3QbOY6
	82oM7039+uBfArcOiy12Sf9/fukCxf3PyYKhfhuRYGlLW6tqQYDYDXu+10kVNDqkqneI3YdKksSTl
	F3QFc9dVvzxIPbHnn9u2LKnVZFmNyD+w6AffpaqZ0EMCo5TulpfliOaCXNiZ4wypP8WrQT11Ejk2Y
	l5Ee1DYwHPDHTwmrDGcckGcQCvtvan9k8nfAPAe9DAGB99A4ZFweNsG7PPcLbQ83QJus/omR+x7GB
	IGL2jYc5f3a1UNJO1jyUudaGSHU5F1+is0pLUPwz3gsDmGu4aBznMuoMHdpchdIA7z8519l1M24bf
	Xmr9Mifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odu0W-003POr-DU; Thu, 29 Sep 2022 13:55:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odu0T-003PO7-7j; Thu, 29 Sep 2022 13:55:18 +0000
X-UUID: f14defb9830f4ffe93f7879bb2ce741e-20220929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=STCDn5QB+UXKv417LvXk9TQm3f2P+5X47QlKUCTyQiE=;
	b=qIkK7wA89/pwvKvho/+JHpsAPatm1nxC4qkZ1fK7NbRO1PAsCSQQattw5ppV1SwO0+GrpfULiNgv9ZXVWlpQradwAfXl1ZE24NM5xLjRXa2CL8tN+7/8JW5reGUXm5A+4bbevH/xhHjz6qzet+Qw4sKQpFst2hF1Eu/8YfHd/4Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:367d7517-5c5a-4e17-bffc-df87cbe28a0c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:8b3883a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f14defb9830f4ffe93f7879bb2ce741e-20220929
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 796709060; Thu, 29 Sep 2022 06:53:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 29 Sep 2022 21:13:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 29 Sep 2022 21:13:14 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 0/2] Add vcodec lat and core nodes for mt8192
Date: Thu, 29 Sep 2022 21:13:07 +0800
Message-ID: <20220929131309.18337-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_065517_289045_77EFE711 
X-CRM114-Status: GOOD (  10.42  )
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

This series are based on linux-next, tag: next-20220928.
We update the child node names from "vcodec" to "video-codec" based on
the discussion in [1].

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220926105047.19419-1-allen-kh.cheng@mediatek.com/

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


