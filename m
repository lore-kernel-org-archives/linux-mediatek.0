Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEDDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qgsU1lf6HCusB5KE1hEfcm/05wMI99LoZwK2K064pNc=; b=euKCWkHor5LCb9
	1csYqUtqYiTQpEiabmwea6IzBjx2+EBgvij7Y8eCYcC71zgiD0wE8U0WECu4hjyAR2hHfknaEWPka
	Pmsk100pZlciWeePLr+EA5suOtp91wZxvhQwGnh9sH+uSp1Ka2GCA/qoJHe+3aULX/s74L9CTspUa
	gz0jYq7h+WTejsfGIFHprK5Nam+uY1eBGkSEnyQyVPT20E3U913w4wCFDln/O94xVROwLMj6dTIIK
	I2sqOo0nn3H50F879g7vX2E0BAYlMMCfSOS7fosMOLHHjVUEca4r8g50J7RQGBgwMnuvuPP9HPOJA
	kDwDkEODXNwHuOwHzTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV75Y-000bqG-N3; Fri, 18 Mar 2022 07:31:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV751-000biS-OJ; Fri, 18 Mar 2022 07:31:26 +0000
X-UUID: 34109da2428c45e998d54eb767aafa6d-20220318
X-UUID: 34109da2428c45e998d54eb767aafa6d-20220318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1939304597; Fri, 18 Mar 2022 00:31:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 00:27:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 18 Mar 2022 15:27:51 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 15:27:49 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, kyrie wu
 <kyrie.wu@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [V2,
 0/7] Support multi-hardware jpeg decoding using of_platform_populate
Date: Fri, 18 Mar 2022 15:27:39 +0800
Message-ID: <1647588466-761-1-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_003123_802170_0E43D29D 
X-CRM114-Status: GOOD (  12.72  )
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

This series adds support for multi hardware jpeg decoding,
by first adding use of_platform_populate to manage each hardware
information: interrupt, clock, register bases and power.
Secondly add decoding work queue to deal with the decoding requests
of multi-hardware at the same time. Lastly, add output picture
reorder function interface to eliminate the out of order images.

This series has been tested with both MT8195.
Decoding worked for this chip.

Patch 1 Adds jpeg decoder dt-bindings for mt8195

Patches 2 jpeg decoder builds three module for using Multi-HW,
export some functions to make them visible by other modules.

Patch 3 use of_platform_populate to manage multi-hardware.

Patch 4 add jpeg decoding timeout function to judge hardware timeout.

Patch 5 add decoding work queue to deal with multi-hardware decoding
at the same time.

Patch 6 add output picture reorder function to order images.

Patch 7 refactor jpegdec func interface for HW working.

---
This series patches dependent on:
media_stage tree:
[1]
https://git.linuxtv.org/media_stage.git/commit/?id=b3627647f9ea7473d10fb08a95fd7c4133a17ca4

patch1 new jpegdec dt-bindings included files
[2] MM IOMMU binding:
https://patchwork.kernel.org/project/linux-mediatek/patch/20220217113453.13658-2-yong.wu@mediatek.com/

[3] MT8195 power domain:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=580579

Changes compared with v1:
- new yaml file for mt8195 jpeg decoder.
- some modifications for patch v1's review comments.

kyrie wu (7):
  dt-bindings: mediatek: Add mediatek,mt8195-jpgdec compatible
  media: mtk-jpegdec: export jpeg decoder functions
  media: mtk-jpegdec: manage jpegdec multi-hardware
  media: mtk-jpegdec: add jpegdec timeout func interface
  media: mtk-jpegdec: add jpeg decode worker interface
  media: mtk-jpegdec: add output pic reorder interface
  media: mtk-jpegdec: refactor jpegdec func interface

 .../media/mediatek,mt8195-jpegdec.yaml        | 166 ++++++++++
 drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 286 +++++++++++++++-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  46 +++
 .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c | 311 ++++++++++++++++--
 .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   3 +-
 .../platform/mtk-jpeg/mtk_jpeg_dec_reg.h      |   1 +
 7 files changed, 775 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
