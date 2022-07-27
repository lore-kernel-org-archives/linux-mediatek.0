Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97E3C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 10:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xc0fF3jFtfEvRPabzLH3rAWR9fCwOilEwZjhewI2Nk8=; b=H+c4xD5PiCduhF/6IZ21p7/8j/
	jbLflblgPtBLjLke2ON7/uNRHxkQAijmN5we6IMhu3L+LpR3shNIfzo1Ma7DccNtOEGbenf3haan+
	0Had4zF2yUYbdDFYDsdPCcnsfURrM9oVn2SLMT294+Z6RSDxdkPb5eEFPmor6wTSGWv5aDETPDwKi
	dH/2ZnCfZ5SNZbNDG+cqN4P87sTa/rEszqToFeocqhm4dyiJjpKJ898h76IfeClMXOvKD3FGYMJNq
	6UaQoUGRAEPTaWM5VPZsj3sz6H6+gmftfU+dmKKilZgOdj2a0Cg5o7gtELBh7P7LmwgoCKG+20Cpp
	WpWYVMaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeYk-00CYjb-It; Wed, 27 Jul 2022 10:46:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeYg-00CYdG-W7
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 10:46:32 +0000
X-UUID: 208dbe05ab2a4e98916834a2986f6c93-20220727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:7b2c2c9d-0673-4090-a524-4203b86b80f3,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:f7ec85c9-5f65-4fda-abe9-f2436fed4c72,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 208dbe05ab2a4e98916834a2986f6c93-20220727
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 355877126; Wed, 27 Jul 2022 03:46:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 27 Jul 2022 18:45:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 27 Jul 2022 18:45:46 +0800
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chengci.Xu
	<chengci.xu@mediatek.com>
Subject: [PATCH v3 0/3] MT8188 SMI SUPPORT
Date: Wed, 27 Jul 2022 18:45:38 +0800
Message-ID: <20220727104541.7309-1-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_034631_057884_254AEAA8 
X-CRM114-Status: GOOD (  11.41  )
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
security world. We add some SMC command to set it.

changes since v3:
  - base on tag: next-20220726.
  - No code change just remove the change-id in patch [2/3].

changes since v2:
  - base on tag: next-20220722.
  - Move some included header to the source file that use them.

changes since v1:
  - base on tag: next-20220720.
  - adds MT8188 SMI support.

Chengci.Xu (3):
  dt-bindings: memory: mediatek: Add mt8188 smi binding
  memory: mtk-smi: Add enable IOMMU SMC command for MM master
  memory: mtk-smi: mt8188: Add SMI Support

 .../mediatek,smi-common.yaml                  |  4 +-
 .../memory-controllers/mediatek,smi-larb.yaml |  3 +
 drivers/memory/mtk-smi.c                      | 82 +++++++++++++++++++
 include/linux/soc/mediatek/mtk_sip_svc.h      |  3 +
 include/soc/mediatek/smi.h                    |  7 ++
 5 files changed, 98 insertions(+), 1 deletion(-)

-- 
2.25.1


