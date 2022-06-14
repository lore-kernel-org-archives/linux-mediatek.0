Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7404C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 12:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MZeXU4ISIIriFCsl0oqd3hu8GWgbwaQH7ad8ps7WYNo=; b=sF41OgQPH7sEbQ
	HEV7K3XYMLbJusWEryYXJ1GicQPFwviwSXkpM6tvvw31sNSR21b+3NP4NWYOb/BCagPpjYpgbzy2I
	byjk1od0m+AhfWbeVsa8Z5MRkYloEn0Lu8sKZqiIlZS6vqtLkCOFE6opLs4vZ2aZGIYkmZfJpypU8
	cjLJ+b07o80+Svd+oQeUlt84fkuoVsEMPcs/+W1UTnRxTHNLMYbXRPh8zwfFU5xTZDaQUfqlf1VAY
	GbO3zYJkFRobSPpUkrPQV5RkjZDCT/87VqPKLIeDxT4iOYc1DWEYVdFlC1Ngx8gIbgRxfFcnqB4m8
	H9BUJmjjwVwJ+KauMiOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o15aM-009UCO-O3; Tue, 14 Jun 2022 12:23:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o15Wq-009SIY-RH; Tue, 14 Jun 2022 12:20:18 +0000
X-UUID: 571cc8547a3d4d72af8872348ef98646-20220614
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:4664122c-b8e2-433c-b57a-0945cdf7eb98,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:92256ac5-c67b-4a73-9b18-726dd8f2eb58,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 571cc8547a3d4d72af8872348ef98646-20220614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1887052045; Tue, 14 Jun 2022 05:20:12 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jun 2022 05:10:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 14 Jun 2022 20:10:27 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 14 Jun 2022 20:10:26 +0800
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
Subject: [RESEND V9,0/7] Enable two hardware jpeg encoder for MT8195
Date: Tue, 14 Jun 2022 20:10:17 +0800
Message-ID: <20220614121024.31667-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_052016_908396_1C4BFD84 
X-CRM114-Status: GOOD (  14.94  )
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

This series has been tested with MT8195 Gstreamer.
Encoding worked for this chip.

Patches 1 Adds jpeg encoder dt-bindings for mt8195

Patches 2 jpeg encoder builds two module for using Multi-HW,
export some functions to make them visible by other modules.

Patches 3 use devm_of_platform_populate to manage multi-hardware.

Patch 4 add jpeg encoding timeout function to judge hardware timeout.

Patch 5 add encoding work queue to deal with multi-hardware encoding
at the same time.

Patch 6 add output picture reorder function to order images.

Patch 7 add stop cmd function to deal with EOS operation.
---
This series patches dependent on:
media_stage tree:
[1]
https://git.linuxtv.org/media_stage.git/commit/?id=b3627647f9ea7473d10fb08a95fd7c4133a17ca4

patch1 new jpegenc dt-bindings included files
[2] MM IOMMU binding:
https://patchwork.kernel.org/project/linux-mediatek/patch/20220217113453.13658-2-yong.wu@mediatek.com/

[3] MT8195 power domain:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=580579

Changes compared with v8:
- some modifications for patch v8's review comments.
- add stop cmd function.

Changes compared with v7:
- some modifications for patch v6's review comments.

Changes compared with v6:
- new yaml file for mt8195 jpeg encoder.
- some modifications for patch v5's review comments.

Changes compared with v5:
- use of_platform_populate to replace component framework to
  manage multi-hardware in patch 2.

Changes compared with v4:
- No change compaered with v4

Changes compared with v3:
- Structure patches for consistency, non-backward
  compatible and do not break any existing functionality

Changes compared with v2:
- Split the last two patches into several patches
  to enhance readability
- Correct some syntax errors
- Explain why the component framework is used

Changes compared with v1:
- Add jpeg encoder dt-bindings for MT8195
- Use component framework to manage jpegenc HW
- Add jpegenc output pic reorder function interface

kyrie wu (7):
  dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
  mtk-jpegenc: export jpeg encoder functions
  mtk-jpegenc: manage jpegenc multi-hardware
  mtk-jpegenc: add jpegenc timeout func interface
  mtk-jpegenc: add jpeg encode worker interface
  mtk-jpegenc: add output pic reorder interface
  mtk-jpegenc: add stop cmd interface for jpgenc

 .../media/mediatek,mt8195-jpegenc.yaml        | 153 +++++++++
 drivers/media/platform/mediatek/jpeg/Makefile |  11 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 299 +++++++++++++++---
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  82 ++++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |   1 +
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |   3 +-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 254 +++++++++++++++
 7 files changed, 751 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
