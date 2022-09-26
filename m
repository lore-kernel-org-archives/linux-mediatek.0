Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4811FC6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 06:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXTpwCqP/aZgnhR2k7VPN+d1upi7OcgiQYXvjYN4hCk=; b=Ty5VqznMv/j8NXA4qVF8iSkDgF
	dFcj5qg99RRGHlYav09/EWUKiOQWEv0dihycpJntFGEc5nx93i9PfiemHcKP6pO5QSykpuM52SwBE
	iDYCDPTTrN0drRkzZ6gxO6TbYSsWb125tRf2rF6JzHZx73L1jBeYb65os0XLYeX9GKPU/jCbobBY4
	pe3zlBge39LkA+T9n2xE6FwRVizH8mvJAkJEQ1xg4IXmkl1m68qZdFhIcn6y458hFf3bybjYji6+i
	dKT7/FICRAi98TWGwzhDSUKj6bAfHY1z316rJuMBJH96Sn8SelUZM78hXA2b90mFF5kEPLcZkbSM+
	I/KWfmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ochtq-002TGt-Jq; Mon, 26 Sep 2022 06:47:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ochsx-002T4V-OW; Mon, 26 Sep 2022 06:46:37 +0000
X-UUID: a055daaa557b41b58163191f198111ba-20220925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=KXTpwCqP/aZgnhR2k7VPN+d1upi7OcgiQYXvjYN4hCk=;
	b=Qe/a9FpQo9257V4vUXNbQU69kJ6RTxPKpYGMocAkgOGzIXvn6m8mZBexY588bR2MCl7JvPoeOvaybfgk4Yis902gjlRpQdvOJ90ZO/vCnmb9MS9bSwGBQEv3nFqz6uGi70JEFuTwY3N06oZ42DBLy7K3pjkKstI4jcXg7XHGaVU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:d1fca916-11fb-4760-a047-cd5b23db7b0e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:2a1b0107-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a055daaa557b41b58163191f198111ba-20220925
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 983656491; Sun, 25 Sep 2022 23:46:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 14:45:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 26 Sep 2022 14:45:47 +0800
Message-ID: <59d90a1fa9f7441135d8ce3f0e8dd7295a44f73a.camel@mediatek.com>
Subject: Re: [V14,0/15] Enable jpeg enc & dec multi-hardwares for MT8195
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Irui Wang
	<irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>
Date: Mon, 26 Sep 2022 14:45:46 +0800
In-Reply-To: <d390a832-c9be-e0bc-971e-d00339e4b34d@xs4all.nl>
References: <20220915064337.2686-1-irui.wang@mediatek.com>
	 <d390a832-c9be-e0bc-971e-d00339e4b34d@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_234635_840901_A10D89DB 
X-CRM114-Status: GOOD (  29.68  )
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

On Fri, 2022-09-23 at 11:38 +0200, Hans Verkuil wrote:
> Hi Irui,
> 
> Something went wrong here: patches 10-15 never made it to the
> mailinglist.
> 
> Can you repost?
> 
> 	Hans
Hi Hans,

I'm sorry for this mistake. I will resend the series patches.

Thanks.

Regards,
Kyrie.
> 
> On 15/09/2022 08:43, Irui Wang wrote:
> > From: kyrie wu <kyrie.wu@mediatek.com>
> > 
> > This series adds support for multi hardwares jpeg enc & dec,
> > by first adding use of_platform_populate to manage each hardware
> > information:interrupt, clock, register bases and power.
> > Secondly add jpeg enc & dec work queue to deal with the encoding
> > or decoding requests of multi-hardwares at the same time.
> > Lastly, add output picture reorder function interface to
> > eliminate the out of order images.
> > 
> > This series has been tested with MT8195 Gstreamer.
> > Encoding and decoding worked for this chip.
> > 
> > Patches 1 Adds jpeg encoder dt-bindings for mt8195
> > 
> > Patches 2 jpeg encoder builds two module for using Multi-HW,
> > export some functions to make them visible by other modules.
> > 
> > Patches 3 use devm_of_platform_populate to manage multi-hardware.
> > 
> > Patch 4 add jpeg encoding timeout function to judge hardware
> > timeout.
> > 
> > Patch 5 add encoding work queue to deal with multi-hardware
> > encoding
> > at the same time.
> > 
> > Patch 6 add output picture reorder function to order images.
> > 
> > Patch 7 add stop cmd function to deal with EOS operation.
> > 
> > Patch 8 Adds jpeg decoder dt-bindings for mt8195
> > 
> > Patches 9 jpeg decoder builds three module for using Multi-HW,
> > export some functions to make them visible by other modules.
> > 
> > Patch 10 use of_platform_populate to manage multi-hardware.
> > 
> > Patch 11 add jpeg decoding timeout function to judge hardware
> > timeout.
> > 
> > Patch 12 add decoding work queue to deal with multi-hardware
> > decoding
> > at the same time.
> > 
> > Patch 13 add output picture reorder function to order images.
> > 
> > Patch 14 refactor jpegdec func interface for HW working.
> > 
> > Patch 15 add stop cmd function to deal with EOS operation.
> > 
> > ---
> > This series patches dependent on:
> > media_stage tree:
> > [1]
> > 
https://urldefense.com/v3/__https://git.linuxtv.org/media_stage.git/commit/?id=b3627647f9ea7473d10fb08a95fd7c4133a17ca4__;!!CTRNKA9wMg0ARbw!1eLKBlTK5IneP2_qZFZp3ujjHfmsb3PEdN5FQJdtUBhR4FitxsDKmCIdxqfG1JIV$
> >  
> > 
> > patch1 new jpegdec dt-bindings included files
> > [2] MM IOMMU binding:
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220217113453.13658-2-yong.wu@mediatek.com/__;!!CTRNKA9wMg0ARbw!1eLKBlTK5IneP2_qZFZp3ujjHfmsb3PEdN5FQJdtUBhR4FitxsDKmCIdxm6Up7tS$
> >  
> > 
> > [3] MT8195 power domain:
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=580579__;!!CTRNKA9wMg0ARbw!1eLKBlTK5IneP2_qZFZp3ujjHfmsb3PEdN5FQJdtUBhR4FitxsDKmCIdxs3hFoKL$
> >  
> > 
> > Changes compared with v13:
> > - some modifications for patch v13's review comments.
> > - fix kernel robot check errors.
> > - fix kernel-doc check warns.
> > - fix sparse check warns.
> > - combine jpeg encoder series with decoder series into
> >   one single series.
> > 
> > Changes compared with v12:
> > - some modifications for patch v12's review comments.
> > 
> > Changes compared with v11:
> > - some modifications for patch v11's review comments.
> > - fix yaml file check errors.
> > 
> > Changes compared with v10:
> > - some modifications for patch v10's review comments.
> > - fix Gstreamer test errors.
> > 
> > Changes compared with v9:
> > - some modifications for patch v9's review comments.
> > 
> > Changes compared with v8:
> > - some modifications for patch v8's review comments.
> > - add stop cmd function.
> > 
> > Changes compared with v7:
> > - some modifications for patch v6's review comments.
> > 
> > Changes compared with v6:
> > - new yaml file for mt8195 jpeg encoder.
> > - some modifications for patch v5's review comments.
> > 
> > Changes compared with v5:
> > - use of_platform_populate to replace component framework to
> >   manage multi-hardware in patch 2.
> > 
> > Changes compared with v4:
> > - No change compaered with v4
> > 
> > Changes compared with v3:
> > - Structure patches for consistency, non-backward
> >   compatible and do not break any existing functionality
> > 
> > Changes compared with v2:
> > - Split the last two patches into several patches
> >   to enhance readability
> > - Correct some syntax errors
> > - Explain why the component framework is used
> > 
> > Changes compared with v1:
> > - Add jpeg encoder dt-bindings for MT8195
> > - Use component framework to manage jpegenc HW
> > - Add jpegenc output pic reorder function interface
> > 
> > kyrie wu (15):
> >   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
> >   mtk-jpegenc: export jpeg encoder functions
> >   mtk-jpegenc: support jpegenc multi-hardware
> >   mtk-jpegenc: add jpegenc timeout func interface
> >   mtk-jpegenc: add jpeg encode worker interface
> >   mtk-jpegenc: add output pic reorder interface
> >   mtk-jpegenc: add stop cmd interface for jpgenc
> >   dt-bindings: mediatek: Add mediatek,mt8195-jpgdec compatible
> >   media: mtk-jpegdec: export jpeg decoder functions
> >   media: mtk-jpegdec: support jpegdec multi-hardware
> >   media: mtk-jpegdec: add jpegdec timeout func interface
> >   media: mtk-jpegdec: add jpeg decode worker interface
> >   media: mtk-jpegdec: add output pic reorder interface
> >   media: mtk-jpegdec: refactor jpegdec func interface
> >   mtk-jpegdec: add stop cmd interface for jpgdec
> > 
> >  .../media/mediatek,mt8195-jpegdec.yaml        | 169 ++++++
> >  .../media/mediatek,mt8195-jpegenc.yaml        | 147 ++++++
> >  drivers/media/platform/mediatek/jpeg/Makefile |  14 +-
> >  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 490
> > ++++++++++++++++--
> >  .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 169 +++++-
> >  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 315 ++++++++++-
> >  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |   6 +-
> >  .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |   1 +
> >  .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 255 +++++++++
> >  9 files changed, 1483 insertions(+), 83 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegdec.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegenc.yaml
> > 
> 
> 


