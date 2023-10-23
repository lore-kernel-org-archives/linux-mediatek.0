Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC3BC25B42
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dQXcmjFwd9DXm27/c465+NmP2tWOpWp/6hKymZvRh44=; b=R3s97iVNPA2wdV8OSjURO4jgB/
	NG2+HzwND9VlZTCkZbGcTmJes0kLa5/W0/+BcTU2NA77S4nGmVsou5ZnTwvzsP7QhMiKZYFODnf9/
	2VLM0AHC+oSpaGd8OL0bFL91BukikmOfa5IXszsfeuX31W8QkJu09zqyV/VnY49SMHyvkLYzjb5TJ
	DkTjQkWVBDhj7Hy7V5yhHVQeWOh4U1RyvTtDRSKvEIfDwOua0CAq8FyKg3d/JpuKubfppCbpeXCQ4
	oXyJbzhIcYEukAsUJqo3kzHr0fYhHWmg2ce324+Kjf7SI6p0XGHXOLqxIT3a3PPUoVDhJiXMwIuVB
	m7ZzVRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqT2-006nIe-2p;
	Mon, 23 Oct 2023 08:39:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqSz-006nHe-2y;
	Mon, 23 Oct 2023 08:39:19 +0000
X-UUID: a5ec1cb6717f11ee9b7791016c24628a-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dQXcmjFwd9DXm27/c465+NmP2tWOpWp/6hKymZvRh44=;
	b=D5xl3ItWDjypRc5RlLN/z+kn+TH5lTX1nM/fUSRLuLDEsYNmEXbid9xAqn9ouviR6bEiwZ1chmv14Xa+Z4X7IJJ2mr5Iqz7Gy4WvlK885QcUjXICBLH9T2TrsSWvBX1320vPYK9c5U9FctpnCV54dKVX8sJuF9nVV2SlSzTkZUM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:8643ff4f-8b83-4056-90e9-c5d07f68bb97,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:4532a8fb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a5ec1cb6717f11ee9b7791016c24628a-20231023
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 385505751; Mon, 23 Oct 2023 01:39:15 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 16:38:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 16:38:41 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eugen Hristev
	<eugen.hristev@collabora.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre
 Mergnat <amergnat@baylibre.com>
CC: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>
Subject: [PATCH v6 0/4] Add basic node support for MediaTek MT8188 SoC
Date: Mon, 23 Oct 2023 16:38:35 +0800
Message-ID: <20231023083839.24453-1-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_013917_966073_E8B06547 
X-CRM114-Status: GOOD (  12.46  )
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

From: jason-ch chen <Jason-ch.Chen@mediatek.com>

MT8188 is a SoC based on 64bit ARMv8 architecture.
It contains 6 CA55 and 2 CA78 cores.
MT8188 share many HW IP with MT65xx series.

This patchset was tested on MT8188 evaluation board to shell.

Based on tag: next-20231023, linux-next/master

Changes in v6:
- Add L2 and L3 cache information
- Fix reviewer's comments

Changes in v5:
- Remove unnecessary always-on regulator nodes
- Fix dtbs_check warning

Changes in v4:
- Explain the reason of modifying pwrap binding file, and correct the
  subject
- Fix reviewer's comments

Changes in v3:
- Remove the duplicated part of mt8188 in the pwrap yaml file
- Fix reviewer's comments about coding style

Changes in v2:
- Add MT8188 PMIC Wrapper compatible to binding document
- Fix reviewer's comments

jason-ch chen (4):
  dt-bindings: arm: Add compatible for MediaTek MT8188
  dt-bindings: arm: mediatek: Add mt8188 pericfg compatible
  dt-bindings: soc: mediatek: pwrap: Modify compatible for MT8188
  arm64: dts: Add MediaTek MT8188 dts and evaluation board and Makefile

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../arm/mediatek/mediatek,pericfg.yaml        |   1 +
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |   6 +-
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts   | 387 +++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 956 ++++++++++++++++++
 6 files changed, 1354 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188.dtsi

-- 
2.18.0


