Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D51AECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 02:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBTVq5JWRZGciHt3zVoLMLM2akIEZ/UY1juZ7uS87mg=; b=Yx3WXQu8N7nNnL8fzWf/pxB4PK
	ZsvIv00tqSrxb8lKkNCCm31LxJm2211rd0nVM2bXquhB0g/WrsTmD0Vd/Hux4njpsWzwLIcHLq8la
	LNQRec+soTg4F7bzlp0J5r692W5LI/9EgGooHw5IVTOz3L0SppSvX4pkEAXozGKLNRiPvRP887FC8
	zltwDZ1nGrhUwLK5JG/YYLKjFUW89jzarSx9LvmuI9BpqYcra2uay96vTbRXFeGhcmqE9yi4MbKyx
	eFXE15/Gl+v87e7DsqZhhbAR6FsF6/Gk49RGQ35Mw/r6psS31SF47qOgPXQ8o58jUM4wM84tfrv/8
	RTEe9Yew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV2Fr-006FCl-Ox; Mon, 05 Sep 2022 02:54:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV1j6-005aDw-BS; Mon, 05 Sep 2022 02:20:43 +0000
X-UUID: f393cf22b40e47479bf0bcb26cc360c5-20220904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=RBTVq5JWRZGciHt3zVoLMLM2akIEZ/UY1juZ7uS87mg=;
	b=R3j9U1a1mmltwNpfuUxhlYuFMuQh+f2M203UHIHmYH0hmTJHmk2XXEOfIXgaWD6MMvcwybTw+9PqIfl2e3ypq6kSpK753wsaoTvTpkkgxgGP4m3ULMNkfTIa6REX+IUZHpX+ke0I0DrlYVqfXKY9FuDFLkEAksyL+u2tv6tXOWw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:094f4690-82f3-4f9b-a9f3-481285442f93,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:81619c56-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f393cf22b40e47479bf0bcb26cc360c5-20220904
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2051079780; Sun, 04 Sep 2022 19:20:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 5 Sep 2022 09:59:50 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 5 Sep 2022 09:59:49 +0800
Message-ID: <8b8edee34e6bfa5d4a87defeedb799be685be867.camel@mediatek.com>
Subject: Re: [PATCH v4,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>,
	<jason-jh.lin@mediatek.com>, <yongqiang.niu@mediatek.com>,
	<chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>
CC: <jitao.shi@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 5 Sep 2022 09:59:55 +0800
In-Reply-To: <3e33e564-a62d-d07c-f214-0f1857b99a9c@collabora.com>
References: <1661743308-29120-1-git-send-email-xinlei.lee@mediatek.com>
	 <1661743308-29120-2-git-send-email-xinlei.lee@mediatek.com>
	 <3e33e564-a62d-d07c-f214-0f1857b99a9c@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_192040_768820_78999B7B 
X-CRM114-Status: GOOD (  15.07  )
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

On Mon, 2022-08-29 at 11:52 +0200, AngeloGioacchino Del Regno wrote:
> Il 29/08/22 05:21, xinlei.lee@mediatek.com ha scritto:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add mmsys func to manipulate dpi output format config for MT8186.
> > 
> > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >   drivers/soc/mediatek/mt8186-mmsys.h    | 1 +
> >   drivers/soc/mediatek/mtk-mmsys.c       | 8 ++++++++
> >   include/linux/soc/mediatek/mtk-mmsys.h | 3 +++
> >   3 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mt8186-mmsys.h
> > b/drivers/soc/mediatek/mt8186-mmsys.h
> > index eb1ad9c37a9c..6eca3445bea3 100644
> > --- a/drivers/soc/mediatek/mt8186-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> > @@ -3,6 +3,7 @@
> >   #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
> >   #define __SOC_MEDIATEK_MT8186_MMSYS_H
> >   
> > +#define MT8186_DPI_OUTPUT_FORMAT		0x400
> 
> For readability, can we please rename this definition to
> 
> MT8186_MMSYS_DPI_OUTPUT_FORMAT
> 
> Thanks,
> Angelo
> 

Hi Angelo:

ok, I will revise it in the next version.

Best Regards!
Xinlei


