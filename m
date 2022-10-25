Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61873C38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21fm5EgPKmeOayQHxWYMU7Nefc1Ipf9I7LMbzYS7TPI=; b=12poiHXDt8q8HWlUcoFZ+qq9nj
	dqQF0o8AarITrLH1WjEMT0qeRK6VLk2W+k4sM1lIGmqVYvkqlmXGzXd/6Bw9pTHaMXDfcQaqJgUfz
	Vi1EDpP5eaIqG9vrdDplVAve60u43S40LTu43F1Uj0uwBlcW6SmYwtejryNW3wiANEQsNyQpqM7a7
	15K4K4bU4HumKTnvAyqWXTs//0D3Spgq4anlwsZgZZYv95EQbYcqE0j2iPSuU/AlsKqeRZI7lKKAP
	UAkd6sMFlmD109DyL5F0ON2+PPrqoRP0K3873ZXZaVTu6S7ExChlu02+vcX3fF3kyy2OfC+6qU3Rv
	5WIOn7eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLWL-005zSZ-Fe; Tue, 25 Oct 2022 15:07:13 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLWG-005zOD-1p
	for linux-mediatek@lists.infradead.org; Tue, 25 Oct 2022 15:07:11 +0000
Received: by mail-qk1-x72f.google.com with SMTP id l9so5689554qkk.11
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Oct 2022 08:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21fm5EgPKmeOayQHxWYMU7Nefc1Ipf9I7LMbzYS7TPI=;
        b=Qao3n6VBojqDPD+nyuHaNb8aRuC3dHiWWy2AGSGIeYcnvqBmtYGQkw0ZAnJFMbgl3b
         YXIsxmYnbPg/gkeIi50KEfyRBdnGvB7rOyE6AKwAWbos4tmP+xf33xTqrKYAFctdgjEV
         5bJSY6/fZwHsi070+kf0Dnmrd9VA6kpKF5vcsJbaF4KkD+ujQ6HfenyTPpf4q34P817v
         Lw/cRjg8xI19gsnwTd7/9PilD6/WIP9eNa1DtNk+gWXZdxuCJP9myXKQJQF5gbDxLWVe
         PS22WiRQZeD4cAN67FUE74f+0buJO7v71DQP6WC4ve5q5Ibyz3V9+9DvZel0/LU50VSx
         rUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21fm5EgPKmeOayQHxWYMU7Nefc1Ipf9I7LMbzYS7TPI=;
        b=de35DglNcgX11WJibD5+58h7yCtdNiSZZr64H3qD3pJG6OPkB0Ujd0EwZbAQTAGVQb
         LsWmE+lf83paI2O3EdfHz8suRfx3i3p6FgdiFAY9IP40vjWTVrILUyKBlLkHO4stXXu6
         wsbMfmqbV4CJIWOVjB3017Z1ULhxY5syDBdawfusx5PEUqRdNjMJJJxNZgv+kvdebp3T
         2jRjJQPSduxhCGO/MbR6iFAQOqzEzYkpcbfLUTuCqxkxNwUAEAKmzpuTQwBgDSEE2fIT
         X9zohqVQziX4Xa3d/W/nwxZVsrPFp8UnVn5ZTVi5pSAPwypcOQQTsifUC/tvGDwQ70nb
         PfMA==
X-Gm-Message-State: ACrzQf33vPbMce8yqXtsRdauDHTuEIR0ox2yqmroNhuXFTg9lmWrB2Ri
	s8Y3NRc4OIZ8yTvwLYeyjTMpnocqErpYFoWA9r5WCw==
X-Google-Smtp-Source: AMsMyM5WxUziOboPsxC2N6qlers3FkCq6d6ddxCwWgeTeLHIKEFc0BoQutxorsr/ysGcAgO7sfY3nB5LJLrWXyNsPDs=
X-Received: by 2002:a05:620a:25c8:b0:6ae:be73:86c6 with SMTP id
 y8-20020a05620a25c800b006aebe7386c6mr25824699qko.531.1666710423705; Tue, 25
 Oct 2022 08:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220829093141.45583-1-tomeu.vizoso@collabora.com>
 <20220909141528.5090-1-tomeu.vizoso@collabora.com> <CAPj87rMYW1xZdacZ1Y0qk+D9xpqsqE+cwbQ1j1nZ7S+RKpzOoQ@mail.gmail.com>
 <CAKMK7uGkFP1jSNQzv37PvSqvOtt1FnbfbNyYEf99WM=_2AszSw@mail.gmail.com>
In-Reply-To: <CAKMK7uGkFP1jSNQzv37PvSqvOtt1FnbfbNyYEf99WM=_2AszSw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 25 Oct 2022 16:06:52 +0100
Message-ID: <CAPj87rPTAhcqSnhzYPdDn93Kh9aGJtN9ZGVAYUP2Ke6w6frH5w@mail.gmail.com>
Subject: Re: [PATCH v8] drm: Add initial ci/ subdirectory
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>, 
	Jonathan Corbet <corbet@lwn.net>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, 
	Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, Neil Armstrong <narmstrong@baylibre.com>, 
	Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_080708_364952_578E6EE8 
X-CRM114-Status: GOOD (  30.81  )
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

Hi all,

On Tue, 25 Oct 2022 at 08:32, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, 9 Sept 2022 at 19:18, Daniel Stone <daniel@fooishbar.org> wrote:
> > But equally - and sorry for not jumping on the IRC (?) discussion as I =
was in the middle of other stuff when it came up - I'm don't think this is =
the right plan.
> >
> > Mesa having all its CI in-tree makes sense, because merges happen rapid=
ly to a single canonical tree. If the scripts need to be changed for whatev=
er reason, we can merge something in under an hour and everyone immediately=
 gets it. DRM is quite different though, given the forest of trees we have =
and the long merge paths between them. I worry that merging the CI scripts =
in-tree - especially for our initial attempt at it, when we're likely to ne=
ed to make quite a lot of changes before it settles down to become a stable=
 system that works for everyone - is shooting ourselves in the foot by limi=
ting our flexibility.
>
> So the entire "we have multiple trees" is why I want at least the
> gitlab-ci.yaml in tree, to force people to collaborate more on one
> thing instead of everyone rolling their own fun and hacking stuff up.
> And there's still tons of stuff outside in the separate repo, like the
> lab status so Linus doesn't get a silly history of lab flapping.
>
> Also wrt "developers don't get the update right away due to
> backmerge/pull delays", that's why integration trees like drm-tip or
> linux-next exist. So maybe initially we should make sure the ci
> patches go in through drm-misc, to maximize how many people see it.
> And even for mesa it's not fully automatic, you still have the rebase
> your branch if you picked a bad one for development (but yeah marge
> does that if the MR is ready). If you're doing kernel development on a
> linear tree instead of an integration tree, you're doing it very
> wrong.
>
> What I think everyone agrees on is that we probably get the split
> wrong and need to shuffle some files back&forth, and that's something
> we need to warn Linus about I guess. But somewhere we do need a split
> between internal and external stuff, and personally I'd like if at
> least the pure sw testing (build and virtual stuff) could be all in
> upstream.
>
> > Given that it's currently very dependent on fd.o infrastructure (publis=
hed ci-templates, the registry, the specific-tag runners for Collabora/CrOS=
 DUTs, etc), there isn't much of a portability gain in bringing the scripts=
 into the tree either. It's a good goal, but not where we are today.
>
> I don't think there's huge chances for any non-fdo gitlab anytime
> soon. Once we get there we might need to figure out how to standardize
> the hw lab interfacing, and if we have all the sw targets in upstream
> that should help with shuffling stuff around for a hypothetical LF
> gitlab CI (or whatever it is).

Yep, having talked through things on IRC, I'm happy with where we are;
let's give it a go and find out.

Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

