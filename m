Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642D0C19F2A
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 06:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=txk5PFBlWOEh3g+hvbGXYuP+5wR/0fydp5k7hhC/zqc=; b=IyDcbd4zmf8Q9ZzvPGfFEGeNvq
	yziPGUHr5hTfk4sdB+xEZpLa9NtgZCFXVkeYQk4x+XRm774evJhXz14Sxfax+nYRrcWIt5R628VuD
	GNx9DU1QsmdFhtWqw0q7F+dlSeukxHaf8UTstNW9zORvIysWvJa5qnCzvDaMy5+P8/4dBUyN4sd0s
	sWCxGz/K6zB9bp+YEOSHjGJC2aIdvn6z3HWurz5ImrCZmQdRpTTwPWPwb5ZlE+l/V+Y4Ikaj9AdGq
	y3/wavNmRpzuAyQlusjqXOjJBg04I3VDPFxV/pkEI4H2OMtdeobDU4n8yVIKWC5x6TJU4LTs4bw6I
	PSmXA8bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHJSf-001wCy-Ig; Fri, 29 Jul 2022 06:27:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHJSJ-001vmD-9j; Fri, 29 Jul 2022 06:26:40 +0000
X-UUID: ea3d7d152c3e4ffa94650930eb5e412d-20220728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:4555eb21-d460-4dbd-8043-fceb9bb45ce4,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:de37b9cf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ea3d7d152c3e4ffa94650930eb5e412d-20220728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 787993184; Thu, 28 Jul 2022 23:26:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 14:26:06 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 29 Jul 2022 14:26:05 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>, kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>
Subject: [V6,0/8] Support multi-hardware jpeg decoder for MT8195
Date: Fri, 29 Jul 2022 14:25:55 +0800
Message-ID: <20220729062603.5533-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_232639_350073_5A7AC6D4 
X-CRM114-Status: GOOD (  13.05  )
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

Patch 8 add stop cmd function to deal with EOS operation.

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

Changes compared with v5:
- some modifications for patch v5's review comments.
- fix yaml file check errors.

Changes compared with v4:
- some modifications for patch v4's review comments.
- fix Gstreamer test errors.

Changes compared with v3:
- some modifications for patch v3's review comments.

Changes compared with v2:
- add stop cmd function.
- some modifications for patch v1's review comments.

Changes compared with v1:
- new yaml file for mt8195 jpeg decoder.
- some modifications for patch v1's review comments.

kyrie wu (8):
  dt-bindings: mediatek: Add mediatek,mt8195-jpgdec compatible
  media: mtk-jpegdec: export jpeg decoder functions
  media: mtk-jpegdec: manage jpegdec multi-hardware
  media: mtk-jpegdec: add jpegdec timeout func interface
  media: mtk-jpegdec: add jpeg decode worker interface
  media: mtk-jpegdec: add output pic reorder interface
  media: mtk-jpegdec: refactor jpegdec func interface
  mtk-jpegdec: add stop cmd interface for jpgdec

 .../media/mediatek,mt8195-jpegdec.yaml        | 160 +++++++++
 drivers/media/platform/mediatek/jpeg/Makefile |   5 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 233 ++++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  46 +++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 314 ++++++++++++++++--
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |   3 +-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |   1 +
 7 files changed, 730 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml

-- 
2.18.0


