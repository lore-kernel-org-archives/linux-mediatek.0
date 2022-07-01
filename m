Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327C4C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 03:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OnVbiZerBoAbYUJ/MM4BaOfDHUOUBzHjL8VyGJM0iAc=; b=FfB6QK7/61QdtddJe//9jgsXVp
	XVIru7n5qd0mi3XOZDh+RQ+ij4dwRZF0rF+LhIujHaQVlQgczKV4CnpT7/0CZp+9JCb+uomkcBJE6
	1L4HdkL6hymy0+VGDsnJtHKiou1YbPq5X59Dm3q66jfqdvsy+mRQgAwmn96sIMbLORAI0tgod5s9q
	CNF3ADXrotdBAnRndOKwKpkAvbnRRLqGy49OXxG+5CYD8nOSssRBulOnsZ6JI8xVLDIIfm+2lsiwo
	sgMrYaUcfUmU2vVwOc+n6py48Bj+v1ehTA2hIXT2WR6bJxU6reykfIYU5/PRfUb8g+piW+F/bKW9P
	dFLKi+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o77ln-002hEo-Vt; Fri, 01 Jul 2022 03:56:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o77lc-002hAr-9T; Fri, 01 Jul 2022 03:56:29 +0000
X-UUID: b085c5e254674ef7b62615a330d4e0e6-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:98829ffd-05b8-4945-9a4d-367faee497be,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:32c71e63-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b085c5e254674ef7b62615a330d4e0e6-20220630
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2075047983; Thu, 30 Jun 2022 20:56:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 1 Jul 2022 11:15:48 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 1 Jul 2022 11:15:48 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <yongqiang.niu@mediatek.com>,
	<enric.balletbo@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [PATCH 0/2] Add dpi output format control for MT8186
Date: Fri, 1 Jul 2022 11:15:42 +0800
Message-ID: <1656645344-12062-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_205628_360110_BAB23107 
X-CRM114-Status: UNSURE (   8.03  )
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
https://patchwork.kernel.org/project/linux-mediatek/cover/20220622130824.29143-1-nancy.lin@mediatek.com/

When MT8186 outputs dpi signal, it is necessary to add dual edge output
format control in mmsys.

Xinlei Lee (2):
  soc: mediatek: Add mmsys func to adapt to dpi output for MT8186
  drm: mediatek: Adjust the dpi output format to MT8186

 drivers/gpu/drm/mediatek/mtk_dpi.c      | 21 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  5 +++++
 drivers/soc/mediatek/mt8186-mmsys.h     |  1 +
 drivers/soc/mediatek/mtk-mmsys.c        |  8 ++++++++
 include/linux/soc/mediatek/mtk-mmsys.h  |  2 ++
 5 files changed, 37 insertions(+)

-- 
2.18.0


