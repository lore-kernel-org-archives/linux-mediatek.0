Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329C1E7D0D6
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 07:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IcZFuJHms8LjHETDWtd+xVyjptA2CQ+H6Ajkbiz71kA=; b=3juoTc9TVRGWYA/8OVOiQIWDDI
	g+F8j6lWyMyXlm2ZKJKZ3c/PnTltEQk9iZZlq8KxYtJBTbMvuR0el6HSLBJUG41BeSHuK1zKbW5A5
	VmU6rXzUJVW3tc/HOiGQgSUabueolx9lpimaDIjBp2VdQslXaixyXq26vAKIFlhr3N29GcJzGYg/5
	lMg1VeUV0UTf9NoLI5xFAKhZBV1pYVAcNMauas9w7lkFZP+SfyDDtBoSqWcy7NNBI5pGwAInuI02z
	avZeVaqdTW7DN8VqIJqbhYSUa9EDkhtjTCH0Lgi9hmO6Zg3VssfmJjQQTz3YI+4RjHUwNc7lF+pL9
	POqpzCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaJ3-0088T1-02;
	Fri, 22 Sep 2023 07:10:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaIz-0088SE-3C;
	Fri, 22 Sep 2023 07:10:27 +0000
X-UUID: 184004ac591711ee9b7791016c24628a-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IcZFuJHms8LjHETDWtd+xVyjptA2CQ+H6Ajkbiz71kA=;
	b=Lm7humURZGYsl6t9orWVnZpU/UURpxTU/SpZqmBbIzwd7KXO6OnIu5307t6gReizX4hM0EBkRcNRePoeljkQEa0TgQn5omI3wWxjjYRqvLKu1Rs7lpe40xhgy+ea37sRXpYrv0vFRx2TrH+SbJNaenWpKWTFCukl7khz8NeRkOQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:c244eb26-e70e-4cc0-a474-04d3bb361552,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:630724bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 184004ac591711ee9b7791016c24628a-20230922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1416729460; Fri, 22 Sep 2023 00:10:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 14:50:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 14:50:18 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v6 0/2] Add support for MT8195 MDP3
Date: Fri, 22 Sep 2023 14:50:15 +0800
Message-ID: <20230922065017.10357-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_001026_034703_6DAAC039 
X-CRM114-Status: GOOD (  10.77  )
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

Changes since v5:
- Rebase on v6.6-rc2
- Add the required property - interrupts in components
  AAL, COLOR and OVL.

Hi,

The purpose of this patch is to separate the MDP3-related dtsi from
the original mailing list mentioned below:
https://lore.kernel.org/all/20230912075805.11432-2-moudy.ho@mediatek.com/
Introducing more components for MDP3 in MT8195.

Moudy Ho (2):
  arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
  arm64: dts: mediatek: mt8195: add MDP3 nodes

 arch/arm64/boot/dts/mediatek/mt8183.dtsi |   6 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 388 +++++++++++++++++++++++
 2 files changed, 392 insertions(+), 2 deletions(-)

-- 
2.18.0


