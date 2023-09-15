Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77141EED615
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 15:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DFB1ce/CaeRxMkY2IQnRopnHe2UahnGT279P4kFvN6w=; b=zIUHoVHEjlre7qweSSl4rgdbCV
	gnnYu0e5U+QIl2h6CoQUK0qkC5NF4esbc3uovW4bJLDSw5nyh/dVCpr0ceCmaFJoUZEVTRhJSy/8J
	o4NYRUq9dfxWsMYE1sWR4zhfO2/EltfaIE/oNH8Ked89NG/EOKeC0aN6L5HCysy6OgNisiIIqkw0S
	eoKmzBSzakd4ZZegfcNpzQq4DWk7aAvJ6jourM/3sb9N35M8vtNhUcsi5bGF0FsvHI2MwXdo2pRVQ
	fOIqv/vjhNWylPXTSjUtt+AOVe8hbeTSIp9NGpI4Vq7ox4i9R7GF9vX6z7JUUb06WUfVugx+3AD9R
	77XKlrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhB1T-00B0sx-0a;
	Fri, 15 Sep 2023 15:46:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhB1Q-00B0sV-1F;
	Fri, 15 Sep 2023 15:46:21 +0000
X-UUID: 01f3a03853df11ee9b7791016c24628a-20230915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DFB1ce/CaeRxMkY2IQnRopnHe2UahnGT279P4kFvN6w=;
	b=d/pv0mp0VW4HE8JObo7qMlBHvo2tyTPCFyuuRzYAcfnozpXW8wN/EdmMdM+olI8XDrITpvkU/LfGM8n4yKCCkw+m9SV6fZY+2G6j1Fm7N3fHijO6ApsCbStEPXLTNbo2YYBzzsoYwlHjUfPWH1dumm74sIo/ltpo/VpzV6N5LRI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:ea746603-a50f-4068-b335-9fef298965d8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:2afe13c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 01f3a03853df11ee9b7791016c24628a-20230915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <william-tw.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1873689373; Fri, 15 Sep 2023 08:46:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Sep 2023 23:26:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Sep 2023 23:26:11 +0800
From: William-tw Lin <william-tw.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kevin Hilman <khilman@kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: [PATCH v2 0/3] mtk-socinfo driver implementation
Date: Fri, 15 Sep 2023 23:26:04 +0800
Message-ID: <20230915152607.18116-1-william-tw.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.910800-8.000000
X-TMASE-MatchedRID: 7LejLvGCNgAsZYGCajmr7M+QmA3DfdSbTCv58Zx9SJpUjspoiX02Fyuk
	s9vcKhsTldfHsj3+ZpTaSHwlOL1r6kttpN+KVVd9A9lly13c/gF/aDoolm3GXTUsHjosUACSR3R
	HPHTssNVZfh5NyMNmxIAy6p60ZV62fJ5/bZ6npdjKayT/BQTiGoCxaPcRWGBYaz1jwFb6Hi1LRI
	6qNRdnldwlh41JmumFJaD3/dLreAh7VtbENfMiUYgD8vh/Ci8nh465MwdO/NcyPT6YOUMfw6/XF
	oPK0hZ9dATQdtPksR+3/JiWOe6GXXSWgQ2GpXdZ9D6bLBJM9NtDDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.910800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D8F24BC104B54FDB57C56364F1072AABD6E1812F6E7F2E8267B43BBD45A354932000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_084620_451097_95E3E4C2 
X-CRM114-Status: GOOD (  10.19  )
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

This purpose of the patches is for soc-related information retrival.
Such information includes manufacturer information, SoC name, SoC 
segment name, and SoC marketing name.

Based on tag: next-20230915, linux-next/master

Changes in v2:
- Remove mtk-socinfo.h
- Consolidate different compatibles into mediatek,socinfo
- Move socinfo node out of MMIO bus
- Move mtk-socinfo.yaml to hwinfo
- Fix reviewer's comments

William-tw Lin (3):
  arm64: dts: Add node for chip info driver
  soc: mediatek: mtk-socinfo: Add driver for getting chip information
  dt-bindings: hwinfo: Add mtk-socinfo driver

 .../bindings/hwinfo/mtk-socinfo.yaml          |  48 +++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  15 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  15 ++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  10 ++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  14 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   9 +
 drivers/soc/mediatek/Kconfig                  |   9 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/mtk-socinfo.c            | 166 ++++++++++++++++++
 9 files changed, 287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml
 create mode 100644 drivers/soc/mediatek/mtk-socinfo.c

-- 
2.18.0


