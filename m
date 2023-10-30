Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC96C4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qlsxU4ZooKcN6eVk2EdmfuYn54VZr8B5QvuOjrY8Ego=; b=rZXNTUAM34rUbc4dXSs/SduC2V
	jYuh7Zr/ZBklLL3csBgOLnT9jyJax38VkSJj09M2/NojJsFlJu5kBYJhf+4i1TZ8Nge9NdJcXVaHf
	DezuhqPutaj513szSiXirerneLHC2jtaQXIY39GGIvYUsHPri8oqdY2Mfctcu2vR6oR3Az4QBJ8L7
	xY0FRBUPGRqFN+DiLpc3qpbb4DEHJgBV0tYyjEr8ciX/mkB/s4RugfADznVuBTXKaXdjuNRxu6lY0
	OALb1Gvtye0oiq+VHHAtIKLTaQ9TNBgIZZOb3cZ7vaQsw+ggWlYIM8QRY/3pKIzR3UUCwxqdIP+dg
	Qqnn8nOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxOtu-002wbM-34;
	Mon, 30 Oct 2023 09:49:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxOtg-002wTf-2K;
	Mon, 30 Oct 2023 09:49:26 +0000
X-UUID: 9856f668770911ee86758d4a7c00f3a0-20231030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qlsxU4ZooKcN6eVk2EdmfuYn54VZr8B5QvuOjrY8Ego=;
	b=OpaTu8zA/MLhv4Yko5W6dUUtMjb+f+XMWNIz9ay6iIX/F9nrKPJ8EtLx8VrsAcLDo7rDCm4aUcnMhhhvxfT7gDqErM1Mr8D8iJTCuOm+mVvgIFK9X8lqUeOkvzgKTafPOrM4al7mFrJXeQ0YC8ZBgJreGw93sN5EnnvQVnbgAqU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:c4153821-2438-4684-9044-23056f5c73ac,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:e21e0e72-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 9856f668770911ee86758d4a7c00f3a0-20231030
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1621077750; Mon, 30 Oct 2023 02:49:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Oct 2023 17:48:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Oct 2023 17:48:41 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "Nancy . Lin" <nancy.lin@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v8 0/3] Add support for MT8195 MDP3
Date: Mon, 30 Oct 2023 17:48:37 +0800
Message-ID: <20231030094840.2479-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_024924_763362_D5B04A61 
X-CRM114-Status: GOOD (  12.18  )
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

Changes since v7:
- Rebase on linux-next.
- To align with the display naming conventions, change the compatible name of
  padding from 'mediatek,mt8195-mdp3-pad' to 'mediatek,mt8195-mdp3-padding'.

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


