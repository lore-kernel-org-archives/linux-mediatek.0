Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE987C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 10:59:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C7B2604AC
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 10:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C7B2604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sN81jMR/Kx3ln4gWptWPtNyGZA+PqNunfwmebPcQugI=; b=u1lOTsf2FG37Tt
	cGF5JGe3zgyYiXQM5ZVeisIPgU4h7D0U3jiqN0+qoHcw0mWimxlgJciaVDPfxizJLwrfxZs7+geUx
	TUUmN9zv24XA8tPp0/ZCH8+AygeKDWfwUE311m6VQK8ixLAMlzJ26au42MFwLiYHSbeI7JauyC8u7
	eVOc6uvv08NzbhHyXuxGFSxlKkgSDgETSUBF53pJ45QMBkJ8+DgJu3Ew35rxuRLp+PlXyVaRGJRIE
	Vq5pcJ2PPyPOuu2NKMyhrotH+g5doRAPwT70fZT/9bTxdo3yv5as1NRWanhqtCL9+HQ7Zo6avbv1f
	UUu/um9qB2cRqInPmmJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mexhT-00GAwb-AT; Mon, 25 Oct 2021 10:59:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mexev-00G9ng-0P; Mon, 25 Oct 2021 10:56:55 +0000
X-UUID: b142fa900346461f9f5b85f638f55880-20211025
X-UUID: b142fa900346461f9f5b85f638f55880-20211025
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 384323141; Mon, 25 Oct 2021 03:56:47 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Oct 2021 03:56:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Oct 2021 18:56:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 25 Oct 2021 18:56:44 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <yc.hung@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <daniel.baluta@nxp.com>, <trevor.wu@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 0/2] Add code to manage DSP clocks and provide dts-binding
 document
Date: Mon, 25 Oct 2021 18:56:33 +0800
Message-ID: <20211025105635.30625-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_035653_095356_C8DD3A96 
X-CRM114-Status: UNSURE (   9.85  )
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

From: "yc.hung" <yc.hung@mediatek.com>

This code is based on top of SOF topic/sof-dev branch and we want to have a review 
with ALSA and device Tree communities the it will be merged to SOF tree and then
merged into ALSA tree. It provides two patches, one is for mt8195 dsp clocks related.
Another is for mt8195 dsp dts binding decription.

YC Hung (2):
  ASoC: SOF: mediatek: Add mt8195 dsp clock support
  dt-bindings: dsp: mediatek: Add mt8195 DSP binding support

 .../bindings/dsp/mtk,mt8195-dsp.yaml          | 139 +++++++++++++++
 sound/soc/sof/mediatek/adsp_helper.h          |   2 +-
 sound/soc/sof/mediatek/mt8195/Makefile        |   2 +-
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c    | 163 ++++++++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195-clk.h    |  28 +++
 sound/soc/sof/mediatek/mt8195/mt8195.c        |  22 ++-
 6 files changed, 352 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
