Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9030BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSNsJXRAq4gUj6ivdXbrjgAuRPp+HHbhKrKeTXicOCg=; b=3WXDbBf5L1j7NQOBM/ampOYTp1
	gWdGoiv3kcqc1d8xhTa/lOKCYGBpP8LsO0ZcDkTXs2EPM/MjYwtrBoqdqqvh0w+o/Jb6FDPyA7VNt
	H9FnMGeKGUBJMQngmU0HDzspPPIc58Pj2HA81PorsjtBiDA4MNVdVFsxqHS9ZkYvl+2YbA605mcQf
	eMJ4rHFrhPzfbQIBfE7P7jb2Fn77Dnx9i5t9SK/dV/OqJ74cwWz2Dzhhjbkeof6atjHbVR61cOjFT
	+MNw6+BSFx+hgogeuTWrb4jfjAeAPYD+gqzxoKL0dH0gpAqVMG7Ntn5cEigM+me7tstjK4OXD/7Fw
	c0AvHxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27xR-006b3R-6V; Fri, 17 Jun 2022 09:08:01 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27wV-006abX-Rm; Fri, 17 Jun 2022 09:07:07 +0000
Received: by mail-il1-x134.google.com with SMTP id h5so456968ili.3;
        Fri, 17 Jun 2022 02:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qSNsJXRAq4gUj6ivdXbrjgAuRPp+HHbhKrKeTXicOCg=;
        b=Dl6LB9Q7n5EpkbYyX81Yn4cmxCMk5bOsvIkbCtCocr/dTjXuNz2CrJSviTnH0BS1ZA
         csEqG/oDAowT6GKI5Jv33GJEiHpYxvdMlDZhfZBBuw/eZ9Eo831Cknv0KsMHy7G0DWSs
         3swp9MPgLARrnm6iLy+/DP1EEaXbJ7LnAHzCQlBxp5v/D0UiuJmor5kJKMxWAzEUyXZI
         1+858U9fStR05SV0oD9CPijH25+Hp8jW+T2+F6TYxR/pS4vViGBRihmxY3Mm2QYpLSfc
         pMc8NksdwBd9eDGRApyinNjzZgukXbDtZkXMIRDLUvQKRqSpj3sI5S1JKd3VMT+YO5Eb
         /7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qSNsJXRAq4gUj6ivdXbrjgAuRPp+HHbhKrKeTXicOCg=;
        b=RnKMCGtT9qzj6odttCa9gEAE8WAIeI1yn9pXhe2YUxVhCwBw3OC5YJFvH2CjeZ3A1/
         t0xjL8X7L7q7i/WB+J5F1fuQab7JhN1+wNg9nzR+/zOU8XEsdj4xpp2dHyZnYSEEp29I
         9IoH9+5/3sJuB6wYxn3eHucYK1Ctow1jD7BoJtQ+sVkNwNo067EKS70f4rs8eOSxewN6
         +kyjGolSRJIqsYS+9XsAVE07wGmQDSVKDmAHqprNn3puYO5+DJZTEA6D5QFM1q2QkMqx
         ylXGvyehUVywZ27RD5uxlR0kY/Hn27nc3eQ24xbFOcX56bd1y50qmpKv3sWtA+I4ZImy
         xvrA==
X-Gm-Message-State: AJIora8hz1j+EuRw84xlnfiVtWc5A4L6mw620fNcWI+bjTnYrc/afSp3
	QcsV1xeAzxeVNM0dYxhH0rL8IJFQnUZuteaNzjM=
X-Google-Smtp-Source: AGRyM1tGCu6AS9wDCH8Gur5zYW6uSfoWWJs4DOW5mFrlMgAa3+NrBz1Bdl1bq12S+LuODQiyUM9pGAPCWwXJA6zrKuk=
X-Received: by 2002:a05:6e02:1aa4:b0:2d3:aeb9:930 with SMTP id
 l4-20020a056e021aa400b002d3aeb90930mr5026082ilv.45.1655456819325; Fri, 17 Jun
 2022 02:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com> <20220613111146.25221-11-peterwu.pub@gmail.com>
 <31b588e9-2233-3b40-e452-83f0f6bfb744@infradead.org>
In-Reply-To: <31b588e9-2233-3b40-e452-83f0f6bfb744@infradead.org>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 17 Jun 2022 17:06:48 +0800
Message-ID: <CABtFH5K9SiOO-JDMoJJ9=5Y2XpMBirgX0ce+8F4e_Kgsk9Udaw@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] regulator: mt6370: Add mt6370 DisplayBias and
 VibLDO support
To: Randy Dunlap <rdunlap@infradead.org>
Cc: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com, 
	lee.jones@linaro.org, Daniel Thompson <daniel.thompson@linaro.org>, jingoohan1@gmail.com, 
	pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com, 
	ChiYuan Huang <cy_huang@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_020703_980731_6A50347D 
X-CRM114-Status: GOOD (  14.17  )
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

Hi Randy,

Thanks for your helpful comments!
We will refine them in the next patch, thanks!

Randy Dunlap <rdunlap@infradead.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8814=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E5=87=8C=E6=99=A84:15=E5=AF=AB=E9=81=93=EF=BC=9A
>
>
>
> On 6/13/22 04:11, ChiaEn Wu wrote:
> > diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> > index cbe0f96ca342..dcb6866dab53 100644
> > --- a/drivers/regulator/Kconfig
> > +++ b/drivers/regulator/Kconfig
> > @@ -804,6 +804,14 @@ config REGULATOR_MT6360
> >         2-channel buck with Thermal Shutdown and Overload Protection
> >         6-channel High PSRR and Low Dropout LDO.
> >
> > +config REGULATOR_MT6370
> > +     tristate "MT6370 SubPMIC Regulator"
> > +     depends on MFD_MT6370
> > +     help
> > +       Say Y here to enable MT6370 regulator support.
> > +       This driver support the control for DisplayBias voltages and on=
e
>
>                       supports
>
> > +       general purpose LDO which commonly used to drive the vibrator.
>
>                               which is commonly used to drive the vibrato=
r.
>
>
> --
> ~Randy

Best regards,
ChiaEn Wu

