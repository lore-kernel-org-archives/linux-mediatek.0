Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D5AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 01:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBCkujc1VUgXGhfgQ2T2R2RGKm/w1zQInsFm/tGxyG0=; b=xY9jq+Lx9N86Ri
	w6evX61A2Ul3K6hNDMQGC+RcioP04oNAqSkfL0V4+ffwb43mCr7d9IoJY5h6nWnu3xQ4N95HACVCx
	PaZ8fzVnY3+uzCqfLZOslxtAqUW6f5+2jbt4gh2oF2FAljZGYYCwsPlx7gr8z9gfNutkVp40RZA7J
	C+Gf/M2D+0oN4YXB96WEariRl3XWG3ZvKSgJlEbbQ3+8SKcfg3rp2fzCnSJVEkDWJjSU5Z3HVmMPe
	2FXzVMQ1OMUwXxUtO7MR7N0w52bdzx/qV/xPA+flCkTZc9A/UV5dhEFFpJyEN7YY58dhRF4TBDEm+
	Fh/5m/B+XFR4TpI5xpYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZjxM-000G8q-L0; Thu, 31 Mar 2022 01:50:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZjxH-000G8B-L2; Thu, 31 Mar 2022 01:50:35 +0000
X-UUID: 4afe4b97511243899bd4910d8ac39068-20220330
X-UUID: 4afe4b97511243899bd4910d8ac39068-20220330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 114880875; Wed, 30 Mar 2022 18:50:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 18:44:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 31 Mar 2022 09:44:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 09:44:30 +0800
Message-ID: <524f93ebeaa9c2ad74b0f5dbb2703afa4c8e0bac.camel@mediatek.com>
Subject: Re: [PATCH v16 5/8] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Thu, 31 Mar 2022 09:44:30 +0800
In-Reply-To: <72e5b8ed21a796f6f756b0ee42b363c158f18cd3.camel@mediatek.com>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
 <20220307032859.3275-6-jason-jh.lin@mediatek.com>
 <72e5b8ed21a796f6f756b0ee42b363c158f18cd3.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_185031_723217_1AAE4AA9 
X-CRM114-Status: GOOD (  23.29  )
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
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 roy-cw.yeh@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK,

Thanks for the reviews.

On Fri, 2022-03-18 at 15:21 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Mon, 2022-03-07 at 11:28 +0800, jason-jh.lin wrote:
> > Add mtk-mutex support for mt8195 vdosys0.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c | 103
> > ++++++++++++++++++++++++++++++-
> >  1 file changed, 100 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index aaf8fc1abb43..1c7ffcdadcea 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -17,6 +17,9 @@
> >  #define MT8183_MUTEX0_MOD0			0x30
> >  #define MT8183_MUTEX0_SOF0			0x2c
> >  
> > +#define MT8195_DISP_MUTEX0_MOD0			0x30
> > +#define MT8195_DISP_MUTEX0_SOF			0x2c
> > +
> >  #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 *
> > (n))
> >  #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
> >  #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 *
> > (n))
> > @@ -96,6 +99,36 @@
> >  #define MT8173_MUTEX_MOD_DISP_PWM1		24
> >  #define MT8173_MUTEX_MOD_DISP_OD		25
> >  

[snip]

> > > +#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		20
> > > +#define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
> > > +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0	22
> > > 
> > > Useless, remove.
> > > 
> > > > +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1	23
> > > 
> > > Ditto.
> > > 
> > > Regards,
> > > CK
> > 
> > Although these definitions are not used, they represent the
> > functionality provided by this register.
> > 
> > I think we can show that we have these capabilities by defining
> them.
> > 
> > Can we keep these definitions?
> 
> OK, but add some information that we could know how to use it. What's
> these DL_RELAY and when should we add these to mutex?
> 
> Regards,
> CK

DL_RELAY is used for the cross mmsys mux settings.
We won't use these setting currently, so I think
I just remove these useless define.

Thanks.

Regards,
Jason-JH.Lin


[snip]

-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
