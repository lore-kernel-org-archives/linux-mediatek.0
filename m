Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D669C4829A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2vNm5vci5F+R+oBGRNTgxDB8K1oVhEs6yL2hE7dnho=; b=wmjgOZziNwLideeQhZB/0Mcd9e
	4nFmk+Dj+g84R9V+N0msr/koYG+ZVeHwK37bIqS3pCucJt3jUBr7CzSeLWaPzAcOPJxqaJYvuYsSB
	igV4urCrUZxpcKKmvhiULZMkWYY53ZLcozm5kmtsv4R1SlnWRXJAg3e7DTBqD1rFnjKUETbeOGKh1
	JXRSfYqbG/WmlxKL2N4M/7ez4kNk3cq9ocWJRttuBU7QGGVibbDuhxeA+UMnvrOnEzEB1NOcXL3YE
	7i66UEm2Odh+TccK02ZAMPbVxVBw/ronH9Fn0Ws6Nmr9XtJ2+htBzbTrrVVRciIiNSsqmH9MpZpDy
	uxJBMhaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIjB-000000073FH-1sy8;
	Tue, 06 Feb 2024 10:30:57 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHid-00000006hZ7-21aA;
	Tue, 06 Feb 2024 09:26:20 +0000
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6d8f19ab3so5362289276.3;
        Tue, 06 Feb 2024 01:26:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707211577; x=1707816377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2vNm5vci5F+R+oBGRNTgxDB8K1oVhEs6yL2hE7dnho=;
        b=kyLTTCE9XWHmPSpgK9zkZkSVY2GVnY2CxVX6/WqmSCwUXG+9402G81iHMJXf4HgNpt
         rNqG86XnLuIvVy2NAnfYZsj0nNtelFnjwXhkN3E6TSe4YvUapwIxGDI9D9te7FsvtKdj
         p4WeOYAU9ou0CZJDzOOAzCHbjW3vAhdNHG62+pzOo2MwDDKYuShlhjBPjCq1LcgiZzwm
         akypkujxJ98a9O9VfU/7jwg189oxKfK9obf2ZAAGzxmP2HtlzU0Rj/g4uDmkS29MxVGR
         arKkG1p0+puD2YH9ufU8ToNjQl8YkOA9RM/0si8VG/gUrz3e7APvL412jcVB7jnC9ikx
         rf2A==
X-Gm-Message-State: AOJu0YwbGrvgx/NoudwHx6K+tQ9wTDc/6jq1FaIQJmcu3KklkJcQifPe
	senZ1L8VIGgK5wghh3+itxwlwLoiIQFnKfNHBvkNJ+gLYZbVB2ImJ46aNS0Yo4c=
X-Google-Smtp-Source: AGHT+IEL1C3BLndk1eFPOfUs2SBV2t5jnv2a2VEumT8bfrSxQY5fevUU59WZzIwRdN3rnuC2fzAZbQ==
X-Received: by 2002:a25:860f:0:b0:dc2:21fd:b17d with SMTP id y15-20020a25860f000000b00dc221fdb17dmr1191905ybk.8.1707211576999;
        Tue, 06 Feb 2024 01:26:16 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWest6fDkJi1KpeV6JwNVMAkxERWBd1ceGRY8Jx4YRogTgYNOzOW4Oo+hkEVtQinREMXDes00RPM2ViwSlQLcA8d6LaWCuLHv/3BXuEJFxkYFrEcPs=
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id t31-20020a25f61f000000b00dc237acbdc9sm437108ybd.13.2024.02.06.01.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 01:26:16 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6047cfd1f5cso3214787b3.2;
        Tue, 06 Feb 2024 01:26:16 -0800 (PST)
X-Received: by 2002:a0d:d8c6:0:b0:602:98af:b469 with SMTP id
 a189-20020a0dd8c6000000b0060298afb469mr1143306ywe.9.1707211576249; Tue, 06
 Feb 2024 01:26:16 -0800 (PST)
MIME-Version: 1.0
References: <da6af483-5ee9-45cd-922e-d9d5364674dc@web.de> <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
 <6e397bf2-1d45-434f-8619-58a737a138e3@web.de>
In-Reply-To: <6e397bf2-1d45-434f-8619-58a737a138e3@web.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Feb 2024 10:26:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWbG6vG4PkbBZ2V+GYbFdnxOgogHUrdBNj4bFYaDafKA@mail.gmail.com>
Message-ID: <CAMuHMdVWbG6vG4PkbBZ2V+GYbFdnxOgogHUrdBNj4bFYaDafKA@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: mediatek: Use devm_platform_ioremap_resource()
 in init_scp()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	LKML <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_012619_543500_4B03EC60 
X-CRM114-Status: GOOD (  18.86  )
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

On Tue, Feb 6, 2024 at 10:21=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 6 Feb 2024 10:05:34 +0100
> Subject: [PATCH v2] pmdomain: mediatek: Use devm_platform_ioremap_resourc=
e() in init_scp()
>
> A wrapper function is available since the commit 7945f929f1a77a1c8887a97c=
a07f87626858ff42
> ("drivers: provide devm_platform_ioremap_resource()").
>
> * Thus reuse existing functionality instead of keeping duplicate source c=
ode.
>
> * Delete a local variable which became unnecessary with this refactoring.
>
>
> This issue was transformed by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>
> v2:
> The transformation pattern was adjusted based on advices by known contrib=
utors.
>
> Examples:
> * Doug Anderson
> * Geert Uytterhoeven
> * Robin Murphy

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

