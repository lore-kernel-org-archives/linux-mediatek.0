Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1E8CD98FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 07:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Jmn2+TqqAj7GyLC6XtWeq57DOeUUrtxC3mMWVQqvFk=; b=OLfc5h5IFjlCoV4kz3E9ia3I+9
	QNp9FzsZ+7As8j1tuHKC+g/wIfOR52pBL7XhSw8UhVGMdnshYigVeSYVHeNJ2QK4OUtkcIrBiEbfG
	QPfwKlcpOdrp5wjE33yhuMvF0a7Mlb8G6k3wzUuWfJYp2ww3s+5R+TYtiouTiU/GjxOuppBQODEtO
	8HZfPLg257GNn48BNLJLJt6ARGQDkqrVUfAz+JFkLXbpRctNHLwqfNhTZsTvta8E72SbApKFRalDP
	KCUT+huAogRxYY7G/C1uYwZ6qIRgckdStdBGBSnupVQ1dZy4K1v/DWAAX8Ts5mm/IyI+wi9MQS9Wu
	uIf0IymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqTzu-00FA97-1A;
	Wed, 11 Oct 2023 07:51:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqTzr-00FA7n-0v;
	Wed, 11 Oct 2023 07:51:12 +0000
X-UUID: eff26244680a11ee9b7791016c24628a-20231011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6Jmn2+TqqAj7GyLC6XtWeq57DOeUUrtxC3mMWVQqvFk=;
	b=GaILCL14P3yHtI+z/HFeLI/al+pZ4hH/vVq9cZa0Kptx9Od1kIVkc7JQhGXT3YD0vjZ+T1EhtxVDHevVEv7kxEihImCzaWuLsWDSYIYRCmMRF1I93AoLee2R2iM24fWez/RuRQ2GY2TkA6SMYDQDsMslZ3ZIJ0sym5JWsg3TZqE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:e0327f2d-dfd3-4e9b-ab89-20e2b7b85415,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:d4a1fdc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: eff26244680a11ee9b7791016c24628a-20231011
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 941823498; Wed, 11 Oct 2023 00:51:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Oct 2023 15:50:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Oct 2023 15:50:32 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "Nancy . Lin" <nancy.lin@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v7 0/3] Add support for MT8195 MDP3
Date: Wed, 11 Oct 2023 15:50:28 +0800
Message-ID: <20231011075031.30660-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_005111_332503_70B8B102 
X-CRM114-Status: GOOD (  11.42  )
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

Changes since v6:
- Rebase on v6.6-rc5.
- Add SoC-specific compatible string to the nodes inherited from
  MT8183, such as RSZ and WROT.
- Add required property to PAD (padding) for its integration into
  the existing binding under display folder.
- Add patch to standardiized DMA related node names, such as VDOSYS RDMA.

Changes since v5:
- Rebase on v6.6-rc2
- Add the required property - interrupts in components
  AAL, COLOR and OVL.

Hi,

The purpose of this patch is to separate the MDP3-related dtsi from
the original mailing list mentioned below:
https://lore.kernel.org/all/20230912075805.11432-2-moudy.ho@mediatek.com/
Introducing more components for MDP3 in MT8195.

Moudy Ho (3):
  arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
  arm64: dts: mediatek: mt8195: revise VDOSYS RDMA node name
  arm64: dts: mediatek: mt8195: add MDP3 nodes

 arch/arm64/boot/dts/mediatek/mt8183.dtsi |   6 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 416 ++++++++++++++++++++++-
 2 files changed, 412 insertions(+), 10 deletions(-)

-- 
2.18.0


