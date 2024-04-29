Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62332C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 10:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXhEnLpZuSACRtLpCaCHyHe6X1epB7qL3alOjAjU9x8=; b=r26BuwuCZsVBOSi75oK2ku4Kjg
	qY80K34zZKG4HURelFMDvRFnYo/DOAgGHcHkH4Pi0W1eNg71Bu7kRqa3FhI5LxoNkH55FW4sU+/Hl
	evLTQvdVVLa93YFWmE7b2vlHuyFZ0veT7HTPvNb5oshBDdokwJSW5SWePOIGYKscUW4xFrzuMQKfP
	q/PK+2stQ4CHKAYAoytmxNBvLnNhqyUemSA9BSrG3/EKoyXhU3oIe/gp01hKVUX1ZC/86rFgc6Mr2
	Xx3gFX1IC/8d0N8fxq4OU77N5aImvyA4l2bCi+TwKYRyC+AMSTFRUr+N7jTnJ/wmDU3SCas2h5/Ej
	8ME/CicQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Obs-00000002MHa-2G7Q;
	Mon, 29 Apr 2024 10:51:48 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Obp-00000002MGe-49cv
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 10:51:47 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4dad4b35d08so2692000e0c.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 03:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714387903; x=1714992703; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BXhEnLpZuSACRtLpCaCHyHe6X1epB7qL3alOjAjU9x8=;
        b=DVwvibL0/qfqmi7TgqtXR1TYH6zQTd1bnTVddU29cQ9/carSw5V/d1hFd7EjyyOqQI
         Y4i1ExG2A7LmXo4KR4Lv+bT4V2M8Pt76HqQp2LUoK7Q7TW0NPr7Oi9gaVCLrnZSR8a52
         QVxByvDNU+ZIxOq8b9GAEtUSz8s4e3sMpZ/X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714387903; x=1714992703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXhEnLpZuSACRtLpCaCHyHe6X1epB7qL3alOjAjU9x8=;
        b=Qw4mR8HqsZcyzWsBC0T4Y6yvhKjUMKL/b/0Pv72fjUINmqAH0w6np5TMcqRHNpgFyA
         XE+2pqBbLlKtHxo1f1JYy7kVBaNSExpXYrK5Au/K4eabbdMPwxMatEdVwRyhhYJ06P0P
         qz3sMQ3Dyhi3zKb9XKimnuYqxBu8jqYZmw8wn31/vvHpJijUL8RN4Bm+Ncky6HSSfWuI
         qGUOns2fceVcop0QMhGkvGj5SihBus8OvVTAuS2fpzRCSVwmD+ZuoXWjL8iN16mk7eQZ
         eHIt2Kpg9G0SRAb0jk8MU8AmIvd005DaXbPpbByM0GaLL3RtOt+VcYaaf1mvLGNhS+CJ
         5CTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOJnYzCn1WaG8mRimbmlYXpBd8INrAyKzmZF4tgTZ7hOd0vCnWRceuHMfFOrXuGxfRtx17Lcs67nAqXHBIcDZU9bS9fi7WIbxCY3KmqwuLbLaq
X-Gm-Message-State: AOJu0YzJ7o7QHvywyFThvp7nJAjrdq/o3wh6+4LkInnqXABQuc3/21Yr
	tEAX2ZOVK7KqqffG0/n+RXcdTJa07EILxYyVM7mfdE/TWzjykQdQ1FVKdtisYvVoKC+DCh0yC9k
	=
X-Google-Smtp-Source: AGHT+IGtiX7WD1P/c6fXmEKq7roHDgqbyQkvcWnQTgjrLiHJnQ9KrZ4wEpLDrFfWCJ/3g42DZQtalQ==
X-Received: by 2002:a05:6122:2529:b0:4bd:54d0:e6df with SMTP id cl41-20020a056122252900b004bd54d0e6dfmr11480664vkb.1.1714387902710;
        Mon, 29 Apr 2024 03:51:42 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id g15-20020ac5c1cf000000b004d347f2551asm3612919vkk.40.2024.04.29.03.51.41
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 03:51:42 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7f02ea354e9so824969241.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 03:51:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuzHBquIZ6btn9AY7fB29GjNFgQHdbGy1fTFuzOriD8P6TSHTLuJtNHXCrX6OJUw28ZwKyKu7el9UqUJPLgYopk30vwLZYtGXbQiRTXbpW+8/f
X-Received: by 2002:a05:6214:27cd:b0:6a0:4d4f:9428 with SMTP id
 ge13-20020a05621427cd00b006a04d4f9428mr14947200qvb.32.1714387880813; Mon, 29
 Apr 2024 03:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org> <40b9c015-8ccf-4313-800a-ecae9aa8cc27@xs4all.nl>
 <ZilMu614pUAzEGTa@kekkonen.localdomain> <20240424184603.GA6282@pendragon.ideasonboard.com>
In-Reply-To: <20240424184603.GA6282@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 12:51:08 +0200
X-Gmail-Original-Message-ID: <CANiDSCucvz=dQYDguzBZ-f95ZP84zuhvoKnmEYoJqAs1YnZ3ZA@mail.gmail.com>
Message-ID: <CANiDSCucvz=dQYDguzBZ-f95ZP84zuhvoKnmEYoJqAs1YnZ3ZA@mail.gmail.com>
Subject: Re: [PATCH v2 09/26] media: v4l: async: refactor v4l2_async_create_ancillary_links
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sergey Kozlov <serjk@netup.ru>, 
	Abylay Ospan <aospan@netup.ru>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Dmitry Osipenko <digetx@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_035146_037650_A2699CAF 
X-CRM114-Status: GOOD (  23.90  )
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

Hi Hans

Your proposal is what I sent for v1:
https://lore.kernel.org/linux-media/20240415-fix-cocci-v1-9-477afb23728b@chromium.org/

I have no strong opinion for any of the two, please feel free to land
whatever version you prefer.


Regards

On Wed, 24 Apr 2024 at 20:46, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 24, 2024 at 06:17:31PM +0000, Sakari Ailus wrote:
> > On Wed, Apr 24, 2024 at 12:55:20PM +0200, Hans Verkuil wrote:
> > > On 19/04/2024 11:47, Ricardo Ribalda wrote:
> > > > Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> > > > is not enabled.
> > > >
> > > > This makes cocci happier:
> > > >
> > > > drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-async.c | 7 +++----
> > > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > index 4bb073587817..915a9f3ea93c 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
> > > >  static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > > >                                        struct v4l2_subdev *sd)
> > > >  {
> > > > - struct media_link *link = NULL;
> > > > + struct media_link *link;
> > > >
> > > > -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > > > + if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> > > > +         return 0;
> > > >
> > > >   if (sd->entity.function != MEDIA_ENT_F_LENS &&
> > > >       sd->entity.function != MEDIA_ENT_F_FLASH)
> > > > @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > > >
> > > >   link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> > > >
> > > > -#endif
> > > > -
> > > >   return IS_ERR(link) ? PTR_ERR(link) : 0;
> > > >  }
> > >
> > > I think I would prefer:
> > >
> > > static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > >                                          struct v4l2_subdev *sd)
> > > {
> > > #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > >     struct media_link *link;
> > >
> > >     ...
> > >
> > >     return IS_ERR(link) ? PTR_ERR(link) : 0;
> > > #else
> > >     return 0;
> > > #endif
> > > }
> > >
> >
> > Me, too.
>
> I actually prefer Ricardo's proposal :-)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

