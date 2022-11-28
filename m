Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE777C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 14:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/7dPK04PdPW+bdB7iypKXPuxUZM9qiPS22anBrTuKZY=; b=Wsmxc7bwKsaLHMpBSu6WuomZTY
	+kBCMiDEUkquJ8E5wt6B97ByD6FESxH4TjfBTXw+H/sBAxb75pRaJzi5VwWLLI2KrFPMmPljl31Ro
	CKbjUMYflvEZyPWtWJv5XKo7oLwaPhJiqHpBtIJZHYlveGC0Z8If/pYVj/sgvI/IKaf97Q5TpeaM3
	stIJzRSM+12PfLRW1IocbMroz2FokrktocfmrT7mhHSSg1zQ16v4sPTGb5usCOTPKFzEuposP/k0Q
	YRidiZFXQHWf4KxfW+yT5cprncyZ7fmUOcmaUAuw6SXV82bMCRxE4a096nHCMBlgM8M4tq7us/eYV
	6s69Zsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfHS-002G84-2p; Mon, 28 Nov 2022 14:38:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfHO-002G5Y-Lv; Mon, 28 Nov 2022 14:38:43 +0000
X-UUID: 95317162c34a4a61b068da835f826370-20221128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/7dPK04PdPW+bdB7iypKXPuxUZM9qiPS22anBrTuKZY=;
	b=S5Ox2DEHv4Qci1BxKZcI3NOTL5YtV8skptrTvbefXEb/AHSpDaU5zpLk22DJD6Stmr4Y2obDtnub8Dyr6q1eGagsTJq906MP1zjeMCEvIPbT0PtJqj8h5Q3qBr8oCLhD+GpIvwfrS8GpwgwmoDD5LA0ANKApUAut09+g51xvhsc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:9ce413d2-0d33-457f-bbce-3f9512f0e8ab,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:35ed851e-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 95317162c34a4a61b068da835f826370-20221128
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1707668154; Mon, 28 Nov 2022 07:38:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 28 Nov 2022 22:38:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 28 Nov 2022 22:38:32 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>, "Allen-KH
 Cheng" <allen-kh.cheng@mediatek.com>
Subject: [PATCH v5 0/3] Add vcodec lat and core nodes for mt8192
Date: Mon, 28 Nov 2022 22:38:29 +0800
Message-ID: <20221128143832.25584-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_063842_745420_6967244C 
X-CRM114-Status: UNSURE (   8.56  )
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

This series is based on linux-next.

Change from v4:
 - Add patch for removing dma-ranges
 - Update child names to video-codec
 - Update patch title and message

Change from v3:
 - Drop `vcodec_lat:` and `vcodec_core:`

Change from v2:
 - Add a dt-bindings patch for changing "vcodec" to "video-codec"
 - Rename child names for vcodec lat and core nodes

Change from v1:
 - Replace node names with video-codec
  [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]

Allen-KH Cheng (3):
  media: dt-bindings: media: mediatek: Rename child node names for
    decoder
  media: dt-bindings: media: mediatek: Remove "dma-ranges" property for
    decoder
  arm64: dts: mt8192: Add video-codec nodes

 .../media/mediatek,vcodec-subdev-decoder.yaml | 67 ++-----------------
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 59 ++++++++++++++++
 2 files changed, 63 insertions(+), 63 deletions(-)

-- 
2.18.0


