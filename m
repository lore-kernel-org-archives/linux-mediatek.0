Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDC5C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:44:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78EB4610FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78EB4610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WZT8cI7v04OCrB6p7Wp1XRIkfc+DbtUVskAU5tjVso4=; b=WEyyqwGBnM0tMtjYhNC7O9Srl
	o0vv5MEAftGzh9PD5Mbk4UFueK96cpcsd0VZN2+txu7rJ42KrsPWW3NbGIe0oEsQoaAINlmvOX+R/
	y5O+ITCp857g53cFD24yhWrhBw1OlA7g+kQrzxm1ztEUbOn1hn0MeK0WIeRKUwxjV91Rs8kd4FTr4
	2iHkQcEjG0s009NnNS1EuoJMll4w0KxKVaZmWts9F1Wq86SZ/fN5ySgxu6j1mqCL64rneNaCj2NBg
	RT3taLlL3FRLlTiY5Z7iU6LAD4xtwVY+Oso3egrBdd57Xu7pW+RJRiy5Eh3yXiV3MP7K/wPzQy0AA
	nowectEuA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXPhE-002Sog-2k; Fri, 16 Apr 2021 14:43:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPgj-002Sbu-Ck
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 14:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Lp6KUcpzifC+AOvSZvapIoyzvGHXfJkgx9ufls5cSDs=; b=CLW+dNrPelj0Zg+ieRKz09Xg1F
 0PaR/knbQVxVOwg65TZRiN0jNK5P4mJF8gdECLL/ZIl+7IcrYbD/ZsUkICtKgsQyR7AMtKD6Oe519
 H5P5vvp7BATw/HqsizHXZE/3tp06meIFEPRpaqwLZm/47vGapQLHYzKpjqBmRP8M6Hgr5Jze4hRuj
 xLNdJNRA88Ej5bq+AKgF3HMagsw4Yxf7Svz1X3ljNAjOd9xRrC/eJ+fjpVST2usOsjWAurWEGagwx
 QQkzfBPZxsTIed+FFt4rcXCjl/tIC0dg7VUaW29kOD0BkpQ7MsDOtxdnhZch6d3OlGfIri2Id55MZ
 7M8Ylv9g==;
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPge-009SvJ-7g
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 14:43:16 +0000
Received: by mail-io1-xd2e.google.com with SMTP id s16so22647077iog.9
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Apr 2021 07:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lp6KUcpzifC+AOvSZvapIoyzvGHXfJkgx9ufls5cSDs=;
 b=euQfq2wFnH47LbM4abT1kLxvYkf6Sm9dtzlvDEkHRLT16XPhriYBl4jchj3CNIj5Cb
 78dEEh4TPIwY63jFSpB3a/4Hw6jbLBUaSghrWwAniyOnmsLBpSGqHaFBCqMY0IIv7hvo
 XREmLq4799LTQ+vzSqvxuvuQjrowfvajPCs7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lp6KUcpzifC+AOvSZvapIoyzvGHXfJkgx9ufls5cSDs=;
 b=HPu3RXIbTeatXecwJP3qjoe3G7Tig929j45lnOV4YAoHedTjyj4S6mNz3mnlro4cKR
 w5DOXi7hHQgjsDVQCJZn8Oe8tFpCAm6JExZ41Aka3naSE9yiidlOOj8dYQnr1L5r8Mzq
 XXOe82pWxR92qx/XWUB9fe9MMt2MSLJCiLDKoBCHXPsfalonXit0Nu8YT9UJxy8j3Spc
 0zEdqBo5my2m7aey4zsWICZMfLhu9ZWUEhAtwE/NhS/XEvarw2ttNh4BGeqWmtYdCPws
 yqw0qgw7yTqmJlOlp5YHDPznpiDDprKQD/MMc/cWhJBGi9TnXAjHf/rMtWSJC5cPYcK/
 yKcQ==
X-Gm-Message-State: AOAM531Rvyl9Yd5lhVyr+kBrIZFPva/krjTdysoed43jPlT10wbs1YgK
 w4NL0p5DJnpbx5w10KYouSFb793PEeOAfuDAZuxl9w==
X-Google-Smtp-Source: ABdhPJzZne3Oah6jq0y3MQ7cXog0eHGiB4uUC0V04tFOpjqhXtg1Qck21Dtp3ESr9EjxkzptDtOP0iJHWG1Ya4WW0SQ=
X-Received: by 2002:a05:6638:38a4:: with SMTP id
 b36mr4265974jav.102.1618584190633; 
 Fri, 16 Apr 2021 07:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210414172916.2689361-1-hsinyi@chromium.org>
 <20210414172916.2689361-7-hsinyi@chromium.org>
 <87y2dicnpy.fsf@intel.com>
In-Reply-To: <87y2dicnpy.fsf@intel.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 16 Apr 2021 22:42:44 +0800
Message-ID: <CAJMQK-iUgQBH8uW07fpbptE33D5NsVwmZXngcZknPw93apRK0A@mail.gmail.com>
Subject: Re: [PATCH v19 6/6] drm/i915/selftests: Rename functions names
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
 linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_074312_313813_29B0F201 
X-CRM114-Status: GOOD (  25.38  )
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

On Fri, Apr 16, 2021 at 10:23 PM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> On Thu, 15 Apr 2021, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > pm_resume and pm_suspend might be conflict with the ones defined in
> > include/linux/suspend.h. Rename pm_resume{suspend} to
> > i915_pm_resume{suspend} since they are only used here.
>
> I agree with the rationale here.
>
> Do you need this to be part of your series, or shall we just pick this
> up for i915? (We might consider renaming to something else or prefix the
> functions with _ though, as we also have existing i915_pm_suspend and
> i915_pm_resume elsewhere.)
>

This patch can be separated from the series, thanks.


> BR,
> Jani.
>
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> >  drivers/gpu/drm/i915/selftests/i915_gem.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> > index dc394fb7ccfa..525afda9d31f 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> > @@ -94,7 +94,7 @@ static int pm_prepare(struct drm_i915_private *i915)
> >       return 0;
> >  }
> >
> > -static void pm_suspend(struct drm_i915_private *i915)
> > +static void i915_pm_suspend(struct drm_i915_private *i915)
> >  {
> >       intel_wakeref_t wakeref;
> >
> > @@ -116,7 +116,7 @@ static void pm_hibernate(struct drm_i915_private *i915)
> >       }
> >  }
> >
> > -static void pm_resume(struct drm_i915_private *i915)
> > +static void i915_pm_resume(struct drm_i915_private *i915)
> >  {
> >       intel_wakeref_t wakeref;
> >
> > @@ -152,12 +152,12 @@ static int igt_gem_suspend(void *arg)
> >       if (err)
> >               goto out;
> >
> > -     pm_suspend(i915);
> > +     i915_pm_suspend(i915);
> >
> >       /* Here be dragons! Note that with S3RST any S3 may become S4! */
> >       simulate_hibernate(i915);
> >
> > -     pm_resume(i915);
> > +     i915_pm_resume(i915);
> >
> >       err = switch_to_context(ctx);
> >  out:
> > @@ -192,7 +192,7 @@ static int igt_gem_hibernate(void *arg)
> >       /* Here be dragons! */
> >       simulate_hibernate(i915);
> >
> > -     pm_resume(i915);
> > +     i915_pm_resume(i915);
> >
> >       err = switch_to_context(ctx);
> >  out:
>
> --
> Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
