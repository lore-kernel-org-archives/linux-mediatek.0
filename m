Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFCEC433FB
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 09:06:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEF0320714
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 09:06:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rqC4ccaz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mQkzamoG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEF0320714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VANbzkP082QhlCJcS68kt/IItDFeflvAhDniRDzvDSY=; b=rqC4ccazkrPH9+7OPKoB2CBwE
	sOpaav4bzSuru/1RDo8myofMzrRWqm5jA829XRY3WB62NSKjoj7uemuTQNshe7j2LReN0OZYVjXRT
	xaxBWm+wjU5ENDMI5GJagVVuUj8sqBTBO5XT4sx7W8Ar5w8fKoNalqdS7AVA1EGp23+qq+vdy7/8Q
	RWb5/JEpzlRwXWWs1ebPbsrWVtY/RZeJqMEPJCjvklkDVLkC50MWoOX5YC50kqJpR//qygAoPpNWo
	CdQvIniJbUa947ARxxaIg7CdgAx2Y/EldHLJXDSJplwOct/y+H6LPB3cZkHOtBcYB32VsIAQYCYc9
	MImsVaW6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzz5m-0005f3-Ra; Mon, 27 Jul 2020 09:06:42 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzz5l-0005bd-0L
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 09:06:41 +0000
Received: by mail-ot1-x341.google.com with SMTP id l27so4629404oti.3
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 02:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bRIWnJYbdw6ZlkOW0iyNPITiiGcd1fenkAUWmQ+sE+c=;
 b=mQkzamoGG2dJfrAkjk0RKvKMPpFeaWFlnszQshNFpdCSSF7MnRaCjZ14VBeze06yzw
 npw+5Pn347bv4kmoDhRBKi42GpVBDUZuBYgfQ5tew4zulPGRXCYyMyfvjKZCZ5Kfvn8e
 T/Lc84X6+iufeU6MltcS4k9M4xhAtOWelCdSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bRIWnJYbdw6ZlkOW0iyNPITiiGcd1fenkAUWmQ+sE+c=;
 b=ZxE4XCdqnIMROEQYWT5HxbDIVACO8KgaTR2cKVLanPoUsnqE0iuBu58zMX8taZQyaZ
 nix2aSqObVXD7MAlCFZzJVrvTBnVfUc2K0faQP7tN3Bk5kb4O3/kWGUkEsQvL5BjCkSy
 0yxO8GcbUZG3sypKk/VyfaNPcOUwZNiNuikf5ee/yOo0Ul1E/tv2HZkTQszqfrCMwIBS
 hvQxD6RWiULv9jHsZ3+UihelXTosiCm0OihLnch2nWFTea65yNkW2x7gd+lZlE25Lt9x
 tVT5cYFTASLB4rd78YoYwUebL8qNeJmGWtLWnVNnM+OXxKb7Jl62AqVUeES0qrJAoTO+
 ZErw==
X-Gm-Message-State: AOAM532MvgBb3dwq1CoNW4YWSpzqM3TuPFYuojUonb7ZTWeepxOZr9hF
 pioxDP4M2/oqXjt7rAU5KOeydRmpIiM=
X-Google-Smtp-Source: ABdhPJxftyajJsMhv+uy7KWrQmX7gEK8aC9uQ4UkBsOf2NYUNJz6SCA+8R4FzsvqW8Y4wwxZQy7qMg==
X-Received: by 2002:a05:6830:1dbc:: with SMTP id
 z28mr18606241oti.246.1595840795145; 
 Mon, 27 Jul 2020 02:06:35 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
 [209.85.210.54])
 by smtp.gmail.com with ESMTPSA id r19sm3222366otn.28.2020.07.27.02.06.33
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 02:06:33 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id h13so11820584otr.0
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 02:06:33 -0700 (PDT)
X-Received: by 2002:a9d:5609:: with SMTP id e9mr18647732oti.141.1595840792802; 
 Mon, 27 Jul 2020 02:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200520082723.96136-1-acourbot@chromium.org>
 <CAAEAJfCzmEj3X2NdgaD=YSS_fV7MnZw=4o5KJOOSoMOSejv7=g@mail.gmail.com>
In-Reply-To: <CAAEAJfCzmEj3X2NdgaD=YSS_fV7MnZw=4o5KJOOSoMOSejv7=g@mail.gmail.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 27 Jul 2020 18:06:19 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUg9ua0gi8c3HSg-GOV=Akyp_KfhpWBZizvmxhc5QcJqA@mail.gmail.com>
Message-ID: <CAPBb6MUg9ua0gi8c3HSg-GOV=Akyp_KfhpWBZizvmxhc5QcJqA@mail.gmail.com>
Subject: Re: [PATCH 00/10] media: mtk-vcodec: venc: support for MT8183
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_050641_065526_3D94AB47 
X-CRM114-Status: GOOD (  25.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hey, thanks for the review!

On Sun, Jul 26, 2020 at 11:33 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> +Enric
>
> Hello Alexandre,
>
> Thanks for the series.
>
> On Wed, 20 May 2020 at 05:27, Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > This series adds support for the encoder present on MT8183. It is very similar
> > to the one in MT8173, but with different capabilities and using a new firmware
> > interface (SCP, while MT8173 talked to the VPU).
> >
> > So this series starts with some preparatory work by putting the firmware
> > interface behind a small abstraction layer instead of directly talking to the
> > VPU, and by adding support for the SCP firmware. Next platform data is completed
> > with features that differ between the chips, like supported formats and bitrate,
> > before support for MT8183 is added.
> >
> > Alexandre Courbot (6):
> >   media: mtk-vcodec: venc: handle firmware version field
> >   media: mtk-vcodec: venc: specify bitrate range per-chip
> >   media: mtk-vcodec: venc: specify supported formats per-chip
> >   media: mtk-vcodec: venc: remove redundant code
> >   media: dt-bindings: mtk-vcodec: specify SCP node
> >   media: dt-bindings: mtk-vcodec: document mediatek,mt8183-vcodec-enc
> >
> > Yunfei Dong (4):
> >   media: mtk-vcodec: abstract firmware interface
> >   media: mtk-vcodec: add SCP firmware ops
> >   media: mtk-vcodec: venc: support SCP firmware
> >   media: mtk-vcodec: add support for MT8183 encoder
> >
> >  .../bindings/media/mediatek-vcodec.txt        |   9 +-
>
> Would it be possible to add the support in
> arch/arm64/boot/dts/mediatek/mt8183.dtsi ?
>
> Given the driver is stateful it should be possible
> for anyone to test it with standard userspace
> such as GStreamer.

Certainly.

>
> Is it possible for the firmware to be pushed to linux-firmware ?

The firmware is already there:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=3c213aa59661c4641f0c2166a315140ac0445230


>
> Thanks,
> Ezequiel
>
> >  drivers/media/platform/Kconfig                |   2 +
> >  drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  53 ++--
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  38 ++-
> >  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 141 ++++-------
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 149 ++++++++----
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   2 -
> >  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 228 ++++++++++++++++++
> >  .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  38 +++
> >  .../platform/mtk-vcodec/mtk_vcodec_util.c     |   1 -
> >  .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   1 -
> >  .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   1 -
> >  .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   1 -
> >  .../media/platform/mtk-vcodec/vdec_drv_base.h |   2 -
> >  .../media/platform/mtk-vcodec/vdec_drv_if.c   |   1 -
> >  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  12 +-
> >  .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  11 +-
> >  .../platform/mtk-vcodec/venc/venc_h264_if.c   |  80 ++++--
> >  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  11 +-
> >  .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
> >  .../media/platform/mtk-vcodec/venc_drv_if.h   |   6 +
> >  .../media/platform/mtk-vcodec/venc_ipi_msg.h  |  24 +-
> >  .../media/platform/mtk-vcodec/venc_vpu_if.c   | 141 ++++++++---
> >  .../media/platform/mtk-vcodec/venc_vpu_if.h   |   8 +-
> >  26 files changed, 711 insertions(+), 255 deletions(-)
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
> >  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
> >
> > --
> > 2.26.2.761.g0e0b3e54be-goog
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
