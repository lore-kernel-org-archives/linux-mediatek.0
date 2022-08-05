Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821E2C00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GiKNv3RkbiGZ1UB2X/sb6BVxk6kdCrhz6SvNVbHZsl4=; b=Z3zcM0moqSpWDbf7C9Q6JjyEew
	e9V1XIeaM1TsgWMkx9TyeZO4IaIU4PedbXTnnRbps0iLUGM28nXVoyz4ITdEp/XeMX3lECbZEWB14
	6dT3xWSRKqtd8uIGA6Tx3cuwlWrUessASpfsnSmLKc2RZG+RMx85IixzwXAYiFUAn4ynqQrCf4Eyb
	sloVg85w7iA3TBqbpphH/y+uMEsr9f+nahFmkvlrlTM2XUfw5Risg79Wzet6nMHT37krxAP/E3VAF
	GBg5tr5KAcIBtP/jUQfhtrMpAOxsA9k3oeM/hoQ3ovYAuGkXnZVtSrLzg+q6N/hhrsRIsq4IuGoEM
	N8qgIh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJu6H-00DpHg-4g; Fri, 05 Aug 2022 09:58:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJu62-00Dp8J-Eu; Fri, 05 Aug 2022 09:58:23 +0000
X-UUID: b9f16531c5b547b8835bfed5c977f6cb-20220805
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:19f9e455-45c0-4d58-80d5-a1c88bd325f2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:f5f606ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b9f16531c5b547b8835bfed5c977f6cb-20220805
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1638523303; Fri, 05 Aug 2022 02:58:17 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 17:57:43 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 5 Aug 2022 17:57:43 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v2,0/2] Add dpi output format control for MT8186
Date: Fri, 5 Aug 2022 17:57:39 +0800
Message-ID: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_025822_503906_7D854AC2 
X-CRM114-Status: UNSURE (   6.43  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Base on the branch of Linux-next/master.
This series are based on the following patch:
[1] Add MediaTek SoC(vdosys1) support for mt8195
https://patchwork.kernel.org/project/linux-mediatek/cover/20220711075245.10492-1-nancy.lin@mediatek.com/
[2] Add MediaTek SoC DRM (vdosys1) support for mt8195
https://patchwork.kernel.org/project/linux-mediatek/cover/20220804072827.22383-1-nancy.lin@mediatek.com/

Change since v1:
1. Modify mt8186 compatiable location.
2. Modify MT8186_DPI_OUTPUT_FORMAT name.

When MT8186 outputs dpi signal, it is necessary to add dual edge output
format control in mmsys.

Xinlei Lee (2):
  FROMLIST: soc: mediatek: Add mmsys func to adapt to dpi output for
    MT8186
  FROMLIST: drm: mediatek: Adjust the dpi output format to MT8186

 drivers/gpu/drm/mediatek/mtk_dpi.c      | 30 +++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  4 ++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 ++
 drivers/soc/mediatek/mt8186-mmsys.h     |  1 +
 drivers/soc/mediatek/mtk-mmsys.c        |  8 +++++++
 include/linux/soc/mediatek/mtk-mmsys.h  |  3 +++
 6 files changed, 48 insertions(+)

-- 
2.18.0


