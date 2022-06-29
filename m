Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671C3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQ2WMkG8qLYJJV0C5HMk4dgjYPugRu+GbhP5w4vvjic=; b=wkzm335AOm2GmYOZjnBENJ+/9f
	Ax0zBKqVlPp+qvd/T7+YjJAgcGOmcP5iMECLNSeT59sKFzhbEFtD5eAI9cOQ797lGzs4L2ZEdSW4g
	T8q1cIqjdHx0cLhHbhzFkgROfA/kLMFXJwstEmImwKdaINJT/DZP2zzN+eOpvNsaE+RVut4OtTG4L
	zNp68HpDIBnHqcRloIEMhXFZSST51TxRbWbFZJ13bFimJI5QQq61NoNcRepcuyXQW0a6azWAJhpze
	9IeMYiHuF1CgT9ctCLrmhsR1qI30880L8CAk039BcqwY/E7QQ61+ZHsnxQD1UoTHc3Pjy23Y1Md/m
	vgXRgvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Tbc-00AZ0C-EJ; Wed, 29 Jun 2022 09:03:28 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6TbO-00AYuK-Hn; Wed, 29 Jun 2022 09:03:16 +0000
Received: by mail-ed1-x531.google.com with SMTP id ej4so21247764edb.7;
        Wed, 29 Jun 2022 02:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OQ2WMkG8qLYJJV0C5HMk4dgjYPugRu+GbhP5w4vvjic=;
        b=EdB8ANSbg+mWuoSRVZV6lr9LnnNYVKTgGfUKrCfmap9mRwKnvgiD3XqLBs/Og34ANA
         lCesVtTj5HLZNe2p26O/DOgLADPjN4owN7qoaJFbOejhqAWfY/CYuOi6P+Cl4Lx3aIwu
         DyXeCITYCXDXAiAFOENqJr8hoAZVsULyHAovswHOftt4FEKV9lN4nEvHvBff55/EwQuB
         YPC/Fx8PrPFEzIK8qaHLgQglWIKhHYrHWVlIe6IQFu/xdoyQiuyGrY7yCfmZftpgvDz3
         WiCAsFa4Brbganuf6drZtl/SGHVBNOg1xTlnFQ5fkpXW4PixJlA0K4HB7SWr9d+Y98TK
         Zgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OQ2WMkG8qLYJJV0C5HMk4dgjYPugRu+GbhP5w4vvjic=;
        b=7qDZQ8fHWDXqhe/RIOl3aZ9k5kzErjIxPYV7Na9EPEtdoX/sseVi6RC7ZQWZJYGVg3
         WOC4p6Ured5AqYJc3+1r5ASoJkSD58JSz8Nsd5kIuMQtvJCTXoFLYVlVJ44e4yGZbIBc
         clm6HCrvbPAd805dX+dIrqxGSlbxOxQzsK2Hhqx3vnhhWNnS3XjCqCLBOnTqua9ES6dl
         OV5ms6wrGWhQylGavyIgK2l8r3TetgTug+AM/er0vK0R6mz9Pblg9Q7nVVjBC8Ar8saA
         bPRye+6dVOZipe7kMem/niPgp28aC+MxI+Q4Ijbs0Bd2T4hlZvx7BCPRDMOXJ/HkPasD
         /4nQ==
X-Gm-Message-State: AJIora/6zKN7IklkcYozEsDepNfJ/zhNkjUgFBmiVWA5DHOqbce/At3O
	QsbNuhbLjwAUG1mUoIs0yjN1NEX7LhXsHKwf5YZmV8KSOas=
X-Google-Smtp-Source: AGRyM1s6NvfpuVf59YeExhpAq82uCzfN6TBh49uac0wvq2suVqnpKDcYOJ/0eVoirPcMNMr5Qg/mfAQcBO4JMHU92us=
X-Received: by 2002:a05:6402:698:b0:435:75d9:f94c with SMTP id
 f24-20020a056402069800b0043575d9f94cmr2869268edy.330.1656493388924; Wed, 29
 Jun 2022 02:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <1656466861-7737-1-git-send-email-u0084500@gmail.com> <618f0794-429c-705d-ab4c-84aace6aaaaa@collabora.com>
In-Reply-To: <618f0794-429c-705d-ab4c-84aace6aaaaa@collabora.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Wed, 29 Jun 2022 17:02:57 +0800
Message-ID: <CADiBU3-DO0tQhEC9f+p06kDFZsk8vDVu_H74PWKSLrBaW5zB5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] regulator: mt6370: Use 'fwnode_gpiod_get_index' to
 fix gpio parsing
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, chiaen_wu@richtek.com, alice_chen@richtek.com, 
	lkml <linux-kernel@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, ChiYuan Huang <cy_huang@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_020314_661799_2C363881 
X-CRM114-Status: GOOD (  19.46  )
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

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2022=E5=B9=B46=E6=9C=8829=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:2=
3=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 29/06/22 03:41, cy_huang ha scritto:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > From the common binding, 'enable-gpio' or 'enable-gpios' are all well
> > for external 'enable' gpio.
> >
> > 'gpiod_get_from_of_node' only parse the 'enable' property, it need to
> > add the gpio suffix. It's more convenient to use fwnode_gpiod_get_index=
.
> > Although fwnode parsing is not preferred, but 'of_parse_cb' already can
> > guarantee the callback will only be used by regulator of_node parsing.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >   drivers/regulator/mt6370-regulator.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/regulator/mt6370-regulator.c b/drivers/regulator/m=
t6370-regulator.c
> > index bc356b4..949b2c7 100644
> > --- a/drivers/regulator/mt6370-regulator.c
> > +++ b/drivers/regulator/mt6370-regulator.c
> > @@ -153,7 +153,8 @@ static int mt6370_of_parse_cb(struct device_node *n=
p,
> >       struct gpio_desc *enable_gpio;
> >       int ret;
> >
> > -     enable_gpio =3D gpiod_get_from_of_node(np, "enable", 0, GPIOD_OUT=
_HIGH |
> > +     enable_gpio =3D fwnode_gpiod_get_index(of_fwnode_handle(np), "ena=
ble", 0,
>
> Since this driver is never calling gpiod_put(), you can even fix that in =
one shot.
>
> Just use devm_fwnode_gpiod_get() here, as it's guaranteed that priv->dev =
is
> initialized at this time.
>
Refer to the regulator framework,it will take over the gpio_desc.
You cannot use devm version for 'gpiod_get'.
> Cheers,
> Angelo
>
>

