Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743BDE63F19
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Feb 2026 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoXcfX7QZiwqawmcK7WDWbqjkD7o01Kl41BVrnneLZk=; b=HTQwcYG8pYqdmGCQMwtjSeR96B
	z7xsPjrQPTz46at/NOeI6HxdIeYiKqLEW3HOrP0hpWZowODUEgOyb82r7kIzd7Q9vkc6cliCnUoAk
	FZ5bYQJFXOJzoQW4lvy8eD5FWdGpW8C+Hs7EtXzNpYm9bY2z2hXYli/BWskmzIBzu6XCWCVYRMXfM
	jyoGAp03T7hLVs9lVIHcaeaKTeyfCXKVEudxufkGdpnOCn6GugsYmKXYvxo3vEdE9y+VXknPBk3Qq
	SnaLzzglhm1ZLVPSg7qSvQUOh9BWI0ptm6FqIcs6Gl1HV+L31U7bbcUocl93Bc4+AWuHjmzLtfVMS
	MaQy24lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrkUv-00000005iG2-44L2;
	Sun, 15 Feb 2026 22:21:49 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrkUs-00000005iFA-3nC7
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Feb 2026 22:21:48 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-45f004e7d71so3370497b6e.1
        for <linux-mediatek@lists.infradead.org>; Sun, 15 Feb 2026 14:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771194105; cv=none;
        d=google.com; s=arc-20240605;
        b=js1FVdql11y1Ni7eA+KBXFeMbIEHE3QhEZv+Zh3926gTeR31JtuZxcpte9XEQ6b8Yk
         1RixSqBZkgGOMd8AWrGhUGAg5yF/yQuKqIVFaIoDACB2DO8JIPHffSbi09KZEAvHM0qr
         vVV//fa7Pn+T8p5Ztb52Sdd6HJ/1NblOMsI4Q5+8v3RWidLTQYlBbYfLgU8R/l02fBJ9
         qT4PUG2AH7FBFcOuieu5AOKoTcUPjx7+q9Y0Oxc2tmeeosIOLg3QN9RVoY61ydLwNDn6
         yU/JeMJi18DlFEmwZvAHSaspDxX5tsZgpxhnJyFMW9oS7xQQlQKCZygQtnHJKPjvfikk
         iT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JoXcfX7QZiwqawmcK7WDWbqjkD7o01Kl41BVrnneLZk=;
        fh=nvxPnCo7Q4zIeZWBa93ElUnUiJUHevJCW9kr4m2juoQ=;
        b=RPdlBLSmw3aq5bgkd6OCHV3BksDWcroUHeWcBjIMwuCvLM4LJflYK2AKqEVvrNBqgc
         5Z8G5ougK5w7KFiPhA4anDRVK/DL/GHPlronyqWf0Sw0v4vVrBZ1nkghabyxGaLc5yk3
         w8u9uqeyIrXPWo7LM4FK3+9xrYPDySuZGknsF3gTIG1XEOixgPc2E7l9QeUEOgkMoeNQ
         1kJzdJ/ZNXMVVLJUxxbw26l6krPq0jnSiuNXY1XFbzATbi3kkoOmxUJ0DGcUqGJNWS80
         AiIo/pBcnTV33nMupe+kXDuCQbreI6mSte9jNF2f3kzcDOMMa9YEeLZMuP6yXX/5AWIF
         sk1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771194105; x=1771798905; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoXcfX7QZiwqawmcK7WDWbqjkD7o01Kl41BVrnneLZk=;
        b=DtmJl+tJDTKGGvGdHhk57GpUMngerXiyEG7ceH8yr3WHX0NY5nCVCoB5nyBg1/gJOS
         pFFQ47hbiwPwrr8CsRKTKp4nS6lCXMVbJyk31yr+q8DSPdHagCf/a+DM17ybpDXLOVfe
         WwTknrAeaUylqogpIn6yo8NUlgAFHpwKn3OT1gRA/LaeRzIwsCa1aLkGTEEuhZkBEi8J
         Qbt0LaGHpVsUq9rTjtyOltgdsY2BbL6Mj+0bWbGh5n8mk/GP8MyfVKzpZLwv2sdaCFmQ
         xPb6Pm/U5k4YCcTOGOX4u3j+wzpdQLMiqcnctDL04H8s60TjEzzEqWJ7PfFxCijbbf1l
         n92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771194105; x=1771798905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JoXcfX7QZiwqawmcK7WDWbqjkD7o01Kl41BVrnneLZk=;
        b=a+PB9twKH0AqDrk3hth6/CCe9OVaRqVluwjzUW9mlW4vl3vNewqnToWRXNOV4vvkGw
         6RIni43etuB/F02sF6trpT5lCZvdVCA4QWnfcUTDwp+Rj3iz3KbzAgOGnFKzccbtx9Ih
         CoGEjTKEOqgpYDI4wfWcHaMaDHY9gMMARsl5+4Ijz141o66qZ+N7dpEP0VbA8N8454Kg
         MvF3InAT6SjAB+6DxywO3js+7i17fJe5qm4gcsW/3qYfzKa8qhLzaFOTEIId6CMtvxyM
         f7TH4CTzy6Yk0i5c0Q/q4AJKkULODPUkJtovaBbe7I7EDizqKhXq+pTMet6DhyLkOJYx
         l7wg==
X-Forwarded-Encrypted: i=1; AJvYcCW4dV76ZbnQCKvEo7CoHUbXk0cOE0/DNswmo2Olho6M0ufokGP8lCaB508ySwdTvavYqiLB6+rYs+srzjgQeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbLj+9E/wzMYcoJMIfFJUcLlPaX39JQ/nLw8cPM3iH9CdWHiPC
	0LmFKH5YJqlOxoSiLC11wQVyVk/q3NTvztewbTV9vKefQsYNTtElvOlHkHT1Zrhb2oH8t5BqswX
	fxUwkNyAi9rF751R90hqVUhO0bY7NtUI=
X-Gm-Gg: AZuq6aLqnEH0ZAs8Y2XKiC21Bqq7WzKgTpl49FaF6nf90OR5xKIImvWWfY+z94xxhN4
	jOO5ntmY657zh4H6YhOQmw1O1xz6d8YP7Af3wP5Cx4juLlPm7fyPSceo4SWZ6XZtEvxlMtAMW6A
	5n8boiHhOnj4xb7zdKcnrIQCHoEUdSUsU6HP5icmZ20aimUMsi1G6tvdKED62ib6SlRTLg1xWid
	R/+Pdj0xHQR+irCOUKpsKZZmdhyVmQ1B8cKa00wxyokkdhOx2iocqC19nN67ShZ82AbiUNOe826
	FigupSE6IZRnGypR
X-Received: by 2002:a05:6820:3090:b0:676:ad01:3c2a with SMTP id
 006d021491bc7-678220d7fd0mr4298684eaf.21.1771194105145; Sun, 15 Feb 2026
 14:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20260215100302.136719-1-work@onurozkan.dev> <20260215100302.136719-2-work@onurozkan.dev>
In-Reply-To: <20260215100302.136719-2-work@onurozkan.dev>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 15 Feb 2026 16:21:34 -0600
X-Gm-Features: AaiRm50FAT8RVr0tUWCN3V2Yh-fEe1_rpCxpthfdlSnrl4R1jpbzNo5n6ndNC5o
Message-ID: <CAHCN7xJJgLxPSf0QJ9nvY4Z3BguDmYJtpeprT+obD5DgA8rOgQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_142147_071033_9CBE4B75 
X-CRM114-Status: GOOD (  21.37  )
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

On Sun, Feb 15, 2026 at 4:04=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> If sram-supply is missing, Panthor falls back to a
> dummy regulator with a warning. This implicit behavior
> hides missing DT wiring behind regulator core fallback.
>
> Make SRAM handling explicit: require sram-supply for all
> Panthor compatibles except mt8196-mali where GPU supplies
> are intentionally managed outside Panthor and DT does not
> model sram-supply for that compatible.
>
> This keeps DT power modeling explicit and avoids relying on
> dummy-regulator fallback.
>
> Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> index 2249b41ca4af..5f6075f18fe3 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device *ptd=
ev)
>          * But without knowing if it's beneficial or not (in term of powe=
r
>          * consumption), or how much it slows down the suspend/resume ste=
ps,
>          * let's just keep regulators enabled for the device lifetime.
> +        *
> +        * Treat sram-supply as mandatory except for mt8196-mali. It mana=
ges
> +        * SRAM outside Panthor so this driver must not require direct co=
ntrol
> +        * over it.
>          */
> -       ret =3D devm_regulator_get_enable_optional(dev, "sram");
> -       if (ret && ret !=3D -ENODEV) {
> -               if (ret !=3D -EPROBE_DEFER)
> +       if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-mali"=
)) {

I wonder if a more generic device tree flag would be better here.
What happens if others do the same as Mediatek or Mediatek decides to
do this with more processors and this list grows?  It seems like a
panthor binding might be useful to prevent future bloat.  As of right
now, the 8196 isn't uptream,so it seems like adding this flag would be
harmless to everything else, and it woudl likely be required on mt8196


adam


> +               ret =3D devm_regulator_get_enable_optional(dev, "sram");
> +               if (ret) {
>                         DRM_DEV_ERROR(dev, "Couldn't retrieve/enable sram=
 supply\n");
> -               return ret;
> +                       return ret;
> +               }
>         }
>
>         opp =3D devfreq_recommended_opp(dev, &cur_freq, 0);
> --
> 2.51.2
>
>

