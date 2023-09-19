Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA7BCD54B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCeLC1/fL5uYZGBDL0V8OauxmTwPHI6gQ14lLZIwYdk=; b=X4CY/aIRFNpg9C2Pl1JHfewYjj
	K0ypBvKnRHmT+inT3Q+QiR6OkFcg5CvFrmZsI1Ig7alavHRGk8Xdo6qgwFiDrtdaC8ARmy1W1IIu7
	rZtFg8rF4eMaaPC7zrKHF37Xo5CvMMZVNUjrI2cUrHTHw3q1pC2v4O9vGjOxP1agJAVkEcB5mnfMO
	zWNP5ZmBO0omextK7cl3LjJPUBAMN/Bh2yUfJrfsyYITeYn+fWIwhgRXT6dvp5U0+ws/eX9fXm+Yn
	xtw9Ki4fPxCAMccBbb9jtTuZ5H2AUYK6uyTjrpiyYr/HnUwUggtuaO9utFPmWs97pGbiO7CoiGtJi
	vwTKhSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXwr-0001EW-0i;
	Tue, 19 Sep 2023 10:27:17 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXwo-0001CK-0p
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 10:27:15 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5008d16cc36so9074932e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695119230; x=1695724030; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCeLC1/fL5uYZGBDL0V8OauxmTwPHI6gQ14lLZIwYdk=;
        b=h5wfoD7MptRGkvne1bOdnntr2APlW6dZeG7O20neu3Medd6TrXylCh8OKwC9xFed8m
         TFAeAhoMerHQ207qQBRJdEg+ICjkjGe7yLFCBim9E873r5UaI6w7vDgx2/PUGSO2sS19
         240B5NrwSZ7Ep8oqvYFw3olFDUXuhOfdTqB9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695119230; x=1695724030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCeLC1/fL5uYZGBDL0V8OauxmTwPHI6gQ14lLZIwYdk=;
        b=c6QVFeE9PFacroN68KCzcwLVBdrQDO+tcpmsYEGezAJUmzAS+6+tjWOxPToKQkcEaq
         M8oJ8K2ZPiMWSaaECf9caNoLOahfvQY9LNgNWSnyaLA8xAVXgz6CSFF6t/k6eBUr6i4x
         VH92l04uNb3opiRQ3GbM6tHQKyMHVr+QD+SMcJnPV6ATNNh8/mgcN5FWHlsAFipqR/j6
         rT0SRJvpYQMCQZScvvxrzLtd6/HC4s/Vrc2heE7rwqHrimWbYv8fDhylDk4Ck6fIOz/Z
         bnY0xukYY/ANfVVvHTm0d8DDsIYW8Bi7Bf6SpMGSJBhFpTsHRmrPicJYKGlGfiWHf9JV
         7HCw==
X-Gm-Message-State: AOJu0YwXQRoWnhdc96bU3JjMx7jHRIuaCTSYo43cfWHGorAbiu7CHJRJ
	SAItiGT/2LSZLbm4Iv/LYQ0pECjtjrnX0mEIA1SsoA==
X-Google-Smtp-Source: AGHT+IHPErruttZ3FyC8GqRiqlrVpQemy7Vw6ESh5Jd2eDFXppLQB4lEWWx/VD4iAcucs811it+71i2s3y0iMA6LtpQ=
X-Received: by 2002:a05:6512:1c5:b0:503:17fd:76bb with SMTP id
 f5-20020a05651201c500b0050317fd76bbmr4104900lfp.39.1695119229636; Tue, 19 Sep
 2023 03:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
 <20230919095938.70679-3-angelogioacchino.delregno@collabora.com>
 <CAGb2v66rEqWBjdMNO3VMZhYj36hhKTxPk+9pborPjnqW0B-=ZA@mail.gmail.com> <f1e28c8d-c30f-d80b-3d6f-fbfd3e55a64a@collabora.com>
In-Reply-To: <f1e28c8d-c30f-d80b-3d6f-fbfd3e55a64a@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Sep 2023 18:26:58 +0800
Message-ID: <CAGXv+5EQYTetP8OaZMRZKjmFtQ_mEgFKCBBPyW-SVCCNczzisw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: platform: mtk-mdp3: Use devicetree phandle to
 retrieve SCP
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wens@kernel.org, mchehab@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, moudy.ho@mediatek.com, hverkuil-cisco@xs4all.nl, 
	sakari.ailus@linux.intel.com, u.kleine-koenig@pengutronix.de, 
	linqiheng@huawei.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_032714_293067_0F8F81E0 
X-CRM114-Status: GOOD (  27.05  )
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

On Tue, Sep 19, 2023 at 6:24=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 19/09/23 12:21, Chen-Yu Tsai ha scritto:
> > On Tue, Sep 19, 2023 at 6:00=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Instead of walking the entire parent node for something that has the
> >> right compatible, use the scp_get() function provided by the MediaTek
> >> SCP remoteproc driver to retrieve a handle to mtk_scp through the
> >> devicetree "mediatek,scp" (phandle) property.
> >>
> >> In case of multi-core SCP, this also allows to select a specific core.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>   .../media/platform/mediatek/mdp3/mtk-mdp3-core.c | 16 ++++++++++----=
--
> >>   1 file changed, 10 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/dr=
ivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> >> index 8677e7fd5083..d93d3833633e 100644
> >> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> >> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> >> @@ -254,13 +254,17 @@ static int mdp_probe(struct platform_device *pde=
v)
> >>                  goto err_destroy_job_wq;
> >>          }
> >>
> >> -       mm_pdev =3D __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
> >> -       if (WARN_ON(!mm_pdev)) {
> >> -               dev_err(&pdev->dev, "Could not get scp device\n");
> >> -               ret =3D -ENODEV;
> >> -               goto err_destroy_clock_wq;
> >> +       mdp->scp =3D scp_get(pdev);
> >> +       if (!mdp->scp) {
> >> +               mm_pdev =3D __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP=
);
> >> +               if (WARN_ON(!mm_pdev)) {
> >> +                       dev_err(&pdev->dev, "Could not get scp device\=
n");
> >> +                       ret =3D -ENODEV;
> >> +                       goto err_destroy_clock_wq;
> >> +               }
> >> +               mdp->scp =3D platform_get_drvdata(mm_pdev);
> >
> > You need to keep the original code as a fallback for old device trees.
> >
>
> I haven't removed the original code, it *is* there as a fallback :-)
>
> mdp->scp =3D scp_get() <--- new
> if (!mdp->scp) { fallback }

I see it now. I guess it's time to call it a day... I even replied with
the wrong email ...

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> > ChenYu
> >
> >>          }
> >> -       mdp->scp =3D platform_get_drvdata(mm_pdev);
> >> +
> >>          mdp->rproc_handle =3D scp_get_rproc(mdp->scp);
> >>          dev_dbg(&pdev->dev, "MDP rproc_handle: %pK", mdp->rproc_handl=
e);
> >>
> >> --
> >> 2.42.0
> >>
> > _______________________________________________
> > Kernel mailing list -- kernel@mailman.collabora.com
> > To unsubscribe send an email to kernel-leave@mailman.collabora.com
>
>

