Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 03:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NANUHResDXmZrUqrCDZW4eS9SbJw5uE8gsoET8JekPk=; b=DHvl9t89AQstfU
	11Ll1HW1YlU6XqLvbHEyQUnbwt7UQNLaNMSqqe0WSVCYP7N689kCz+5DZhfYJU8cGtuAIBSaaVWGo
	DoSpgeMd1MaKGhBkm61NbNZggJwIVpCjJTALaS4kOJwZr8QFjI8Pm8SxmQieEAQFiJkKhR5A/KnEB
	jXx8APfHIxqpxJQC/DXGHZUlyKoBw2BnCk69Gtp36hzaPHe1jvu1kh2PBNxIYzO1/WhUHPiNOykDW
	MuTlpL2ex4jT7xFzTkz1PGc2lPFsh8rc4kveL0XECOu5e6Ry47y/E0zUW+8mC08JnNUGSZU4Q29p9
	uMY4imJceaMVvcQZgSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msz1c-00E8dK-PU; Fri, 03 Dec 2021 03:14:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msz1N-00E8Xi-AW; Fri, 03 Dec 2021 03:14:04 +0000
X-UUID: d2dc089aae1440c3b81c4a578f1fb116-20211202
X-UUID: d2dc089aae1440c3b81c4a578f1fb116-20211202
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1041612029; Thu, 02 Dec 2021 20:13:56 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 19:13:55 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 3 Dec 2021 11:13:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 3 Dec 2021 11:13:52 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <kyrie.wu@mediatek.com>, <irui.wang@mediatek.com>
Subject: [PATCH V6,
 0/5] Support multi-hardware jpeg encoding using of_platform_populate 
Date: Fri, 3 Dec 2021 11:13:45 +0800
Message-ID: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_191401_404560_CDA625AE 
X-CRM114-Status: GOOD (  10.33  )
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

This series adds support for multi hardware jpeg encoding, by first
adding use of_platform_populate to manage each hardware information:
interrupt, clock, register bases and power. Secondly add encoding 
work queue to deal with the encoding requestsof multi-hardware
at the same time. Lastly, add output picture reorder function
interface to eliminate the out of order images.

This series has been tested with both MT8195.
Encoding worked for this chip.

Patches 1~2 use of_platform_populate to replace component framework
to manage multi-hardware.

Patch 3 add jpeg encoding timeout function to judge hardware timeout.

Patch 4 add encoding work queue to deal with multi-hardware encoding
at the same time.

Patch 5 add output picture reorder function to order images.
---
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

kyrie.wu (5):
  dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
  media: mtk-jpegenc: manage jpegenc multi-hardware
  media: mtk-jpegenc: add jpegenc timeout func interface
  media: mtk-jpegenc: add jpeg encode worker interface
  media: mtk-jpegenc: add output pic reorder interface

 .../bindings/media/mediatek-jpeg-encoder.yaml      |   3 +
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 287 +++++++++++++++----
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  91 +++++-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c  |   1 +
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h  |   3 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c  | 316 ++++++++++++++++++++-
 6 files changed, 644 insertions(+), 57 deletions(-)

-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
