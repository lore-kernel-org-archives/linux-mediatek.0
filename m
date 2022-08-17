Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115E5C25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+cjoaemZJqBbSmeLNEK8tfGc3Qqonry8WAhLSKAr138=; b=fFoeFhpoTmhHHF6qhRMan1HpzL
	10M32FfohcGhfUm4UbQm+tf76mr1Run4e8BV8/JdBPCzRChxLZV8CeYOF1+x97VRTwYzEKYwQhHme
	mDVSCUg+VCUx32T19ESaURrS7uhefARxuAPDoU4obbh8tfiyZA6AdURRkXmytJJrQrjvpRDgfa0zK
	BQG/aRZ8l/wGAIJ3SBmRCKrN3ZAy6b9gubl3sPA+fjFndl/5DJI+3amAUMK1fZ4ffO5f8y5rY3Hw9
	ihlsBJ1pd3A/+99RA0JlrqUuUmTZs+cDkQtDNxedcqdz5UJJ5UpJUUZlnHVIilCxTyRqq6prMenId
	XwNCNSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJQ6-002Wf3-AG; Wed, 17 Aug 2022 13:49:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJPv-002Wa6-LE; Wed, 17 Aug 2022 13:49:09 +0000
X-UUID: 9fb4b8d80a8345aabc94d27b812c2b55-20220817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+cjoaemZJqBbSmeLNEK8tfGc3Qqonry8WAhLSKAr138=;
	b=N2Ry7NGHDqo/jeKw5bYlG31fusmuT6jDIS2Z3HTPD8FajYgr8fQThRBHomz+5O1tB0Gv7OxNusu/fjqSX1VDFPiMEtZrdCM8gZcR2iBT2O/bgyyioc6X9xgG1bPcv4jG/ZzVpHPXuZfs8erau5qrpGZYud0sVgsD2EiJhIW+xIg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:7d6882da-f7a9-4c18-b1eb-b72f17c91326,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:15fa18af-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9fb4b8d80a8345aabc94d27b812c2b55-20220817
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1223506804; Wed, 17 Aug 2022 06:49:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 17 Aug 2022 20:48:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 17 Aug 2022 20:48:24 +0800
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yi.kuo@mediatek.com>,
	<anthony.huang@mediatek.com>, <wendy-st.lin@mediatek.com>, Chengci.Xu
	<chengci.xu@mediatek.com>
Subject: [PATCH v5 0/4] MT8188 SMI SUPPORT
Date: Wed, 17 Aug 2022 20:46:04 +0800
Message-ID: <20220817124608.10062-1-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_064907_750169_41943D80 
X-CRM114-Status: GOOD (  14.65  )
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

This patchset adds MT8188 SMI support.

MT8188, similar to mt8195, there are two SMI-common HW, one is for
VDO(video output), the other is for VPP(video processing pipe). They
connect with different SMI-larbs, then some setting(bus_sel) is
different.

The connection between SMI and MM IOMMU could be something like this:

  IOMMU(VDO)           IOMMU(VPP)
     |                    |
SMI_COMMON_VDO       SMI_COMMON_VPP
----------------     ----------------
  |     |   ...       |     |    ...
larb0 larb2 ...     larb1 larb3  ...

Another change is that the register about enable/disable iommu is in
security world. We add some SMC command to set it. And we add a return
value for configure port function because SMC call may fail.

changes since v5:
  - base on tag: next-20220817.
  - return the result of config_port directly in mtk_smi_larb_resume().
  - update the comments about flag MTK_SMI_FLAG_CFG_PORT_SEC_CTL.
  - put the code about CFG_PORT_SEC_CTL before SMI_LARB_NONSEC_CON.
  - remove the unnecessary type conversion of larb->mmu.

changes since v4:
  - base on tag: next-20220728.
  - new patch[2/4] to add return value for all config port function.
  - rename enum IOMMU_ATF_CMD to a lower case: iommu_atf_cmd.
  - rename MTK_SMI_FLAG_SEC_REG to MTK_SMI_FLAG_CFG_PORT_SEC_CTL.
  - rename IOMMU_ATF_CMD_COUNT to IOMMU_ATF_CMD_MAX.
  - add some comment for why still need write SMI_LARB_NONSEC_CON.
  - return an error(-EINVAL) when enable iommu failed by SMC call.
  - put enum iommu_atf_cmd inside the macro CONFIG_MTK_SMI.

changes since v3:
  - base on tag: next-20220726.
  - no code change just remove the change-id in patch [2/3].

changes since v2:
  - base on tag: next-20220722.
  - move some included header to the source file that use them.

changes since v1:
  - base on tag: next-20220720.
  - adds MT8188 SMI support.

Chengci.Xu (4):
  dt-bindings: memory: mediatek: Add mt8188 smi binding
  memory: mtk-smi: Add return value for configure port function
  memory: mtk-smi: Add enable IOMMU SMC command for MM master
  memory: mtk-smi: mt8188: Add SMI Support

 .../mediatek,smi-common.yaml                  |   4 +-
 .../memory-controllers/mediatek,smi-larb.yaml |   3 +
 drivers/memory/mtk-smi.c                      | 109 ++++++++++++++++--
 include/linux/soc/mediatek/mtk_sip_svc.h      |   3 +
 include/soc/mediatek/smi.h                    |   5 +
 5 files changed, 114 insertions(+), 10 deletions(-)

-- 
2.25.1


