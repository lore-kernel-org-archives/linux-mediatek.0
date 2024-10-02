Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9AECF318C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 02:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AcPXQUaCxOIV+61poGYvI0YUnLEQXuMc5eUSKOoaXqU=; b=EiK2OrPyG33d5+IXeQPLWYoOwf
	l6AMrX/qSEuitLPHRGuclJUMimbL37Px+UxhFxBOatMZ2zTMuJY7UBj4BP7V9g80s5MSemrkEPmBK
	tjwcF7iCJPxpB6lx9fVhodXyDj6ydavgqhrm8CU/JwK6JrCBb7ZR6jJ6hr37WVfk/dUScG4WHzFNW
	7aVGzWxHxxjXKHX/OukpLAVdgZScagWJsIdo98JJ53dC16aU6kSf1Mc+smgb+iiCbfXDZmazLIvae
	6YZ/w2XIxD1yQ9NHSL7S7hmyKcpB6db+DMAWxApW3ExbnJPDuP/6fOBe+4WakFskcw4BdGq5iRJ2I
	5sb8dqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svp4p-00000004cfN-1WkH;
	Wed, 02 Oct 2024 02:26:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svp0F-00000004c1k-1Xol;
	Wed, 02 Oct 2024 02:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=AcPXQUaCxOIV+61poGYvI0YUnLEQXuMc5eUSKOoaXqU=; b=TXowBfGGqSrqAnwi7AuV5bgP/F
	cnTrzfH/V6ONZOytKwSPz/6Qu/rQT5wPAczrRSF6xqy3LIo6R7jpO0xsvcuOX6sdorHmZZOWsvbdQ
	DR2bVgvun6vQefYngRdSPz97RF6Ai4qfTTfrVEotmeGyjJcxpsBwu/syuTYDa3ASQfwYxHhPP01zn
	0byyDR1EGcp5cJPRb4hSfAA/zqXU7672MU1acPVIFcKA3pqlZthrLZp6dzLJWbrbsq7xVtH8/+dBn
	o0wwfxVBYm5Heb3lrtzsM+T9HEU6uEepDIfGve2i/HKA8GNfwPh6PPFn3+JRb+HjyD9ZsB0/10RL6
	rXEsWBqA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svp0B-00000003POY-1LAk;
	Wed, 02 Oct 2024 02:22:10 +0000
X-UUID: 14bdf9bc806511efb3adad29d29602c1-20241001
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AcPXQUaCxOIV+61poGYvI0YUnLEQXuMc5eUSKOoaXqU=;
	b=XT88rwe3EaDKFdEwQOGXaw9rCj4DRhVLohIQK4nCT5DDlDF7nRHGXb9cLQX8yiz2ErQg4J0zc/sfr2pljh2cmGz4iiU1xaIm4Qy/4B1YjO4DGI2Ih+/gRmjF6Ra/68jWm9OL35gl3aNBzGRwSqqGBBlY7dAS3AIGT+YVGudLOVk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:64e2a823-8b96-401a-a07a-2944f43ccb23,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:fd7292bd-085c-4112-81e0-4d6de274b71a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 14bdf9bc806511efb3adad29d29602c1-20241001
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1849645113; Tue, 01 Oct 2024 19:21:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Oct 2024 10:21:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Oct 2024 10:21:43 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH v3 0/6] Enable Mali GPU on MediaTek Genio 700 EVK
Date: Wed, 2 Oct 2024 10:21:32 +0800
Message-ID: <20241002022138.29241-1-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.044400-8.000000
X-TMASE-MatchedRID: KEJBxOLBAjImTNBjrl+CAW3NvezwBrVmojQrbrPpzzqGisL/BZ/9PdW+
	IybvzGvgeyV2YHoU7/9OpyDH40bTVCZ6g2ERe8TsEhGH3CRdKUW1k3bRIdXVNDRCaZSKE/OsA1b
	OITH3wO2jkL1tNPFpRvdsbxOBLnf/SSOWVJeuO1AURSScn+QSXhhJCIHRlO51+gtHj7OwNO2tdP
	9AzJTY3N0bSp+8QIl/aV4pUm/qj5FdlXbNLWcTJSSNE2xxcJan3FPN7y72I2X/VPzeOYtIXNrfj
	pJgt9jNWLbrjyWszO633j8cs89UgXZrUbEZipAEiWT09mQz7szw9kH8zAy44SIduk5Jkjd3Vcr2
	04P67pw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.044400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BB5BB6716194BF829B372D5EC5D1D350D243FA7ACD22CFF460F39C63E9B156DF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_032208_186102_0CEEEE06 
X-CRM114-Status: GOOD (  10.10  )
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

This series is based on linux-next, tag: next-20240927

Enables the GPU on mt8390-genio-700-evk.dts. 
The panfrost driver probed with dmesg:

panfrost 13000000.gpu: clock rate = 390000000
panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
panfrost 13000000.gpu: features: 00000000,000019f7, 
  issues: 00000003,80000400
panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
  Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
panfrost 13000000.gpu: shader_present=0x10005 l2_present=0x1
[drm] Initialized panfrost 1.2.0 for 13000000.gpu on minor 0

Changes in v3:
- Drop patch "nvmem: mtk-efuse: Enable postprocess for mt8188 GPU
 speed binning" as suggested by Angelo.
- Add patch "dt-bindings: nvmem: mediatek: efuse: Reuse mt8186-efuse in mt8188"
 to reuse "mediatek,mt8186-efuse" compatible.
- Updated patch "arm64: dts: mediatek: mt8188: Add efuse for GPU speed binning"
 to revise the compatible string and remove Reviewed-By tag.

Pablo Sun (6):
  arm64: dts: mediatek: mt8188: Fix wrong clock provider in MFG1 power
    domain
  clk: mediatek: clk-mt8188-topckgen: Remove univpll from parents of
    mfg_core_tmp
  dt-bindings: nvmem: mediatek: efuse: Reuse mt8186-efuse in mt8188
  arm64: dts: mediatek: mt8188: Add efuse for GPU speed binning
  soc: mediatek: mediatek-regulator-coupler: Support mt8188
  arm64: dts: mediatek: mt8390-genio-700-evk: Enable Mali GPU

 .../bindings/nvmem/mediatek,efuse.yaml        |  4 +++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 13 ++++++--
 .../dts/mediatek/mt8390-genio-700-evk.dts     | 31 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-topckgen.c    |  9 ++++--
 drivers/soc/mediatek/mtk-regulator-coupler.c  |  1 +
 5 files changed, 52 insertions(+), 6 deletions(-)

-- 
2.45.2


