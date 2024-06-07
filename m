Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF795C27C53
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jun 2024 11:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXrg4sVxCUukDDGsNqD6ghGWEjqWMXR9QLDCnb60Xb8=; b=FRKpArMtlUm0hCbxPQbB5DUamA
	okedrpn92w0GzdBG3t/5ZVC/XPzNutD+qtr/OIomKTs9Nrfytd8YdzltxdDwvexyrLrMChhsHVz50
	C65NgDzY43GnggOUi6f5BDJbbTWK7VtNIuPLoutVjH6YPf9iV/ArVIF+fm8fQltXx6Wxw+LwpzLz8
	AxlELxXn9z1NYbt+cHojjLw2KIM1XyP9UKGM+0qM2hLAOdk2CoQy/lQ3tXbpgFbYXbWhwuddxNGRV
	oypwU5c8cugGgzUi5Jsa7mPQPLbguTPAg/TqnkMBc5VH6eCqgw/TU6G41K94cDifavelgusquITQi
	pDlh3pLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFXeL-0000000Dh91-36kG;
	Fri, 07 Jun 2024 11:20:49 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFXeI-0000000Dh6n-2Mym
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jun 2024 11:20:47 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-80ac42098aaso545573241.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jun 2024 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717759243; x=1718364043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXrg4sVxCUukDDGsNqD6ghGWEjqWMXR9QLDCnb60Xb8=;
        b=ijum+HPkGLEVvNHjzdUhB80cYqowl5ww5NKT3ejwcKueL2Ls/hYgz9OhfmOLZucXpT
         0X+w42/KXy8ozVn6njPSd93i3GZKoIwJZNtenog4mHCgDCj5ScVaq4CAptPZMhlD5IkR
         QkJn7RcyfT7TgjnlIl5AsGKCXCo8eiAJ3pz3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717759243; x=1718364043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXrg4sVxCUukDDGsNqD6ghGWEjqWMXR9QLDCnb60Xb8=;
        b=Z98SBT+8IK5TlUv5V7F0KxwqMqMEzamHgMzldxnLnp/myEmNj0QFLnL3C0h3finscA
         3r8f3Ap56KvgR0azkvZtXhp+pWzkqMQlY7txJSsHC9HMARn3IUTQtsD6gIzY17HoF5Tw
         fqjfY90te1hnYQcp+NLeUV/2N7g1TfgHajmGQcHYJocwuIkQDRsykG65z/9FYrzhNKMp
         /ts3XHIoJR6lbSxn3pdXe16qMvfJS6JrUfEdP2qgouOjpGuuDjlaZRLLHpXFRr7dcPd+
         ZoiO82tsnUaCcdeaffpdikQT9K8gHgvoSPRBrfQmsVWdryXFpqI/ZefdUZgLK+1Sdx8k
         dcQg==
X-Forwarded-Encrypted: i=1; AJvYcCUQjFgUNcSjbJDVSJybwAx0457jSGWMnZTQUaRq58/guCImEJqY/z4XlrclpO2MPj10EdRouq1aPMh7toBjjY2L2Prc6w8X/8xCQKE9fT2d3Q2P
X-Gm-Message-State: AOJu0YwADuv6GUw7D7TYC1JSUGTS1HTwXHKewnhKV3D9gu2031EVlJbV
	21wkD6MLdk1o/z2XanCEg+gBdRbfejDvIZTa2uZ39/ykxPT8sK19SnFHKvZuwuUygJOsF4DUFhE
	=
X-Google-Smtp-Source: AGHT+IF/hQu9pPOHxj/7rhl2K46x4cZhHFhgGxe310btppgKkxqwb73H/5zWr/qf/8jKFrns+AgTcg==
X-Received: by 2002:a05:6102:3174:b0:48c:3154:e3 with SMTP id ada2fe7eead31-48c315406ccmr740360137.4.1717759242968;
        Fri, 07 Jun 2024 04:20:42 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-48c19fb982asm623429137.26.2024.06.07.04.20.42
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 04:20:42 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-48bbcaf093bso541023137.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jun 2024 04:20:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPCskojNrEc8cxnpLlZI8H+fUbh4kwf8+TVWZ63q4hXP8ECvHDCQzWhaeR+A+mCQYzIFtZLhsQxMnk4NNaBYXVoxleEcWxX7cpg5N5W4EUMmmR
X-Received: by 2002:a05:6102:34e2:b0:48c:379a:b362 with SMTP id
 ada2fe7eead31-48c379ab51dmr77117137.15.1717759241750; Fri, 07 Jun 2024
 04:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240521095536.3869399-1-fshao@chromium.org> <9f73dffc48394e6304263ac2293a2b18864ae3dd.camel@collabora.com>
In-Reply-To: <9f73dffc48394e6304263ac2293a2b18864ae3dd.camel@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 7 Jun 2024 19:20:04 +0800
X-Gmail-Original-Message-ID: <CAC=S1njnqrdrQqJZYQ7mffgmAUUxtoO7utZumED0dmX=Fa9+Qw@mail.gmail.com>
Message-ID: <CAC=S1njnqrdrQqJZYQ7mffgmAUUxtoO7utZumED0dmX=Fa9+Qw@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Reduce msg queue trans buffer size
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_042046_658451_D8454D4B 
X-CRM114-Status: GOOD (  22.52  )
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

On Fri, May 31, 2024 at 8:47=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le mardi 21 mai 2024 =C3=A0 17:54 +0800, Fei Shao a =C3=A9crit :
> > In the MediaTek HW vcodec pipeline, the `trans` buffer is used to
> > transfer the data decoded by the lat decoder to the core decoder.
> >
> > In the beginning, 6MB and 30MB were allocated for the trans buffer to
> > handle FHD and higher-resolution contents respectively, but it turns ou=
t
> > that's more than enough in practice and there's room for improvement.
> >
> > The buffer sizes were reduced to 5MB / 8MB respectively and the decoder=
s
> > have been validated to work normally on the MediaTek Android products.
> > It's time to adopt that change in the upstream MediaTek vcodec driver.
> >
> > Reduce the msg queue trans buffer size to 5MB / 8MB respectively to
> > optimize the memory usage per decoder instance and improve the overall
> > system performance.
>
> I don't disagree with the change, but it feels like this is has hack over=
 a
> hack. We have an entropy decoder (LAT) metadata buffer, which of course i=
s
> resolution dependent, for which we hardcore two sizes.
>
> Any chance Mediatek can document this blob, or at least document the prop=
er
> relation between the size and the resolution ? This way we could dynamica=
lly
> size the buffer for the chosen resolution and trust it to remain big enou=
gh for
> a long time. Removing the non scientific claim of "have been validated", =
which
> is producible for anyone hitting issue with that change in the future.
>
> Nicolas
>

Sorry for the delayed reply. I totally agree with your point, but last
time I was told these are what they are using internally so I guess
it's not there... or it could be me that didn't ask the right question
(we want to do this with finer granularity or dynamically).
If we don't get an answer here, I can also bring this up to MediaTek
next time and see if they can provide more details.

Regards,
Fei

