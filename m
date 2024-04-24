Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FF7C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 18:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AHgfTpF3cLHSAeDsd1TA/pt5hql/fCtz0ijoVnYJbI=; b=AC7aXSqpru+lFrKQPz0rqJlH0Y
	S/W2C2O2SpC1H84/FVYzWPKxeUP6fXynKgEoHwqYKbl/r/cmJ3Yvb/JvsG+X48K5RFxfzxmy7hQaN
	LpL6HS0O5wFE3GGUAKq07fs6Fq37SsAbhKUR/SwHTJBq/QzMafCA3KoWMIFhCY3Lv2UHz2wDYfYcJ
	iD8lBp8CYE6vFkkFjo1LqkgXiEXJRdp7wYDM55W7TfCgSdkHSmri0LkgB0sZd2x4DJXNPFJVzZZEb
	qPq4Ho61DtTd9fGHN3PXMjCSpVElICC6FD8ODO+d8WAtVYf86WV1Rh/S52mZNJe7nlbUm4JcaplVq
	vcqE6DWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzhBm-00000005Izy-3FgM;
	Wed, 24 Apr 2024 18:17:50 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzhBi-00000005Iwm-2mEH;
	Wed, 24 Apr 2024 18:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713982666; x=1745518666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7xkLBBaXS/ts3U0e/eGzzgm9XxfKNOK2obmaTlvSKJQ=;
  b=hi2MCSCDkGYe+SpL5wg8rG7pTlzKxOh/tgrQpjuo3wZONNzkMj/tAncZ
   zqyNXkUIjntHTTnhT7DNEcug0sjUlY2vgkO/JhzGKMusblBUQb3jktyOZ
   m7ubq7BuHNq3uRkBAM/x/I+V29+4oZaEm86qbQnoh0UUZ34lb/duEP147
   CRumgwgo0WOcpz9AGorhXxGhkPJvXWX2NLD/DSIpyd4+4i3yZGaxiOw/l
   N70pjQWcEoC9wShUmfJP3DE08v/bdJD95ezysAi5lHDlfGcT9hqcHuaBf
   yXwGegsjHzTQ2w1qtxzPxyCf/i/sZpFixV0026WqOZMbQJMXmSuAHRPTQ
   Q==;
X-CSE-ConnectionGUID: gfJyNkJJQGCxBt9zaRBqsA==
X-CSE-MsgGUID: 0TgrJmwJTUCfV689zpfXBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="10169233"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="10169233"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 11:17:41 -0700
X-CSE-ConnectionGUID: kTFwy/phR+KWMlgyOhnMww==
X-CSE-MsgGUID: 8tONyMQGRoWni1myd2XIFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="24864024"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 11:17:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7403011F855;
	Wed, 24 Apr 2024 21:17:31 +0300 (EEST)
Date: Wed, 24 Apr 2024 18:17:31 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <ZilMu614pUAzEGTa@kekkonen.localdomain>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
 <40b9c015-8ccf-4313-800a-ecae9aa8cc27@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40b9c015-8ccf-4313-800a-ecae9aa8cc27@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_111746_741649_CC8BF2E2 
X-CRM114-Status: GOOD (  20.96  )
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

Hi Hans,

On Wed, Apr 24, 2024 at 12:55:20PM +0200, Hans Verkuil wrote:
> On 19/04/2024 11:47, Ricardo Ribalda wrote:
> > Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> > is not enabled.
> > 
> > This makes cocci happier:
> > 
> > drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> > 
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 4bb073587817..915a9f3ea93c 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
> >  static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> >  					     struct v4l2_subdev *sd)
> >  {
> > -	struct media_link *link = NULL;
> > +	struct media_link *link;
> >  
> > -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > +	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> > +		return 0;
> >  
> >  	if (sd->entity.function != MEDIA_ENT_F_LENS &&
> >  	    sd->entity.function != MEDIA_ENT_F_FLASH)
> > @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> >  
> >  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> >  
> > -#endif
> > -
> >  	return IS_ERR(link) ? PTR_ERR(link) : 0;
> >  }
> 
> I think I would prefer:
> 
> static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> 					     struct v4l2_subdev *sd)
> {
> #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> 	struct media_link *link;
> 
> 	...
> 
> 	return IS_ERR(link) ? PTR_ERR(link) : 0;
> #else
> 	return 0;
> #endif
> }
> 

Me, too.

-- 
Regards,

Sakari Ailus

