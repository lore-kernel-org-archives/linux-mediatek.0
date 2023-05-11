Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A8FC77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 05:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TZUTUOuw8gS3YY4QfM/+qXEJz2gQxAmQCsDAHLbmhU=; b=e+/PLsEXmmEpa1
	/XrjYzLgZxkKqFYYzuO5GPxY5BstsBEqY3mL2UcRaYvxpmJsG3kcb0TbrX1ofLwAoKJ92mfAaa7e2
	GQXHbhycAujBWl26gTGHpt0385zWsXRDtHleunqat4FGJXbP/qGMIHn5+2E7vkXAZXGqSOTBhaGFJ
	tfZyQvoiGLqlphxnUZ2AH9ul8uDi0eBrpczr0aHZPmXRavnSZYf/zuRoYfeRmYCPjRMIAHN2yl3/u
	SIdCbxUzP93Ak2vr78JITGIFpO+X4gkL/m36QYj/Y+VIT75QoOIQCg3+l6XLuzPTAkLk7XL0u29F9
	BI6Fw/A3YFZPt6IeHANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwzCV-007wKj-08;
	Thu, 11 May 2023 05:50:51 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwzCR-007wHp-0f
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 05:50:48 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-44ff6a049a7so2897677e0c.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 May 2023 22:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683784234; x=1686376234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TZUTUOuw8gS3YY4QfM/+qXEJz2gQxAmQCsDAHLbmhU=;
        b=cmQ4baQnxQ6OJaWyiKd9TwKrwVLa3z9moGFNjZHUpOJdcpGwRAgzMMUDJZMnfbWv8J
         QGiI7irEoRuJrTYfRvNNvXnt4McMMkn6LRHsWtp6fbJHSE0OkTfKZBk9uWpVHzEP7euO
         N/kNcWjhR6aHrPQP8chTmD6UOlmnRpa+cAmiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683784234; x=1686376234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TZUTUOuw8gS3YY4QfM/+qXEJz2gQxAmQCsDAHLbmhU=;
        b=O+Z5p05uEm9Bo71w7zlnalJXwfD0T/p0V3js3MJ8M4B26ojtTmlvamrnPK8CV4o83M
         H1CA6w6wmAsi3vUHMaGloUQ75PQFy85lc1uscA6FYc4zI5UDiEIv14xqJhICirY8uhmc
         OR+VNS4PsZhZebDbeUHm0sPymbYs8ZQcWnHb4vd5aEAtSK5B0RKgECnMvmgx2+cm+Q4p
         K6kw9iMoPId+EM7ZVvkc3Xk9U51o0/lVkh1ZhGiSuGjEfxYRne1oxN2rcn4zS3HPjvpc
         PCBxD8ZYaLFDdRLUZcLesifBHif3Df5F+yDt1HDHLka+4HCo08J+WyZoJ/htQmMt3xCX
         Wk4w==
X-Gm-Message-State: AC+VfDw85iO1EWbN4IGpEE3SE9ZJpTRx/l4Tnc5mGVrIQgo9g4u5li7B
	CY5vq3ZAMvVvohsRAmi4jrulRlTbQuzI1LYaOX0bOw==
X-Google-Smtp-Source: ACHHUZ7fGE4nB3zdLHbvSnPzibOTMUdkLYtLPvJiu7zEMVz/OES4+wnOovyGzoWDL0QKVJZH9Czbi0nR2DM+Cg67Ouk=
X-Received: by 2002:a1f:3f8a:0:b0:44f:a64b:479b with SMTP id
 m132-20020a1f3f8a000000b0044fa64b479bmr6002540vka.6.1683784234113; Wed, 10
 May 2023 22:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230510233117.1.I7047714f92ef7569bd21f118ae6aee20b3175a92@changeid>
 <20230510164330.z2ygkl7vws6fci75@pengutronix.de>
In-Reply-To: <20230510164330.z2ygkl7vws6fci75@pengutronix.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 11 May 2023 13:50:23 +0800
Message-ID: <CAGXv+5HBM+eksJaxL2GqLfqSmK8vsQx5NXHfhe075HkOK3vjHw@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Convert mtk_vcodec_dec_hw
 platform remove callback
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_225047_249545_00A6769F 
X-CRM114-Status: GOOD (  22.71  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org, Yunfei Dong <yunfei.dong@mediatek.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 11, 2023 at 12:43=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> [expanding the audience a bit for more expertise]
>
> Hello,
>
> On Wed, May 10, 2023 at 11:31:35PM +0800, Fei Shao wrote:
> > This aligns with [1] and converts the platform remove callback to
> > .remove_new(), which returns void.
> >
> > [1]: commit a3afc5b10661 ("media: mtk_vcodec_dec_drv: Convert to
> >      platform remove callback returning void")
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> >
> > ---
> >
> >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c=
 b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> > index b753bf54ebd9..bd5743723da6 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> > @@ -193,16 +193,14 @@ static int mtk_vdec_hw_probe(struct platform_devi=
ce *pdev)
> >       return ret;
> >  }
> >
> > -static int mtk_vdec_hw_remove(struct platform_device *pdev)
> > +static void mtk_vdec_hw_remove(struct platform_device *pdev)
> >  {
> >       pm_runtime_disable(&pdev->dev);
> > -
> > -     return 0;
> >  }
> >
> >  static struct platform_driver mtk_vdec_driver =3D {
> >       .probe  =3D mtk_vdec_hw_probe,
> > -     .remove =3D mtk_vdec_hw_remove,
> > +     .remove_new =3D mtk_vdec_hw_remove,
> >       .driver =3D {
> >               .name   =3D "mtk-vdec-comp",
> >               .of_match_table =3D mtk_vdec_hw_match,
>
> While the patch looks fine, I wonder if having a remove callback just to
> do pm_runtime_disable() is worth keeping it. Doesn't the core care for
> things like that? I grepped a bit around, device_unbind_cleanup() is
> called after device_remove() which calls pm_runtime_reinit(). Does that
> mean calling pm_runtime_disable in .remove() is useless? In that case,
> you could just drop the .remove() callback.

Maybe just switch to devm_pm_runtime_enable() on the enable side?

ChenYu

