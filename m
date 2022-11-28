Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202ACC43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WWumrqiTDYq5uOZBAPJFRzs6vcelTvSCtUZimwYyKk=; b=ooc0zWMMx3eT06DgsxCuQtMz5Q
	m3KBhavg+MHbkUid8SjkACN02OmiZfatIwhHkKARh2j8VfMPyo7GwTgUEMflyHfOvIWzyKn0I+Yh6
	2Zzorv7jqL//SKl48nG6sffWZ1Q3Uc7eQ+6fNqZZNShUpg0XrxspwHbzAYYuSlZ9tGC7qH/GTYpL4
	nssi1n/foF12Xir5wAOBwWhgDWKpBGEVszHtslNhh0zrTObKdyYHP8dj12YenCqdfDSerIVA7HbfT
	25nQY/ZrDnd8uSWOeg9TvE8Vov/HPf0hJ5td2EERcH3D8c81eTwaqiC1giO3K3GKbjTTZm2hgKYHt
	dVS7sMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeVb-001y7W-Lj; Mon, 28 Nov 2022 13:49:19 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeVY-001y6H-Vc
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 13:49:18 +0000
Received: by mail-io1-xd2e.google.com with SMTP id c7so7558134iof.13
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 05:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5WWumrqiTDYq5uOZBAPJFRzs6vcelTvSCtUZimwYyKk=;
        b=JaLWK4hY8LgNiPiKh9CCSm+56V2c4Rm7Q59ef1OdxUY5vA0ZNzGYJh8zBSh2Cg6W64
         eEKR+qLTv/MU1cSh80KUT8bP9gfduZ5u5xWY/RRkgkx433VnWoMLQFoAUQzLsnHsYWJW
         YGsPYd+Hr+yIoAkDDGPvqs9pyqr1YJYebXF1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WWumrqiTDYq5uOZBAPJFRzs6vcelTvSCtUZimwYyKk=;
        b=cZOCFDx+QdKYG4qz8Nm6vX19FOlkKU8Q6oyA7e/guF0GalGimOLsKjSuSfVpExL70k
         L418fGHXbDdwEEeyAsBX0JF8LBEAQkD5Zd5Z5M2mOYVlZkVrcOWufwkaTo8wxPA4Vb1D
         KT0pYVRO+93rwf0yhmEmzi12YIFfbR2d75qBptF2WIlAFJ+TMl8X+lZgN50lAFWe2i9c
         qWJAFftWZU33t73Z1+vUE2U7m8kBZh2j74NvuaNzJ2a1x70r3jaEz6i1BbrjB7c6UmtP
         H2180R5hAWlpd1WBC7mHaXgNp0rzrVUUFBtq1RF+jR/9bQs2WmfB9Lg20OK4Aaj0Tl9t
         6DVA==
X-Gm-Message-State: ANoB5pnM5anTTt/+rGpLZh2/SZB/p9U+ONzmOKNL2s+ommv1ENMOVObL
	OtzakzWOtvTKVlbd8dKmfQuCQpyueLBWVS7J
X-Google-Smtp-Source: AA0mqf4DUkUChp2rjV4VWu6M4K74moEFmjadkbZHmlSy9wz2ITVLtFYFT3OCWUYLoLvpr4ygt/69Jw==
X-Received: by 2002:a05:6638:381a:b0:389:e3ba:464f with SMTP id i26-20020a056638381a00b00389e3ba464fmr1487907jav.25.1669643355419;
        Mon, 28 Nov 2022 05:49:15 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id t193-20020a0254ca000000b003757ab96c08sm4391423jaa.67.2022.11.28.05.49.13
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 05:49:14 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id c7so7558022iof.13
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 05:49:13 -0800 (PST)
X-Received: by 2002:a02:ccfb:0:b0:373:9d0a:33a0 with SMTP id
 l27-20020a02ccfb000000b003739d0a33a0mr1950090jaq.286.1669643353517; Mon, 28
 Nov 2022 05:49:13 -0800 (PST)
MIME-Version: 1.0
References: <20221128-mt8173-afe-v1-0-70728221628f@chromium.org>
 <a214fe55-fb5e-04b8-348b-895902470b18@collabora.com> <Y4S43XjRyrdm4Tha@sirena.org.uk>
In-Reply-To: <Y4S43XjRyrdm4Tha@sirena.org.uk>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 14:49:02 +0100
X-Gmail-Original-Message-ID: <CANiDSCv8Ai2W10cOjBgthshi8XPCDoCvGxXfoL-47eFrRjrseg@mail.gmail.com>
Message-ID: <CANiDSCv8Ai2W10cOjBgthshi8XPCDoCvGxXfoL-47eFrRjrseg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_054917_058909_C2A6DF89 
X-CRM114-Status: GOOD (  11.83  )
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

Hi

On Mon, 28 Nov 2022 at 14:34, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Nov 28, 2022 at 02:17:53PM +0100, AngeloGioacchino Del Regno wrote:
>
> > This commit needs a Fixes tag, as this is indeed a fix.... kexec isn't anything
> > new, so all kernel versions are affected by this bug.
>
> Fixes tags are a nice to have, they're not 100% a requirement - they're
> a lot more useful when they're fixing a bug that was introduced rather
> than just something that never worked.

I do not have any strong opinion here. If you want to add the tag. It should be:

Fixes: ee0bcaff109f ("ASoC: mediatek: Add AFE platform driver")

Let me know if I shall resend.

Thanks!

-- 
Ricardo Ribalda

