Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F135EC07E9C
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:22:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD4AD61C88
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD4AD61C88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fXxNDhvHjqaeasCCIjOrtePmImk7ZnESa9g52+kHZuE=; b=wT09W/GOsbRJIR
	n5r0SXmasijvXUOWs1CDyh2NSARvdd9ZIU2DtDe9dqyTGkU3yghww6q0Tb9JUqr5QOJx3RN7GkWBs
	ZlSqcwBvq7mWRUe86U03hwV5sKCnx3mJPG81C8xy89UTQUl6oBU8qhAl6LunRvcUatFZfSyt+WAik
	pM8iFfnvgbzLC565BezCOStcWyWzVEspvVEiQ1WNlgSvjIVhnyhw/DsCVge7VlZaYr3zUw7t0lPhg
	aP/38xvgQmkY+QkkpZxwkJG3QKeoB8aEfTRB756o6CMjm5WMR/a91GZ8pTBpAE0EU3Mp7Cs1895wj
	lQVKoqaDycO/eknXXWqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m10xL-00DeeN-DE; Wed, 07 Jul 2021 06:22:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m10x6-00DeXR-JP; Wed, 07 Jul 2021 06:22:34 +0000
X-UUID: c547b41cfefd4f75a19e9d97357dca40-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=bfv83xB9hr/vLhdo8jkRe3YT2uB1fN8ER/P6+fT6Wlw=; 
 b=trm/IlfsUdI4eZs+EHx+HZr1e7PQL4V74JZYIMBsHpm+oefkIxZC/tYdHI5rh65GtA0DS6Isb02pGVlAvkOdM2+0gNje7jpuwxyDl9bziA3c0YC0oYp37NPK4cE905V2Q/cprLk9nOtgyFjyhVU6B6qBxRSCR9ynqOKW1TvFRIg=;
X-UUID: c547b41cfefd4f75a19e9d97357dca40-20210706
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1960353174; Tue, 06 Jul 2021 23:22:24 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 23:22:22 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:22:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:22:14 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1,
 00/14] Using component framework to support multi hardware decode
Date: Wed, 7 Jul 2021 14:21:43 +0800
Message-ID: <20210707062157.21176-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_232232_698406_152ADBC5 
X-CRM114-Status: GOOD (  18.59  )
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

This series adds support for multi hardware decode into mtk-vcodec, by first
adding component framework to manage each hardware information: interrupt,
clock, register bases and power. Secondly add core thread to deal with core
hardware message, at the same time, add msg queue for different hardware
share messages. Lastly, the architecture of different specs are not the same,
using specs type to separate them.

This series has been tested with both MT8183 and MT8173. Decoding was working
for both chips.

Patches 1,2 rewrite get register bases and power on/off interface.

Patch 3-5 add component framework to support multi hardware.

Patches 6-14 add interfaces to support core hardware.
----
This patch dependents on "media: mtk-vcodec: support for MT8183 decoder"[1].

Multi hardware decode is based on stateless decoder, MT8183 is the first
time to add stateless decoder. Otherwise it will cause conflict.
Please also accept this patch together with [1].

[1]https://lore.kernel.org/patchwork/project/lkml/list/?series=507084
----

Yunfei Dong (14):
  media: mtk-vcodec: Get numbers of register bases from DT
  media: mtk-vcodec: Refactor vcodec pm interface
  media: mtk-vcodec: Use component framework to manage each hardware
    information
  dt-bindings: media: mtk-vcodec: Separate video encoder and decoder
    dt-bindings
  media: mtk-vcodec: Use pure single core for MT8183
  media: mtk-vcodec: Add irq interface for core hardware
  media: mtk-vcodec: Add msg queue feature for lat and core architecture
  media: mtk-vcodec: Generalize power and clock on/off interfaces
  media: mtk-vcodec: Add new interface to lock different hardware
  media: mtk-vcodec: Add core thread
  media: mtk-vcodec: Support 34bits dma address for vdec
  dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
  media: mtk-vcodec: Add core dec and dec end ipi msg
  media: mtk-vcodec: Use codec type to separate different hardware

 .../media/mediatek-vcodec-comp-decoder.txt    |  93 ++++++
 .../media/mediatek-vcodec-decoder.txt         | 169 +++++++++++
 .../media/mediatek-vcodec-encoder.txt         |  73 +++++
 drivers/media/platform/mtk-vcodec/Makefile    |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   4 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 286 +++++++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 193 ++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  51 ++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  98 ++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  13 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   1 +
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  69 ++++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   1 -
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     |  30 ++
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |  87 +++++-
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |   8 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |  21 +-
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  16 +-
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 266 ++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      | 136 +++++++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  46 ++-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  22 ++
 25 files changed, 1582 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
