Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE56C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 10:30:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CE056187C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 10:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CE056187C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsATaCcefyp3Lg7Kg6Q7m3WmTIIGb3ZnPHfyxY9Ui3k=; b=qqsglyJcLhykc7
	Y7ixGDgUT+GrkSo2v8rGCAUQ4vnULbTMNlETGLdknxNgrXxpuD31ynQoe4QLlBr1QgxETsqEHqTx4
	qnZ22ph17+mhIErUx8v/HjibOIshME2XDEXHcd/H1ztm9vo1+UKPKBY2xhCMpxXrX0B3rhflhb48u
	L9IwDI99xZ19NV4K5Un1seSaAxnrZCB7C10o6v1OAdiCL0BjC9HZiT2xdB7oZenPWirfZHcJThZ3d
	CqAXfn+RqE4zLTjlIZl+WjqSxiMV+kom42jooyOYy9bxnMzTqOwqHq6rXUpCmzL9Ndj6Srd2BXdQ2
	OmpRHCVLeenPTiqc1asg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8KLJ-00ERBb-3P; Tue, 27 Jul 2021 10:29:45 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8KKu-00ER2s-Qb
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 10:29:23 +0000
Received: by mail-ua1-x934.google.com with SMTP id 79so4708547uau.9
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BNXOQOHHvkyOlpYQvBOMgkkH26gWwGd0okW8oi8QdqI=;
 b=VA9XBSq4CQhlCAZrPbTm3nskntRBag7xfqyt0l5ZRi4tj4r7Nwmj7cH8Q//ULvZ68Y
 5rx6ds4fUh1cKyKjtK9DlDLoCmoMTBGuBTVGak7TJbutzKps51Gx+PW0a4zDeLzgCVRA
 7v+taAWoRMIo4GLW7W31F6kuP0wNC9VL3N8Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNXOQOHHvkyOlpYQvBOMgkkH26gWwGd0okW8oi8QdqI=;
 b=qJQB2mVG/VUSbd4OOrEPvmyzruMJPvRaCuhh7CfB3CVFRji7XkmCVhgoZh0LZvMLTE
 jSTxQRzPFUcMMCq26NnyXz7ObxPt8On8AT0w1oFRJPISHuKZeoJQnxGOrols7vQ7qm3Y
 rdq4XWKNj6b69Fb0XqKjh+rUGvGflYCYtKcQSYhPsRxkCqt9ivPvL6CzEiXhV29GH6JL
 BU6hoPZmGsdbbqiRN8lVIDo9I+Qleqt0MNztwn2S8ZaiGE55fDvMpdwNcKbUiLfyTbEs
 0diPoZSFS/ZiMEJI+N3v+JV2rkmXDlcZnFDjChxxWwp/rI0J0u1QtuFmKcW9GPsCWQfJ
 NBaw==
X-Gm-Message-State: AOAM532ZSdhycKGEaii7CaQSjYW/XErbxmHJxQ98IMwICB4RhFoP7ymR
 i8QWzwLvUIIU2LzSeD2J6RrmH4dDxbHIprwSlD6cGQ==
X-Google-Smtp-Source: ABdhPJyx7sQwhJ8UE8NDg2Kx4YHR88sGvEf5AH10FBKUxfscAE8LJuhcwnvw8wjRTLPiqyBoy6zqtE4uvHrV7c6EPNE=
X-Received: by 2002:ab0:2641:: with SMTP id q1mr16151134uao.82.1627381759398; 
 Tue, 27 Jul 2021 03:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210727094435.v3.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <YP/FMblLCPpR7Tgf@ravnborg.org>
In-Reply-To: <YP/FMblLCPpR7Tgf@ravnborg.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 27 Jul 2021 18:29:08 +0800
Message-ID: <CANMq1KAVA3LRXzcKrVoj30KtvwuA0hQ12JdMLu32-RD8h=UjFw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
 features
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Andrzej Hajda <a.hajda@samsung.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, 
 Jonathan Marek <jonathan@marek.ca>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, MSM <linux-arm-msm@vger.kernel.org>, 
 Yangtao Li <tiny.windzz@gmail.com>, Abhinav Kumar <abhinavk@codeaurora.org>, 
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Paul <sean@poorly.run>, Xin Ji <xji@analogixsemi.com>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 Rajendra Nayak <rnayak@codeaurora.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, lkml <linux-kernel@vger.kernel.org>, 
 Robert Foss <robert.foss@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Yu Jiahua <yujiahua1@huawei.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 freedreno <freedreno@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_032920_894272_04CD8D4A 
X-CRM114-Status: GOOD (  15.84  )
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

On Tue, Jul 27, 2021 at 4:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Nicolas,
> On Tue, Jul 27, 2021 at 09:45:21AM +0800, Nicolas Boichat wrote:
> > Many of the DSI flags have names opposite to their actual effects,
> > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > MIPI_DSI_MODE_NO_EOT_PACKET.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@samsung.com>
> > Reviewed-by: Xin Ji <xji@analogixsemi.com> # anx7625.c
> > Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org> # msm/dsi
> > ---
> > I considered adding _DISABLE_ instead, but that'd make the
> > flag names a big too long.
> >
> > Generated with:
> > flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
> > flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
> > (then minor format changes)
> >
> > Changes in v3:
> >  - Added all R-b tags from v1 and v2 (hopefully didn't miss any).
> >
> > Changes in v2:
> >  - Rebased on latest linux-next, after some of the flags got fixed
> >    (Linus Walleij).
>
> Thanks for the update, applied to drm-misc-next.

Thanks Sam!

>
>         Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
