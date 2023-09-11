Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEAAEE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QeZPdiVCIBARaAlW5frnuN99j3rzp4a9OMhyKJX2M8=; b=zFwByvPISocZB0ErQfPm4WON1v
	yV+HUedRarVFwtULW54+F5581M06mJJO2grnHIvM1fV/wXXw7DLFsGJ8Tpf9o1eEDfsuTeOYhP+mN
	cD70xJhTvsfzIb83Sh1EXKrpTkOcbjfY9h/SFx9wItyDfkJlVpj7aiNNYWNXeTmHjLZYcvtE9bP+q
	jfxEr2NFPKO8LiY9c6r8VoPExSImo1+21SoIsO93Lg+KAi4xVtmIMQ+ogkzqmwJpCmY24B5UY1c0E
	xP/ndszgm3+Amea+Zl+Iw0j1y72Nn/loW2V1JTSCzpXzdHpQPNh1EyZs3urFFmoqe487vaf4OHh5V
	GgEnpMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjVH-000ygS-2h;
	Mon, 11 Sep 2023 16:11:11 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjVF-000yf8-09
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 16:11:10 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-502934c88b7so7332710e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694448662; x=1695053462; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QeZPdiVCIBARaAlW5frnuN99j3rzp4a9OMhyKJX2M8=;
        b=GUtY/rK6BhR8DmqtmuBWtstCVA/Nj09bcBVHZ2g0u4vvpJ01O07QrJskgO8K+IoeON
         7OY+pbdQQUhuGf53EvqcCzMC6ZKdiRaLoi+Xt0pDgWOuYgnlQ+LS5a1ENsmlXznCB3Sf
         nVEY1aITahEVtvOfK+1k2t8JOyd3O3ivOW2II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694448662; x=1695053462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QeZPdiVCIBARaAlW5frnuN99j3rzp4a9OMhyKJX2M8=;
        b=hLIbNpmnRWJgzPaxfHAacz9L7sEgm+QQT3dTlmBRirCkuaPu8XCH1BPXRsq/aTqXoV
         aAhjxUQwm0OsP3NwlT1vn76slHBSZLasjSyoTZVwCl+BlnGznqSLQFWhrukRf2pwQmqk
         DWbqReU371apZ1IC5fhkJknS+tow79Nl2/tEZZgp9n8CGA583SbRcYLmtZQ+gXua1yBt
         ayKwh2y7PY3/g3wi60kaMb9jS1kNzKipVc6H6slZPEEL3dA1ueLF8iGpnm7/anTb2Dzf
         LLo508+teim5YjzjcnPK++UQ9KuwtaKrwSnyRGURZN1l1iCkFMOKEupH2ubePbDZm4FJ
         uv4w==
X-Gm-Message-State: AOJu0Yz+OFt+fgMskXyz6eX0MsBQVVMtPuFnvXmF9Pyv9q4gz4S8WS9s
	8Qat+2/W9aa7cVbbspMNHgfx9yNCQe5c9Kv9aEu6Pw==
X-Google-Smtp-Source: AGHT+IFitij3Pl3MXW5qAy/2i+82MF50TSi4196GiLezn/haEu8BXRVQwamS82xBUz8pAxOqumQr4w==
X-Received: by 2002:a19:2d58:0:b0:4f8:6abe:5249 with SMTP id t24-20020a192d58000000b004f86abe5249mr7125644lft.3.1694448662346;
        Mon, 11 Sep 2023 09:11:02 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id o24-20020a1709062e9800b009a19701e7b5sm5553519eji.96.2023.09.11.09.11.00
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 09:11:01 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so21204a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 09:11:00 -0700 (PDT)
X-Received: by 2002:a50:9faa:0:b0:525:573c:6444 with SMTP id
 c39-20020a509faa000000b00525573c6444mr340372edf.1.1694448660156; Mon, 11 Sep
 2023 09:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid> <CAC=S1niYAC3PFQoAmwVc=1FcK29uu5sC9c1pGo-mku__y7eHcA@mail.gmail.com>
In-Reply-To: <CAC=S1niYAC3PFQoAmwVc=1FcK29uu5sC9c1pGo-mku__y7eHcA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Sep 2023 09:10:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VT8ZQkcLn4nsxCygC5SG16qYW5igFfwM762jEK42p12g@mail.gmail.com>
Message-ID: <CAD=FV=VT8ZQkcLn4nsxCygC5SG16qYW5igFfwM762jEK42p12g@mail.gmail.com>
Subject: Re: [RFT PATCH 05/15] drm/mediatek: Call drm_atomic_helper_shutdown()
 at shutdown time
To: Fei Shao <fshao@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, airlied@gmail.com, 
	angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org, 
	daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_091109_084071_EDB6B3FE 
X-CRM114-Status: GOOD (  18.33  )
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

On Fri, Sep 8, 2023 at 4:51=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote:
>
> Hi,
>
> On Sat, Sep 2, 2023 at 7:42=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> ...<snip>
> > @@ -952,6 +960,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops =3D {
> >  static struct platform_driver mtk_drm_platform_driver =3D {
> >         .probe  =3D mtk_drm_probe,
> >         .remove =3D mtk_drm_remove,
>
> I think this patch, and perhaps some others in this series, will have
> a trivial conflict to Uwe's work about the remove callback conversion
> e.g. [1], so you might want to rebase the series onto the latest
> linux-next.
>
> On the other hand, I tested this patch on MT8195 and MT8188
> Chromebooks and I don't see issues during boot / reboot, so
>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: Fei Shao <fshao@chromium.org>
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.g=
it/commit/?h=3Dmediatek-drm-next&id=3Db3af12a0b46888340e024ba8b231605bcf2d0=
ab3

That makes sense. I had based this series on drm-misc-next which
didn't have those, but now that a new -rc1 is out it then
drm-misc-next should rebase shortly. I'll make sure that the next
version includes Uwe's changes as much as possible.

That being said, I also wouldn't object if the maintainer of this DRM
driver wanted to resolve conflicts themselves and land the patch
without me needing to resend. The conflict is trivial, there are no
dependencies and no reason to land the series all at once, so landing
this patch early would mean less spam for the maintainer since they
would no longer get CCed on future versions. :-P Just sayin...

-Doug

