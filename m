Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E8FC32771
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 03:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CADN05KKbe5B1zz0kofRSrHf38vfNJyFp8QN7NHk8Q4=; b=cmTqZ0gml60+Gjamv2SEh0y+Bq
	npaeIARK0BufsyDQ+TZ77cRqG//wsejeZOx8sKpKdnOQGflIcmqckhgRmtjGa0DcZYil+ha5BO6IY
	iK4kks9FhqDJR7CiQ/jMjBMcKEW9ZBUd5ZObjlNOMPrpskHPT0pQ1LtwPOBkDRx+3gnmkkbeHAYc+
	bEYL+ZYEdQDetewTCxR6UzrYXePCI7k3zPwNC73p+Nsh8HCrx/SnVZYpewiR/IvXNgnzqrO9OIaEi
	fGdiBOBdMPeO65mKTHNtPCOz3QchSFMHeqdK2579bfmjyfzRJhp97AIVqDNl9CDr/2zqyUTrtdRu7
	P5JyYjaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZlQ7-00C0Io-Tn; Sun, 18 Sep 2022 03:56:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZlQ5-00C0Gq-St
	for linux-mediatek@lists.infradead.org; Sun, 18 Sep 2022 03:56:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 32CC7611D1
	for <linux-mediatek@lists.infradead.org>; Sun, 18 Sep 2022 03:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895F5C433D7
	for <linux-mediatek@lists.infradead.org>; Sun, 18 Sep 2022 03:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663473396;
	bh=zQBJ7g2dqPG3Wawo+dvaGCD0KbnK53uZvn6GoJzaFIw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E5oC4XqGGp/sVSgGqAhm7E22u2KyApjDGDuUC6RU892A/kOWmAiV0BhvnAJgAC3cq
	 bGpUIrDr9Ldryu1IUCmrhdrE/1TcCozKd1sPYxm2wfu5996kvhrC1pUlXqAGoHfNqq
	 DvYmQ1Mc5hQXbiNY0hdXpm4JfRWEVwhY0Dty1cfY2RCBSWl8Gm8k75bwoPsmtgfUNb
	 ejjvxUz3C/swtapFoN3o6UngAnsVdo9cU5sgjQekauR+W3lIaY2dNj/wnDvR/EFIkZ
	 L84rmG7j7yYf49OZGaKo65FXVVn7guMgWsM0ICK6QytyNLZ9rdCiJotdVZ3/R39qHk
	 FwsSOfmfn/gtg==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-127ba06d03fso57625552fac.3
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Sep 2022 20:56:36 -0700 (PDT)
X-Gm-Message-State: ACgBeo361DJzt5qYYdhi6ldRz/JDa2I1Dba46FUsBARdwBS9fkH+b2w5
	Jd9MH8dGkGggZEA+GNFM1AdVEuhbunY1FMuAUg==
X-Google-Smtp-Source: AA6agR72JrAxWr7yPtw1xlQbAjWKiFgKegrMAxPQ0bdLhuwUE3ebcH4uk0sky4W+STGpW400sMmg5/ZC5SSkXM+uc08=
X-Received: by 2002:a05:6871:799:b0:11e:a2a3:dcae with SMTP id
 o25-20020a056871079900b0011ea2a3dcaemr11745800oap.69.1663473395662; Sat, 17
 Sep 2022 20:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220913134929.1970187-1-yangyingliang@huawei.com> <6051fab8-e198-fd58-2dfe-b2b344b67c15@collabora.com>
In-Reply-To: <6051fab8-e198-fd58-2dfe-b2b344b67c15@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Sep 2022 11:56:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8yTkkBNEv=MgRj2+JQM0=bD+z2wFsTT7n6uEC0ay1L9g@mail.gmail.com>
Message-ID: <CAAOTY_8yTkkBNEv=MgRj2+JQM0=bD+z2wFsTT7n6uEC0ay1L9g@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: dp: change mtk_dp_driver to static
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Markus Schneider-Pargmann <msp@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_205637_985799_AF2AE3BA 
X-CRM114-Status: GOOD (  18.03  )
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

Hi, Dmity:

My tree has no mtk dp driver yet. Would you like to pick this patch?

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Dmitry Osipenko <dmitry.osipenko@collabora.com> =E6=96=BC 2022=E5=B9=B49=E6=
=9C=8815=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:04=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 9/13/22 16:49, Yang Yingliang wrote:
> > mtk_dp_driver is only used in mtk_dp.c now, change it
> > to static.
> >
> > Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort dri=
ver")
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediat=
ek/mtk_dp.c
> > index dfa942ca62da..6a8c0f4c5c09 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > @@ -2642,7 +2642,7 @@ static const struct of_device_id mtk_dp_of_match[=
] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
> >
> > -struct platform_driver mtk_dp_driver =3D {
> > +static struct platform_driver mtk_dp_driver =3D {
> >       .probe =3D mtk_dp_probe,
> >       .remove =3D mtk_dp_remove,
> >       .driver =3D {
>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>
> --
> Best regards,
> Dmitry
>

