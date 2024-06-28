Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF90C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 13:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaqXsmEEvwtbfKc4COzmzLPLcldVrccbV4qjW+VQiGU=; b=ZF8MtAPn1K+z8DhcAidSxREWyO
	9zz6j7oFsC8FMVRqY2QrSWW7OEeojZJI6XbArOWG2q+MFVM6RH/CoXiH9odF068TXg96pmM+GbJab
	wz0Ewm1SjEVUnblXODZaZnN2rz1oX4vPR5XwLnanbDhBRpM2ixtUuvnM2U65eOMwvHvIPXGvjC5Xt
	Xe1XH58x1pBv7bJlaOKSZXqlMoudhSAfI8uQywUB5VFHf6cEJn6x1GJeKu606XBVE9ZjMJEDtNl5s
	LvSeHYZmhEG5WuaFx/97bFw2LlvhhihS5sjPVxXe5ebtu7VYQwk+l4X8JC4f+Y277NSpEQsBmplJ8
	4bsiVoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNBLI-0000000Dm56-1S6D;
	Fri, 28 Jun 2024 13:08:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNBL8-0000000Dm30-1uAe;
	Fri, 28 Jun 2024 13:08:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9B0D62181;
	Fri, 28 Jun 2024 13:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF67C4AF0D;
	Fri, 28 Jun 2024 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719580113;
	bh=JIVz5FNKvOgvnmUGw6kEzut1ksjPBzPXDnVwiaNYL9M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eLntOJis4L1ZOaIqToYV1m5g0zhnqfwnQb9LMmqz3N1a35Md98Ko+laaC7A2lM+LF
	 GvWtzk8GLmNHiJNaHQn7WzFB6/1kqAF3LpQ8HaH7zQxLFOJ5YqCwgFv6Zbu5MCHN6T
	 EWe8NaXmkRa9xVEZB56BXNZlVlug54g48v9B6RTB9Gi9SLC6eOQweFtRYzh+3s/Z/x
	 N8pAwNLTlPubOlZ3L2rHYATOLEmliZ+Z+W6kFeksM8LCxyrflfOY9lbkrfKwI/zY9G
	 g9DUsRuHMJvO2suzqlfcCHgwjPbwK0G5+HpwiLFEgRR/LXIdO0IDf3IPvYDKIjDuUS
	 u0TC7+rWqsu0Q==
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-710437d0affso372896a12.3;
        Fri, 28 Jun 2024 06:08:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV906f2V6hZpB99xkhoEwhsTE7JLhoej+3EsU9OLT+Puv/9q1vQMIXLZ1mrzd+q5Ot4yM7DbzmMY2/Oh6znRgtoXunqGwqZ6vL6PenMbvBugSGm3ggwmjb0FOKF3/g2wMz7KKHHedGyeOhbscsYfcBcU69E+xuDWgE=
X-Gm-Message-State: AOJu0YxCyRmzxVDf+8UZQl6eNaWUAl91y9fa9h4tK++ke8uDxarU+jF/
	DQc65ClOzXXI3VWKiTUSXxzUJwPCxSuGAaCHy+YLZ03pSDMw6C1NZm+gAYlpj14T/xvVHPt3SEg
	Xio92W7EduT2jjmCnFShF6N8l5g==
X-Google-Smtp-Source: AGHT+IF5mMCy7YrbrupOvlCOrOkU+rRYXca41m4MwdvomMcM+qWWY7QocDzkEcdXjTasG6C59jUoX3JcCm/MleU2EcU=
X-Received: by 2002:a17:90a:8c08:b0:2c8:e280:381f with SMTP id
 98e67ed59e1d1-2c8e2803890mr5364325a91.29.1719580112763; Fri, 28 Jun 2024
 06:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240604083337.1879188-1-mwalle@kernel.org>
In-Reply-To: <20240604083337.1879188-1-mwalle@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 28 Jun 2024 21:08:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8mviPhxsqtUcsB4xjU02VEq02-04cNq6fJYsTndJVfvQ@mail.gmail.com>
Message-ID: <CAAOTY_8mviPhxsqtUcsB4xjU02VEq02-04cNq6fJYsTndJVfvQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek/dp: fix spurious kfree()
To: Michael Walle <mwalle@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jani Nikula <jani.nikula@intel.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_060834_614509_DAD11903 
X-CRM114-Status: GOOD (  17.71  )
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

Hi, Michael:

Michael Walle <mwalle@kernel.org> =E6=96=BC 2024=E5=B9=B46=E6=9C=884=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:33=E5=AF=AB=E9=81=93=EF=BC=9A
>
> drm_edid_to_sad() might return an error or just zero. If that is the
> case, we must not free the SADs because there was no allocation in
> the first place.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

>
> Fixes: dab12fa8d2bd ("drm/mediatek/dp: fix memory leak on ->get_edid call=
back audio detection")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 536366956447..ada12927bbac 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2073,9 +2073,15 @@ static const struct drm_edid *mtk_dp_edid_read(str=
uct drm_bridge *bridge,
>                  */
>                 const struct edid *edid =3D drm_edid_raw(drm_edid);
>                 struct cea_sad *sads;
> +               int ret;
>
> -               audio_caps->sad_count =3D drm_edid_to_sad(edid, &sads);
> -               kfree(sads);
> +               ret =3D drm_edid_to_sad(edid, &sads);
> +               /* Ignore any errors */
> +               if (ret < 0)
> +                       ret =3D 0;
> +               if (ret)
> +                       kfree(sads);
> +               audio_caps->sad_count =3D ret;
>
>                 /*
>                  * FIXME: This should use connector->display_info.has_aud=
io from
> --
> 2.39.2
>

