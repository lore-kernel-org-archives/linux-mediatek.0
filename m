Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8687CC678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X7uQb937I9ABKmQ3rnJtjeos+zixi+r7Ynzr23zzN6g=; b=Gm0oUmAVAyXWJMOg5LWQ/oR97G
	hGGBgAxNN1bPeqZzEeyEDP5306YpYGUy3Bsn19WqoXI5XCa5AuPInq3tOUZAjsZjL/G2H6uBr13z1
	W4mtWFbJgc//zz/3FCE/L7AvDJAWSUhEmWFrV59W0OZuz6Rsq/e1VhmaKaUf4lHsvlij73uh4/88B
	DrQkWqh8VevoQfGfGyTpgExbdMPgA09QQOsduOBzNXoOahj3LHnozX1jteSl1dcHKMMipScUvJdml
	tkStsxYh7VhBtYSenyw1k0aW+H33oI9cR/nOtscKhFLPiZ6RynqmBKQm5+XDtvV9lyxlgmPG9WKDZ
	JujXB5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY1Bb-005XPk-0w; Fri, 03 Mar 2023 08:54:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY1BX-005XOj-QG; Fri, 03 Mar 2023 08:54:41 +0000
X-UUID: 04472d88b9a111edbbe3f76fe852e059-20230303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=X7uQb937I9ABKmQ3rnJtjeos+zixi+r7Ynzr23zzN6g=;
	b=S/i18wf6upUc6dHJCCDYRhnVssh49+EyUmSzSzWjvUJKsxmYltxXywnMdtGSMrkyrxg863jbJDBN67wPeMabUyVaz2S3SsF5NN9Wgpb6hbbZJzN6pCNHChdx4LjOQDfL9kzabnFUcNJSaZHLMB/fTdAnZul5J3+XM5dnVCVJkwU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:1a2db18f-0c6d-4d70-b618-40014240cccf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:bc8a1cb2-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 04472d88b9a111edbbe3f76fe852e059-20230303
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1996098221; Fri, 03 Mar 2023 01:54:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 3 Mar 2023 16:33:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 3 Mar 2023 16:33:59 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8 00/11] Add support for MT8195 SCP 2nd core
Date: Fri, 3 Mar 2023 16:33:44 +0800
Message-ID: <20230303083355.3378-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_005439_897876_2E36F83B 
X-CRM114-Status: GOOD (  12.54  )
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

The mediatek remoteproc driver currently only allows bringing up a 
single core SCP, e.g. MT8183. It also only bringing up the 1st 
core in SoCs with a dual-core SCP, e.g. MT8195. This series support 
to bring-up the 2nd core of the dual-core SCP.

v7 -> v8:
1. update the node name of mt8192 asurada SCP rpmsg subnode
2. squash register definitions into driver patches
3. initialize local variables on the declaration at patch v8 06/11 

v6 -> v7:
1. merge the mtk_scp_cluster struct into the mtk_scp structure
   at the "Probe multi-core SCP" patch

v5 -> v6:
1. move the mtk_scp_of_regs structure from mtk_common.h to mtk_scp.c
2. rename the SCP core 0 label from 'scp' to 'scp_c0'

v4 -> v5:
1. move resource release actions to the platform driver remove operation 
2. fix dual-core watchdog handling

v3 -> v4:
1. change the representation of dual-core SCP in dts file and update SCP yaml
2. rewrite SCP driver to reflect the change of dts node
3. drop 'remove redundant call of rproc_boot for SCP' in v3 for further investigation

v2 -> v3:
1. change the representation of dual-core SCP in dts file and update SCP yaml
2. rewrite SCP driver to reflect the change of dts node
3. add SCP core 1 node to mt8195.dtsi
4. remove redundant call of rproc_boot for SCP
5. refine IPI error message

v1 -> v2:
1. update dt-binding property description
2. remove kconfig for scp dual driver
3. merge mtk_scp_dual.c and mtk_scp_subdev.c to mtk_scp.c

Tinghan Shen (11):
  dt-bindings: remoteproc: mediatek: Improve the rpmsg subnode
    definition
  arm64: dts: mediatek: Update the node name of SCP rpmsg subnode
  dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP
  remoteproc: mediatek: Add MT8195 SCP core 1 operations
  remoteproc: mediatek: Extract remoteproc initialization flow
  remoteproc: mediatek: Probe multi-core SCP
  remoteproc: mediatek: Control SCP core 1 by rproc subdevice
  remoteproc: mediatek: Setup MT8195 SCP core 1 SRAM offset
  remoteproc: mediatek: Handle MT8195 SCP core 1 watchdog timeout
  remoteproc: mediatek: Refine ipi handler error message
  arm64: dts: mediatek: mt8195: Add SCP 2nd core

 .../bindings/remoteproc/mtk,scp.yaml          | 176 +++++++-
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   2 +-
 .../boot/dts/mediatek/mt8192-asurada.dtsi     |   2 +-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |   6 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  32 +-
 drivers/remoteproc/mtk_common.h               |  34 ++
 drivers/remoteproc/mtk_scp.c                  | 399 ++++++++++++++++--
 7 files changed, 591 insertions(+), 60 deletions(-)

-- 
2.18.0


