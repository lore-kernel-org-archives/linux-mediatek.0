Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75379CEBF65
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 06:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9viVYcO8aNN6w4qtlrLEQocIgbO7sam0vRHSWJsSzE=; b=Ju39TL0YNZUAiVFyNtrZrl/Yvb
	WG7dWlJDudzLgmqMTYlhdWFhL2CBsiP8l9x0bHrKDW543rHA37bH/u3MTYJ8HRchq5gpv8ob8ZlHq
	66juLyngCc9L9ebYwCzdMWU5sDHYsTZ3pQ5rzP87Rq8IB0ZmBlNql0zoiBhz/SqmuPPFShEgvBXZ3
	To1HmXDleIaKCP/OoKBXYa5LMIDp05bbuXYheZh915uO2pYa3xPB3RZqQIBlRvpDDMe5GGKjl6zkT
	lPlNMc7VWmD8djxvk6vztPZJzF8419gN0XBLoSY2LnFH27vuMTYu2jkv9hRCZveHr7q4W/skVUB6Y
	puDQuaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su4tC-0000000AGTj-1tJ5;
	Fri, 27 Sep 2024 06:55:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su4oV-0000000AFIV-2lw1;
	Fri, 27 Sep 2024 06:50:53 +0000
X-UUID: d3d98fa47c9c11efb3adad29d29602c1-20240926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=o9viVYcO8aNN6w4qtlrLEQocIgbO7sam0vRHSWJsSzE=;
	b=t7qU4SGEfjjpgWT0CrHFZUl7oaACV1o24xDN5yhdKSm58lGjBgq8pY54rr2FEdcdr7dsZC20+MRANKX9KxeBoW1q0VswCwdJyN2f2BLg9MKomJiDQzgxXQb3ZW8ePnQtwm/4ceDonOLhSW4bqDP1zKGfhlSQI278Tk+mQalVjXk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:28343d62-443a-4941-98f0-9a7ef0b2c1d3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:24c2a69e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d3d98fa47c9c11efb3adad29d29602c1-20240926
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 7862445; Thu, 26 Sep 2024 23:50:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 14:50:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 14:50:43 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu
	<ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, Ben Lok
	<ben.lok@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, "Nancy . Lin"
	<nancy.lin@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, "Chris-qj
 chen" <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH v3 3/5] arm64: dts: mediatek: mt8395-genio-1200-evk: Fix dtbs_check error for phy
Date: Fri, 27 Sep 2024 14:50:39 +0800
Message-ID: <20240927065041.15247-3-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240927065041.15247-1-macpaul.lin@mediatek.com>
References: <20240927065041.15247-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.841900-8.000000
X-TMASE-MatchedRID: zCWA9GkRdEXwBTQ+XvV6VZdc7I2df+ms2D9FbDg9BP7HkH7uosEn7E/3
	ZkXeY1OAsdosXJJWMVwSc9Me4enxyKXzgcphDfm8i/b+LxU2p47Dx2NobQWtm3td2pOTSxFkZvo
	+mFW19mDftLFtxOSbQ4Ay6p60ZV62fJ5/bZ6npdjGVuWouVipcjAGbKlbRjKT1oeFEpXgY4R2cs
	iM2ZNrXCkQwQp8jWDV1FmTk6ph5l9KExYgiTytN6BnGq9kNZm0dvYOSQ2POAuEeo2QbLGzt21Rj
	oup2VCcWve+eVz4Pp5Vk5utmQ1VlGVF3+d9rnoxpI8EFEZVbig=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.841900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 72096D519EB39C5F442D061C47D1581668AC1771DA1106EA6093E5F78DFE193A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_235051_728043_DC4F01A8 
X-CRM114-Status: GOOD (  10.60  )
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

The ethernet-phy node in mt8395-genio-1200-evk.dts was triggering a
dtbs_check error. The error message was:
  eth-phy0@1: $nodename:0: 'eth-phy0@1' does not match
              '^ethernet-phy(@[a-f0-9]+)?$'
Fix this issue by replacing 'eth-phy' node to generic 'ethernet-phy'.

Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Changes for v2 and v3:
 - No change.

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 1ef6262b65c9..b4b48eb93f3c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -187,7 +187,7 @@ mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		eth_phy0: eth-phy0@1 {
+		eth_phy0: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <0x1>;
 		};
-- 
2.45.2


