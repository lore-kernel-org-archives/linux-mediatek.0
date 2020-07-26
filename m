Return-Path: <SRS0=eMNs=BF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179CDC433E4
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jul 2020 14:33:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C9B20714
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jul 2020 14:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UaKQULY6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="cHvFGREX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C9B20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lyaQVfzUoRCFMlvbaPtFc60/q3RR/d7f/T8qOBqErMU=; b=UaKQULY6VODjXJ/FCYGJFTtnG
	lJ2hn3IJ7Zy3Vv9C947BSHkae096Mr8AL87iDH07ZAuM4fCvk8I9y08vhgGpjdS3OGVvox9w+BVRN
	oqMRmynacyB1ce4zZULbPy4KVzg8RypJh9J0TdffZO/05ejgEKGEKaiTgPM/rW/jtYfBAp6rSVVeM
	ivBMISZj7QsPl8J4Hiql7kN9G5+cK4uPndr0Sn5kpFXEd3K9h+WRxI8ahlleRKGK5BjDP8UCT+Cz+
	6t4/wCmnC6ZOLj8HcwvW6n9UkXLTf1zmMBVkmlZUw5QmjUuFGJs3Y1FkjwBL/bESHG96OoQNjbKg7
	G3XR8xmEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzhiX-0000MY-Su; Sun, 26 Jul 2020 14:33:33 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzhiW-0000MC-9g
 for linux-mediatek@lists.infradead.org; Sun, 26 Jul 2020 14:33:32 +0000
Received: by mail-ej1-x642.google.com with SMTP id a21so14468403ejj.10
 for <linux-mediatek@lists.infradead.org>; Sun, 26 Jul 2020 07:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h6PjDTHNbJzGCFM7oR6czVYevtbFuByjvgvxELkV44g=;
 b=cHvFGREXeIYAdMHGV9Us7B6YAzH1cpXsAofFEeZiU4bKarJ0bBTHvJIhRR5jkexoZv
 F39ZFNAKdNBkZ6tm4PeeiU0zKnBgEZqzV9vbbZ1n/pET7fnu1cADJcXvRGk7X4OXUMuf
 BHyoTH66YJ/j8KD4yjcjeqoyJdE1QIdELbga1xF/Go8WVWxCSHWBSKsfL3uHZjG/e4Sz
 qQe9fnJ4P4v8A0RV99gfJDVBWiCA4vGkmc2AfHQmGtX2vKg+vy2NyabllpDcZLJbZ8kT
 SCQZigjGxMehQ5WX5HIO+G9Kgsusa/Vk2bFi3zUphaq2R85opqe+kllXgbbserAFqLJW
 Xpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h6PjDTHNbJzGCFM7oR6czVYevtbFuByjvgvxELkV44g=;
 b=JX5+lpjRYoRs+9PQU1TC6p7wT3a9chytkEF9Tf8KgpdY9Cre16ef2H6x/ErAvhVbmn
 NNRcjhSzy0maRBdKuwIB8+0xe/oNASUKXrp/ZKCkGLohnf9VXgpJjynkoOOxw7qMtVNe
 bpznMBRDU4aRwuQv5LcwlBwqV0+mU9UR25i9STF3yjJKRk9ZoQvDMnlVlsEniSoNJry3
 plS9HcimByccb7AId8ueW+IEzVc2Ut6Sob3p2KBieNCwlO0VIbtMLZ3WhUMYrrXMDhAt
 EXZOy2CTa1wr78MWhub80Qqfn7P5mHzOHycYVywTkKy8+wigCv9zswRB24VnSPJ//x+b
 8jpA==
X-Gm-Message-State: AOAM532d3FiyFCg4F5frIeYc3I1FrBuDSih93yJkWcv1IVLHmldYdg3f
 YYzzDklQoLtbthBOghLUO0DA3E0l3u1oUEEO8EfUfw==
X-Google-Smtp-Source: ABdhPJy1W/4bjZ9ErvmYuBxoIGryOmP7jlkH2GYRNNSWZpkWHE1CIwV6bSkC7L0BGhUkfi3frU4HwDBBPvwDO8iOwMs=
X-Received: by 2002:a17:906:aed4:: with SMTP id
 me20mr8903155ejb.141.1595774010704; 
 Sun, 26 Jul 2020 07:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200520082723.96136-1-acourbot@chromium.org>
In-Reply-To: <20200520082723.96136-1-acourbot@chromium.org>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 26 Jul 2020 11:33:19 -0300
Message-ID: <CAAEAJfCzmEj3X2NdgaD=YSS_fV7MnZw=4o5KJOOSoMOSejv7=g@mail.gmail.com>
Subject: Re: [PATCH 00/10] media: mtk-vcodec: venc: support for MT8183
To: Alexandre Courbot <acourbot@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_103332_376148_4C990503 
X-CRM114-Status: GOOD (  18.17  )
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

+Enric

Hello Alexandre,

Thanks for the series.

On Wed, 20 May 2020 at 05:27, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> This series adds support for the encoder present on MT8183. It is very similar
> to the one in MT8173, but with different capabilities and using a new firmware
> interface (SCP, while MT8173 talked to the VPU).
>
> So this series starts with some preparatory work by putting the firmware
> interface behind a small abstraction layer instead of directly talking to the
> VPU, and by adding support for the SCP firmware. Next platform data is completed
> with features that differ between the chips, like supported formats and bitrate,
> before support for MT8183 is added.
>
> Alexandre Courbot (6):
>   media: mtk-vcodec: venc: handle firmware version field
>   media: mtk-vcodec: venc: specify bitrate range per-chip
>   media: mtk-vcodec: venc: specify supported formats per-chip
>   media: mtk-vcodec: venc: remove redundant code
>   media: dt-bindings: mtk-vcodec: specify SCP node
>   media: dt-bindings: mtk-vcodec: document mediatek,mt8183-vcodec-enc
>
> Yunfei Dong (4):
>   media: mtk-vcodec: abstract firmware interface
>   media: mtk-vcodec: add SCP firmware ops
>   media: mtk-vcodec: venc: support SCP firmware
>   media: mtk-vcodec: add support for MT8183 encoder
>
>  .../bindings/media/mediatek-vcodec.txt        |   9 +-

Would it be possible to add the support in
arch/arm64/boot/dts/mediatek/mt8183.dtsi ?

Given the driver is stateful it should be possible
for anyone to test it with standard userspace
such as GStreamer.

Is it possible for the firmware to be pushed to linux-firmware ?

Thanks,
Ezequiel

>  drivers/media/platform/Kconfig                |   2 +
>  drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  53 ++--
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  38 ++-
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 141 ++++-------
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 149 ++++++++----
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   2 -
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 228 ++++++++++++++++++
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  38 +++
>  .../platform/mtk-vcodec/mtk_vcodec_util.c     |   1 -
>  .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   1 -
>  .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   1 -
>  .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   1 -
>  .../media/platform/mtk-vcodec/vdec_drv_base.h |   2 -
>  .../media/platform/mtk-vcodec/vdec_drv_if.c   |   1 -
>  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  12 +-
>  .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  11 +-
>  .../platform/mtk-vcodec/venc/venc_h264_if.c   |  80 ++++--
>  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  11 +-
>  .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
>  .../media/platform/mtk-vcodec/venc_drv_if.h   |   6 +
>  .../media/platform/mtk-vcodec/venc_ipi_msg.h  |  24 +-
>  .../media/platform/mtk-vcodec/venc_vpu_if.c   | 141 ++++++++---
>  .../media/platform/mtk-vcodec/venc_vpu_if.h   |   8 +-
>  26 files changed, 711 insertions(+), 255 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
>
> --
> 2.26.2.761.g0e0b3e54be-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
