Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA62C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 05:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CIj+KHWTsOvoPw2Oj3lIF4tZzWcxMSAJpBm5UZu/1Jk=; b=C2oFH0BGPsQBCO
	cFIljmJ4yMg9m3tG0Nlc4jU10C5/Y4KtWlFnu1TpHtDQd9ZP4eMCqcqHKpYpGmSnwSDfHERQ8KadV
	nAaabOZ25YQBPQJkwKpD2OKGx+ZcKMIHL350/sg0vXO7g/nGgNw3Zj7Q9Bj6Srb2wJ36q3ESb0E52
	tS2MrIYAB/urbKyiTaKIIWNsREbEFNuXC6mjc9+7gVbo8K84In7H5Hgk78d8osIdtcFNjJvpJ9qsW
	jUb/juo2cG+7mPuVjpub2NVNoyiODgfpqebRwQXiTWOa/VfBU3DdGOnze3vvcJIAbBfsY+VWv9ev6
	yE3qzS+Ye9Rv7RGbeTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt1DS-00EQUT-L0; Fri, 03 Dec 2021 05:34:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt1DE-00EQQ0-Rh; Fri, 03 Dec 2021 05:34:27 +0000
X-UUID: db81d47ba1a2433bbdc70fa9e457f2c0-20211202
X-UUID: db81d47ba1a2433bbdc70fa9e457f2c0-20211202
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1903674614; Thu, 02 Dec 2021 22:34:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 21:34:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 3 Dec 2021 13:34:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 3 Dec 2021 13:34:17 +0800
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
Subject: [PATCH V1,
 0/6] Support multi-hardware jpeg decoding using of_platform_populate
Date: Fri, 3 Dec 2021 13:34:09 +0800
Message-ID: <1638509655-14296-1-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_213424_984295_405F9489 
X-CRM114-Status: GOOD (  10.07  )
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

This series adds support for multi hardware jpeg decoding,
by first adding use of_platform_populate to manage each hardware
information: interrupt, clock, register bases and power.
Secondly add decoding work queue to deal with the decoding requests
of multi-hardware at the same time. Lastly, add output picture
reorder function interface to eliminate the out of order images.

This series has been tested with both MT8195.
Decoding worked for this chip.

Patches 1~2 use of_platform_populate to manage multi-hardware.

Patch 3 add jpeg decoding timeout function to judge hardware timeout.

Patch 4 add decoding work queue to deal with multi-hardware decoding
at the same time.

Patch 5 add output picture reorder function to order images.

Patch 6 refactor jpegdec func interface for HW working.
---
kyrie.wu (6):
  dt-bindings: mediatek: Add mediatek, mt8195-jpgdec compatible
  media: mtk-jpegdec: manage jpegdec multi-hardware
  media: mtk-jpegdec: add jpegdec timeout func interface
  media: mtk-jpegdec: add jpeg decode worker interface
  media: mtk-jpegdec: add output pic reorder interface
  media: mtk-jpegdec: refactor jpegdec func interface

 .../bindings/media/mediatek-jpeg-decoder.yaml      |   4 +
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 295 ++++++++++++----
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  64 ++++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c  | 369 +++++++++++++++++++--
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h  |   7 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h |   1 +
 6 files changed, 640 insertions(+), 100 deletions(-)

-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
