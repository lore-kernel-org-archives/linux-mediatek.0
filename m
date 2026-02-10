Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDFFEA3F04
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 05:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMMIDaH2OMrzByxZGI9BwGClJ/ZnKLT/rEz49GNyBFQ=; b=E+jp2HMG9+hFsls+5XlrbaRAcf
	EdPFsTEsPXKQJWU62qk2NGKURbVP/UfORPcqzI3PvIfP7eerzXvD52M2I8EmAItf/3etgtQsqZW9/
	CLLmf4gtqqyMcOHelW5fT0WqYGa9RfEUiweaWXk8nd7uLFVwL4ofqr3sPIO5ovJ5WpwX4ZKDRigdF
	5eXUO+Um8xlCGTp7KS1AJVIWDHyxRhuIwGAhUjU0So77ouajuCWf0NO1QwxBWC9yjr0DVGRsWrLbS
	9JiOqpuQxQY4vh+8GiCkjfnb4Qhch7muCchmi7K6jZ10Sa1WTbZdM5Kgqpo+iqB/5XiLJBNR8VXes
	6ewqwT7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpfx1-0000000GRfc-1XJa;
	Tue, 10 Feb 2026 05:06:15 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpfwz-0000000GRet-0sIv
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 05:06:14 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-354c825dc77so306760a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Feb 2026 21:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770699971; x=1771304771; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMMIDaH2OMrzByxZGI9BwGClJ/ZnKLT/rEz49GNyBFQ=;
        b=OPnxnAcdhYpRrDxyqNk7XZ7SNbWMX1j4d6vk4bp25jtvaGcwaiclJiCXBB0wbzVXSu
         hq6vAud45Fo237x/oJOp6OfF66ykFjxOAWA067MF5MTTjddooVfIuncnmJefYEj4zNwi
         PFLc+fyQ0O3ImKUWmXMZOLGrZ5Aa9ggBJyO7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770699971; x=1771304771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMMIDaH2OMrzByxZGI9BwGClJ/ZnKLT/rEz49GNyBFQ=;
        b=QoTI/9l6+l8n//XFkSKtErHra0hlRW/Z0i9yiuxT4Yzye9R/7do7bo9NMDD7FYD7F6
         o12xdzdZ+fV5exqMZzxWQYb4IXlRvtBRgdQ4Q1cAOTbJJHeapvSzQfZQy0gafK5ZMkHz
         /l6foxHSxqO/adpbMgVgL6tK0PTd/qs80vJBTHk36jn2Ke4v1JfIRaipC5wkIwGUbIGk
         fkUFLsm7L1+gx5AZNfgFh87LuqZhcKL71C6jVVm9Xw85mlO3hiLRHsJkmWqIntfKo22r
         XNHbIf3gRCJ/lniaR0pYbiEwxzR7PsK4o6TGYKqMu+OLGqMBvt5ioBRyRsxWO9jbcObd
         UR1A==
X-Forwarded-Encrypted: i=1; AJvYcCWJH7dyTN5hpZxpVr54RBgfasxAxE5faE4UsEGx/IFUiAxJDxAyFA5i15bdnr7mNFAIkm+TuJXGCgyanLSZlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCFUfK0g2d19v9qMVRz7MIbWzdIWqdo6795VgFIBsZojnDXaqM
	Bn1TWCAUWYaBflmrbZtXwjrYuH18rui1RpmpNuSjT3Zrv85EU8pvXucI7zH+yIPQ/g==
X-Gm-Gg: AZuq6aJIgsj9Pz6rqaF2Oo7cAnEBG1sAzJNjWBHOHKUTOlvCi0eXj9xw4e+gfk0/fxu
	HRPkDSwZnT34lT4pw2kXSzYPdGi4+UFNKgjbSfHPt8CpvzQYg7QMjOt42VHH0fd3JzpJX2IYTdH
	77reulWKzVQlL9GNuVxeIgDyzoiT7yIfWvPEJpb4hOU4qXi5bH2HXBApUZMeN+TMOxsheVPM8TR
	Z9xJ0PeiSV1njk9ZMrcQXwtgWhMkrZvhZL2Iexd/yOFAKjGwYD+TL4PvzjAARB5wcaxbKlHUNGH
	CRDHfxnJ0msODvHQukIgY4wqSR0JngRutEwJM/LNP1Jb0wIUAOL/H86XP9l3VxLzGya7sWpH6oB
	wwqjV5lt88gA6LMsaKpn71KO8ZG31+rXKKtx/dx5QTW63qEfLfNYDvoddPxb9U2XtAUysfLeXNS
	aAVVMc8UL0t7c/3SIL6AHXNeBZYXnkE0mi8HkjV+veGox5ZijWpv0FmaY=
X-Received: by 2002:a17:90b:314c:b0:34c:9cec:dd83 with SMTP id 98e67ed59e1d1-354b3e4b663mr12562993a91.27.1770699971626;
        Mon, 09 Feb 2026 21:06:11 -0800 (PST)
Received: from google.com ([2a00:79e0:201d:8:822c:995b:f23f:e04e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3562fc6f342sm3648006a91.0.2026.02.09.21.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:06:11 -0800 (PST)
Date: Tue, 10 Feb 2026 13:06:06 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, greenjustin@chromium.org,
	sjoerd@collabora.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Macpaul Lin =?utf-8?B?KOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
	Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Disable AFBC support on Mediatek DRM driver
Message-ID: <20260210050606.GA852606@google.com>
References: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_210613_246569_FCB63495 
X-CRM114-Status: GOOD (  13.71  )
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

Sorry for revisiting this old thread.

On Fri, Oct 24, 2025 at 05:27:56PM -0300, Ariel D'Alessandro wrote:
> Commit c410fa9b07c32 ("drm/mediatek: Add AFBC support to Mediatek DRM
> driver") added AFBC support to Mediatek DRM and enabled the
> 32x8/split/sparse modifier.
> 
> However, this is currently broken on Mediatek MT8188 (Genio 700 EVK
> platform); tested using upstream Kernel and Mesa (v25.2.1), AFBC is used by
> default since Mesa v25.0.
> 
> Kernel trace reports vblank timeouts constantly, and the render is garbled:
> 
> ```
> [CRTC:62:crtc-0] vblank wait timed out
> WARNING: CPU: 7 PID: 70 at drivers/gpu/drm/drm_atomic_helper.c:1835 drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> [...]
> Hardware name: MediaTek Genio-700 EVK (DT)
> Workqueue: events_unbound commit_work
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> lr : drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> sp : ffff80008337bca0
> x29: ffff80008337bcd0 x28: 0000000000000061 x27: 0000000000000000
> x26: 0000000000000001 x25: 0000000000000000 x24: ffff0000c9dcc000
> x23: 0000000000000001 x22: 0000000000000000 x21: ffff0000c66f2f80
> x20: ffff0000c0d7d880 x19: 0000000000000000 x18: 000000000000000a
> x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000000
> x14: 0000000000000000 x13: 74756f2064656d69 x12: 742074696177206b
> x11: 0000000000000058 x10: 0000000000000018 x9 : ffff800082396a70
> x8 : 0000000000057fa8 x7 : 0000000000000cce x6 : ffff8000823eea70
> x5 : ffff0001fef5f408 x4 : ffff80017ccee000 x3 : ffff0000c12cb480
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c12cb480
> Call trace:
>  drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c (P)
>  drm_atomic_helper_commit_tail_rpm+0x64/0x80
>  commit_tail+0xa4/0x1a4
>  commit_work+0x14/0x20
>  process_one_work+0x150/0x290
>  worker_thread+0x2d0/0x3ec
>  kthread+0x12c/0x210
>  ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> ```
> 
> Until this gets fixed upstream, disable AFBC support on this platform, as
> it's currently broken with upstream Mesa.

Do you remember the circumstances you had an issue with?

Looking at our notes, it seems that for MT8188 only vdosys0 supports
AFBC. And on MT8195 it has issues with color correction on the second
pipeline. The driver as currently seen in next-20260209 only signals
AFBC support for the first pipeline on these two platforms. So I don't
see any issues there.

The commit you mentioned that introduces AFBC support failed to take
into account this flag when exposing AFBC support to userspace. But
this was subsequently fixed by:

    8d121a82fa56 drm/mediatek: only announce AFBC if really supported

On my MT8188 based Chromebook, only the planes for the internal display,
i.e. the first or vdosys0 pipeline, show AFBC support.

AFAICT the Genio 700 EVK only has one external HDMI connector, and that
is tied to the second pipeline, which should not have AFBC support
announced. I'm not sure why mesa would still be using AFBC then.


Thanks
ChenYu

