Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32627C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 13:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1bi6/pV5dnWQVLXsd0M3pxQ3S/btsUbrA7wJE2qzwvQ=; b=gIsGBFcSU85AZQ
	+VnYvk6mYffQz5nvV+3lQmRxsf3I5Qo45Kp3W31TwSiPF2Y6ocwdp1jltwfVLZEhGgOrVSS1HXajW
	e3gfu3VD1/pkGkLtvBgUNXlmaYEllsbDeANfrWrPz7+cpnj8mT6hj+6Rdj2aKF4Rs7f1MgBL+Jr3U
	8/r2SHHvix7gcmzk8WR53w/GQQNbp7fI6tijWWhtgIP13ZCn5xuB1l2d1GXtopV8YeHtxKUPv6iI2
	N4J9Qt4DZbOHxkKXskzJ37Csq/ExtFZUQMEBF5dbgndWbfr8xcmDjgcb4j0Fjr0z0D7+xv1EjsgvM
	le05EYVxSJtLA+Upr6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4V1-007BVP-Vg; Thu, 28 Apr 2022 13:48:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk4LK-0077GR-1Z; Thu, 28 Apr 2022 13:38:03 +0000
X-UUID: 2a45c1dc4a734f39ae14b245c6da560e-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:076cb117-6e02-45ea-9475-a4dd0b3e1e49, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:ad450e2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 2a45c1dc4a734f39ae14b245c6da560e-20220428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 420548239; Thu, 28 Apr 2022 06:37:57 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 06:37:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 21:37:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Apr 2022 21:37:54 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <jitao.shi@mediatek.com>, <xinlei.lee@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v5 0/4] Add mt8186 dsi compatoble & Convert dsi_dtbinding to
 .yaml
Date: Thu, 28 Apr 2022 21:37:49 +0800
Message-ID: <20220428133753.8348-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_063802_134499_7DFB0AC1 
X-CRM114-Status: UNSURE (   8.88  )
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

Changes since v4:
1. Modify DSI dt-binding.
2. Add support for MT8186 DSI in mtk_drm_drv.c.

Changes since v3:
1. Add dsi port property.
2. Fix some formatting.

Changes since v2:
1. Added #address-cells, #size-cells two properties.
2. Fix some formatting issues.

Changes since v1:
1. Delete the mediatek,dsi.txt & Add the mediatek,dsi.yaml.
2. Ignore the Move the getting bridge node function patch for V1.

Rex-BC Chen (1):
  drm/mediatek: Add MT8186 DSI compatible for mtk_drm_drv.c

Xinlei Lee (3):
  dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to .yaml
  dt-bindings: display: mediatek: dsi: Add compatible for MediaTek
    MT8186
  drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.c

 .../display/mediatek/mediatek,dsi.txt         |  62 ---------
 .../display/mediatek/mediatek,dsi.yaml        | 123 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   8 ++
 4 files changed, 133 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
