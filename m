Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82FFC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWU7JmaZHLuJIBS19FYhFuAZtD3iPvW9neLDub/pedU=; b=X4TEZKRVfT2IXc
	ajB6CaU9f57q3Ths7phcBjD67LEa0PWByBmRNgv4ZPxy/ZEbL/UQCbfo007Plqtx2ZliFxLO8IVXf
	tQqLEHW7+r6rFgKFw3PuhYaSVGMEpbbZIvtpurbc3JdeFVf8V6i4QBNIRW5xoefvOgZdkB5pKYx5q
	y32IUe7Li9DteF1NoMEky4dgbmu+q5PdvpZEBu86ETWzOQQMKJpq3Zrk4i/N4+SmHW47Kmv6pNRAF
	Vy5g7xoTtwuCsXt8UPDrCQhEw6A8aTm2NcO2mBJvGz3nWlSXY6PFt1afetYsXa2KBg94bRehQ1Pud
	P0ZRGs04AKaT+VtZpjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDkt-001WVI-N6; Mon, 06 Jun 2022 14:30:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDkZ-001WJw-U8
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 14:30:38 +0000
Received: by mail-ed1-x531.google.com with SMTP id n28so19084719edb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yGL0Upz9tWnkdyE7J91J4gh0jAtGzDIxVVzukBDULoo=;
        b=CMRHt1AN30bDkUOr86s0m7NX4v6Nb+f9O1f35JrMFYxJW+BntmP8QkDNPVhjPtLBAY
         +XZXVhMMoo3pRxxgqF6QmA5eND0Uhc4PnRQFCZGdnwOLTPB4jgL6mvWNPsslH/pJ8IAP
         3HOTuodUa88+MXtlY2t8w6gtk1sibf3wiJKvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yGL0Upz9tWnkdyE7J91J4gh0jAtGzDIxVVzukBDULoo=;
        b=uL79TsaCw6Q8HMPGLqLE4iMf7obxtj7QVin1OG6kgldb4DF7eVf2qRNSGBqO13ztmK
         YtKcgigNyqxKB3jxz25PHWerLWbkRl23SPhm0obJu2UUw4enEiSxarTU2bPNkO+n377S
         RAHrRj1kPTwLzdHQwApI4QQYWQWJ0MhKZFMHzlOBUENugG0cALRNhKpdf0zP8Q4alw3I
         18AIvtl2XYXi5/OjIbPSkVVxFL3K89iZ8oWv0MgGv67tUFvlvvVehknBUXuwjtmdImMd
         SNjVqfdJ4znGX6vjSVpvzlDD8uqXTF6ZQq143AAI8CapI6l/RAWmaP29tPkFOa8IvoTh
         eP3g==
X-Gm-Message-State: AOAM5302eJQX2bxHlknROC8I+OsMeZXmKi3BbbAf9U1HAXH7DBXxeILr
	Y23k8XekmlCJdD5xxjuJldb6pqF09wk8UTglra4=
X-Google-Smtp-Source: ABdhPJwvXcl3ld1pX4ANPwWgwgROW9nTo5zTrQAKueG7XVEHYIQqIfr5knsX7zLQKVGhFTkoYSkuzQ==
X-Received: by 2002:a05:6402:3489:b0:431:3565:4cb0 with SMTP id v9-20020a056402348900b0043135654cb0mr12433461edc.135.1654525830594;
        Mon, 06 Jun 2022 07:30:30 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id me3-20020a170906aec300b006ff01fbb7ccsm6392134ejb.40.2022.06.06.07.30.30
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 07:30:30 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id fd25so19096739edb.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:30:30 -0700 (PDT)
X-Received: by 2002:a5d:608d:0:b0:218:3cfa:afe9 with SMTP id
 w13-20020a5d608d000000b002183cfaafe9mr5831997wrt.422.1654525373078; Mon, 06
 Jun 2022 07:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org> <20220606044720.945964-6-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-6-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:22:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WeF=fM9dVSgdNNP8_mOWZXZyoSwF-tztSXe1=dLb5KzA@mail.gmail.com>
Message-ID: <CAD=FV=WeF=fM9dVSgdNNP8_mOWZXZyoSwF-tztSXe1=dLb5KzA@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] drm/panel: panel-simple: Implement
 .get_orientation callback
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Rob Clark <robdclark@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_073036_015443_401A2307 
X-CRM114-Status: GOOD (  11.52  )
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

Hi,

On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2->v3: add comments for notice.
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
