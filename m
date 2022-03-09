Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 09:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=em+hnf13W0mLSs7E2YowGJvJuTBS1hhr4G2KXsLoLFg=; b=MPVOBCc/gj+pAG
	AkGJY0Lbue2VDoSNkAJUizGLaSsbF10TlPj4xIa4oYTbeg0l96Mflnjv0v/NMmzmbVSKBZHp+a1eO
	TAypR0T+FC6J5DHaBYTsZDZeuqxSMyPR0yWUmi6Jg6SbAXyUxxHzh6yBH3J5cfvEjEO0LRTLGW/pj
	u28rcflWITPKnlP7PUjkllh/9t/thXjJ/4lCye7XzzGmP7VPLs9WIC5PLc/XxmJrd4LhNwB93PGoq
	I5AHKwNKEDOXnwXsyvJiIierENt+39cu1Xoqok6T6UBahF2rgiLIYX0L0PD3GXAZgmNw5q2mlQmb3
	PoCqioEdHp1LGctXhJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRsOp-007s0q-JP; Wed, 09 Mar 2022 09:14:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRsOk-007rxm-3I; Wed, 09 Mar 2022 09:14:25 +0000
X-UUID: 91580a931217417da0881f3e7f102557-20220309
X-UUID: 91580a931217417da0881f3e7f102557-20220309
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2038776629; Wed, 09 Mar 2022 02:14:14 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 01:14:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Mar 2022 17:14:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Mar 2022 17:14:04 +0800
Message-ID: <6da50a5b69538e44ba06d6f90dc4e64ee74048ca.camel@mediatek.com>
Subject: Re: [PATCH v12 3/4] soc: mediatek: mutex: add support for MDP
From: moudy.ho <moudy.ho@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jernej Skrabec
 <jernej.skrabec@siol.net>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <jason-jh.lin@mediatek.com>, <roy-cw.yeh@mediatek.com>,
 <river.cheng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 9 Mar 2022 17:14:04 +0800
In-Reply-To: <1c665549b28c206126b1407eaf6ca97269bf1169.camel@mediatek.com>
References: <20220301100246.2153-1-moudy.ho@mediatek.com>
 <20220301100246.2153-4-moudy.ho@mediatek.com>
 <1c665549b28c206126b1407eaf6ca97269bf1169.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_011422_155537_171DCFF2 
X-CRM114-Status: GOOD (  27.15  )
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

On Thu, 2022-03-03 at 17:33 +0800, CK Hu wrote:
> Hi, Moudy:
> 
> On Tue, 2022-03-01 at 18:02 +0800, Moudy Ho wrote:
> > For the purpose of module independence, related settings should be
> > moved
> > from MDP to the corresponding driver.
> > This patch adds more 8183 MDP settings and interface.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c       | 68
> > ++++++++++++++++++++++++++
> >  include/linux/soc/mediatek/mtk-mutex.h |  3 ++
> >  2 files changed, 71 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index aaf8fc1abb43..a6268ecde240 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -136,6 +136,18 @@
(snip)
> >  struct mtk_mutex {
> >  	int id;
> >  	bool claimed;
> > @@ -156,6 +168,10 @@ struct mtk_mutex_data {
> >  	const unsigned int *mutex_sof;
> >  	const unsigned int mutex_mod_reg;
> >  	const unsigned int mutex_sof_reg;
> > +	const unsigned int *mutex_mdp_offset;
> > +	const unsigned int *mutex_mdp_mod;
> > +	const unsigned int mutex_mdp_mod_mask;
> 
> Useless, so remove this.
> 
> > +	const unsigned int mutex_mdp_sof_mask;
> 
> Useless, so remove this.
> 
> >  	const bool no_clk;
> >  };
> >  
Hi CK,

Thanks for the suggestion, these two can indeed be removed and will be
fixed in the next version.

(snip)
> >  
> > @@ -366,6 +405,21 @@ struct mtk_mutex *mtk_mutex_get(struct device
> > *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mutex_get);
> >  
> > +struct mtk_mutex *mtk_mutex_mdp_get(struct device *dev,
> > +				    enum mtk_mdp_pipe_id id)
> 
> For DRM, mutex id does not physically bound to specific hardware, why
> do MDP need the pipeline id?
> 
> Regards,
> CK

In the next version I will remove this mandatory designation method and
change it to the existing API.

Thanks & Regrads,
Moudy Ho
> > +{
> > +	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> > +	int i = mtx->data->mutex_mdp_offset[id];
> > +
> > +	if (!mtx->mutex[i].claimed) {
> > +		mtx->mutex[i].claimed = true;
> > +		return &mtx->mutex[i];
> > +	}
> > +
> > +	return ERR_PTR(-EBUSY);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_mdp_get);
> > +
> >  void mtk_mutex_put(struct mtk_mutex *mutex)
> >  {
> >  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > @@ -485,6 +539,20 @@ void mtk_mutex_remove_comp(struct mtk_mutex
> > *mutex,
> >  }
> >  EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
> >  
> > +u32 mtk_mutex_get_mdp_mod(struct mtk_mutex *mutex, enum
> > mtk_mdp_comp_id id)
> > +{
> > +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > +						 mutex[mutex->id]);
> > +
> > +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> > +
> > +	if (mtx->data->mutex_mdp_mod)
> > +		return mtx->data->mutex_mdp_mod[id];
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_get_mdp_mod);
> > +
> >  void mtk_mutex_enable(struct mtk_mutex *mutex)
> >  {
> >  	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > diff --git a/include/linux/soc/mediatek/mtk-mutex.h
> > b/include/linux/soc/mediatek/mtk-mutex.h
> > index 6fe4ffbde290..b2608f4220ee 100644
> > --- a/include/linux/soc/mediatek/mtk-mutex.h
> > +++ b/include/linux/soc/mediatek/mtk-mutex.h
> > @@ -11,9 +11,12 @@ struct device;
> >  struct mtk_mutex;
> >  
> >  struct mtk_mutex *mtk_mutex_get(struct device *dev);
> > +struct mtk_mutex *mtk_mutex_mdp_get(struct device *dev,
> > +				    enum mtk_mdp_pipe_id id);
> >  int mtk_mutex_prepare(struct mtk_mutex *mutex);
> >  void mtk_mutex_add_comp(struct mtk_mutex *mutex,
> >  			enum mtk_ddp_comp_id id);
> > +u32 mtk_mutex_get_mdp_mod(struct mtk_mutex *mutex, enum
> > mtk_mdp_comp_id id);
> >  void mtk_mutex_enable(struct mtk_mutex *mutex);
> >  void mtk_mutex_disable(struct mtk_mutex *mutex);
> >  void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
