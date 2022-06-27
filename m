Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863FEC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 02:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V6BCMZaPmbxagVpCVUucgwQkntVzmvtlKzOdQDEvKGg=; b=nlUcdVEi3i/mjzYjCziBga2ytD
	LhsA8gDHguhZ1GFGs1gcKR6WVhdfYhLEHL3Crp/IQapisJhaHwayj4XHr0XVGxPnUmqDkQqe5jwx1
	dYBRsabHS9BwFZ7laf7XBydo/NIMyPEnPan8P6CcImIqMwRdcIhR8/nRhQBylef09Br7l9S637Aqs
	8C1Hf0RUl5ubjzNgp5CT45Tu2NhWUrbsxwbgzw7BF14IH/PLXgcS66mTopAdpFvPzz3P7d58+LSvQ
	9OWp/wGJ80diLU0GK8mAg1utIpE8dN4bsBCB8Uspw4PcpOF0BK+Vx8/vgznpDVU7ZwiXnQiPSpvXH
	xs3+188g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5evu-00EowZ-2s; Mon, 27 Jun 2022 02:57:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5evh-00EopC-OY; Mon, 27 Jun 2022 02:56:51 +0000
X-UUID: 119f282cf8384b2682e28f23ba705693-20220626
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:d57e0b4d-ab4c-475c-8525-00daca4dbf61,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:f68f90ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 119f282cf8384b2682e28f23ba705693-20220626
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 49583120; Sun, 26 Jun 2022 19:56:40 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Jun 2022 19:55:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 27 Jun 2022 10:55:43 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jun 2022 10:55:42 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [V4,0/8] Support multi-hardware jpeg decoder for MT8195
Date: Mon, 27 Jun 2022 10:55:32 +0800
Message-ID: <20220627025540.8901-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_195649_826296_7D48587D 
X-CRM114-Status: GOOD (  12.33  )
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

 .../media/mediatek,mt8195-jpegdec.yaml        | 176 ++++++++++
 drivers/media/platform/mediatek/jpeg/Makefile |   5 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 246 +++++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  47 +++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 310 ++++++++++++++++--
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |   3 +-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |   1 +
 7 files changed, 754 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml

-- 
2.18.0


