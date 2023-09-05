Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1966DC83F3E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFHibJcCTrHc7UsLYmrMGzSLKGIb6u3hELCj6ZH9vKM=; b=U3aOFts4WSIJW4BN5zPjBGSK4c
	6PrnyfBLDjm5kV47xddCBG2++7ELv3R3vWXupOoYmK4C5lpkCWYuL3Ar5UNI6Vfu1hHYub+CyMm2W
	y2A9z6fhFtc0V5Z4yj+gzZ2u3BGxOMRIOFd+6Q5L1lqSVAki+kHoaXK9SdcFEN78gqKIXUnWBSQ2i
	e7YYFyzsDHcfzVsN/MtZly1zTx4O8jTkI2R9euAQRJ8YwqGG2j3HIUqysZA7Bp1FTOxgsHRdZA8wf
	XznOInAurm7YSMX7UZrJH+dFT3CM1GVjtN4+5aJlaWFm353exIkb+lhqlFsdfRI4JQSx0FH929JXK
	/IEItMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTxV-005srq-04;
	Tue, 05 Sep 2023 11:11:01 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTxS-005sqY-0r
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Sep 2023 11:11:00 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5731fe1d2bfso1241526eaf.3
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Sep 2023 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693912255; x=1694517055; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lFHibJcCTrHc7UsLYmrMGzSLKGIb6u3hELCj6ZH9vKM=;
        b=Qu3qp805opLDHa6S8SygLBfaSGv/lThRypdyD2Q17LEkT+Yl61XXjSUczlZCVLbX2w
         WdH6xMB1/1NHMg+qyKYn8OtMo/XutPSR4U/l8q1FGiUeVdavRnqASkcxrNk8xqIzzL6U
         3sIPCAL5jRfasKaT4GXtJgNUm8HhK1wgnXgI7kHTZx7L0hah1dhRGUz2gc2tR9b3TAxm
         ZgaGT0Z+J0a4Lyn/rM1/2uCFmfFoFSaXiHoy1YSKiwcvjx4CtjL7w1Gf4l+U1Akmk2SX
         Eq5GZhPZj8uRa5Rt4Emd8F8FPb4Aw63KZdP4H5boU5gJeFImkafo2nov2mtORBYYCCEd
         DWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693912255; x=1694517055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFHibJcCTrHc7UsLYmrMGzSLKGIb6u3hELCj6ZH9vKM=;
        b=RkPUz+gV/2xKloIBjJ1tXzwHbwvAXji/X7HqDMDutMzDvoWYMseq2yJ7n1qHM8ISPs
         Acm3U+Q1FdGCIsZsdZLLVU0XqH0yPIIKfpEArrJWEw2AGycN5GgQ7ege7P+Eb4iB1B7r
         e4/s3wAV602OPPw9XfU9yM5QijiEoPWNQIZ0Ug8BBEtpCRXYbZzkep7VA0LgZvKic4hW
         nvEPFkUSbMD9mVGNlfuI33shzb3kBuns7aR+7tPOsNa3yepvYdRHnT5CMOPOsLwxYUCO
         tKYNy9tz0Z2MgDTWMN35zS7eRyIYP+UQuTnUAkjPyG7i+qqDyliCE2dqBE1xzLyZIB86
         QRTA==
X-Gm-Message-State: AOJu0Yy1kJXL+v8oRedBmV0PzHu0bZY/kbdGO3u5uDCUizlz2okiq2cs
	8dYp86g+ucPbVYnrbE7ZkJGsItlbuTXPmxgXIceIYg==
X-Google-Smtp-Source: AGHT+IFo9xBi2/mp2LlaAKkJ92fJy9V9XtRAZ9XtjSlMoeM6e+JjrV7rskbJMCadKMIvoAvsNXEXvZjxBF6IQTrAKW0=
X-Received: by 2002:a05:6358:63a4:b0:135:24ed:5106 with SMTP id
 k36-20020a05635863a400b0013524ed5106mr8346763rwh.9.1693912255339; Tue, 05 Sep
 2023 04:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com> <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
 <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
 <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com> <2jz6wurh6ejbaejwtb5r5gukjuw4zs7ujk5hbwfpsn26o6esqe@g2nnb2gjpnjp>
In-Reply-To: <2jz6wurh6ejbaejwtb5r5gukjuw4zs7ujk5hbwfpsn26o6esqe@g2nnb2gjpnjp>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Sep 2023 14:10:44 +0300
Message-ID: <CAA8EJpoGoopP64T1nm1ye1ukTwT=u+LYY1ubQG-9dQ-j41iHiA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
To: Maxime Ripard <mripard@kernel.org>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org, 
	helen.koike@collabora.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com, 
	daniels@collabora.com, gustavo.padovan@collabora.com, emma@anholt.net, 
	robclark@freedesktop.org, robdclark@google.com, anholt@google.com, 
	robdclark@gmail.com, airlied@gmail.com, daniel@ffwll.ch, 
	jani.nikula@linux.intel.com, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, virtualization@lists.linux-foundation.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_041058_326662_070BDD1C 
X-CRM114-Status: GOOD (  34.38  )
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

On Tue, 5 Sept 2023 at 14:00, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Sep 05, 2023 at 03:39:33PM +0530, Vignesh Raman wrote:
> > Hi Dmitry, Maxime,
> >
> > On 05/09/23 14:13, Maxime Ripard wrote:
> > > Hi,
> > >
> > > On Mon, Sep 04, 2023 at 07:59:26PM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, 4 Sept 2023 at 19:16, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> > > > >
> > > > > Force db410c to host mode to fix network issue which results in failure
> > > > > to mount root fs via NFS.
> > > > > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
> > > > >
> > > > > Use fdtoverlay command to merge base device tree with an overlay
> > > > > which contains the fix for USB controllers to work in host mode.
> > > > >
> > > > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > > > ---
> > > > >
> > > > > v2:
> > > > >    - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
> > > > >
> > > > > ---
> > > > >   drivers/gpu/drm/ci/build.sh                         |  5 +++++
> > > > >   .../gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts  | 13 +++++++++++++
> > > > >   2 files changed, 18 insertions(+)
> > > > >   create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > > > >
> > > > > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> > > > > index 7b014287a041..92ffd98cd09e 100644
> > > > > --- a/drivers/gpu/drm/ci/build.sh
> > > > > +++ b/drivers/gpu/drm/ci/build.sh
> > > > > @@ -92,6 +92,11 @@ done
> > > > >
> > > > >   if [[ -n ${DEVICE_TREES} ]]; then
> > > > >       make dtbs
> > > > > +    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
> > > > > +        dtc -@ -I dts -O dtb -o drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > > > > +        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo
> > > > > +        mv arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
> > > > > +    fi
> > > > >       cp ${DEVICE_TREES} /lava-files/.
> > > > >   fi
> > > > >
> > > > > diff --git a/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > > > > new file mode 100644
> > > > > index 000000000000..57b7604f1c23
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > > > > @@ -0,0 +1,13 @@
> > > > > +/dts-v1/;
> > > > > +/plugin/;
> > > > > +
> > > > > +/ {
> > > > > +    fragment@0 {
> > > > > +        target-path = "/soc@0";
> > > > > +        __overlay__ {
> > > > > +            usb@78d9000 {
> > > > > +                dr_mode = "host";
> > > > > +            };
> > > > > +        };
> > > > > +    };
> > > > > +};
> > > > > --
> > > > > 2.40.1
> > > >
> > > > Can we use normal dtso syntax here instead of defining fragments manually?
> > >
> > > What Dmitry is hinting about is to use the "Sugar Syntax". There a good documentation here:
> > > https://source.android.com/docs/core/architecture/dto/syntax
> >
> >
> > With the below DTO syntax,
> > /dts-v1/;
> > /plugin/;
> >
> > &usb {
> >   usb@78d9000 {
> >     dr_mode = "host";
> >   };
> > };
> >
> > Decoded dtbo file is,
> > /dts-v1/;
> >
> > / {
> >
> >       fragment@0 {
> >               target = <0xffffffff>;
> >
> >               __overlay__ {
> >
> >                       usb@78d9000 {
> >                               dr_mode = "host";
> >                       };
> >               };
> >       };
> >
> >       __fixups__ {
> >               usb = "/fragment@0:target:0";
> >       };
> > };
> >
> > With the previous fix using fragment we get,
> > / {
> >
> >       fragment@0 {
> >               target-path      = "/soc@0";
> >
> >               __overlay__ {
> >
> >                       usb@78d9000 {
> >                               dr_mode = "host";
> >                       };
> >               };
> >       };
> > };
> >
> > Decoded apq8016-sbc.dtb file with the fix (setting dr_mode to host) is,
> > /dts-v1/;
> > / {
> >       soc@0 {
> >               usb@78d9000 {
> >                       dr_mode = "host";
> >               };
> >       };
> > };
> >
> > How can set the target to "soc@0" using the DTO syntax?
>
> To strictly answer your question, that would be something like
>
> &{/soc@0} {
>         usb@78d9000 {
>                 dr_mode = "host";
>         };
> };
>
> You can simplify this further however by doing:
>
>
> &{/soc@0/usb@78d9000} {
>         dr_mode = "host";
> };
>
> Also, that node actually has a label ("usb"), defined here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/msm8916.dtsi#n2322
>
> So you can end up with
>
> &usb {
>         dr_mode = "host";
> };

... which is the simplest and thus more robust one.

> All of them should be equivalent to the one you had in your patch.
>
> Maxime

-- 
With best wishes
Dmitry

