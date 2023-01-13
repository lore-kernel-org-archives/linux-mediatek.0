Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8070C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 06:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qv+KkInTLw4al9JNASorMveEjnaJV7ozjLhA4jeinMs=; b=wmqWK93abWxfT4sKP8S5LtCjts
	28R/5DERc6dV78qKImOVQx25lJ2vxC27F9FGtdZQtx/zW3EksgZNNcN+8sYs1AhHi+lg/7mRttJ2o
	g1GY9HadJlUJoTmitoy9T/masoyuEcSQ9tXq13MkPdFhWsPXDuNpz01mcM+CPAlfaWm5ImwbR44kY
	oblNh36+K5QNpqrQvQ5WvsML+3SPAHHa6gCA+IiBlPjAHjla2h9HcvvWo4YRTxbD7dWyd+xXg+AYq
	6pZB94SBhFcBaRyKe9LfuZG1TLEnHuB1Tb0VZniBxM4fXX4Eih7B25pA1h6aM2+PwJm1E9PvOEknb
	mjavrc/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDB3-000fCs-3J; Fri, 13 Jan 2023 06:04:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDAF-000eoT-Cq; Fri, 13 Jan 2023 06:03:45 +0000
X-UUID: 072b6628930811edbbe3f76fe852e059-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qv+KkInTLw4al9JNASorMveEjnaJV7ozjLhA4jeinMs=;
	b=hNqr8ttZCzMo0v5kzEUlsUbplwl2+JORVhsxiywWtG8Zf+ZlhjA6O14TmhQX69QC3V0MIIlzyMVNhVeRTvFvsAAGjg23MqemX+cAXjqTeeIzdG0RwqIuzs0Jb+cFciRCS2Jzn6lZi8F/Cnvgi1PpZfksdeoxut89q7EFLbG2srM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:9c72aad9-11de-4479-b728-63da14caeb2e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:d3fc258c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 072b6628930811edbbe3f76fe852e059-20230112
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1293959583; Thu, 12 Jan 2023 23:03:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 13 Jan 2023 13:43:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 13:43:05 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v5 00/10] add support for MT8195 VPPSYS on MMSYS and MUTEX
Date: Fri, 13 Jan 2023 13:42:54 +0800
Message-ID: <20230113054304.21841-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_220343_595663_B9232F46 
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

Changes since v4:
- Rebase on linux-next.
- Remove MMSYS fallback compatible.
- Migrate MT8195 VPPSYS0/1 from clock to mtk-mmsys driver.

Changes since v3:
- Rebase on linux-next.

Changes since v2:
- Depend on :
  [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=681097
- Split dts settings into two patches based on belonging to MMSYS or MUTEX.

Changes since v1:
- Depend on :
  [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=681097
- Add compatible names to VPPSYS0 and VPPSYS1 in MMSYS binding file.
- Fix VPPSYS's MMSYS and MUTEX dts to pass the dtsb_check.
- Rename mtk_mmsys_merge_config() and mtk_mmsys_rsz_dcm_config() to
  mtk_mmsys_vpp_rsz_merge_config() and mtk_mmsys_vpp_rsz_dcm_config().
- Clean up mtk_mmsys_vpp_rsz_dcm_config().
- Add a comment to mtk_mutex_write_mod() and clean it up for use in more
  than 32 mods.

Hi,

This series add support for MT8195's two VPPSYS(Video Processor Pipe Subsystem),
under which there will be corresponding MMSYS and MUTEX settings that
need to be configured.

Moudy Ho (4):
  dt-bindings: arm: mediatek: migrate MT8195 vppsys0/1 to mtk-mmsys
    driver
  dt-bindings: arm: mediatek: mmsys: Add support for MT8195 VPPSYS
  arm64: dts: mediatek: mt8195: add MUTEX configuration for VPPSYS
  clk: mediatek: remove MT8195 vppsys/0/1 simple_probe

Roy-CW.Yeh (6):
  dt-bindings: soc: mediatek: Add support for MT8195 VPPSYS
  arm64: dts: mediatek: mt8195: add MMSYS configuration for VPPSYS
  soc: mediatek: mmsys: add support for MT8195 VPPSYS
  soc: mediatek: mmsys: add config api for RSZ switching and DCM
  soc: mediatek: mutex: Add mtk_mutex_set_mod support to set MOD1
  soc: mediatek: mutex: support MT8195 VPPSYS

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   2 +
 .../arm/mediatek/mediatek,mt8195-clock.yaml   |  16 ---
 .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  26 +++-
 drivers/clk/mediatek/clk-mt8195-vpp0.c        |  58 ++++++--
 drivers/clk/mediatek/clk-mt8195-vpp1.c        |  58 ++++++--
 drivers/soc/mediatek/mt8195-mmsys.h           |  13 ++
 drivers/soc/mediatek/mtk-mmsys.c              |  64 +++++++++
 drivers/soc/mediatek/mtk-mmsys.h              |   1 +
 drivers/soc/mediatek/mtk-mutex.c              | 135 +++++++++++++++++-
 include/linux/soc/mediatek/mtk-mmsys.h        |   4 +
 include/linux/soc/mediatek/mtk-mutex.h        |  35 +++++
 12 files changed, 356 insertions(+), 57 deletions(-)

-- 
2.18.0


