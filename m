Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC7EC3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 11:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2difOvlWIEO63yHi+zzCArMOSeh2R/YOZyOxHPP5y8=; b=LRn4ogUqm/mrrjUWCF1SBJvHrd
	prW41VzfodoeuTSxoUXIosmKlt5Cd2GbYMsqifwfY4BpMuo2reFCJcS5M5kgHm5V/ZiJrTAsYwjd3
	7CQ8LofBQ0J7uB0vH0hpQ5b+zC0L6HW1mwv8qatuDPUJEuE+TJfFbkFVyGGpNfnbdwAkKOTiA9x31
	FDEx/CyGCWNU/9NRNva9/wD3boOFjC62RJru/45UDVOWxIvWs8MyZ+EamLM+wFQLuYaZi9nvM73n+
	Uae3WC3UNZqe2z0KzV3IALlIzkxRi07whv3lhRduy01zhpmnbyT2KJIPUxpY6zfKOU38xLxHRuxQ3
	gRBVPEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUP28-0000000Gn1i-35bL;
	Thu, 18 Jul 2024 11:10:48 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUP25-0000000Gn0f-0hmZ
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jul 2024 11:10:46 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-79f178e62d1so11470885a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jul 2024 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1721301043; x=1721905843; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g2difOvlWIEO63yHi+zzCArMOSeh2R/YOZyOxHPP5y8=;
        b=jfoPXNn4ctZCYVlRBFSxq9HjkRB0qSKS40IALNMfNgVkQnxXev15YYqe7i7CvEaxxK
         mHbZ0jyhEx0tdxS7z4A1s1mvyk9wqqxlRbnHf/IHWX8PmQ6gIV1L+Vv0EdPJyd/FIA2o
         EYee1BjwFt1ujycY3LulUGGdJUjTBFjAimssU5E2QQedCsWZJh/3eFwyMEjR50wEUV3E
         C09ot7GHxlM7jaFzAhwHmUV272vgq9mXm4gw9WXVDaKXXhJlDTgYER7G4EoBA8pScHQ5
         f09oNMuZQ/EdZSX0t8g20541iklNLawOUSAr8+n1GzDD6Dsy8RFX/JZt9X/dlNr+i0HK
         7aFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721301043; x=1721905843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2difOvlWIEO63yHi+zzCArMOSeh2R/YOZyOxHPP5y8=;
        b=Ag8Sq3wRwWl7zM6u11DhGQnVlHAWspP/ee0eV+9QtqrMXK0uvkqxLRQ+WVOd4n8dOZ
         zNi+WqNxQdzEaIDT2MlLY4T9zfwu6gRYQNBZEpdu6X7dGtgv9JA8XjNbUCMg1JJWAiDp
         p54wI56bo9i6rBhtZ/I7hbOwDk66pkKKYHd50XENv2UDURogJ05Hpke5n6AqJjzAhWN+
         xoDf+aclQIviMHn7ofcbppQngMb43YRCUzzaoCvaLGk662oSjG5DqqEFotz4GoSKQ5uL
         Hq/rAY66J8rMz12SDsdoldiVD/oQrXtCJQ4NvnziepXLKCKTUhpnHBXJ4jV6qvJXq2GV
         tDQw==
X-Forwarded-Encrypted: i=1; AJvYcCVeIqcOxNnnOKuKjXJUInercp08ikUdn1KN4gHJfs/JTHxT2zvaoHXNWD9jwb4PJ3w8J10LRf/PQ8mPRD4HBbA9tg6zkQwxPdOGCAH6jC6HEXJn
X-Gm-Message-State: AOJu0YxMDSxY/oHDJKmtGEeRQt5zVUiXYsS+WZDCBmyLF4Tu5S8uUTT8
	e61JmomKntQZzsyBirxv/ieoB2gnd/er6T1OVxMxYt2mIqY8ImK0tNMdjHxY62NuCjQXyDZ2T9Y
	EgsL808QGmi8bzrSnCFjnlZmReLzsR85VK0f5fA==
X-Google-Smtp-Source: AGHT+IHkpXrj6tfe5GKUAxDloIykkCd7pSLfu610KYCjUhm0uSHpFNmHy8/JsbORj2vqFg5Eb30UAAlM+BNEUmR4XcM=
X-Received: by 2002:a05:620a:29c6:b0:79b:ea85:9f9f with SMTP id
 af79cd13be357-7a1938c1e9amr47232985a.2.1721301043317; Thu, 18 Jul 2024
 04:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
 <CAC=S1nigoJWAECBrm-Q=Co1-qd_yUhx3R4D9=dYeUV=gr5UYfQ@mail.gmail.com> <74e7477b-81c7-4713-80cc-1cb476185bc9@collabora.com>
In-Reply-To: <74e7477b-81c7-4713-80cc-1cb476185bc9@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 18 Jul 2024 12:10:32 +0100
Message-ID: <CAPj87rPZRjmMPjaOY-UH4auTuMS6mh9N7=maRBzxut2OgtALbw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_041045_238000_67A75C22 
X-CRM114-Status: GOOD (  22.25  )
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
Cc: chunkuang.hu@kernel.org, kernel@collabora.com, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, ck.hu@mediatek.com, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, Chen-Yu Tsai <wenst@chromium.org>, matthias.bgg@gmail.com, shawn.sung@mediatek.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

On Thu, 18 Jul 2024 at 11:24, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 18/07/24 11:27, Fei Shao ha scritto:
> > This matches my preference in [1], so of course I'd like to see it
> > merged... if maintainers are okay with it.
> > Given I've tested the exact same change before:
> > Reviewed-by: Fei Shao <fshao@chromium.org>
> > Tested-by: Fei Shao <fshao@chromium.org>
>
> Thanks!

And:
Reviewed-by: Daniel Stone <daniels@collabora.com>

> >> OOTH, Intel recently added a feature for enumerating "suggested"
> >> cursor sizes. See https://patchwork.freedesktop.org/patch/583299/
> >>
> >> Not sure if other compositors will end up using it or not.
>
> Yeah, that's good, and we might do that as well in MediaTek DRM... in a slightly
> different way, as it looks like they are simply hinting the same values as the
> mode_config is declaring... while we'd be adding a hint with a sensible size that
> is less than the maximum supported one from the overlay.
>
> In reality, here, the issue is that the most popular compositors do not support
> overlay planes (as in, they don't use them at all)... my first idea was to remove
> the CURSOR plane entirely and declare it as per what it is for real (an OVERLAY),
> but that would only give a performance penalty as that'd become yet another unused
> plane and nothing else.
>
> If at least the most popular compositors did support overlay planes, I'd have done
> that instead... but oh, well!
>
> And anyway I hope that the maintainers are okay with this because, well, otherwise
> MediaTek SoCs won't be usable with any popular WM.

Every compositor is going to use it, yeah. But until it does, people
are just going to use cursor_width and cursor_size. A lot of older
desktop hardware supports only a single fixed dimension for the cursor
plane (hence the single values), so rather than guess if it needs to
be 32x32 or 64x64 or whatever, people just allocate to the size. Not
to mention that the old pre-atomic cursor ioctls actually require that
you allocate for cursor_width x cursor_height.

So yeah, this is the right fix - though you could even be more
aggressive and reduce it to 256x256 - and supporting the CURSOR_SIZE
property would be even more useful again.

Cheers,
Daniel

