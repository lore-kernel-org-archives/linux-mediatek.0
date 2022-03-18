Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AB2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 13:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8bTRaR8YcU5iLRftYPguEq4sw/DAn4a3Lbk+Nc8LGC4=; b=U4XA+vIvBHm3RK
	jxbVAbgXdjicdAPQvWaYjj7UVhvt5N+MTP51bFJLjmLkC0ijsU1a3a2778aEHjAAEhfpbhDwMVC9L
	9D3v2GXTKhgiKAbWkxKm4u7SsdjTNLJeIwylrg2kKjuEqZL4JFkhXg/BwaTi12itqDeF5GfVjyzPu
	p5X4x1qTy4ukA71sPyfs9ty9eTSZ16Ej51Cpffgp0D1V8FB1FnzMlsx+S2FusLNHrosjd+nEuSBo+
	mft8ewORqoHXv/JmTJEty4YJon/lSacL09tBT73DwBErpG3fPXD63Uo/jc/ZVDaKQIC4t+LdKkfzm
	7xOlnxx1FsSYKWVIWR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVCHJ-001g97-HR; Fri, 18 Mar 2022 13:04:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVCHG-001g86-JN; Fri, 18 Mar 2022 13:04:24 +0000
X-UUID: 952df146d52443609ab6f8a40de147b7-20220318
X-UUID: 952df146d52443609ab6f8a40de147b7-20220318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 506439869; Fri, 18 Mar 2022 06:04:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 06:04:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 18 Mar 2022 21:04:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 21:04:13 +0800
Message-ID: <4a59806ad9adbfcaa4c34cdf79d615e24e666442.camel@mediatek.com>
Subject: Re: [PATCH v15 19/22] drm/mediatek: modify mediatek-drm for mt8195
 multi mmsys support
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <srv_heupstream@mediatek.com>, David Airlie
 <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <llvm@lists.linux.dev>, Nick Desaulniers
 <ndesaulniers@google.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Fri, 18 Mar 2022 21:04:13 +0800
In-Reply-To: <abdf2bf18c57b8c622970252f58d4849823e48bd.camel@mediatek.com>
References: <20220311015506.11232-1-nancy.lin@mediatek.com>
 <20220311015506.11232-20-nancy.lin@mediatek.com>
 <abdf2bf18c57b8c622970252f58d4849823e48bd.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_060422_675519_56A0161B 
X-CRM114-Status: GOOD (  21.10  )
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

Hi CK,

Thanks for the review.

On Mon, 2022-03-14 at 18:08 +0800, CK Hu wrote:
> Hi, Nancy:
> 
> On Fri, 2022-03-11 at 09:55 +0800, Nancy.Lin wrote:
> > MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
> > The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
> > only one drm driver register as the drm device.
> > Each drm driver binds its own component. The last bind drm driver
> > allocates and registers the drm device to drm core.
> > Each crtc path is created with the corresponding drm driver data.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  24 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.h |   3 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 300 ++++++++++++++++++--
> > ----
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  10 +-
> >  4 files changed, 246 insertions(+), 91 deletions(-)
> > 
> > 
> 
> [snip]
> 
> >  
> >  static const struct mtk_mmsys_driver_data
> > mt8195_vdosys0_driver_data
> > = {
> >  	.main_path = mt8195_mtk_ddp_main,
> >  	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
> > +	.mmsys_dev_num = 2,
> 
> After apply this patch, vdosys0 only would not work. So I think this
> should be set to 1 in this patch, and set to 2 in the patch that
> support mt8195 vdosys1. With this modification,
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

OK, I will fix it.

Regards,
Nancy


> >  };
> >  
> > 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
