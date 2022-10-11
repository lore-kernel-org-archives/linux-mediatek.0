Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D95C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 07:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vgyP3iJSMe9TwBKbKheoFtjDlfAFaGgHy8h/DUtQK6k=; b=Dlf0hokfcQ8a65UbPZbgAkDVHb
	qtW25DEeoXphrLwJK/CnL0MftndXKRwrjjOF6dVRHmEosvb8tUVO03ErMxEQPM54PZK1PzZHxwC+f
	e0HL2iyJe5dMd+CfDVjOuJS6w+bQzV1H71lZuTPUG5n7GLKtjf/QzLkVINRKFrcydieqxIhwkskbM
	mCLagpp02UCgJBVSeSH2C70OTLdJF7q/nKqqdjt9BUPwyl8f8B8zqNemOU4ZYRlChoxW0TH10iPpu
	UCLa/o3PzqK1splM0r3iXHaMZ8mpI0ooG1YGEf+GDeT2TGcxQ+v8Mp5MhKmAR1U+wEsH8v16jCLlL
	va8Bve0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9Jw-003Wcy-4q; Tue, 11 Oct 2022 07:04:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9Jb-003WWc-4c; Tue, 11 Oct 2022 07:04:36 +0000
X-UUID: 0b22ea992bfd49ff84eba9c74e6670ad-20221011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vgyP3iJSMe9TwBKbKheoFtjDlfAFaGgHy8h/DUtQK6k=;
	b=sXh6vLHT52FSryzxa0SZw6NMmKLeFS9NmpyERvqyikVoI6pc8CvinNlzTx3zKB1SGgLKS8tuzzMb4PSDU779l3Z975RmRya22DNPFrO+QX6yXyoXrX6HWnFegs5kAJfDcSQBtZOlSyTnGuCzf5J9cbAMX3DafxnzsN0+70gbVg0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:0201792d-daa7-4e71-b498-a2068bc198cf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.11,REQID:0201792d-daa7-4e71-b498-a2068bc198cf,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:39a5ff1,CLOUDID:f63187e1-2948-402a-a6e4-b5d31fe11eb7,B
	ulkID:221011150405ATPYTWQ8,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0b22ea992bfd49ff84eba9c74e6670ad-20221011
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 580160139; Tue, 11 Oct 2022 00:04:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 11 Oct 2022 15:03:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Oct 2022 15:03:56 +0800
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
Subject: [PATCH v2 0/7] add support for MT8195 VPPSYS on MMSYS and MUTEX
Date: Tue, 11 Oct 2022 15:03:49 +0800
Message-ID: <20221011070356.682-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_000435_208434_50B9EE3D 
X-CRM114-Status: GOOD (  11.10  )
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

Moudy Ho (1):
  dt-bindings: arm: mediatek: mmsys: Add support for MT8195 VPPSYS

Roy-CW.Yeh (6):
  dt-bindings: soc: mediatek: Add support for MT8195 VPPSYS
  dts: arm64: mt8195: add MMSYS and MUTEX configuration for VPPSYS
  soc: mediatek: mmsys: add support for MT8195 VPPSYS
  soc: mediatek: mmsys: add config api for RSZ switching and DCM
  soc: mediatek: mutex: Add mtk_mutex_set_mod support to set MOD1
  soc: mediatek: mutex: support MT8195 VPPSYS

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   5 +-
 .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  30 +++-
 drivers/soc/mediatek/mt8195-mmsys.h           |  13 ++
 drivers/soc/mediatek/mtk-mmsys.c              |  64 +++++++++
 drivers/soc/mediatek/mtk-mmsys.h              |   1 +
 drivers/soc/mediatek/mtk-mutex.c              | 135 +++++++++++++++++-
 include/linux/soc/mediatek/mtk-mmsys.h        |   4 +
 include/linux/soc/mediatek/mtk-mutex.h        |  35 +++++
 9 files changed, 276 insertions(+), 12 deletions(-)

-- 
2.18.0


