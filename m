Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F70C0219B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2025 01:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C269Snjlx9b6eymcjtSvUmDEAyVpwqFen8FaGwcU0Uc=; b=BbLmYVezhEyl+kSc3b2sm1Q7Pi
	hD8r1CdobbpQkE87quT65qwCA+LDJnv26d076i5x3P7L5Lbcms/PX0V2a5iAWeD3OI8lWu3+e0bee
	2cwDGw7kopKRQZrtQnLcNfbyu8L4GeMoMRkj4LCMHn/og1eWUV+RjWmZxwcavrLzjaz08wfXXe+u4
	pSpkDcl20S7PMmezYdwn16g/bDbBzI+EQ0ww0O28g9RrH7Bd4x54gZ+TpzzdcHVBlL0UMWvhhRNRL
	6aGSETSOXQTqunRKL1lOuYpkkKsX7klGh4sMC/uwGFlZzOiXqDZPea0alf1AG6dFHBTHALR2Nu1UO
	2Ulqzx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDQK-00000007zDr-2565;
	Fri, 07 Feb 2025 01:44:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDQI-00000007zDG-3gEC;
	Fri, 07 Feb 2025 01:44:52 +0000
X-UUID: 1bfd0bbae4f511ef9048ed6ed365623b-20250206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=C269Snjlx9b6eymcjtSvUmDEAyVpwqFen8FaGwcU0Uc=;
	b=AA4VZzrC6dN58Sih6kXC+LMnzxdh7P5cX/7R1YrZ8nBThn1OjKkniVtyuf/Plj9iMCfagtc9Z+wA8LFLzFN4TXtGj2NcWViYtRlYZgJVZVwSdyRfMlqlTTYiNHrRI3LLTWpO71r9bY5+93Od719DpCcSaifVheSlOpPxJSC36cU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:5f23daf9-b6c0-4d24-aaa7-5f160a0c3386,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:288d45ff-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1bfd0bbae4f511ef9048ed6ed365623b-20250206
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1586113996; Thu, 06 Feb 2025 18:44:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Feb 2025 09:44:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Feb 2025 09:44:42 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v2,0/2] Add an interface to get current DDR data rate
Date: Fri, 7 Feb 2025 09:42:46 +0800
Message-ID: <20250207014437.17920-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_174450_918223_8E2A4EC1 
X-CRM114-Status: GOOD (  10.34  )
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

*** BLURB HERE ***
This series is based on linux-next, tag: next-20250206.

Vcore DVFS feature need know the current DDR data rate.
Add MediaTek DRAMC driver to provide an interface that can
obtain current DDR data rate.

---
Changes in v2:
- Remove pr_info and pr_err, use dev_err or dev_err_probe to print
  error message;
- Replace module_init by module_platform_driver;
- Remove unnecessary global variables;
- Change fmeter-verison to platform data;
- Remove mtk-dramc.h;
- Refine compatible to "mediatek,mt8196-dramc";
- Refine CONFIG name to MEDIATEK_MC;
- Fix yaml build errors, remove unnecessary properties on yaml file.

Link to v1:
https://patchwork.kernel.org/patch/13904862

Crystal Guo (2):
  memory/mediatek: Add an interface to get current DDR data rate
  dt-bindings: memory-controllers: Add MediaTek DRAM controller
    interface

 .../memory-controllers/mediatek,dramc.yaml    |  44 ++++
 drivers/memory/Kconfig                        |   1 +
 drivers/memory/Makefile                       |   1 +
 drivers/memory/mediatek/Kconfig               |  21 ++
 drivers/memory/mediatek/Makefile              |   2 +
 drivers/memory/mediatek/mtk-dramc.c           | 196 ++++++++++++++++++
 6 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
 create mode 100644 drivers/memory/mediatek/Kconfig
 create mode 100644 drivers/memory/mediatek/Makefile
 create mode 100644 drivers/memory/mediatek/mtk-dramc.c

-- 
2.18.0


