Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0853C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 18:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2xqEhMxycEjBhjY+SW2f/ptZbLRut2nqnKv7AhHTsU=; b=M5AQ6XWs8/LeyOfk2XLePp0lKt
	iydUTfryPDfE/lrRiot7I2+d9k8K8lNZmStuHCYh2eec/mmUsbN5TD7C9QV0gPOrK7RgSOg4OIFQ9
	Lf4bX20XdGgV2jQZ5slKhGrfn9OMtGpwHb+waeWekK+wM2y0o5R5oHqQO6w61uSknuvQ1wX2NdfCq
	o+kr2s33GZKRwRKjVvKX8/jCTJREUV3JX8x9ZInV4IX0Fn5SGsHpPiJo2wdyJihT7mfzCv2uHJK/4
	L+c0c+Csr6TbKcK1eEWRRkppHMEoo2gONVh1gX4E/BMQjVDcVPOeOM48QHV7GjwE8mK8j5wm35yC5
	pChEe1IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5MV-0006ht-2Q;
	Thu, 27 Jul 2023 18:05:19 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5MT-0006gm-0c
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jul 2023 18:05:18 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-267fc1d776eso742129a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jul 2023 11:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690481114; x=1691085914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2xqEhMxycEjBhjY+SW2f/ptZbLRut2nqnKv7AhHTsU=;
        b=BZzGlAWaLN5HzAW0XQoq28j6w1Sd0mVR9E9rCB2BXq81DJU+6GNDieYgwG95A4pu7n
         7cl2TKUTvki8cFM+SlUQsUCHau7L/gkOluxxHfWkkcT8WTaR3BMpfRd+deNpSbp+NODQ
         tnQMd1rUlE/o3Ac2n3M+u7r8fOsiqwRagjNk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690481114; x=1691085914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2xqEhMxycEjBhjY+SW2f/ptZbLRut2nqnKv7AhHTsU=;
        b=fYd6F9lqL07xtr9KklEYt+qKiA+yM1WZ6lpHN0sIm2yg6Ff3mum4W66RpufrvWcUpe
         d1jDIG1Djka8mwRyuDZfOtp+OO9z+K3F5XuIIBugMOGXxPCPhN9pa8MGXPb+kfQeE17T
         8ZNvP28H7sfiQlHywTrzZ7CZVwKbPJKRgssP+28p+fLD7OmlEA2SEtr34JnY6wyjIMZU
         RTHNxJG4N4j/Hy5iO0aIvklvbkb0JFwNVTImPdR99t6OvbxAAGzTyhtTHaX9stkY3zuI
         ZHYH2j0GvilGgmsnY0DkvFQvj1Zab22dNK45kUJhcNoC3Zz7uMcQlabayhXfNSLbuoGP
         /m6A==
X-Gm-Message-State: ABy/qLbhrWKdl/2TUSBmweH4j8ay6AQcWG7KV3Id7MJOkhiPpbkT87db
	g9Cc29JJLlxxy4v6wfBQmNJSoAmRQc9UnInFEizHlg==
X-Google-Smtp-Source: APBJJlFSUn/RnNcmP9TXTR68kfhrUCVXTDkYGL9u4XackksJVuYb2XSWoOopMg0tUC6R36Q4frWhes8VXFfDFC0nTq4=
X-Received: by 2002:a17:90a:3e4f:b0:25e:ad19:5f46 with SMTP id
 t15-20020a17090a3e4f00b0025ead195f46mr44833pjm.12.1690481114187; Thu, 27 Jul
 2023 11:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230724175839.675911-1-greenjustin@chromium.org>
 <CAPj87rNJa3CNWekovSMjgfGyduJ5BZtcqAumKfDdooW7Ocs9zQ@mail.gmail.com>
 <CAHC42Re3LoQQOzPww7SbYTEK2MLHwtkitvEtV6uBnkQNST30tQ@mail.gmail.com> <9334a56f-77d1-f062-08d9-33a6c6136fdc@collabora.com>
In-Reply-To: <9334a56f-77d1-f062-08d9-33a6c6136fdc@collabora.com>
From: Justin Green <greenjustin@chromium.org>
Date: Thu, 27 Jul 2023 14:05:03 -0400
Message-ID: <CAHC42ReCBe0Anz+cZ+0_GD01R_qBQhQ3tmB=GGg0g1Yz96M+HA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Daniel Stone <daniel@fooishbar.org>, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org, 
	jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_110517_298336_9480A352 
X-CRM114-Status: GOOD (  22.09  )
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

> ...so that a per-plane logic in mtk_drm_plane can be easily added, becaus=
e...
I think my concern is more that if we need to validate the format and
the modifier differently because of the plane data, then this method
would provide limited value. For example, on my MT8195, plane ID 38
supports AR30 and BA30, but plane ID 50 does not support any 10-bit
pixel formats.

On Thu, Jul 27, 2023 at 5:37=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/07/23 21:44, Justin Green ha scritto:
> >> Would it make more sense to commmonize function mtk_plane_format_mod_s=
upported()
> >> and call that one here instead?
> > I had considered that, but mtk_plane_format_mod_supported() is
> > required to take a drm_plane as a parameter in order to conform to the
> > type signature defined in drm_plane_funcs, but
> > mtk_drm_mode_fb_create() does not have a drm_plane to provide, since
> > the framebuffer is created later in the function. Technically we don't
> > actually use the drm_plane in the implementation of
> > mtk_plane_format_mod_supported() today, so we could just use a null
> > pointer, but I figured we may one day need to add per-plane logic.
> >
>
> My suggestion was not to use that function as-is, but rather to add a hel=
per like
>
> bool mtk_format_modifier_supported(u32 format, u32 modifier) { ... }
>
> ...so that a per-plane logic in mtk_drm_plane can be easily added, becaus=
e...
>
> static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
>                                            u32 format, u32 modifier)
> {
>         return mtk_format_modifier_supported(format, modifier);
> }
>
> so apart from that, is there any other reason to not do that? :-)
>
> Regards,
> Angelo
>
> >> This is not DRM_FORMAT_MOD_INVALID. Please either explicitly compare a=
gainst INVALID if that's what you meant, or against LINEAR if that's what y=
ou meant, or both.
> > Ack, I meant to use LINEAR. Will update for the next version of the pat=
ch.
>
>

