Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2390C001DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 06:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtp1bzCVDFwIiSovncTLXWQtJcUXbRosxyZwqe0vmGs=; b=Pm1/lGzMo3tD1wFzswoS7Quup+
	8Rnit2jU/euHEZpdBUEyPxrwoQC8DTjQ0afy5ImCFC/74RcRDntSKQyxV7ivDxXRUlFMkna9i+7P4
	D+/IgWNKkD7V8O2UjQVg9AK9KLyxKywIoOWeUNC39La8D6VJsWqDz7ZZxTLwI6jcpPAcm0J+naEmV
	DZLJNrP+tUe0yXr7TJQbPcx5akz8UnRtWZMBML9AMnE5Itash+dfAid3R7W/4x3+Eo2WHTWUcu+Rp
	VjfB5EVrI9ZpQZbXa+kcWhYSHVGz+BG5+5fCRjWw4CcIt7nm5oKn61gxSw0mjRLvRuftAJUg29sBb
	/2BZfZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVQsa-00GFnf-1y;
	Mon, 14 Aug 2023 06:16:40 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVQsX-00GFmQ-2r
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Aug 2023 06:16:39 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe55d70973so4615917e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Aug 2023 23:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1691993795; x=1692598595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtp1bzCVDFwIiSovncTLXWQtJcUXbRosxyZwqe0vmGs=;
        b=YDpPpXmNzXUlbdG/UEBe8x7JmXGK7eWE++II4MlYs3jd4ooDq7+4xrWE/uz3RVWarW
         X9MKyT7BzZoZQFd7YypPoAau3NpVVvknneEgz5Sos4Qs2eRGxA7eGm6eB+wwEi+Znb2b
         xSluQmB9hDhc+I75zzM4QOJgc0Q4pAcqvEb8QxQ3VJ4vKjQ4XnJCeg5VWRoMdCI2JK5e
         CTePX9wdt/V1Ecneh4tno0VhK+I07wNN1/lBqT/G034Xv2fJgLKTVsh9znST1GKP4Odh
         DvY5tGtIAZHWHFtS7F06t0Kc0YuAn9kfB8BKy7MPRlxUCRJU+X2FBUHixQlcD3VbJDiv
         JKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691993795; x=1692598595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtp1bzCVDFwIiSovncTLXWQtJcUXbRosxyZwqe0vmGs=;
        b=cB1QEMsEsapKJdT3TjXzObqhSpPF/l4ZgASZ2G3idL+NbgYtW0/LVBwkG9uMnJDJbX
         3CXyzvNoxXtofa8Cxb/lqGuRVSGiJ1Mp9G7Vn+EIn/mbYwSakbG/cDGqnfIAVMLHqetx
         V1nfJLVYUKocXcTVh1xeuyOn0jhIh6CmzISrbbO7yFjdVXXxziVbmtbPioiuHn1JjNpS
         fKHksjYpZcAflsLUFC2o8Nvakj4980f0n+ZVtJnoNkSQ3WBm37cTGALsHIHiIyBrjuun
         RTEWhU5Ipt7xZuqtHpfpmwvtFMgSepTzM9kA/kqYLDdZRTiLT3eNwveCX5qUlFuDB6lB
         Oc/g==
X-Gm-Message-State: AOJu0YxbdVLiwrETllhUviqCufrAWRjc3rIvvXLdhfPCBaxAPpFLVxQO
	57tDq8BlZ9SzaOpNv118cqHhwOFZZnrIg4si5+s1nw==
X-Google-Smtp-Source: AGHT+IEB803wvl7rL05GuOz87zusd0mp83hEVNoYiEid4k5V2fkib0/LS0E2ZX26IunNIvwK54X/SvavadmoSxcMyr8=
X-Received: by 2002:a05:6512:110d:b0:4fe:8c1a:e9b7 with SMTP id
 l13-20020a056512110d00b004fe8c1ae9b7mr3885743lfg.34.1691993794927; Sun, 13
 Aug 2023 23:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230813190845.49738-1-alex@shruggie.ro> <CAGXv+5F8HZOawAKoDvVCx7+mGmEPsELzp-r-6c5tw64c87Aa_A@mail.gmail.com>
In-Reply-To: <CAGXv+5F8HZOawAKoDvVCx7+mGmEPsELzp-r-6c5tw64c87Aa_A@mail.gmail.com>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Mon, 14 Aug 2023 09:16:23 +0300
Message-ID: <CAH3L5QpgFzyhru8AXHHnp5DFqb60tGxQ93Kf_+vdm12N5V72tw@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek: remove redundant dev_warn in probe
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org, 
	rui.zhang@intel.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, aouledameur@baylibre.com, 
	daniel@makrotopia.org, void0red@hust.edu.cn, aboutphysycs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_231638_106191_FBCB8206 
X-CRM114-Status: GOOD (  25.97  )
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

On Mon, Aug 14, 2023 at 8:20=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Mon, Aug 14, 2023 at 3:09=E2=80=AFAM Alexandru Ardelean <alex@shruggie=
.ro> wrote:
> >
> > There's no need to print any extra messages in the driver if
> > devm_thermal_add_hwmon_sysfs() fails.
> > If this function has any failures, they will already be printed.
> >
> > While looking inside 'drivers/thermal/mediatek/auxadc_thermal.c', the
> > failure will be either be one of:
> >   'Failed to allocate device resource data'
> > or
> >   'Failed to add hwmon sysfs attributes'
> >
> > Also, the failure will be reported on the 'dev' object passed to
> > 'devm_thermal_add_hwmon_sysfs()', so it should be clear which device th=
is
> > error belongs to.
> >
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >  drivers/thermal/mediatek/auxadc_thermal.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/therma=
l/mediatek/auxadc_thermal.c
> > index f59d36de20a0..55f7fde470e5 100644
> > --- a/drivers/thermal/mediatek/auxadc_thermal.c
> > +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> > @@ -1290,11 +1290,7 @@ static int mtk_thermal_probe(struct platform_dev=
ice *pdev)
> >         if (IS_ERR(tzdev))
> >                 return PTR_ERR(tzdev);
> >
> > -       ret =3D devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
> > -       if (ret)
> > -               dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs"=
);
> > -
> > -       return 0;
> > +       return devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
>
> You changed the logic here. The original logic is to print a warning
> if the hwmon sysfs stuff failed, but continue to probe the driver. In
> other words, hwmon sysfs failing is a non-fatal error.
>
> Your changes make it fatal.

Ah, right.
My bad

>
> ChenYu
>
> >  }
> >
> >  static struct platform_driver mtk_thermal_driver =3D {
> > --
> > 2.41.0
> >
> >

