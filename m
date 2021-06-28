Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D272C11F64
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 23:45:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF67661CBB
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 23:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF67661CBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAaUOasMn9orL1rCQTb0USs46iBvBX2d4YxhZzx6eV4=; b=zzGhVvFFSF7NjG
	FBaz+j5RdI3ROvI6HLIxiVSiNVmDGT4hNCVqYixJAvsaW4fS+hKfG/IYzFEBMnkC29EAqg6AJHizZ
	sjKpxv5+OmbfPXBSwPsfJeX+o54f+lf413pQNSnZxzn3utdPjBCpEeXar5HL8B2uUkavwnzSJhMGA
	5SxK5A6rA/0qihle9H4AYgHigUbl8EoogJmTQoGeV6fWq8jzch5/fOuUwku1XvI4Rw01YsFN+lI1h
	veKvAAvwA/SGJ6GzL45yqfyugAy2k4dBlqFoOwiwCVBHWd/N9fkC8gU+G6IEtrH0zhbFJcQTQysh+
	9npCNPLxCNiPQAXTdmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly0w0-009OQR-Ow; Mon, 28 Jun 2021 23:45:00 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly0vy-009OPk-Hh
 for linux-mediatek@lists.infradead.org; Mon, 28 Jun 2021 23:44:59 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id ay19so4333612vkb.9
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Jun 2021 16:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K+u9zamzkTK0tcOtoSmHBJMw1wdjgvet+oYikY+vPpw=;
 b=gHLbIqQSZA+sYnsVzhDgRcVbz0BRC2ayMuV17e7qZzEMN4HF7dGJqkddBXrMM4rghH
 GeoQQojrKE9FUO/96fJpvJ2tOoQooUQ3iwBawTeKxoxyRmQWpCw0i7GfqY+OyikgTU11
 SFjZOVK0ZexOcYN4FekunaLJlFEWU2wL6ijfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+u9zamzkTK0tcOtoSmHBJMw1wdjgvet+oYikY+vPpw=;
 b=D5dAILTttbqwVm8APvaU6443nqtPqmuC7o0v/T9NnnTvCjmncqiYO+x24jfxTl1Jil
 KCi1BJ4u1bYTblmx2CoTPAW6F3xuVRHy5pJgpP1AiajoHcPubIofwMgLpp6y8ni39h3C
 258hh+1JPEJjE1aKVPjYBPR1NVQ/CkcaQxQOhDiyzCULBNvSREvCR1xqHW4ik+LJgqvC
 I6t5J3+isd43ISftacyr3bskqFXULRVMQRsyVmEYy5gpGwVU0bSY/iGndluOquPZlKH8
 0jjYaZ2vWOPA0a2XsNNR8gHWKoxJY4JQVICkamk95G8eG2IPyVtX4o9i42chfL+ejfvb
 Ot7Q==
X-Gm-Message-State: AOAM532DL4u+tLakY2Tz5OtCTA8ZH0Oor9TQ6MKs5WrHvzwegOfd+2Vm
 CJebdRkVpEIEyclFfU3+5ofJRyPSwkFKVjHpsffl0Q==
X-Google-Smtp-Source: ABdhPJzu8m7WzPUvBstEnrLdEWviDthvRrwmL0ifVahCxK9zdAzvpMQjspmMVmZthMZJ0Wl9qUBJ9r+Xqn08qNV929U=
X-Received: by 2002:a1f:4582:: with SMTP id s124mr19508263vka.10.1624923895693; 
 Mon, 28 Jun 2021 16:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
 <CANMq1KAsvXZAjmYCMQsAUwpkzuA9-PRnNWkpsLuNbOkP6DixGA@mail.gmail.com>
 <CACRpkdYK3nw890YFNxgtrwDvxcoeNVu7MxqUw94NN_6PiYxkJQ@mail.gmail.com>
In-Reply-To: <CACRpkdYK3nw890YFNxgtrwDvxcoeNVu7MxqUw94NN_6PiYxkJQ@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 29 Jun 2021 07:44:44 +0800
Message-ID: <CANMq1KAO_4udNPsSQ+D3d=+Zhqj9KudNvTSQa5GpTXNUMPFUgA@mail.gmail.com>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.velikov@collabora.com>,
 Inki Dae <inki.dae@samsung.com>, Jernej Skrabec <jernej.skrabec@siol.net>, 
 Jonas Karlman <jonas@kwiboo.se>, Joonyoung Shim <jy0922.shim@samsung.com>, 
 Jordan Crouse <jcrouse@codeaurora.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Rajendra Nayak <rnayak@codeaurora.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 Rob Clark <robdclark@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>,
 Xin Ji <xji@analogixsemi.com>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 MSM <linux-arm-msm@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_164458_634760_DC3871EF 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 28, 2021 at 7:10 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Mar 3, 2021 at 11:31 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > On Mon, Mar 1, 2021 at 4:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > > >                 dsi->mode_flags =
> > > >                         MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > > > -                       MIPI_DSI_MODE_EOT_PACKET;
> > > > +                       MIPI_DSI_MODE_NO_EOT_PACKET;
> > >
> > > Same, just delete the flag.
> > >
> > > These are all just semantic bugs due to the ambiguity of the flags, it is
> > > possible to provide a Fixes: flag for each file using this flag the wrong way
> > > but I dunno if it's worth it.
> >
> > Wow nice catch.
> >
> > I think we should fix all of those _before_ my patch is applied, with
> > proper Fixes tags so that this can be backported to stable branches,
> > even if it's a no-op. I can look into it but that may take a bit of
> > time.
>
> This is fixed now, please will you proceed with this patch, because I
> really like it!

Thanks for the ping, that fell off my radar, v2 on its way ,-)

> Yours,
> Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
