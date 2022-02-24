Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA463C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 09:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A3JJV1YNOUuWHiydVLdvsy1O5NCiMmdGRptqpmLIjX0=; b=YYYBR4Tm29FJ+o
	gKMWVzj/SO6k78zTLWO1b97ftKnn3wrCaQD1uku343cdrN3uTXocXM3/WfcwylgFDXqXoJ1M2+WaL
	dpN8sWmImY7AJyAatVhEgjHI7YSRSnHknpCB6mOKNOk3EyilynVwibgK6eKy6D2xOG05bOOBAfy3C
	k8qFqxqIMg605r6tsYX9UDoYbDVrSvImrXYOZBtn0LZs+cO6y8rtjCrDU+NgC9fCHTX87EqcZIA5G
	+RJwkFvc3FEIXHMuZZF7+7U1/bX/dWt2+MXfDoIkAa2PYnezsgPG+SGXtji+kVXtO6ApsaX3uioJw
	oeIC+2JX4aNtHjMZ36iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNASC-0005Bj-C3; Thu, 24 Feb 2022 09:30:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNAFa-00HZvk-NO; Thu, 24 Feb 2022 09:17:28 +0000
X-UUID: 75b4c66d16f64bc08f3a3e3e3304b259-20220224
X-UUID: 75b4c66d16f64bc08f3a3e3e3304b259-20220224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 584686426; Thu, 24 Feb 2022 02:17:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 01:07:20 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 24 Feb 2022 17:07:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Feb 2022 17:07:18 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, kyrie wu
 <kyrie.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>
Subject: [RESEND,V7,0/6] Enable two hardware jpeg encoder for MT8195
Date: Thu, 24 Feb 2022 17:07:11 +0800
Message-ID: <1645693637-627-1-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_011726_809544_71B00BF6 
X-CRM114-Status: GOOD (  13.85  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

This series adds support for multi hardware jpeg encoding, by first
adding use of_platform_populate to manage each hardware information:
interrupt, clock, register bases and power. Secondly add encoding
work queue to deal with the encoding requestsof multi-hardware
at the same time. Lastly, add output picture reorder function
interface to eliminate the out of order images.

This series has been tested with both MT8195.
Encoding worked for this chip.

Patches 1 Adds jpeg encoder dt-bindings for mt8195

Patches 2 jpeg encoder builds two module for using Multi-HW,
export some functions to make them visible by other modules.

Patches 3 use devm_of_platform_populate to manage multi-hardware.

Patch 4 add jpeg encoding timeout function to judge hardware timeout.

Patch 5 add encoding work queue to deal with multi-hardware encoding
at the same time.

Patch 6 add output picture reorder function to order images.
---
Changes compared with v6:
- new yaml file for mt8195 jpeg encoder.
- some modifications for patch v5's review comments.

Changes compared with v5:
- use of_platform_populate to replace component framework to
manage multi-hardware in patch 2.

Changes compared with v4:
--No change compaered with v4

Changes compared with v3:
--Structure patches for consistency, non-backward
  compatible and do not break any existing functionality

Changes compared with v2:
--Split the last two patches into several patches
  to enhance readability
--Correct some syntax errors
--Explain why the component framework is used

Changes compared with v1:
--Add jpeg encoder dt-bindings for MT8195
--Use component framework to manage jpegenc HW
--Add jpegenc output pic reorder function interface

kyrie wu (6):
  dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
  media: mtk-jpegenc: export jpeg encoder functions
  media: mtk-jpegenc: manage jpegenc multi-hardware
  media: mtk-jpegenc: add jpegenc timeout func interface
  media: mtk-jpegenc: add jpeg encode worker interface
  media: mtk-jpegenc: add output pic reorder interface

 .../media/mediatek,mt8195-jpegenc.yaml        | 174 +++++++++++
 drivers/media/platform/mtk-jpeg/Makefile      |  11 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 292 +++++++++++++++---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  81 ++++-
 .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c |   1 +
 .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   3 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 261 ++++++++++++++++
 7 files changed, 769 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
