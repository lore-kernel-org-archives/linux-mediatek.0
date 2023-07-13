Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44E5C001DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 03:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QV7vh1ogKfJf1Qa4ERBfjeAWDEN5HhFP3tvUsoJaZI=; b=t+5FyH3vOJw8TEhghBMrxe609E
	so7wY/3MifI5VbZudod1yxmPR/oZyKAXRJqf5q+muRzkhqWFDZlaJMRg4p7V3fBgck9u9IT+yr5lI
	C3QQIqSYdByOav6FFoBytW7TBCXiJ0IyDsy0m5mJtGyZXsEvA6O7usxa0ki4QVAZA3JG1wOJIwMa/
	ZHITVsZEDb3I64m9I85E6fJctmD22aWNL2aojFUxcMDy9rB2NpSPBsTuGAjmcOQ7tzJy+iTDll/Ow
	xGK/8fyLzuAsMKOfqDPo9VJ9BivZdMTOU4h2n1Ndr2fH8rxTMnYQIpzsCslqg6aTuN+KIGi/RguBH
	ScmJJaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJn70-001pPC-2p;
	Thu, 13 Jul 2023 03:35:26 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJn6y-001pOE-0i
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 03:35:25 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3457157a164so900145ab.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 20:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689219323; x=1691811323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QV7vh1ogKfJf1Qa4ERBfjeAWDEN5HhFP3tvUsoJaZI=;
        b=SPC64ahuJ4yc+hbCsW4t2IZyJ/mnAPf7F8sU5lO3hkgK9WjzAvGdrXeRL5djAR9Wvo
         TaqbEoHKn8etgEgMO0wMsslRmi+hxYjSRegsd+pCTSMsUZZVem40XEqMjW8PFWgJsb12
         uOR0H6Da8rJKRepz8X+4MUD2vaeLYNQSJEwFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689219323; x=1691811323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QV7vh1ogKfJf1Qa4ERBfjeAWDEN5HhFP3tvUsoJaZI=;
        b=bS3QzbGIDVGWPGCapWmHtqZTehuSnJvyCJ/KMqs3bvmaz3PoY6llTa/8kIK9QVcUtb
         jeN3g2wijXT2TTcTs13ScM4JNx+Owk2ansPap+146sH321LhY/Qd1RKL6un8N46rQNqA
         giIeNge/aH/7LCitOzGAiVUWB+9qZe87EoHDGHfe+zTHGOLVT+7GM7qV47h3QfHth98W
         Nfb0oULmFMSR+pYW3FEhRHP044bp9TrYg3RqXx2+GIDlDfMOaVa4u1tlRR6kpqzVeG6C
         X7ZEbx/KcwgfexK77aP9U48KNCS2p2kYlhEj7Wd8QRwx76sAM/ULR2ahthqbX8iGYEi8
         nLAg==
X-Gm-Message-State: ABy/qLYh/9GVvE9XtLWL7MFi1bOPKoQxkiBiCwp/TJrueRtcIgY2Wf19
	a/bhsf6xHo5tD/1ioLqVSS8pPGQAF4kVvfOb+yE=
X-Google-Smtp-Source: APBJJlFlA90nN5VwAkFjIlveRMvEPjgrhtMEJ5HwJ/GmFcg8hWekdQi1iROVEj4BTvX2wMwcPjZSgg==
X-Received: by 2002:a05:6e02:109:b0:345:ad48:d160 with SMTP id t9-20020a056e02010900b00345ad48d160mr383881ilm.17.1689219322893;
        Wed, 12 Jul 2023 20:35:22 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id f18-20020a92cb52000000b00345dd778ab8sm1797584ilq.27.2023.07.12.20.35.21
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 20:35:21 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-77a62a84855so6410039f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 20:35:21 -0700 (PDT)
X-Received: by 2002:a05:6602:18c:b0:786:2125:a034 with SMTP id
 m12-20020a056602018c00b007862125a034mr572395ioo.18.1689219320748; Wed, 12 Jul
 2023 20:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230421021609.7730-1-nancy.lin@mediatek.com>
In-Reply-To: <20230421021609.7730-1-nancy.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 13 Jul 2023 11:34:44 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj2Mwfbs_fgzcMsauhjaWdj0_0=t2F708i4F=u0oGgo-w@mail.gmail.com>
Message-ID: <CAC=S1nj2Mwfbs_fgzcMsauhjaWdj0_0=t2F708i4F=u0oGgo-w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: fix uninitialized symbol
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, clang-built-linux@googlegroups.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_203524_260228_B92D6A7A 
X-CRM114-Status: GOOD (  18.50  )
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

On Fri, Apr 21, 2023 at 10:16=E2=80=AFAM Nancy.Lin <nancy.lin@mediatek.com>=
 wrote:
>
> fix Smatch static checker warning
>   - uninitialized symbol comp_pdev in mtk_ddp_comp_init.
>
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT=
8195")
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

This seems to be unnoticed and I just want to get some attention for
it. Any action items here?

Regards,
Fei

> ---
> v2: add Fixes tag
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index f114da4d36a9..e987ac4481bc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -546,7 +546,7 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struc=
t drm_device *drm,
>  int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *com=
p,
>                       unsigned int comp_id)
>  {
> -       struct platform_device *comp_pdev;
> +       struct platform_device *comp_pdev =3D NULL;
>         enum mtk_ddp_comp_type type;
>         struct mtk_ddp_comp_dev *priv;
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> @@ -588,6 +588,9 @@ int mtk_ddp_comp_init(struct device_node *node, struc=
t mtk_ddp_comp *comp,
>             type =3D=3D MTK_DSI)
>                 return 0;
>
> +       if (!comp_pdev)
> +               return -EPROBE_DEFER;
> +
>         priv =3D devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
> --
> 2.18.0
>
>

