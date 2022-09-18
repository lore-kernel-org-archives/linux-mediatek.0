Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B65C32771
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 03:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aT/xJUvlS3ZkhinZGJsF7f/pWcb52Vm/+Ih6k0YdT3c=; b=3FKaJKXPVDiMPGJo85uLUU08wd
	AXE6kR1TGQCSt8JnvIaM3FVUNT3PBOQOcIgXjT7ouea//beHC2AP+TCfRgL7g8J4QGK1e5/WiX3qm
	hiw9/j0r3sBhAZX29ClgTc3DmlVQW4ETZT7ib/cbNJ9dnIyuOMfFNnhTZWyVYxMLR4ZsE2IjB/CmU
	0JLu3Y3GWUDE8bDZHge2A8X/xOflxtJQhqihStH3Xq89+/xaWeeuokbQcOVD2XWwLJ0aZ+2xQeNZO
	PGzcT66TcOXKfBEruMFdHodgaUOiwAQkgrLdiDWCyZiQiruI/mqg2jg68ELGU76pmaTT4sz0YsSql
	/+7Gfsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZklF-00Bfup-PP; Sun, 18 Sep 2022 03:14:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZkl2-00BfkJ-4w; Sun, 18 Sep 2022 03:14:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 24F00CE0B50;
	Sun, 18 Sep 2022 03:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE694C43144;
	Sun, 18 Sep 2022 03:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663470845;
	bh=Y9FHsBbI7CNPRKhfCvmq4BIFyaa1dC1WylWyfszKy4s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZC6AiZl5zbZmsPoTnRaHmLCF1K78RvN57gFeZD5Y5OkFRyZAHUfVqlnpG8um7Ki+x
	 F45/ngOd69C83qSsvfYTYNT4KW14z0TjlLFYKazYzR/10J4aAUDPBVDXP2Z0cTCpoG
	 +rMmYxW4FuFOHZxC+gaLtnWwZAvEcpiWhSxoHP5UX6JZnm08osBXBUie2qPh7bL0YC
	 ZaF/mrOeRPZreA4aWSMadtG4XkPlEK//6Bkt5C8p1zugh7LmSeFFoyiBO/7y1d6bqn
	 84IxB2F8jNDnIfb9r4OoZAnLpQwQ/5eiXcIfvpErNgcJr0RfpeRM2fOHfbNJq+tkfJ
	 u0ZPG5n0lySgw==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-12803ac8113so57502688fac.8;
        Sat, 17 Sep 2022 20:14:05 -0700 (PDT)
X-Gm-Message-State: ACgBeo1bd1/INop9wDVMKCM/k5UaqsFuz4lzWt/iAkHRNK8AFEw7Xfz9
	dc2dLscH+eHvlKs8iTF2OISHguYxJEhaCKZVCw==
X-Google-Smtp-Source: AA6agR4cU7YVJerUEM7KKKNcBT86A+GPNcDzuOehKm1I3RQK4reVXmD7SmAQEHy95VJ9wK0JduW2mWCcc1rx+Wpm70A=
X-Received: by 2002:a05:6871:96:b0:11d:ca1b:db19 with SMTP id
 u22-20020a056871009600b0011dca1bdb19mr12989922oaa.74.1663470844989; Sat, 17
 Sep 2022 20:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com> <20220916133821.27980-4-rex-bc.chen@mediatek.com>
In-Reply-To: <20220916133821.27980-4-rex-bc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Sep 2022 11:13:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Q=yiDMA8UrkaCKDEpxf=KwZtr-sJ+na5Qtuk4kqPY3A@mail.gmail.com>
Message-ID: <CAAOTY_9Q=yiDMA8UrkaCKDEpxf=KwZtr-sJ+na5Qtuk4kqPY3A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/mediatek: dp: Fix warning in mtk_dp_video_mute()
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Guillaume Ranquet <granquet@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jitao Shi <jitao.shi@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	liangxu.xu@mediatek.com, DRI Development <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_201412_558107_6C2EF858 
X-CRM114-Status: GOOD (  16.70  )
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

Hi, Bo-Chen:

Bo-Chen Chen <rex-bc.chen@mediatek.com> =E6=96=BC 2022=E5=B9=B49=E6=9C=8816=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E6=99=9A=E4=B8=8A9:38=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Warning:
> ../drivers/gpu/drm/mediatek/mtk_dp.c: In function =E2=80=98mtk_dp_video_m=
ute=E2=80=99:
> ../drivers/gpu/drm/mediatek/mtk_dp.c:947:23: warning: format =E2=80=98%x=
=E2=80=99
> expects argument of type =E2=80=98unsigned int=E2=80=99, but argument 4 h=
as type =E2=80=98long
> unsigned int=E2=80=99 [-Wformat=3D]
>   947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\=
n",
>       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
> ../include/linux/dev_printk.h:129:27: note: in definition of macro =E2=80=
=98dev_printk=E2=80=99
>   129 |   _dev_printk(level, dev, fmt, ##__VA_ARGS__);  \
>       |                           ^~~
> ../include/linux/dev_printk.h:163:31: note: in expansion of macro =E2=80=
=98dev_fmt=E2=80=99
>   163 |   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
>       |                               ^~~~~~~
> ../drivers/gpu/drm/mediatek/mtk_dp.c:947:2: note: in expansion of
> macro =E2=80=98dev_dbg=E2=80=99
>   947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\=
n",
>       |  ^~~~~~~
> ../drivers/gpu/drm/mediatek/mtk_dp.c:947:36: note: format string is defin=
ed here
>   947 |  dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\=
n",
>       |                                   ~^
>       |                                    |
>       |                                    unsigned int
>       |                                   %lx
>
> To fix this issue, we use %s to replace 0x%x.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
> Reported-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index c72c646e25e9..d58e98b2f83a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1222,8 +1222,8 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp=
, bool enable)
>                       mtk_dp->data->smc_cmd, enable,
>                       0, 0, 0, 0, 0, &res);
>
> -       dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-0x%lx\n=
",
> -               mtk_dp->data->smc_cmd, enable, res.a0, res.a1);
> +       dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: %s, ret: 0x%lx-0x%lx\n",
> +               mtk_dp->data->smc_cmd, enable ? "enable" : "disable", res=
.a0, res.a1);
>  }
>
>  static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
> --
> 2.18.0
>

