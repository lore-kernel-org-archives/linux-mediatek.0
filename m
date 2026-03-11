Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E593FD88F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 04:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csAuxU4WY1Se481wrqRHAT1G6rL7KDqCbNJuB1aP/kY=; b=Q3qJ3Q7j4JWBf4JFgj3SPhFp0c
	M8lb6i63ltOrrqTL5goC9A9UjBq6pz1Q6ybU10v6dkdMSalDiaUveXrEBr9VL4x/gJc7upVtMQDVW
	v8IFVMl3tk//2E1tQpsqCKIxDIt1LNnDOLHI/r+1gjlqbEOgt3wGjKyoekSA+7HUNyu3Zk1BjimUh
	tV14wNiDXqLXbqojsyCqrTeCfvBrI6d7S6S+XHM1668CptlUJ5+CJ4q1Az39p36ClJtP9eM4hjh8L
	S5Lj2W3c4FF4WzJq0noS5F4Tk1km4369X5wVJy49iur0AOzpS4F6Mv1GOECg4jJlgi8jY8U2qEKDI
	8jPwHpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0BbU-0000000Ajdu-2Cn3;
	Wed, 11 Mar 2026 04:55:28 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0BbR-0000000Ajci-1sjA
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 04:55:26 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59de8155501so8169457e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 21:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773204923; cv=none;
        d=google.com; s=arc-20240605;
        b=h2PoiNmR8x1Z5H24AvJQnzpyFDPsvmjdKZnu6wQ/7Oj/wXsvGMNXiI/5wCm9ltmjUb
         eW2V0aSj1oDgRjgCNwgXfZxO8FBhGvf8bsZ3CZMMLIpMZJKJKv0nDRbPWSuqPGi4SaeG
         +AQwmirUUcJS8G1BPvvdiCRMJbWRriImwET0+vRsXQ02Ka4REIMPETKJnM33ROF3Z3X7
         o3Qo6dpJeRavz4dFJCwRIRXmlakB7ZfEcw13JUKEMTcWChLatdYyJlaFRP2/jmRpTBXB
         +O7KjEYM8DWpd2RnVjaTauqw7VfIStTigquEVPU3PjDw9iq32HIStdm+K3qDRDRJvA6s
         7DvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=csAuxU4WY1Se481wrqRHAT1G6rL7KDqCbNJuB1aP/kY=;
        fh=UNIy2mNSgaBNLbOcxfYCI0aRPKPFkmlht6cziOIoDBg=;
        b=hcfWbs+old1QtO8Pf96R5I2sph8FxQC1k36ibg/6A+X3VXkYgqnO0BQpy+yAYi3u1d
         Ktnfzu+9jQBp5HulKeLfPMeBPzk63dG+bGT4efliXWvJc2IUWO5GBtenb7C0goCIGP9m
         Y1P7zkJE8NsuA/8YndMDz9luBgjtEaRiuxNnl8EY2VuurgCYFSBk2Qz3dCggx9hdbx3n
         xRKR3Bk48WtzQYM6GBGBrBRtYa8qA40uXN7Z4ORLQya4+WQMhWMZSfyG1rizRNs2rSGr
         7EhSoTXY0Atq0mq4DbQAPgpVuwkQRIzn+Jyc4QpGKBKQOxNlDO2x2uTeBvWmFsC38YKo
         kRCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773204923; x=1773809723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csAuxU4WY1Se481wrqRHAT1G6rL7KDqCbNJuB1aP/kY=;
        b=kZAdDF3GZh8whYQe8EjvyMyBgSfepbwkxXMAHva8ufIzMKd+QzomJHNRd9RVrz5pij
         /GK7ILWK7kfSx5wXMJBD1Y8jfALC25wU0mF0yoDDIoznHRfqz3P9dtAvP1AGglBiVAZr
         wziPkskhq3L9rhU4kxYXmW+FxO2k3dLRvY0Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773204923; x=1773809723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csAuxU4WY1Se481wrqRHAT1G6rL7KDqCbNJuB1aP/kY=;
        b=B6vVQA4DQH/MbWVeDzjsc+GAoW2DUr5LTBtR1GSimLA0oespMZIIFmb497Dy17bSJ5
         pmYh6EPQmlSyQYU56TK45UfYMNuK+VjxS+Jz24ZJOjO+ziUCK1AwvbTrcWyvY/4d0wzF
         iJ+imTNSkFcr9j+jRliAksQzqAewInzYcy10CxmKpXWTpIdnJd3tEvVp5bLU1Va9q4k/
         X5T1k47Ni0T0knbgHADqP5/pt+lv3TkCc5w8tYToPl4LTWq1nkh7NqH6GK3iTOWJ6tp1
         9q/WcRStznI0J46CE40iJ1DGSAwam0fGmeDSug4tkl7V3QBu9Wm99PccVh9MioiUGq40
         x/VA==
X-Forwarded-Encrypted: i=1; AJvYcCUmMgFryeFUIRIN1xJsQ2E4nilI8VZ0rohLaeSFRRIchQ6gAKrXk/YVeB21wYiiWrse3TbsrG4MiXD1PdFEaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4JI41V8rL9OyMuQLNz/b9Gm7N4V1s965RhndECdGPwXcuN1u/
	aUntKIH6cEubUfYJym4mSN7oLoMF6Lln9jyzaZ0Y/rILLGusJDWxbVTdjPao3duZROynZL14OzV
	mNAUQhzKhzLZHl5r/us1wqitHXDmSslhC5/+aRDq1
X-Gm-Gg: ATEYQzxxOsoowvyjDoPTutY6hkweh94ujx1P4U6JYw5MLH3XUJrTr3KXAYAuTz0tdBz
	bK4UZdlOPIZpCanyAkMod2KW4k2FYbGv8MXS+pTYiFGABeFJm1Mk/XcRtz1dUL528AOBlKR4Pk9
	jJVeYeSVlHtCh8qa1ot58WsiuSRhyEFT1GYGzzXEWOE3iPr98vPOoUEXHwSHW/cKOZs/bWFYH9/
	S4ApV635QvlknpmgmLbVll2++LU3uLEzw9fRq+O2FJpV5DtqP5CpFtP6QH5SBGNQvHoEl2I3W8Q
	or7Oufxtcrqt8JfBXY8Odfv/z908MOFBUE0hcA==
X-Received: by 2002:a05:6512:619:b0:5a1:3da6:3587 with SMTP id
 2adb3069b0e04-5a156bbdbc3mr242495e87.16.1773204923158; Tue, 10 Mar 2026
 21:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260310032511.2545500-1-wenst@chromium.org> <20260310032511.2545500-4-wenst@chromium.org>
 <b2acf78f-4ff9-4e3f-802d-5318e6f25c20@suse.de>
In-Reply-To: <b2acf78f-4ff9-4e3f-802d-5318e6f25c20@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Mar 2026 12:55:11 +0800
X-Gm-Features: AaiRm51TX-eh65P-jmgUubiAbXiGD5qlFS3vQBfHYDDCC5yEHtzRczjcYjc_Cmg
Message-ID: <CAGXv+5HJKjM77PdZjwUossTzrPx+LvgVaS=-sGcGNec77TJLzw@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/4] drm/mediatek: Set dedicated DMA device and
 drop custom GEM callbacks
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_215525_663380_56F2FD32 
X-CRM114-Status: GOOD (  31.45  )
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

On Tue, Mar 10, 2026 at 4:21=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 10.03.26 um 04:25 schrieb Chen-Yu Tsai:
> > In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
> > use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
> > drm_gem_dma_object, but custom callbacks were still needed to deal with
> > using the first device of the pipeline as the DMA device, instead of
> > the MMSYS device that the DRM driver binds to.
> >
> > Turns out there is already partial support for dedicated DMA devices in
> > the DRM subsystem for PRIME imports. The preceding patches add support
> > for dedicated DMA devices to the GEM DMA helpers.
> >
> > This allows us to just set the dedicated DMA device for the DRM device,
> > and drop all the custom GEM callbacks. Also drop the .dma_dev field
> > from the driver private data as it is no longer needed.
>
> My impression is that this patch should be split up: first replace
> dma_dev with the dma device; then replace the now-duplicate code with
> shared helpers.

I'm not sure which of the following you are thinking about:

a) one patch with just the drm_dev_set_dma_dev() call,
   one patch dropping the custom GEM callbacks

In this case the first patch has no actual effect, since nothing is using
drm_dev->dma_dev. I think this is not a good split.

b) one patch adding drm_dev_set_dma_dev() and replacing priv->dma_dev
   with drm_dev_dma_dev(),
   one patch dropping the custom GEM callbacks

In this case the first patch would modify a bunch of places that then
get dropped in the second. The churn maybe isn't worth it.

c) one patch adding drm_dev_set_dma_dev() and replacing
   drm_gem_prime_import_dev() with drm_gem_prime_import(),
   one patch dropping the custom GEM callbacks

Functionally the second patch would depend on the first.


I still think having one single patch is better.

> > There are slight differences in the mmap helper: the VM_DONTDUMP and
> > VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj()=
.
> > VM_IO probably doesn't make sense since the buffer is allocated using
> > dma_alloc_attrs().
>
> We can add VM_DONTDUMP to gem-dma's mmap helper. [1] It's most likely
> the right thing to not dump graphics buffers and standard practice in
> most other GEM memory managers.

Makes sense. I can add a patch to the series to do this.

> [1]
> https://elixir.bootlin.com/linux/v6.19.6/source/drivers/gpu/drm/drm_gem_d=
ma_helper.c#L537
>
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> The changes look correct, so I'm here's the
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> But this patch requires a review from the driver maintainer as well.

Sure, and I need to respin the series because I forgot to remove the
deleted file from the Makefile.


Thanks
ChenYu

