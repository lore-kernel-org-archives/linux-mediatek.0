Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B878FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fuTi0P4WaxFOhqjmFKoq5UCXqQTujSR3PH+r6aViYRY=; b=syvtNsDDIeCm+X
	ISTK8XUpYfgh7JEPDJCqE8RebWyRO1kbkl9TRmMXaGebrqe10KsyjsgcObi8HH/CwYdc87b/Lk0l0
	vmlk2j05q/u8Yt+MjQHvmkIW/zbIgJry4ZH1T4Z+sNtar1Im5Fd+e+cPWVCQI/IjpvpXe/+2bxvTT
	o4tlvjTTTgVhwzrZLEPWwKueLcCV8r6rgR3ke2S+HECgGK8VmqVnS9/1A0+mTKTNC1JQbSNqRJ+xU
	j2wYN9UNxgAyVXzgSdriMr9xg4ZRX5MSABxFcAGN8eL8+ERnYJExA+3JXOYFGh1clizVOenJ33Wps
	ACb6P2AYTLQYXH6+X6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDQ6m-001qXV-Fr; Fri, 28 Jan 2022 12:12:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDQ6G-001qJO-Ss; Fri, 28 Jan 2022 12:11:34 +0000
X-UUID: c05c9f0590a04e318cd332e3a35be657-20220128
X-UUID: c05c9f0590a04e318cd332e3a35be657-20220128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1315949491; Fri, 28 Jan 2022 05:11:29 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Jan 2022 04:07:34 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 28 Jan 2022 20:07:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 20:07:19 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Subject: [PATCH v1, 0/4] add display support for mediatek SOC MT8186
Date: Fri, 28 Jan 2022 20:07:14 +0800
Message-ID: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_041132_943988_97DAA5CE 
X-CRM114-Status: UNSURE (   9.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Yongqiang Niu (4):
  soc: mediatek: mmsys: Add mt8186 mmsys routing table
  soc: mediatek: add mtk mutex support for MT8186
  drm/mediatek: split postmask component
  drm/mediatek: add mt8186 display support

 drivers/gpu/drm/mediatek/Makefile            |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h      |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_postmask.c | 155 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c  |  30 +---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c       |  41 +++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h       |   1 +
 drivers/soc/mediatek/mt8186-mmsys.h          | 113 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c             |  11 ++
 drivers/soc/mediatek/mtk-mutex.c             |  45 ++++++
 9 files changed, 378 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c
 create mode 100644 drivers/soc/mediatek/mt8186-mmsys.h

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
