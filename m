Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D6DEB8FD7
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 11:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etW99NG5BvyY4SuRfU5lZu1cQhINWbdTi13Yac2QPgE=; b=f7Lz2ZyfpWZBWHuyHnX8Sr5Tba
	x9KkeJVStmKfAGOcQfy2h8wxa00fVlZrQMvwSA6BROQtojPTrp2WXn2e06lvi/Cf/y3fzkfhLE1Gb
	6L332hq4Lflas07iiY+yyn6kjJmX8wAUfdxE2JbEB27hvDZVcybLwBmYD69wWMK1fNlpidNhNLv1g
	GxoPAhfkPvhLKNdlL2qj7va8jgLZIRn6SpA2fUeIV9s7jQ8iGH7ogUC6pA5qBXCnPgk84CxRdWYWh
	+sFsSmzSj5YYCahxJnASuPegg0BU9joAZrFQUASg5GuV8GAih+OtlPn3XgVxsCREB5JnCJCbsL/cD
	JDcrhXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qea1g-00Di3v-35;
	Fri, 08 Sep 2023 11:51:52 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qea1d-00Di1O-0B
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Sep 2023 11:51:50 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-77ac14ff51bso72950139f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Sep 2023 04:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694173899; x=1694778699; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etW99NG5BvyY4SuRfU5lZu1cQhINWbdTi13Yac2QPgE=;
        b=Oy7m+zK8HyEIsOHJaHZvLQP20WIpdTWv4a8QFxo/Re0WHdKcDak0cTztq3acZjvwRK
         8gsYoa2RiD3GPJaIUUkfp0+c0sNneVAoGVd9GXByWp0tj9tRyB49OpZl2k2ymGNb3WsS
         ujIx3CQFPJ9SbJvq+BT38bV5/SoRjUZzxvDTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694173899; x=1694778699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etW99NG5BvyY4SuRfU5lZu1cQhINWbdTi13Yac2QPgE=;
        b=Onxq5q4LIKUUKDHRPOcTS09pLTdBK1+YS2o7H0aV/OG7F0HOOon5gnp+AqTW1rIl0Q
         lm+NEtoT7gDE+aEsvybvq6qcBMMYIPXDJHHrfCfyPWdgEWxu2K9cKwDsmK6Jxv1c71+j
         dtyB/hKINFFYql+Pni81D5ebXkInf7WvYIM3cmWypWSLc+RHzFP00myw1Dkaex0VL4/R
         sNbzHGNcizUU8/cWIsz2TuEk4ssbitSdE4NIfx1ZY+TUPktXxMCYFK7HCxhoMVVigb0g
         qyKXPUMTFfssb3OIS2VVE2tEWikiMgMBcMeMGDm8zLmX3yotmIG+jOeBTFTzTGxQVjDr
         l5WQ==
X-Gm-Message-State: AOJu0YyP/z/6EGiLSweLUOrtyBob8QiX2884ObucCwAxk7s3MHhH2bAM
	ZK1Sp6MC0GKk7dMOsFV5tdDvQ/9F1bI8F5aExo8=
X-Google-Smtp-Source: AGHT+IFxUY5Qi8kssEV6MTOIp9pD3zfZznUa6DAqPcU56/VD1XM78ZL1z8Zn+OrIbsPWkc+YqmlHKw==
X-Received: by 2002:a6b:5c0b:0:b0:790:a905:5fbf with SMTP id z11-20020a6b5c0b000000b00790a9055fbfmr2781666ioh.11.1694173899082;
        Fri, 08 Sep 2023 04:51:39 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id z10-20020a6be00a000000b007862c74cec6sm456563iog.1.2023.09.08.04.51.38
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 04:51:38 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7951f0e02ecso73922339f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Sep 2023 04:51:38 -0700 (PDT)
X-Received: by 2002:a6b:e60b:0:b0:791:280:839e with SMTP id
 g11-20020a6be60b000000b007910280839emr2660662ioh.16.1694173898001; Fri, 08
 Sep 2023 04:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org> <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
In-Reply-To: <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 8 Sep 2023 19:51:00 +0800
X-Gmail-Original-Message-ID: <CAC=S1niYAC3PFQoAmwVc=1FcK29uu5sC9c1pGo-mku__y7eHcA@mail.gmail.com>
Message-ID: <CAC=S1niYAC3PFQoAmwVc=1FcK29uu5sC9c1pGo-mku__y7eHcA@mail.gmail.com>
Subject: Re: [RFT PATCH 05/15] drm/mediatek: Call drm_atomic_helper_shutdown()
 at shutdown time
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, airlied@gmail.com, 
	angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org, 
	daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_045149_093495_EEA41C1F 
X-CRM114-Status: GOOD (  12.31  )
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

Hi,

On Sat, Sep 2, 2023 at 7:42=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
...<snip>
> @@ -952,6 +960,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops =3D {
>  static struct platform_driver mtk_drm_platform_driver =3D {
>         .probe  =3D mtk_drm_probe,
>         .remove =3D mtk_drm_remove,

I think this patch, and perhaps some others in this series, will have
a trivial conflict to Uwe's work about the remove callback conversion
e.g. [1], so you might want to rebase the series onto the latest
linux-next.

On the other hand, I tested this patch on MT8195 and MT8188
Chromebooks and I don't see issues during boot / reboot, so

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git=
/commit/?h=3Dmediatek-drm-next&id=3Db3af12a0b46888340e024ba8b231605bcf2d0ab=
3



> +       .shutdown =3D mtk_drm_shutdown,
>         .driver =3D {
>                 .name   =3D "mediatek-drm",
>                 .pm     =3D &mtk_drm_pm_ops,
> --
> 2.42.0.283.g2d96d420d3-goog
>
>

