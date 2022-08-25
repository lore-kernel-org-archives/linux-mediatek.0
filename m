Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E794C65C14
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTOBWtrX+pjJ3ahFlS9FAQk7EKs/QTk29vxbSTY4jaY=; b=HOv91fuygC7uvFro7i43V7B4Bf
	dYFgrklh381rfd1ZzUUa5H+g/9xqxB1TnvSRtBzDpN5+7i7AerzO4NPjAY9ubJKqU7CXq+Kpz6lI9
	0NlMo8M1GVg5UXIx4QnF1qjsa6j/bc4pWQK2wenwcsw2GaaqZVuKqwYrbMvczV0Q2Ty0xfsw4swjw
	K1Wp6rwgSNFcWfNBYoO3xWfDdj3hWwcN4rh8meDqKbifRm/z6Q1wggFLX9QikR5sWc+AXoMVi0i4J
	CGaWNX4+WiDyN85qLiIz8JTMF/hElbX3IEpUNeyt4daQRuqf871BlBXdYLvubjqm0Ief1/uWk+GKX
	4vQ4VbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRENJ-00FUyf-Hy; Thu, 25 Aug 2022 15:02:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREN6-00FUu0-Rx; Thu, 25 Aug 2022 15:02:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D74761982;
	Thu, 25 Aug 2022 15:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEB5C43470;
	Thu, 25 Aug 2022 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661439734;
	bh=wjzgRFEte1JYnIbn0TO9+w6aujcip3bCGZB7ym5Hwqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HkRRkzc9iafdkf9TMuKnfqx+MEHwzecpp3cFlYHeVXNhCy0CydbQiOhMjHVpUe1oY
	 z8ppkiRKmmBFXy8f/xvVskAEuR1DQ1GbwTz1qoYisg/Y8P4wll3wAnJK/wKYTf0nXf
	 xsJRoaTa+1V6PkhjmQOey5EARkduy8bSNR2rHEEQDuXpbw3h2n92Z92JFsPqEHUa/0
	 1jKFsx0C/45mNLfBD0fpSBeWj375DsH5odKJKfTgMGAhCTSA93C0jFG1ptbeqrC8fr
	 N2BvGI2buJudq0B41JKkljHZXQK/DCwDHSvY+vz7rLCQM2dc+APZ8lGhH/E0tvXNZM
	 /qTPFWo3Z3XIw==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-11d7a859b3aso14018968fac.4;
        Thu, 25 Aug 2022 08:02:14 -0700 (PDT)
X-Gm-Message-State: ACgBeo3wXlaMdJwXdm5eCC99ZY7iq1EBveGtO+2UCDjTokmHhQ1AQ37z
	WAQnvmk72ABsSf2F0sPWDazAjkmDHg50m/jYEg==
X-Google-Smtp-Source: AA6agR70oWHotJ5zvAGB1qZOQksOWhU541/A7VrzrBgK6KvY/ErP5FdHQ4RJbVcMw2k+yzFchbHSwLv1yStFufhZmaA=
X-Received: by 2002:a05:6870:4690:b0:11c:d599:4f41 with SMTP id
 a16-20020a056870469000b0011cd5994f41mr5866261oap.69.1661439733913; Thu, 25
 Aug 2022 08:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com> <CAGXv+5H+BQcT=JTD3Y1necym=6uLHD8HgWpjjpyTLSin9D1KNA@mail.gmail.com>
In-Reply-To: <CAGXv+5H+BQcT=JTD3Y1necym=6uLHD8HgWpjjpyTLSin9D1KNA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 25 Aug 2022 23:01:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-KS8XTqcaNRpzc0xfO23KfdTy8Gx=yGtGWLQJEcgsWjw@mail.gmail.com>
Message-ID: <CAAOTY_-KS8XTqcaNRpzc0xfO23KfdTy8Gx=yGtGWLQJEcgsWjw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Add atomic {destroy, duplicate}_state,
 reset callbacks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, David Airlie <airlied@linux.ie>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Rex-BC Chen <rex-bc.chen@mediatek.com>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	xinlei.lee@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_080217_000498_4EFA1985 
X-CRM114-Status: GOOD (  23.62  )
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

Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2022=E5=B9=B48=E6=9C=8819=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E6=99=9A=E4=B8=8A9:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Jul 22, 2022 at 1:27 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Add callbacks for atomic_destroy_state, atomic_duplicate_state and
> > atomic_reset to restore functionality of the DSI driver: this solves
> > vblank timeouts when another bridge is present in the chain.
> >
> > Tested bridge chain: DSI <=3D> ANX7625 =3D> aux-bus panel
> >

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

> > Fixes: 7f6335c6a258 ("drm/mediatek: Modify dsi funcs to atomic operatio=
ns")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
>
> This patch is now needed on top of v6.0-rc1, otherwise booting will
> stall for a while waiting for display vblank, which never happens
> because the DSI pipeline is not configured correctly.
>
> ChenYu
>
> > ---
> >
> > Note: The commit that has been mentioned in the Fixes tag should
> >       *not* have my Reviewed-by tag, as the author changed it but
> >       erroneously retained the tag that I had released for an
> >       earlier version of that commit (which was fine, but the new
> >       version broke mtk_dsi!).
> >
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/media=
tek/mtk_dsi.c
> > index 9cc406e1eee1..5b624e0f5b0a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -808,10 +808,13 @@ static void mtk_dsi_bridge_atomic_post_disable(st=
ruct drm_bridge *bridge,
> >
> >  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs =3D {
> >         .attach =3D mtk_dsi_bridge_attach,
> > +       .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_stat=
e,
> >         .atomic_disable =3D mtk_dsi_bridge_atomic_disable,
> > +       .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_=
state,
> >         .atomic_enable =3D mtk_dsi_bridge_atomic_enable,
> >         .atomic_pre_enable =3D mtk_dsi_bridge_atomic_pre_enable,
> >         .atomic_post_disable =3D mtk_dsi_bridge_atomic_post_disable,
> > +       .atomic_reset =3D drm_atomic_helper_bridge_reset,
> >         .mode_set =3D mtk_dsi_bridge_mode_set,
> >  };
> >
> > --
> > 2.35.1
> >

