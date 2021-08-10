Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E672C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:37:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB43360ED8
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB43360ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/wPk85v7y9Me6nPRQbcKYfb1lWPKu4pxsaCiUxSodYk=; b=2e88sa1B1DWk18
	S64FWXVBh5XZbsyTPwBX05HXBJ0srOofHAGglmmDiFRbBaJFXX6uk1XFNZk1t2gZVp23WvdD9gEVF
	0YKQAeAu+AAWq8DgA8P6S0RcBL8ublJ+kBxGapdnwxNjaOgTUPUtuwPCAkEtnzbKBHqxpvU8y3vIz
	kA0XmJOYREUt6cWLcrQ1DOTdjIY7xPhxakCuUu4xTGO3Jj/ul6kBghZP7FHYLQDiNN88Ljp594/+E
	bmSZNlVJ+VP6WI7kfByoNedNhcfQSL1pBI5LfWI5k3NgPt86VZECXgjEafJK4MFrXqcsCwRoB6nWi
	+aK+x+mSjmGy4WajPAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDNGI-00341w-My; Tue, 10 Aug 2021 08:37:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDND3-0032Cb-L0; Tue, 10 Aug 2021 08:34:10 +0000
X-UUID: 95afd3f00e1b48c99cbd08a30da5bf99-20210810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PkO+djF6pM3GjB5SUH+FBOO6zjBSFvsXyGqjO8hSHUc=; 
 b=KMPZKwyXbjGzC0OCh6u9qZgTelQegO0Jp8dxCttkxXmFCcL9mavY0lzu1hIYE5RCTUtNyey9r5lcaH5+2pWXhvd/8NlHJxUb+cBGhOkC4V/BURJfoFGr06Q5fV831M7KsVzkqzUelj6ImZlc5LVUl5NWQvSrn9BVvLjLriGRQ/g=;
X-UUID: 95afd3f00e1b48c99cbd08a30da5bf99-20210810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1091080396; Tue, 10 Aug 2021 01:33:58 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 01:31:21 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 16:31:20 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 16:31:19 +0800
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, George Sun
 <george.sun@mediatek.com>
Subject: [PATCH v4,
 00/15] Using component framework to support multi hardware decode
Date: Tue, 10 Aug 2021 16:30:32 +0800
Message-ID: <20210810083047.16693-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_013405_802301_22B3955B 
X-CRM114-Status: GOOD (  25.39  )
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

Patches 1~3 rewrite get register bases and power on/off interface.

Patch 4 add component framework to support multi hardware.

Patch 5 separate video encoder and decoder document

Patches 6-15 add interfaces to support core hardware.
----
This patch dependents on "media: mtk-vcodec: support for MT8183 decoder"[1].

Multi hardware decode is based on stateless decoder, MT8183 is the first time
to add stateless decoder. Otherwise it will cause conflict. Please also accept
this patch together with [1].

[1]https://lore.kernel.org/patchwork/project/lkml/list/?series=507084
----
Changes compared with v3:
- Fix return value for patch 1/15
- Fix comments for patch 4/15
  > Looking up "mediatek,mtk-vcodec-core" to determine if it uses component framwork sounds like...
  Add prameter in pdata, for all platform will use compoent after mt8183

  >> +     if (dev->is_comp_supported) {
  >> +             ret = mtk_vcodec_init_master(dev);
  >> +             if (ret < 0)
  >> +                     goto err_component_match;
  >> +     } else {
  >> +             platform_set_drvdata(pdev, dev);
  >> +     }
  > + Has asked the same question in [1].  Why it removes the
  > +platform_set_drvdata() above?  mtk_vcodec_init_master() also calls platform_set_drvdata().
  Must call component_master_add_with_match after platform_set_drvdata for component architecture.
- Fix yaml files check fail for patch 5/15
- Fix yaml file check fail for patch 14/15

Changes compared with v1:
- Fix many comments for patch 3/14
- Remove unnecessary code for patch 4/14
- Using enum mtk_vdec_hw_count instead of magic numbers for patch 6/14
- Reconstructed get/put lat buffer for lat and core hardware for patch 7/14
- Using yaml format to instead of txt file for patch 12/14

Yunfei Dong (15):
  media: mtk-vcodec: Get numbers of register bases from DT
  media: mtk-vcodec: Align vcodec wake up interrupt interface
  media: mtk-vcodec: Refactor vcodec pm interface
  media: mtk-vcodec: Use component framework to manage each hardware
    information
  dt-bindings: media: mtk-vcodec: Separate video encoder and decoder
    dt-bindings
  media: mtk-vcodec: Use pure single core for MT8183
  media: mtk-vcodec: Add irq interface for multi hardware
  media: mtk-vcodec: Add msg queue feature for lat and core architecture
  media: mtk-vcodec: Generalize power and clock on/off interfaces
  media: mtk-vcodec: Add new interface to lock different hardware
  media: mtk-vcodec: Add core thread
  media: mtk-vcodec: Support 34bits dma address for vdec
  dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
  media: mtk-vcodec: Add core dec and dec end ipi msg
  media: mtk-vcodec: Use codec type to separate different hardware

 .../media/mediatek,vcodec-comp-decoder.yaml   | 172 +++++++++++
 .../media/mediatek,vcodec-decoder.yaml        | 175 +++++++++++
 .../media/mediatek,vcodec-encoder.yaml        | 185 +++++++++++
 .../bindings/media/mediatek-vcodec.txt        | 130 --------
 drivers/media/platform/mtk-vcodec/Makefile    |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 280 ++++++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 184 +++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  53 ++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  98 ++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  13 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   2 +
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  71 ++++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  12 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   1 -
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     |  27 +-
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |  87 +++++-
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |   8 +-
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   2 +-
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |   2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   2 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |  21 +-
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  16 +-
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 290 ++++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      | 157 ++++++++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  46 ++-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  22 ++
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |   2 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   2 +-
 33 files changed, 1795 insertions(+), 280 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
