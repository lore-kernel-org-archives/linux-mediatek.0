Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6426C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 02:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uZQlJmnF/+Yv7xhOhj08U2bLyxxao2MYgk/ImgAraJc=; b=p7HOKu9aJyoXq34EDJwCgWblxB
	61qjR5kGZKxxh0HlbYFsFerlDLCCFIWM+R4Lph0j1PwaDXJCkjeyg8Gs1IF4lZhEJmZnMTRPalTGs
	VA06ye3aRw8mG1W7eyl9dxpyPKTMNxAUwYcBZahjozZ65BHm1l+gFGz+kMsW5kUKmK7N1kViP/Viq
	Br9ocpHOeB0pC8NIzSJVMYWQZr/XZJscyQC0P/kugRznXbv64mjdfkjVVYagfAKrRiUBHP6rWXc9D
	WtLrCj8DcDKLvYRt/blX0f/xoiFGeIT9vAnlk51lh75bEj6gmQgblx00AA0Kqbxx+rhXWOdiMzOvP
	IyFa5ELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2aF-009u8o-2j; Wed, 01 Feb 2023 02:10:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2Zn-009tzl-Hl; Wed, 01 Feb 2023 02:10:22 +0000
X-UUID: 88a31058a1d511edbbe3f76fe852e059-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uZQlJmnF/+Yv7xhOhj08U2bLyxxao2MYgk/ImgAraJc=;
	b=CsMPYaVKRUd8y+rW2KU+4XHBVmCwazdKiAUR8IRhW4PEMXMTKZIX7ylhZHrk2xN184mJn7vXvVBRdsYGPXcnO2TdMksPBgW48qjA9WgQ1MKFdH1a+9JWRjnsiXMTHslc40Iv1ZFKVVjcdDmqgiMSVtYtZqsDhWg4FIV6UuqkB1o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:5be85c3f-3660-42b4-b2f6-feef6a360e4f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:3ca2d6b,CLOUDID:b408858d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 88a31058a1d511edbbe3f76fe852e059-20230131
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 56771700; Tue, 31 Jan 2023 19:10:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Feb 2023 10:09:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 1 Feb 2023 10:09:23 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Chuanhong Guo <gch981213@gmail.com>, Xiangsheng Hou
	<xiangsheng.hou@mediatek.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<benliang.zhao@mediatek.com>, <bin.zhang@mediatek.com>
Subject: [PATCH v6 0/5] Add MediaTek MT7986 SPI NAND support
Date: Wed, 1 Feb 2023 10:09:16 +0800
Message-ID: <20230201020921.26712-1-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_181019_678106_2D83829A 
X-CRM114-Status: UNSURE (   9.14  )
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

This patch series split from bellow series which pick-up spi relevant patches
https://lore.kernel.org/all/20230130030656.12127-1-xiangsheng.hou@mediatek.com.
This series add MediaTek MT7986 SPI NAND controller support, add read latch
latency, smaple delay adjust and add optional nfi_hclk.

Changes since V5:
 - Split spi relevant patches from previous series V4

Changes since V4:
 - none

Changes since V3:
 - none

Changes since V2:
 - Change snfi mediatek,rx-latch-latency to mediatek,rx-latch-latency-ns.

Changes since V1:
 - Use existing sample delay property.
 - Add restricting for optional nfi_hclk.
 - Improve and perfect dt-bindings documentation.

Xiangsheng Hou (5):
  spi: mtk-snfi: Change default page format to setup default setting
  spi: mtk-snfi: Add optional nfi_hclk which is needed for MT7986
  dt-bindings: spi: mtk-snfi: Add compatible for MT7986
  spi: mtk-snfi: Add snfi sample delay and read latency adjustment
  dt-bindings: spi: mtk-snfi: Add read latch latency property

 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   | 54 +++++++++++++++----
 drivers/spi/spi-mtk-snfi.c                    | 41 +++++++++++++-
 2 files changed, 84 insertions(+), 11 deletions(-)

-- 
2.25.1


