Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206D1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAJckkD4UuuHl70O8qDgCKBp28ZgCMKEQEQG2B3UfE0=; b=sHe9eBmpl8EOXmqtHvIi832Feq
	srBe/QlGDm3dd23/yPKHVTQjbAj7yLu5g/Spyv+ANlX247Dh0RI38E3bMe9K2L29yEE3xGldlBhdD
	4Vzpcjjr4HS6kJCUQCV+KMlRhicdaoMzyN343Wk8QiT49tx8jVFppwSN+9ehTzBhB2pFPCNt1nJ7K
	SZwCLcc1tHpEHy/GDDN5dzqb89jjntlIy3cMa2kkR/1pfI3q3NKo4OR5JGluzRzJiDsM5VlFbHwon
	gisJlo9aTQFrPig6sg5gYBBV3yS8hSBnInA+MKzxzis0Z2/ZfbagJCE6qjj0yQ/yG0gO1VeXfYPVd
	Jd8a+jTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkm6-0085Bb-MN; Tue, 19 Jul 2022 10:48:22 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkm3-0085AL-Gh
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 10:48:21 +0000
Received: by mail-ed1-x52f.google.com with SMTP id m16so18993762edb.11
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 03:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jAJckkD4UuuHl70O8qDgCKBp28ZgCMKEQEQG2B3UfE0=;
        b=Q/Szb78YeaaPFs6XH9/IQHBVYt7poFICWO1a+McjynpiY6pG9I1QRhvcjCyZW6vxnT
         PxrDVy8fqimCTQDCY5vw60fGcwvARB/d+GrfnEURIYrjlYUAu+g4KEelBSEVAkLTon1i
         BraWKs6Eih7MiBHZXskxv4ylpEKf9Zme+IDLlu/1kv4oyrljN1MqwRfNIWViVXUNrct2
         u7AiHcXjfoR3SpMsm7PwS6mcOZXhMToPiIVophvCrx4VBf1kYpn4hXZYAEWApydD4tre
         eQIVXISQIy7ixmTDgFI3pw5O25NGhwF2bp3seoOr71PWiE9pToJ9D/iKflX4V3b20TqG
         hV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jAJckkD4UuuHl70O8qDgCKBp28ZgCMKEQEQG2B3UfE0=;
        b=1nIzU6lW3MXwt2A90xiqyc4ogcbq4iOqjCqaMZa60sfNtgJui/Giwl6PajG/xob22s
         13j1lxi9E8cYmvBBNYYZUu6A19z+AWuElNMzLcYC7VFc+cdxH9c5HYNQ6Jm3xtbKLNO1
         qm/CoXaCc54OS6AON3YqZk+MN2q86D/oGFzh9PINMincecolP6iR9FKQOew6NY7xohjl
         jWvHHCR+7wgLCrj++L9znQqScmkjp4JtrMcwQvEpPX5+w1i2A3YIMXord5wpXkdjOquM
         vB4FHSNNIHfUZmGWRVFdE8rbtqrhjKKrN8+J0RR2WUlrhc3UTMAIz6GLXub0dW530rlY
         YzdQ==
X-Gm-Message-State: AJIora+CHKyefBVdVTyeLhn2BJDMzL7/UGftC7YrFkTup0M4BpCqge14
	q4llO1CIzvGuISyRefpldQPJCyX4HiPZQEhi5XbYTg==
X-Google-Smtp-Source: AGRyM1ua9YfZzMzY+4okMS9alFUwqOoJ7z9AWWeCobrYmvatBAnyqrolqInpc2mJusYtBC/LbNwM0xE6plFTLrpI0iA=
X-Received: by 2002:a05:6402:4490:b0:43a:8f5a:d273 with SMTP id
 er16-20020a056402449000b0043a8f5ad273mr42301746edb.6.1658227695061; Tue, 19
 Jul 2022 03:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-5-sam@ravnborg.org> <CAPY8ntB2gXoUbUJhDLWVX3szaEKKKhnOO-qsKRZkMp1jDOt0Qg@mail.gmail.com>
 <YtWftDRPYcP5p+i1@ravnborg.org>
In-Reply-To: <YtWftDRPYcP5p+i1@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 11:47:58 +0100
Message-ID: <CAPY8ntCGVoNt9AsWb=3ou6x3XUDQ=S-=5-Yrd4HzAOLc+2XvKw@mail.gmail.com>
Subject: Re: [PATCH v1 12/12] drm/todo: Add bridge related todo items
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	DRI Development <dri-devel@lists.freedesktop.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Jitao Shi <jitao.shi@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>, 
	linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Philip Chen <philipchen@chromium.org>, Robert Foss <robert.foss@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_034819_760945_8F8F4A8E 
X-CRM114-Status: GOOD (  34.23  )
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

Hi Sam

On Mon, 18 Jul 2022 at 19:00, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dave,
>
> On Mon, Jul 18, 2022 at 11:27:37AM +0100, Dave Stevenson wrote:
> > Hi Sam
> >
> > On Sun, 17 Jul 2022 at 18:58, Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Add todo in the hope someone will help updating the bridge drivers.
> > >
> > > v2:
> > >   - Updated descriptions in todo.rst
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > ---
> > >  Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > > index 10bfb50908d1..fbcc232e0bc1 100644
> > > --- a/Documentation/gpu/todo.rst
> > > +++ b/Documentation/gpu/todo.rst
> > > @@ -480,6 +480,26 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
> > >
> > >  Level: Starter
> > >
> > > +Drop use of deprecated operations in bridge drivers
> > > +--------------------------------------------------
> > > +
> > > +&struct drm_bridge_funcs contains a number of deprecated operations
> > > +which can be replaced by the atomic variants.
> > > +
> > > +The following is more or less 1:1 replacements with the arguments
> > > +and names adjusted:
> > > +* pre_enable => atomic_pre_enable
> > > +* enable => atomic_enable
> > > +* disable => atomic_disable
> > > +* post_disable => atomic_post_disable
> > > +
> > > +* mode_set is no longer required and the implementation shall be merged
> > > +  with atomic_enable.
> >
> > The dw-mipi-dsi and msm DSI host controller bridge drivers are
> > currently relying on mode_set as a convenient hook to power up the DSI
> > host prior to pre_enable of the bridge chain. Removing it is therefore
> > going to break those.
> >
> > There is a proposed mechanism to allow for the removal of this hack
> > [1], but it's still waiting on R-B tags and/or discussion from bridge
> > maintainers (gentle nudge as you are one of those maintainers).
>
> I have over time gained some knowledge of how bridges works and have
> applied a few patches - but the maintainer role belongs to others.
> I just try to help a bit.

Apologies, I'd misread the text in this patch
+Contact: bridge maintainers, Sam Ravnborg <sam@ravnborg.org>,
+         Laurent Pinchart <laurent.pinchart@ideasonboard.com>
as being that you and Laurent were the bridge maintainers. Colon
instead of comma :-/

> I will review the referenced series - could you then in return
> review this series?

Sure, these look to be within my levels of knowledge.

> >
> > And do you mean merge with atomic_enable, or merge with
> > atomic_pre_enable? atomic_pre_enable would be more applicable for
> > almost all the bridges I'm aware of as they want to be configured
> > before video starts.
> Thanks, yes you are right. I will update the text to refer to
> pre_enable as this is often the right choice. Looking at how many
> bridges who implements mode_set, or are not yet atomic, this will
> take a while before we can drop it.

Thanks. That makes more logical sense to me for the majority of cases.
As to timescales, it always takes longer than ideal to migrate older drivers.

Thanks
  Dave

