Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96266C54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1YjIjeqOSOzfGq2xXT4IYkQmnAHVepprgGXQRagfTY=; b=d4cEo/d6K1Svtd5jhaezxikDVR
	GZM1IAm+m3SEqZnV1w1r3zo4SRLwCgNxTkWjDIvTEJdQ3g8TWCBCpuQs3Ttt9VLhbfKxJJ9WtP2Q2
	Nkw8rN9ROV1RAkx0i3HE6Ube/flpu0kdOd8i/O6kyNtEL2VxYWNTPNmWodtFbwG8krjUWBnb+M5gR
	e9ZRXTvnZBwm/4gqV2eughthZCW0RxAOJH/vBHagVOe0h52ToTz/VYbf733mODhpJRkpK17mpO0hf
	+ZuVWWH5m1rqE91oictKzqLAb0L49EJmMku5da7V4B+vbmor/asaqFkZ7Z40NjvMMlQtNBw02guq5
	AVEsPOjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5se-0000000035s-2sEe;
	Fri, 15 Mar 2024 11:37:44 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5sb-00000000344-20LT
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 11:37:43 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso1809957276.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Mar 2024 04:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710502656; x=1711107456; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W1YjIjeqOSOzfGq2xXT4IYkQmnAHVepprgGXQRagfTY=;
        b=PylynIzpUuMbvUvr6vIrP9+33rYEqLBTqlDM9adiLhAvjiwJvacb0TvM48SCuZv2Hh
         xLNXIrG1T0YtEiTPSpyCOtwVjyktQ+PmmRMIjk5/6mGjJBlz4Lsvh1xWRsjgkNIkNwvy
         /LqtDnQHbMUNny1tfmePF1eqKjIekkV9sBfVf6BHLFAv6T6WCryRPMCyPh+1Pzhe6v+v
         r24ciHn3QqISDeeGJors3mQWyQspCTMEhaWyEfn6Uxw0Q+7AU+7nnd2SvwlyjfvrnRAp
         pBVk9ZBsYcSyK2UKMCKLrbc/tzi/WNnO/T9Tw72oPqYawE5B7ofR28DXxPXVtekwISq8
         clCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710502656; x=1711107456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1YjIjeqOSOzfGq2xXT4IYkQmnAHVepprgGXQRagfTY=;
        b=fSmA8hQqY7+0u0gMWwL0yp2I+lM0UkjekKdXA0hLkOKYmyjaNZi+Oj3wl045hoEW3m
         4j6nxF1qgdlj3TUPcBo8ZSof76HYRyhGwJKvK1vXrbVsVweWOepWxwu+5cGgTG7CF/pL
         rMAUfS9HRVYA9fgldKWVQeli9E/XKd/tVvKSrorgyB4AG1Ekx9kZpOSR8RPBpdAZBiOd
         0ZsHKg6O2b0gjazsJId192D2R2hP5tShYx6XX1Oj3Cs3+/YG6nRfr4LN3Mm6ZxqCR1sq
         gp8XrkFFM+gWhoDD2GSJV3t+GlHCv0yuMv5mAcL/m1Xbqn7U0LqeUg29YuZygpol64fp
         AgIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVNJ+wJN1A+H8qc7AlbR411Q+tABD8JzeuaSDitNAzj9ETH6IdG0HX1PvFrfpIkVsxPZ95b2Dv4dbPs5DlgCkl9U8XfwE7x7+/8DfIVfEu4G0e
X-Gm-Message-State: AOJu0Ywgs7u33opLhFDn2c30CDgNgdO/AqkitZKMyZTObAxQZ1oq5PJS
	gAtEvE7vu+JvbpKZ9ZCdVRc95dqlHQCEmRWEtcA2UQHhTKsa/xZcM+26p/P2LXXFdTzZNUvOQql
	qvqxw5xr2p5Sxs7aCA3Kz8QIM/xBd/Him9fJcTA==
X-Google-Smtp-Source: AGHT+IGNjJToPdVH5hgnrzbo2/Y+N7SoBZsHPueEWHCi3sAAnAaUw/tww8bYLv5uKat8ny98eFlvnQEHDXDY2PazX2c=
X-Received: by 2002:a25:c5cb:0:b0:dc6:c2b2:c039 with SMTP id
 v194-20020a25c5cb000000b00dc6c2b2c039mr4303557ybe.41.1710502656113; Fri, 15
 Mar 2024 04:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240306030649.60269-1-vignesh.raman@collabora.com> <20240306030649.60269-4-vignesh.raman@collabora.com>
In-Reply-To: <20240306030649.60269-4-vignesh.raman@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 13:37:25 +0200
Message-ID: <CAA8EJpo=OXUitC+NPjZd5Kpq9dF04BSffvgsMYnn7LmmEoh09A@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] drm/ci: uprev IGT and update testlist
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, 
	mairacanal@riseup.net, mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_043741_579359_05285001 
X-CRM114-Status: GOOD (  10.21  )
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

On Wed, 6 Mar 2024 at 05:08, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>
> Uprev IGT and add amd, v3d, vc4 and vgem specific
> tests to testlist. Have testlist.txt per driver
> and include a base testlist so that the driver
> specific tests will run only on those hardware.
> Also add testlists to the MAINTAINERS file.

I think we should move away from specifying tests explicitly. They can
easily get out of sync. A month ago I had to manually go through the
list of the tests and update it to follow changes in the IGT.

I think we should directly use testlist.txt from IGT and then filter
it out using skips.

-- 
With best wishes
Dmitry

