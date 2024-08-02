Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66B1C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Aug 2024 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+sapha34Lxn3Kxqsm1snFFVFaOu7AQoIhw5OgcrrpE=; b=427oxoOHAA0dGjSRsYdPdTvl43
	C1j/pn6P+ZQZD1/zIafJ9iL9ynb3i4wUKX1ZB0ftm83Y0HcLE9PBj2Mi0QiNaVZkZWCpBGfYQCtiR
	MgPCd+1t6w+Pk6xEoabpqvA4Ie2j0+/PH+kVtU9lNYhM45MNlnTCO1k80OvwbuyG7KQMsbiL7x0BA
	FwBkjEZQJTUBuG19+ssXoW7sgfRKWHP6Jhgc1+4eaSj0bGmv5/2PPK2FiBEGCafDiCotuDXa1h/8z
	5kTLgFFfY0aNhXmmdNGzncuDMpLB7xcrhKb+1SZjCx61B8wa+Ncc+KUb7fVQKv3ax02kdSpQsVgRF
	6SEtwdFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmWW-00000007u2u-1umr;
	Fri, 02 Aug 2024 07:16:24 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmWT-00000007u28-0YfJ
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Aug 2024 07:16:22 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ef2d582e31so92129881fa.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Aug 2024 00:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722582979; x=1723187779; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+sapha34Lxn3Kxqsm1snFFVFaOu7AQoIhw5OgcrrpE=;
        b=XPXdTiAm/btI87yT3wvBAOW/rYiFtNSjKgiD0LLRsQAZFquHuqmgOgkkvjPLyBIIA5
         2z1TVsdiyBtUZPzIegFgKkE+iBOXfnhLxpMABAF2fL6jU5xQdeCE/NZXwJZMAv7/S443
         pa15jUQZOLBWfj9q54MOhTD4ziobdIc39BRro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722582979; x=1723187779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+sapha34Lxn3Kxqsm1snFFVFaOu7AQoIhw5OgcrrpE=;
        b=CwbIvAAmALXHqW8VAbuh9CjGSw+hp4SpnLEzFxM0+T7RX29nGkC+P1Q3/wqEOE+5Vw
         1BnKbmDQMiHybV7klYeX0dC5pBRnEAVTiN+SFTA/QfHYCUqAJjadUZ/zZh/rj80rJcH2
         r4owwtTLIRHMJmUxihZey//mw7nHxuH8OLJK2wzmGyrDAwXVQfgBaQ4G2X3TpGY0xNfJ
         dqjG3nbOh/0mOyZTIUq0rETVhZfFwLwUqiYGmXWBYVo265X72RKMNq+HevhnsXTNbw9U
         exxwc5dUqByljTz8XOzIWlqb7/ckLcTWgZ3WvcgPbRkJz074p0BpZ9wwkbyb8Vd3VhTj
         eFWw==
X-Forwarded-Encrypted: i=1; AJvYcCXwPARbNsbPYAz0HUj8oxiKuiMl4Ktgy+vKkPHADD9yL/OpGbxBrWxXzPb/nrbuNelVp9vhrUJyjpmUiP/PIIBzeN5DZETWAnWIP5dQSI9Xbe5A
X-Gm-Message-State: AOJu0Yx6Ror5GdiQJbg9O8NkUw73gdpbhycdlZNxthkuuXYcPZ5Cm7Dg
	xZrkb1CWRmt+6vB20NLNVNCWo15WmqT03eHmiEisu2zJCx/Xfh0c9mlQb0f1MeEzmPeXCWVTfCK
	g5i0KlsO+i78jxzTYi3hA62cTmCH3//4P96CwlymF1YxZKmA=
X-Google-Smtp-Source: AGHT+IHlBY9J6wgUSTXFPOTeGDo91vUxRviE1wDTIp9ZeLiUGJ8zLKg/jFuA/tu3qejE7r+JLa1Geqa6c47CZ1VZMic=
X-Received: by 2002:a2e:9081:0:b0:2ef:2ed2:25b1 with SMTP id
 38308e7fff4ca-2f15aaba811mr17537031fa.20.1722582978759; Fri, 02 Aug 2024
 00:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <38a703a9-6efb-456a-a248-1dd3687e526d@gmail.com> <y45w6ytynovupuiwky6atwonho7r3r2hx5mnwxdifh7xvh4nr5@jxssn6blkm5e>
In-Reply-To: <y45w6ytynovupuiwky6atwonho7r3r2hx5mnwxdifh7xvh4nr5@jxssn6blkm5e>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 2 Aug 2024 15:16:06 +0800
Message-ID: <CAGXv+5EkZCDT4LGvSGqHmHu7SmnH+63WE4A=ZKgB4MsBJAsHYw@mail.gmail.com>
Subject: Re: panel-simple-dp-aux: "DP AUX done_probing() can't defer" on
 MT8186 w/ Collabora kernel
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Alper Nebi Yasak <alpernebiyasak@gmail.com>, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_001621_216199_DF25FB05 
X-CRM114-Status: GOOD (  20.71  )
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

On Tue, Jul 30, 2024 at 7:24=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, Jul 27, 2024 at 08:33:10PM GMT, Alper Nebi Yasak wrote:
> > Hi,
> >
> > I have a MT8186 "Magneton" Chromebook that I'm trying to boot a kernel
> > based on Collabora's for-kernelci branch [1], using a config from
> > postmarketOS [2] (intended for that), on a Debian sid installation.
> > This sometimes fails to enable the display with:
> >
> > > panel-simple-dp-aux aux-0-0058: DP AUX done_probing() can't defer
>
> The error is caused by mtk_dp_edp_link_panel() returning -EPROBE_DEFER
> (most likely because something is missing). However this callback must
> not defer, it's called at at a different point.
>
> The actual issue seems to be in these lines. The callback tries to bind
> all components, however it should not as the DPI isn't available yet.

My guess is that I upstreamed an incomplete external display pipeline.
The pipeline is still missing a representation for a mux that routes
the signal to either the left or right side type-C port.

I will send a patch to disable it.

ChenYu

> [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc/dpi@1400a000=
 to encoder TMDS-32: -517
> [drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
> anx7625 0-0058: [drm:anx7625_link_bridge] *ERROR* fail to attach dsi to h=
ost.
>
> >
> > I know this is a weird out-of-tree combination of things but I've been
> > asked to report this on the mailing list by wens on the #linux-mediatek
> > IRC channel.
> >
> > [1] https://gitlab.collabora.com/google/chromeos-kernel/-/commits/for-k=
ernelci/
> >
> > [2] https://gitlab.com/postmarketOS/pmaports/-/blob/master/device/testi=
ng/linux-postmarketos-mediatek-mt81xx/config-postmarketos-mediatek-mt81xx.a=
arch64
> >
> > Serial output from the system starting with dmesg and some more info co=
pied below.
>
>
> [trimmed the log]
>
> --
> With best wishes
> Dmitry

