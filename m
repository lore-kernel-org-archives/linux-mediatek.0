Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68E2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 15:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvYCK14v4nzT82jZLXCKDFzrpoTdng10OGuQsn49Asc=; b=BDz0rMJovd3tyw
	5DNCJjPTbbJO4yBmxB5/jTHPwEKhANnra9DvjzQB6Ih48aneUOgnynq4WTod99nvAsE94NqgBLdzk
	maVmxBIu0AOcGwY7ZWbVvt50HidhX6cpSmrmp6ScK0RYVPT3Cf3Cmy3czEe0GwtYTg4dEuVHI3wtY
	U04kO+mmBGvmKfJokG+Hh4BsZ6J9bY8YUGPBxrQ+tg8N0aVP/Vp+75tFh9SvjwCXrL5idiUYGFVa0
	yS1DTnL4GtMcOc4EhSzuvN5RcephfLWXd8cx4GjXthxwrjCgFQZk1kujBMZRCEkMLanLv7MyS/kKw
	KDxcdbx35LH0HyzhbDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFHzM-00G6GY-P0; Wed, 02 Feb 2022 15:56:08 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFHsz-00G4RH-MG
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 15:49:36 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id j2so53768ybu.0
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 07:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/siAlN12aLkICP6/rrLm39IlMfBgQE7j1j4GTBXCe9o=;
 b=gWjNQ8FVYVcHiCwRtEAS7NrkTAvIjJU/VrqAnes2yv01NsrE4rU3dpRu7fG4gVfjgU
 /ldWfg/vwbb75BTcEVAcLJVjaZfofykrHQyaul9ew9uYl1kou+/3sWInfm6OO633wvB3
 FeIGnPC/6msmeS/tBY0ftUubEMYtZfRzK1E1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/siAlN12aLkICP6/rrLm39IlMfBgQE7j1j4GTBXCe9o=;
 b=KUgc0UNSaL7uaJRAg5Q17dLGi6E94mWE6nmTFAAtAb/pctPgF+lbPPEjC0uR2d0sG2
 6HtJwhhWua7BsWPb+waApSFj1jL0jCEArtDgLI/k14CSXuFSCTVFH0/OLhQcelqFHlX/
 G9kesL9W1Fo0Gf6O7om20rtktZuuNBOoN0bQl7v4mBh+TOt1Qg5Ov/hoYIDeklZSreM+
 egWIphjWgfuQBcI5aD+fG2F/rPi5f89WrI/KJoOURy4BfwPe14nzn44JrkDMFjXf+LUq
 g5HaPuRxm1bjg3fgKbIMu1AE/UZl6/HJkotswr/T5x59tRELOX9d+IV4muyq6fxQAfur
 mSNg==
X-Gm-Message-State: AOAM532MoQNCMsGnUPhar86CVTY7lFr8ssM8f2cO5U9DfbdLUOhl/LCK
 j+hLK/6iXIeQ4e5XP7mJ4mnObOc8Jy9irtqeEwtyEA==
X-Google-Smtp-Source: ABdhPJzOI+CAspMP7aHP0upHc/wxFpkGCHDf+XfXkFWd8wWK8Qi+Y/Kt+hJfo9SkDJmj5/uVRZvSOUFn0/NVB3IqdOw=
X-Received: by 2002:a25:c709:: with SMTP id w9mr42995658ybe.296.1643816972414; 
 Wed, 02 Feb 2022 07:49:32 -0800 (PST)
MIME-Version: 1.0
References: <20220121060120.10683-1-guodong.liu@mediatek.com>
 <CACRpkdaL_cUj2rbQUSzVj+ViEuNWiQbsakChNkaj6FK+fE76FA@mail.gmail.com>
In-Reply-To: <CACRpkdaL_cUj2rbQUSzVj+ViEuNWiQbsakChNkaj6FK+fE76FA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Feb 2022 23:49:21 +0800
Message-ID: <CAGXv+5E6bq-veUQ6bEPgKwUULpWvZPu9GZ9cGkDS3OKD5Z8KFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: mediatek: Support pinctrl driver on mt8186
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Guodong Liu <guodong.liu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_074933_784654_1F8BEE63 
X-CRM114-Status: GOOD (  13.63  )
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

On Sun, Jan 30, 2022 at 9:43 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jan 21, 2022 at 7:01 AM Guodong Liu <guodong.liu@mediatek.com> wrote:
>
> > changes since v1:
> > - add default pinctrl config to consistent with other MTK pinctrl drivers
> >
> > Patch 1 add pinctrl file and binding document.
> >
> > Patch 2 add pinctrl chip driver on mt8186.
> >
> > Guodong Liu (2):
> >   dt-bindings: pinctrl: mt8186: add pinctrl file and binding document
> >   pinctrl: add pinctrl driver on mt8186
>
> Looks good to me, just wanna loop this by Chen-Yu Tsai for a check that
> it looks good to him too.

I'm still on vacation, and even after that, I might not have the cycles to
do an in depth review of the hardware bits this month.

Since Angelo already gave an ack (which somehow was not added in v2), and
AFAIK the driver does work downstream in ChromeOS, I wouldn't block it.

However, there's an error in the DT binding that should be fixed sooner
than later.


Thanks
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
