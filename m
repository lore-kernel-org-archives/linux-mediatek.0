Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6483CC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 00:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frCsZ8lyomyuXyz+f8OnjknZXnRMr07nVmeMmOxETFY=; b=V0zVNTcvjE11iCb8GKv93fF1qk
	tDdgNYig8vWFgwaRaUjNKSV5696vsqPxLjIGHse4xuOzEMuJS7H2kQI/21moe90t6x5T5MA+Af5C4
	dCDoAnKpJalmddHq32UztjxDcPxEYPQ5XDKSIZeocVFgQjYjWs3IlMf/ouyRT7mILiNUe0yj9Dbus
	YiIYOYG1RhX6Xa2TIkbjN+CXFfLFPUoBRDN3q/NtAG2T4WE2li7Hg+VlXAUTPk8ZeRuhx3r/4KcJu
	9uOHOmQkLVCQIIMo3kZ/Ury/ZOCOlAgCMcXWIvB+8/1845gTuWbn9HC+p5YNF+UJY7ht4cd1IG5jw
	S7GgUp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouMwm-00Ex7H-C9; Mon, 14 Nov 2022 00:03:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouMwa-00Ex4O-Mk; Mon, 14 Nov 2022 00:03:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5CAA9B80D0A;
	Mon, 14 Nov 2022 00:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C711AC433D7;
	Mon, 14 Nov 2022 00:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668384191;
	bh=Y6+GesINiuVpEDuqYdsy5iev4MVdI1Uu35S43Ufbsfk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pHR9XXS3jciNgcTlJe4f8U6qRQubEv/9wFdbpipVtW9H3ufdxALFDsKKrsPl8RTNH
	 veSGQPkphxJU4IyIsY5qFZN4s953ZZYAeVaoeorksvV/kAX7oXZ6FGWAqFE8QCTgF2
	 S4MOashNnZBGTtvwa9S62atATbfCtC/aMFdDB0viGiXrxOpDOQLV0WszHer8MxKxzt
	 hOjzInM+pQN5E/J1iocH8WKSt3DLAgmKA0uEBoH5jHaqSR0+VqzMUBhhUW79b4AukJ
	 UbEBVMlcBNgzjbXEKRvRgfxbRzbHtOJPD8pQdjKdOmPmMMrQbYl65DscvL4KR6Es5k
	 pAJCtg/UF6/bw==
Received: by mail-ot1-f45.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso5848079otb.6;
        Sun, 13 Nov 2022 16:03:11 -0800 (PST)
X-Gm-Message-State: ANoB5pl3MrODe3qYhvCOO1zkoTnuZPl5XMpjfVSf3qW2xOJ8iuOnxglm
	WV+LNwqjYlJE9KEws0Eh9nrCw8k8/GDOEyfR1Q==
X-Google-Smtp-Source: AA0mqf4gu4W/Men7HSJ8Gnbjz5l/uOk6f5sN2spmarR43u5YDzmkrtAca4fKVNC6ZOOoT9otESBFHAQKHzDDPV0mrKQ=
X-Received: by 2002:a9d:4b02:0:b0:661:b04c:41d9 with SMTP id
 q2-20020a9d4b02000000b00661b04c41d9mr5409278otf.92.1668384190909; Sun, 13 Nov
 2022 16:03:10 -0800 (PST)
MIME-Version: 1.0
References: <20221102154712.540548-1-nathan@kernel.org>
In-Reply-To: <20221102154712.540548-1-nathan@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 14 Nov 2022 08:02:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9nH8tW6yP=3giQmSKQjnQ+pmaGRQ0N3_ODFg1uS-rvCA@mail.gmail.com>
Message-ID: <CAAOTY_9nH8tW6yP=3giQmSKQjnQ+pmaGRQ0N3_ODFg1uS-rvCA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix return type of mtk_hdmi_bridge_mode_valid()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_160321_069558_C8A389B3 
X-CRM114-Status: GOOD (  19.08  )
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

 Hi, Nathan:

Nathan Chancellor <nathan@kernel.org> =E6=96=BC 2022=E5=B9=B411=E6=9C=882=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A11:47=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
>
>   drivers/gpu/drm/mediatek/mtk_hdmi.c:1407:16: error: incompatible functi=
on pointer types initializing 'enum drm_mode_status (*)(struct drm_bridge *=
, const struct drm_display_info *, const struct drm_display_mode *)' with a=
n expression of type 'int (struct drm_bridge *, const struct drm_display_in=
fo *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-po=
inter-types-strict]
>           .mode_valid =3D mtk_hdmi_bridge_mode_valid,
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
>
> ->mode_valid() in 'struct drm_bridge_funcs' expects a return type of
> 'enum drm_mode_status', not 'int'. Adjust the return type of
> mtk_hdmi_bridge_mode_valid() to match the prototype's to resolve the
> warning and CFI failure.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Chun-Kuang.

>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Reported-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 4c80b6896dc3..6e8f99554f54 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1202,9 +1202,10 @@ static enum drm_connector_status mtk_hdmi_detect(s=
truct mtk_hdmi *hdmi)
>         return mtk_hdmi_update_plugged_status(hdmi);
>  }
>
> -static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> -                                     const struct drm_display_info *info=
,
> -                                     const struct drm_display_mode *mode=
)
> +static enum drm_mode_status
> +mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> +                          const struct drm_display_info *info,
> +                          const struct drm_display_mode *mode)
>  {
>         struct mtk_hdmi *hdmi =3D hdmi_ctx_from_bridge(bridge);
>         struct drm_bridge *next_bridge;
>
> base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
> --
> 2.38.1
>

