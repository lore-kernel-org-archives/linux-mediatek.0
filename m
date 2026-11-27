Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAEB606A31E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 12:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mmMjXmnd;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AiMgcbxi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6wJPtmDOKQWl0gKDtiuKlNF32reQWcBhdrSBFhz15UA=; b=mmMjXmndBeXPnj
	UANuoSSNEMwOsCAO+d860L8ia0Q/hsfPmT/jM9Za3hDp1u662oBDG7bnUyHXkLkkWfcyQDjb42RrC
	ea/kSoj7R1LdtgRLno3rqLWbNYmNi2QLt/79fXLPPV9Pmpl8LA139IwpvzXGuwKfiHJHFzPQRrz3G
	4shwhujqEyVyENRIAes34TScJmZog5jUTBFWRizlWXwHXW6j/jmTwO1OkFhhlZEKo0F/EOytlqhtE
	Uyyg6nAG6nEcZECe42B4XeMAvEDisyGMzu2pR8OM6uWCOyB/X27k4QyG32WgcHUqHlCC576ImokLP
	B0tk8CUXEza9O9djWBCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv2C-0000000G7gZ-37yz;
	Fri, 27 Nov 2026 12:26:36 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv23-0000000G7dc-3bZC
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 12:26:35 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so3322021a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 04:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795782387; x=1796387187; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6wJPtmDOKQWl0gKDtiuKlNF32reQWcBhdrSBFhz15UA=;
        b=AiMgcbxivZkNA7tSvfOr26mFCrDe7oqH9OFmhDq4j+SNgmWWAwCQEA21Tg/NIomHzv
         lEPNurRgKfI6I19/FqSEes6y1sDXMZgY495JZBVlwonkUL1zaT4NYqrLA13xYjI8Zo88
         SVX4cv+vITPrRsX3Pq9raVDmu/ZqaOYjkKBto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782387; x=1796387187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wJPtmDOKQWl0gKDtiuKlNF32reQWcBhdrSBFhz15UA=;
        b=D9PTXcOvGsjXwkxm+XaCzMfyhI3MhwNHDvYRQXl5/sxZ7yO3nXF9BzQAUrqJPjgTbU
         HCMlSscNBPnjA0iO/DRqOPm6qw2ZoBcr9zGpMw+ekXhOdLz58gbtg2QCFMF94XnH2pGQ
         SFzp45ujetxdgugjIGYf81o/0jp2L1KEGwDPGumdWcmRHKDE/2w3rLAJO5oj5eLATjRq
         Tr3cGZJYYx9rWzsfN/9UMdAJsX4tgBnLWkDC9LyHUfJplVtLJpxWjp3tdy0RZgBiQHL+
         RHFW0ndbTacKFU4spsE4MfWgyI1khX1aIUAiosNY6LLluM6+UZPKbWwTxo2w1ukMA5UD
         FiWg==
X-Forwarded-Encrypted: i=1; AL+hErE1zUO9XY8eTFfO/62HKeBBge/hSJ+9NCtv2dJ+2mfveAluqaxmj8ProXIMAxEMIUV9ijzOkco072wL5KpcjQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Jrr5dbsheo0+nMA5Go8CIkODFTt8X7JqBmpwCl839eem3dX2O
	PNVOcMnitEI++ma4+/r5xJYPYiM8PpdDRTon6OGK7SMUu4+M01ZlbrZ5PrRn3UGqeFFNvdVBBBb
	/hw4=
X-Gm-Gg: AZFdTZdYYfSZoo1d6Gfk2yF678Yt6F7qzB+MhhZipC/aZAmb8nTJOgLcFTGYHPb6N43
	+ZC7aiUWymXN/AC+VT+GbwIHZ10BHG5WjNNi1urOIZZXAgkBHecmKW+/tQN95eyOyRVsScN8AK5
	sHjn6NYHs6OkHV4jfDwfJOAWa3VkYATF1OmHjCi0JU45ONwJUzjFUS0o/dI6Gn2mWbr1DXLK+7j
	ogh3LuI9WPRvJ4oF67V5XyNiEsOX3NPr3VoDIV1zEnJ5NIM8cNMwN5Ul9hGE/mGs1dwD+OGHRwL
	1Hjluz80akaiDgSD8HdP7xlxQ0HVS+Io56THX9GvVZoGND9M0pxZr/2e41YUynmjybzCwe+fKKa
	HoGB5HkVdianI69RESV9siPX/ZgIBwh6jaOUgN7u1Hadwve/Cz6DJVY8xHNO5clVer9Y0v+TeXC
	jjS9Ihb4EvayRp8Vs6X5AvbY/RrIv0jh6cvXOPLlycflLVaCKoFCibJtdJmsK/3L5lspHz0MAod
	1ngT/qTc57IBXECHOz6ci29+T/FRlQGI1zE7Sym5OX3KFu3PTQxT+YfrH91DzcThp/h3fp45Wm5
	jT+Jozl4HqbvrbIUuIGokW6LDguRZZY1WjQYaNSqNahkrFHDpKmZJuTy+z33ubI8rTgo2NQtKlg
	rdbeSgQhOHwEk
X-Received: by 2002:a17:90b:534b:b0:3b5:32db:12b with SMTP id 98e67ed59e1d1-3b532db04c4mr2516527a91.22.1795782386877;
        Fri, 27 Nov 2026 04:26:26 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm17628027a91.17.2026.11.27.04.26.26
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:26:26 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-385c497bf94so7862129eec.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 04:26:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHEvdqgz3MMgVu1T+0fl4+o2CnLDPEQouhmOYzX2r1qxtCbmFMz2txWFiNsnV8KZ7JqTdWiSi7BwZVbuXtLig==@lists.infradead.org
X-Received: by 2002:a05:7301:4d0c:b0:376:a6d7:8f6f with SMTP id
 5a478bee46e88-3856ec3ec8bmr25649718eec.17.1795782385135; Fri, 27 Nov 2026
 04:26:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-47-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-47-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 20:25:42 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh8TnQeGfW+At1vCs3ie=7EYiG2R9xSTyfZ1A4mW0+CGQ@mail.gmail.com>
X-Gm-Features: Aa3M54p-uqcPZ0BTjnlZ-C4P_vANwYAAc7cv53pfujMjetYD2ahEumQx7Kd9jG4
Message-ID: <CAC=S1nh8TnQeGfW+At1vCs3ie=7EYiG2R9xSTyfZ1A4mW0+CGQ@mail.gmail.com>
Subject: Re: [PATCH v2 46/46] drm/mediatek: mtk_drm_drv: Fail init only if all
 paths are invalid
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_042632_615999_506FFF97 
X-CRM114-Status: GOOD (  25.46  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Jul 14, 2026 at 7:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Up until now, if not all display controller paths were valid, the
> driver would fail probing and refuse to bind components: while
> that was a good idea before, now that mediatek-drm gained much
> more flexibility, it is finally possible to gracefully handle
> this situation and register only the valid paths while leaving
> the invalid ones unregistered, without any crash.
>
> Count how many output paths are found, and then count how many
> have failed probing: if there is at least one valid path, avoid
> erroring out, so that at least some outputs will just work.
>
> Of course, any path failing is not a clean situation and must be
> resolved: in this case, function mtk_crtc_create() still prints
> error messages so, even though some output works, that will not
> go unnoticed, as a quick check in kmsg will show the errors that
> made a certain path not to register.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 82d844b6abf7..7c9cb50909c8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -394,6 +394,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         struct mtk_drm_private *priv_n;
>         struct device *dma_dev =3D NULL;
>         struct drm_crtc *crtc;
> +       int num_failed =3D 0;
> +       int num_paths =3D 0;
>         int ret, i, j;
>
>         if (drm_firmware_drivers_only())
> @@ -460,15 +462,29 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                         if (!priv_n->data->output_paths[i].len)
>                                 continue;
>
> +                       num_paths++;
> +
> +                       dev_vdbg(drm->dev,
> +                                "[CTRL%d-CRTC%d] Path Len:%d, Controller=
 Order:%u\n",
> +                                j, i, priv_n->data->output_paths[i].len,
> +                                priv_n->data->output_paths[i].order);
> +
>                         ret =3D mtk_crtc_create(drm, i, j,
>                                               priv_n->data->conn_routes,
>                                               priv_n->data->num_conn_rout=
es);
> +                       if (ret =3D=3D 0)
> +                               break;

Since patch 38/46, mtk_crtc_create() already combines all controllers
(`order 0..N`) for `output_paths[i]` into one CRTC, so only the leader
(`order =3D=3D 0`) should call it.

Relying on `if (ret =3D=3D 0) break;` instead of filtering `order =3D=3D 0`=
 has
a few issues:
- If a follower (`order > 0`) appears before the leader in
  `all_drm_private[]`, `mtk_crtc_create()` gets the follower's `j` as
  `priv_data_index` (setting `mmsys_dev`, CMDQ, and `conn_routes` from
  the follower) and breaks before reaching the leader.
- If `mtk_crtc_create()` fails, the loop retries it on every remaining
  follower for the same CRTC.
- Patches 38/46..45/46 don't have this `break;` yet and register
  duplicate CRTCs for each follower.

Skip `priv_n->data->output_paths[i].order > 0` in the loop (starting
in patch 38/46) instead of breaking on `ret =3D=3D 0`.

Regards,
Fei

>
> -                       if (ret)
> -                               goto err_component_unbind;
> +                       num_failed++;
>                 }
>         }
>
> +       if (num_failed =3D=3D num_paths) {
> +               dev_err(drm->dev, "No valid Display Controller path! Goin=
g out.\n");
> +               ret =3D -ENODEV;
> +               goto err_component_unbind;
> +       }
> +
>         /* IGT will check if the cursor size is configured */
>         drm->mode_config.cursor_width =3D 512;
>         drm->mode_config.cursor_height =3D 512;
> --
> 2.54.0
>
>

