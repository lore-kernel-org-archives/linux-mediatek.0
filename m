Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D97C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 18:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmzvC+uE95uvTZNFVb/rgoIhUNHjXdDqUEl48fEuhmw=; b=HkgeNzMsxD1WjktdIkbDFIiNFK
	239Wbkp2BuIWxN2yjEGfWQGDxbrj1MsWqs7iceFOZwXuJV2/bNZN1SaWoUZWpKq2oGyvYsslHFr2p
	7br4KrscQu4GKpomTMki67XtWwyJZo9s6mPvyuQnkMr3d4m4iY0RUugbv8GIdjABbxna0No8tgnqf
	CA01LiF9wvHseLMQ348UFs71NyKLteyZIP3jAPsZtGfIpUuXS5MnbanWhmw+0aCH4CEKhNOEQNmrx
	v7RgPt9lnXCo+tsz4MGbdS3GkmMhnPQ1m+4voi/cSsJc1vTprdUreaV/1UXUgtMEMahgYr3jxQq1H
	fnHMCBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzhdJ-00000005Skv-3fgk;
	Wed, 24 Apr 2024 18:46:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzhdG-00000005Sha-1Cxi;
	Wed, 24 Apr 2024 18:46:15 +0000
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E133B1;
	Wed, 24 Apr 2024 20:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713984318;
	bh=s3FyBov567J2QGOwzCsWd6sbv2/5L8BTtQKZYmfBE4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LyWtD7HhQFhNcsJLXImxTlEO9zSrnA0XXnPz447uiAF/Ub8UwT4XZ+hvcyDUMkod9
	 TdsIHxHej3MnvOv6+cPx44pYbMUETYoC3ESpbOJODQu+8+i6ZJdk+ZjLuVIbDD+Fvz
	 VrWw2zwvUmUkCU8m2caH9M+pJwe1tu3zoTtTA6F4=
Date: Wed, 24 Apr 2024 21:46:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 09/26] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
Message-ID: <20240424184603.GA6282@pendragon.ideasonboard.com>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
 <40b9c015-8ccf-4313-800a-ecae9aa8cc27@xs4all.nl>
 <ZilMu614pUAzEGTa@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZilMu614pUAzEGTa@kekkonen.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_114614_493906_66056959 
X-CRM114-Status: GOOD (  20.58  )
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

On Wed, Apr 24, 2024 at 06:17:31PM +0000, Sakari Ailus wrote:
> On Wed, Apr 24, 2024 at 12:55:20PM +0200, Hans Verkuil wrote:
> > On 19/04/2024 11:47, Ricardo Ribalda wrote:
> > > Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> > > is not enabled.
> > > 
> > > This makes cocci happier:
> > > 
> > > drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> > > 
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-async.c | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > index 4bb073587817..915a9f3ea93c 100644
> > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
> > >  static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > >  					     struct v4l2_subdev *sd)
> > >  {
> > > -	struct media_link *link = NULL;
> > > +	struct media_link *link;
> > >  
> > > -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > > +	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> > > +		return 0;
> > >  
> > >  	if (sd->entity.function != MEDIA_ENT_F_LENS &&
> > >  	    sd->entity.function != MEDIA_ENT_F_FLASH)
> > > @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > >  
> > >  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> > >  
> > > -#endif
> > > -
> > >  	return IS_ERR(link) ? PTR_ERR(link) : 0;
> > >  }
> > 
> > I think I would prefer:
> > 
> > static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > 					     struct v4l2_subdev *sd)
> > {
> > #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > 	struct media_link *link;
> > 
> > 	...
> > 
> > 	return IS_ERR(link) ? PTR_ERR(link) : 0;
> > #else
> > 	return 0;
> > #endif
> > }
> > 
> 
> Me, too.

I actually prefer Ricardo's proposal :-)

-- 
Regards,

Laurent Pinchart

