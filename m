Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED86EA3F35
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t12lxM+brFyq0KY7Nz/qV0/1FHoQ9NnONI3XMskNk5E=; b=wIWNQ7Tg3Vbu6sOQUfY+2yruBq
	ahaP+xHjVgvOXTSpwhcSlZdGuVXT7sZoccRcE7QSCn6x367H31ZZrfgUkp0hWmGhdP0jc781E3kUD
	2r0+I7Y495ukzPK0dNsWshJKcVirY7L1DvaoOnrgVXPKTw9BH+mx/TKUnsaGqsyURZ7M6JgwUuxKe
	XBi49WI8DFjt4OAkqjBrwds0sL7aF52TEbz1kr0WEOI3THHM24nSpgzWqEhmasbthSnzPOn3e3Ll9
	qT3Vc/u0Zj8mfyUeWKSntqdD2dRzroqqmqbIHFeri9JCglCnyCxInMbEj2v1KyCY8Yb2aXu1Sk4md
	5xi+K0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkSf-0000000Gmqg-1FXJ;
	Tue, 10 Feb 2026 09:55:13 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkSc-0000000Gmpi-1yVo
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 09:55:12 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-385c6c727fcso43466681fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Feb 2026 01:55:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770717308; cv=none;
        d=google.com; s=arc-20240605;
        b=JokyPjwsA4NOUo+ecI/PHFu8qDsKHcTvb1Tn6qaniIqq7YeTuEdX/UOXGksGLqvoTN
         8BHas1/1MSkMrMmaeX92K44QBaIItkTFaetH2rYh9dMtISuVcTMSKFXkEZOnnOOkOjHa
         yJeEUyfYpkNsbwClR+of5zrptaMgMtKbUJ4rEnsXqXRCwA1qicBlq3VglAO/f1tl9YFA
         NvrCOI0EmXuAsGM/juDHgLeevsWMrk03cFovJklzO9Zc8Vlo+gCNiuWiBTYqZImdi6iV
         xort1HwDRVFmgothwtSRuXiCR3Zx9EKPSWllNM6gF68YxAMBLLQifVTwVZLu8rQBM0Cu
         PR/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t12lxM+brFyq0KY7Nz/qV0/1FHoQ9NnONI3XMskNk5E=;
        fh=o3oX4T/kdWEpJ4AfueA1kviJjRHm1RlIbak+KiD9F7A=;
        b=BEVWqECCJolNNsO42eWjqL41fza8OoW5M0R1wh1FUtqNvKdt4plWN2PBDhrIIRYZDX
         hl6tw/SaMek/bqbamJLIelLu2KOVq9I6ygAtl7mkWKvLTw79xP122jM6qcLAS7wBeL9i
         tfgNPRsU6aLvCkE83n7SggluUIuwmz9TFm7+rkk1RV68wT9PLOnz3iENiqdmtKQ2lHsr
         6hhcwWSWQPMmMX5yN1CPup/VgusOo1YGWai2L8Jrqljh1Su/0ypq63gTAvnYSzniLVXk
         0zlt1lrF4J4DO9C8taPiFLdKIB8kPtIQe0geu+QwDx2hZuEIPQQSkEKNJiqpu4B20kSX
         lYvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770717308; x=1771322108; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t12lxM+brFyq0KY7Nz/qV0/1FHoQ9NnONI3XMskNk5E=;
        b=Lrw60HJD0O/qDsruRs+RA+frIxWkrSRwFhU3D6AK0G1p2t9VNUnsjv+7+X/eHi/WTR
         KCn7oZe9Jarp2Z4NwT9DjELYhT68T5tCWIgkpqiyRfp/K+Q8gXLcPwDj6nXQyoLG9s70
         C66O/oIkTweJqyr5PFp2mBHsJzuVoDwrtoDnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717308; x=1771322108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t12lxM+brFyq0KY7Nz/qV0/1FHoQ9NnONI3XMskNk5E=;
        b=Qun56xYaLUdMcYEvAkR0ZyeJRpA8wcJAS/zE5uPf9GSXJEMVoDC0JZD6Vp8FAVVKFZ
         wqDAR4d6QQONntzvKmVeR0jwowQeSlBDwXup5m3+uUEVrvWUetWNihoM0iURNVmmbcqg
         9h7guhRrkprcqEkEO6zRMEseAo6SXavfmFVqC0yih8Zr+pQZyeuQoi8m4zFyNHcqVCnd
         Hn/eZCrZa8kzSXeyLWmZJAxrxmCaKyGlXV4/r2K/KJc8WG1AOE2cgtr0PLfV5ZrZC7Bj
         Az+D9UT3R+23RuFC0n9mXUNKbL8gXFKDERwr++UuE9QK/X0X9+itEWZzx1TUhSzdgs7b
         F0Mw==
X-Gm-Message-State: AOJu0Yzy4I6Y05O5JB7d/b8ZS9H19tWzBOpWfb2Ugv990HN5yda7B325
	7XvCmdtBFlJxJ0zSz31XpUWb2GGIszpvkKfSWsaymZJJwrwLhNK3AnDICZsP8khN7rq1svYgVQJ
	Sky8lgxO0uuP2PdGUw6lrVv76xjKUFvNM9p1ctQqP
X-Gm-Gg: AZuq6aKKNOPpieBkmb+fv8fvKX/3kEch2SrByDQRa7vwr6bJYfo74ED7PDAp55hxLjT
	aCICbG57S0LoTDDE36HNyAU1QummRPJGIk1+hmijDhPNqMmCG9FHkb/gTyqLptrmWKdg+bwhKDD
	LTwxXsRcbBhAlbqcT6oCHYlME6k5iTwcR3Us60zDhFU6k4Ywlxt/fOl+ZXRNx0B/eHY5bFtTHwM
	7rwqhFscT++nHmGrxkNmmDk80MlAse1aWHesJVRi8ChUJTMyPv0dW+BUPOKE1wVjZtORBXAyZ3t
	Wo3i8zcABmdq3GbqKR1mJVUWyQ004OwMgJA47A==
X-Received: by 2002:a05:6512:32c8:b0:59e:24e5:a3a5 with SMTP id
 2adb3069b0e04-59e55bd0c28mr479672e87.29.1770717308202; Tue, 10 Feb 2026
 01:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20260210093333.5112-1-l.scorcia@gmail.com>
In-Reply-To: <20260210093333.5112-1-l.scorcia@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 10 Feb 2026 17:54:57 +0800
X-Gm-Features: AZwV_QhvCuo8DxUPuUh7S4r_8wwpmJqqu_YbBa1qxu1eyMYPq5mPl5vB5s7VIBQ
Message-ID: <CAGXv+5Ep+YGsqZqWB3HXES07sFw8YtoTEPDxkq1yHQPJpFDTUw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/mediatek: Remove all conflicting aperture devices
 during probe
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_015510_615372_C7107461 
X-CRM114-Status: GOOD (  32.21  )
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

On Tue, Feb 10, 2026 at 5:34=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> If a device has a framebuffer available it might be already used as
> display by simple-framebuffer or simpledrm when mediatek-drm is probed.
> This is actually helpful when porting to a new device as
> framebuffers are simple to setup in device trees and fbcon can be
> used to monitor the kernel boot process.
>
> When drm-mediatek loads a new fb device is initialized, however
> fbcon remains attached to the initial framebuffer which is no longer
> connected to the actual display - the early fb is never removed.
>
> We can gracefully transition from framebuffer handling to drm-managed
> display by calling aperture_remove_all_conflicting_devices as we probe
> mediatek-drm. This takes care of unloading other fb devices/drivers
> and disconnects fbcon which then automatically reconnects to
> mediatekdrmfb as soon as it's available.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
> This patch has been tested on Xiaomi Mi Smart Clock, however
> I'd like to get some feedback from more knowledgeable people,
> especially about those points:
> 1. Is aperture support on mtk-drm desired at all?
> 2. mtk-drm does not know about the fb address therefore as far
>    as I can see we can't use the more specific function
>    aperture_remove_conflicting_devices. This means that all generic
>    aperture drivers will be unloaded. It might not be a real world issue
>    as I can't see why one might want to load mtk-drm while keeping
>    other aperture  device drivers active, but my experience is very limit=
ed.

This is pretty much what all other platform drivers do. So that's fine.

> Thanks!
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index a94c51a83261..17e45b93fe49 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -4,6 +4,7 @@
>   * Author: YT SHEN <yt.shen@mediatek.com>
>   */
>
> +#include <linux/aperture.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -1116,6 +1117,11 @@ static int mtk_drm_probe(struct platform_device *p=
dev)
>         if (!private->all_drm_private)
>                 return -ENOMEM;
>
> +       /* Remove framebuffer owners, this will release fbcon if active *=
/
> +       ret =3D aperture_remove_all_conflicting_devices(DRIVER_NAME);
> +       if (ret < 0)
> +               dev_err(dev, "Failed to remove conflicting aperture devic=
es (%d)", ret);
> +

I believe this could be in mtk_drm_bind() just before drm_dev_register().
The idea is you want to kick out the existing framebuffer as late as
possible to reduce the time the screen is unresponsive.


ChenYu

>         /* Bringup ovl_adaptor */
>         if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_DRM_OVL_ADAPTO=
R)) {
>                 ovl_adaptor =3D platform_device_register_data(dev, "media=
tek-disp-ovl-adaptor",
> --
> 2.43.0
>
>

