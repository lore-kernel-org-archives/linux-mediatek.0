Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B5BC001DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 07:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/wCFrYPEzzO/MfkHD0RMinAwo+j9ojz+4k/clTmCNQ=; b=mFf2I9WpUqUfC2UhgfepUU35bh
	9iyCAuYEMThYUBTpaE8Pk+EdqxEffBWn1G3MXaX7acF0AnpKnYDG4dsEO8nKoU8QlQ4xam5Z/nskY
	gpja1u/KrKBpUOtOs2UVd3n/LkLtelUFTRFf0m8fOAb8zPHsW60W++ckZz5KEyh1F1BluWNT0uJJg
	nrnfHd4eRRNB72029tAJfuWJezrD3LD9XnkBmq8CRH/NPnz/utpzAEH5Bu0m1rUc7MoRfl0gl9vMk
	3KY7ZIP0yfyXtr6e0MKwg5IBM2xkgn/4z3r867A9G2FUHRt5CsoMBfJbI81VrHZN7jSHTT0pz24lH
	6g7QJ2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOC2A-006Vym-1D;
	Tue, 25 Jul 2023 07:00:38 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOC27-006Vxf-0u
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jul 2023 07:00:36 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3460815fde5so28423915ab.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jul 2023 00:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690268432; x=1690873232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/wCFrYPEzzO/MfkHD0RMinAwo+j9ojz+4k/clTmCNQ=;
        b=GhMhgrzhRi8xlIOr/f901h3+iOlA1BGwAn1p77n5kWP+v92Q5dtRO1S/d7r2WK2W06
         cPI1SKAnt3eqyGckTri+16ofzgoMDHFOYs2glIAQknBO9wEvluNbR07ylp8L/MTls8f0
         JDM2HGgNw81JLRKZ8S5766orREqMfbKHfFIX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690268432; x=1690873232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/wCFrYPEzzO/MfkHD0RMinAwo+j9ojz+4k/clTmCNQ=;
        b=BkSJ2Zb17vTBd0HizPR6j0iKZeCyn7WKlVvR4JHed9oM4GcxMsIIq3mIa2J+9tDiOj
         7+tQLpcRuzpgbKfyvpbOm9xAigQ5cGr1AToJ0//pm8cgkpG4ZARMVvBl8K1O+OjFqZvs
         AN/lmQNGKs0+JYlPrBlFrDRKNim33YesxW9uxqYmaNoumfqxAp3tuYOHJfYRqQo657D+
         4H0F/4E9td4tjem0oaw/45mx7BxOKC6otI3iLuB3UIzUMgAJTQtJl71O8wiGIUFJ6ym1
         krg30245MB6usMkt/ys4yjkCSnqQx8s8gfHuQkAycUtl5KdLPtOb1dt0O3jBVgW1Lk8s
         NgvA==
X-Gm-Message-State: ABy/qLYy1f1Kwe0/537rHqbiPYOsYap5Gx7/7RtIBkz4d0cRYaD53Eeg
	jNaFXQwoE9dgePUxjCVsVEYf4XIQKuZQ2QgXDzU=
X-Google-Smtp-Source: APBJJlEyHHuU3/LDywleOu1WrWAPrldwBsrLCMFI4BhUcLVzlPw/B5Kq1BdBjsBRSH5iNbgsryuq2w==
X-Received: by 2002:a05:6e02:1ba7:b0:345:7497:3cb7 with SMTP id n7-20020a056e021ba700b0034574973cb7mr2251845ili.10.1690268432522;
        Tue, 25 Jul 2023 00:00:32 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id b6-20020a5d8d86000000b00783634b9eafsm3752867ioj.50.2023.07.25.00.00.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 00:00:32 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-78372625badso274418339f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jul 2023 00:00:32 -0700 (PDT)
X-Received: by 2002:a6b:7e06:0:b0:783:6190:f913 with SMTP id
 i6-20020a6b7e06000000b007836190f913mr2051985iom.4.1690268431885; Tue, 25 Jul
 2023 00:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230724175839.675911-1-greenjustin@chromium.org>
In-Reply-To: <20230724175839.675911-1-greenjustin@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 25 Jul 2023 14:59:55 +0800
X-Gmail-Original-Message-ID: <CAC=S1nju8_KWG0v=JNh+v9LVBuEVDnnW5JCfbcySBLGEJAMvxg@mail.gmail.com>
Message-ID: <CAC=S1nju8_KWG0v=JNh+v9LVBuEVDnnW5JCfbcySBLGEJAMvxg@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
To: Justin Green <greenjustin@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	chunkuang.hu@kernel.org, wenst@chromium.org, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_000035_372867_FA909858 
X-CRM114-Status: GOOD (  11.68  )
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

On Tue, Jul 25, 2023 at 1:59=E2=80=AFAM Justin Green <greenjustin@chromium.=
org> wrote:
>
> Add a check to mtk_drm_mode_fb_create() that rejects any modifier that
> is not the AFBC mode supported by MT8195's display overlays.
>
> Tested by booting ChromeOS and verifying the UI works, and by running
> the ChromeOS kms_addfb_basic binary, which has a test called
> "addfb25-bad-modifier" that attempts to create a framebuffer with the
> modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
> EINVAL.
>
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Tested-by: Fei Shao <fshao@chromium.org>

Tested the UI and with the aforementioned binary on a MT8195
Chromebook (AFBC supported) and a MT8188 Chromebook (AFBC not
supported at this moment).

