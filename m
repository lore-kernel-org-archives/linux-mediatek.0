Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C1FCA0EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 06:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzZ0g5ZlS6sJREICVBNJdNjzNdZ31/yPMuU7RoyizV0=; b=RmAyPrhEozl+Rnfktzr6X2s2cO
	T256G9swN+vv2gf+C76gsUhIj/I6zJaNO6KvhR/bO5KdiatAGq7NIH9MIPS6h/DpdZJYPpr27bTWl
	E2tiaOgfstSVMU9rf7ZyWMeGUEdXq4C04JqTDQigkMwh4QIZPolC6QQadzLsQxlR9mQhmm1AHKZq7
	5LIviv+NHbLBsfj3eiVBPcA25zMjou3WW+IpKpm/4l8fUR8sRJM/Qpnb51wwUbH08SwkzT4CP9msK
	s/rMEVMrfybh2ZdIXvStJd8XDZPujhjN+bf9F1znL6umdCsU3WH7POp8alJlPurknM7z6iLTO3gnu
	ex+MbtgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfwtl-002HRl-2P;
	Tue, 12 Sep 2023 06:29:21 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfwti-002HPy-36
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 06:29:20 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-79277cfc73bso165142739f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694500151; x=1695104951; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzZ0g5ZlS6sJREICVBNJdNjzNdZ31/yPMuU7RoyizV0=;
        b=hfl7jQD7CRgyPhSPIBDx2xnBGeZISqQWf+/ULRj2f9ed5bkiLvP1hxxv7GupF0+U8p
         DuLJKJwE2wENl2zaiOLM9N7y5UZGHtjyKaP5XoBlfl4K9einm+bdpmgKzI+uH2OE4HlN
         QTu2IZ2yKPmu+qeuZ0buiQHzbVK7OnfpCzwwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694500151; x=1695104951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzZ0g5ZlS6sJREICVBNJdNjzNdZ31/yPMuU7RoyizV0=;
        b=N5xDNz6Jnt1vMM5t1GO+d0VCuLBRG3P/s/UgRmJZpjAZXNtLLr1uCyl1HbGtZznrMV
         3n8ePouSmg1Cub0FJn2Tct9AQbNnkzkIIhTCkJrHX5mnSAIM4jrE29+rPoV3pWYo9iZ4
         YbOU7YT4fIZHsVvr6Q56zOj5cG+TSaP2OVFH9plBXQGn1kIvDRuEcresnrA32WbRsPm9
         4LR/GneZDhNggZ7zYiuMY3klzXPfti9z5x5wTdeQvSRcemj05Y3HsRVdF1k6oGsVZroO
         LlZJgVTfCGGitQR0MMV/m0M3NErItjlKsBLnwKHRSZdANY6YXiB69gjhNvg9Gdnoj+nm
         JK1Q==
X-Gm-Message-State: AOJu0Yx4YQMpbAtSIHYvLX98lI+QYBgL2x61GgR4sC0f6Le0F0hvDoef
	iP84exsa4d1Spq8iZLVJKc9VcDNoSjctCgrQB8c=
X-Google-Smtp-Source: AGHT+IGTR6CK5w2cdB0PHQgzaLK7XmCILo/j8fhSzd66M7B8j7UXmPTKyFQ1JsRLc/BALiwwfLQTVg==
X-Received: by 2002:a5e:840a:0:b0:790:b033:6ffc with SMTP id h10-20020a5e840a000000b00790b0336ffcmr13009474ioj.20.1694500151266;
        Mon, 11 Sep 2023 23:29:11 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id c4-20020a5ea904000000b00760e7a343c1sm2613259iod.30.2023.09.11.23.29.10
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 23:29:10 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-79565370a93so164782739f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 23:29:10 -0700 (PDT)
X-Received: by 2002:a6b:610a:0:b0:786:25a3:ef30 with SMTP id
 v10-20020a6b610a000000b0078625a3ef30mr13376283iob.7.1694500149823; Mon, 11
 Sep 2023 23:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
 <CAC=S1niYAC3PFQoAmwVc=1FcK29uu5sC9c1pGo-mku__y7eHcA@mail.gmail.com> <CAD=FV=VT8ZQkcLn4nsxCygC5SG16qYW5igFfwM762jEK42p12g@mail.gmail.com>
In-Reply-To: <CAD=FV=VT8ZQkcLn4nsxCygC5SG16qYW5igFfwM762jEK42p12g@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 12 Sep 2023 14:28:32 +0800
X-Gmail-Original-Message-ID: <CAC=S1njNfjOaSidUHSGPKC+-625Ysx66wx9Sk02ZXGvpUKYBbA@mail.gmail.com>
Message-ID: <CAC=S1njNfjOaSidUHSGPKC+-625Ysx66wx9Sk02ZXGvpUKYBbA@mail.gmail.com>
Subject: Re: [RFT PATCH 05/15] drm/mediatek: Call drm_atomic_helper_shutdown()
 at shutdown time
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, airlied@gmail.com, 
	angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org, 
	daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_232918_999434_FF927487 
X-CRM114-Status: GOOD (  14.13  )
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

On Tue, Sep 12, 2023 at 12:11=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
[...]
>
> That makes sense. I had based this series on drm-misc-next which
> didn't have those, but now that a new -rc1 is out it then
> drm-misc-next should rebase shortly. I'll make sure that the next
> version includes Uwe's changes as much as possible.
>
> That being said, I also wouldn't object if the maintainer of this DRM
> driver wanted to resolve conflicts themselves and land the patch
> without me needing to resend. The conflict is trivial, there are no
> dependencies and no reason to land the series all at once, so landing
> this patch early would mean less spam for the maintainer since they
> would no longer get CCed on future versions. :-P Just sayin...

Oh then feel free to ignore that if the changes weren't in the tree at
that time... It was just a gentle reminder. Thanks for clarifying.  :)

Regards,
Fei

>
> -Doug

