Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B03BEB64DD
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jul 2023 09:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Y92lXyifAyJtOM5gK7Dsb34fvRwiHTeIOUsz1X8hBY=; b=cVACyzeYyQQnMM880hPWUzs58z
	PeoSiGqjIRR8gsOpx6TtQhcYmQOaQ6T79s6iFzmNJyAhYkzmJj3rVRTyxXrjeQwjWY6s95oypHcXS
	/vo6Et3A7Tl3GrMkHn1U9jkZXYT+sPojA7zMVQHFcIRcEwZltmO/u202cOM0F2BfQeMJb+hLd0g20
	D94K4evQpz0jOn4zYlVV/7C7CSjr2taF1GnWEbrXilMntlX6OZd8fCKD9Q6/DQkxKsqHukArZRNTG
	Y+UUoIaFl9u5ui3CizUK5hqkYuKNXXURgrc6p6WP8KmGQ4gLZryYO0OvydRj80EWL5BUmPxwTBJq0
	dsW3OqDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtG9-007TIh-1N;
	Sun, 02 Jul 2023 09:20:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtG5-007THO-20;
	Sun, 02 Jul 2023 09:20:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C607660BDE;
	Sun,  2 Jul 2023 09:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC89CC4339A;
	Sun,  2 Jul 2023 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688289639;
	bh=OoxJTr497VHioUOadb8LISKib9/DxBLCZJxT7FykF9g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bL0RniYz/c2H9vpv4pnuaegmDqeFYDlUS2BEZ7GDJrxaZs9kAQm8I1PMBYfdWmWpL
	 Q4BwNtmNN7cjEb9ZEBMxfdH6HGTTH7ldQIhsTRnan2H8upACk1UfBKxzWVDIqZK7EC
	 aoJ9kyx0fO+f5T4QELXyDFR3OOW71En9FO9CRQCv8gCGAKA+8DvNDYz/5JckqAS+Yl
	 vdPmulOGE4uWEYbOL2mghdaRMKPAWPkzRISV58zSqCf0nVYb8PmGRuSaqq5toObf3+
	 udZE9XFmwFXy7ZVJQy1bsEEI0vrmLPLd+BMr1MqiYnB2kpaKuFh8RCPJN3a206Hxl9
	 OIBmWKxePHZ8A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so5528080e87.2;
        Sun, 02 Jul 2023 02:20:39 -0700 (PDT)
X-Gm-Message-State: ABy/qLZZL7zl/2SJc0+jjiHJLtiZpiQj8XzaaMIJolcBuaStD5T6o3Vf
	S32Ocx/F6mS8YGR34XofJ8FSf74I/20u+WXeAw==
X-Google-Smtp-Source: APBJJlFzKkAXMTAQCIn36i2e8A9159bcyumoyoBjKkUas8tkWmueWlSltNowd8sa4B/xy0FSyk17VqHCj3F5LJNwJpU=
X-Received: by 2002:a05:6512:ea0:b0:4f8:6882:ae9d with SMTP id
 bi32-20020a0565120ea000b004f86882ae9dmr5936084lfb.69.1688289637554; Sun, 02
 Jul 2023 02:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230630100321.1951138-1-jstephan@baylibre.com>
 <20230630100321.1951138-3-jstephan@baylibre.com> <CAAOTY_-qu2RWr496wXxc1Cp14eZfzKt4QgEH8fJns2LOjpwi8Q@mail.gmail.com>
In-Reply-To: <CAAOTY_-qu2RWr496wXxc1Cp14eZfzKt4QgEH8fJns2LOjpwi8Q@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Jul 2023 17:20:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9SFRMb7d3c62SVDnZY00hRAZ=9wBi9QCcv1UKuc8iBtQ@mail.gmail.com>
Message-ID: <CAAOTY_9SFRMb7d3c62SVDnZY00hRAZ=9wBi9QCcv1UKuc8iBtQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Julien Stephan <jstephan@baylibre.com>, Louis Kuo <louis.kuo@mediatek.com>, 
	Phi-bang Nguyen <pnguyen@baylibre.com>, Florian Sylvestre <fsylvestre@baylibre.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, daoyuan huang <daoyuan.huang@mediatek.com>, 
	devicetree@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_022041_784119_3C3309EB 
X-CRM114-Status: GOOD (  17.74  )
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

Hi, Julien:

Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2023=E5=B9=B47=E6=9C=882=
=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=887:35=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi, Julien:
>
> Julien Stephan <jstephan@baylibre.com> =E6=96=BC 2023=E5=B9=B46=E6=9C=883=
0=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:05=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > From: Louis Kuo <louis.kuo@mediatek.com>
> >
> > This will add the mediatek ISP3.0 seninf (sensor interface) driver foun=
d
> > on several Mediatek SoCs such as the mt8365.
> >
> > Then seninf module has 4 physical CSI-2 inputs. Depending on the soc th=
ey
> > may not be all connected.
> >
> > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> >
>
> [snip]
>
> > +
> > +static const struct mtk_seninf_conf seninf_8365_conf =3D {
> > +       .model =3D "mtk-camsys-3.0",
> > +       .nb_inputs =3D 4,
> > +       .nb_muxes =3D 6,
> > +       .nb_outputs =3D 4,
> > +};
> > +
> > +static const struct of_device_id mtk_seninf_of_match[] =3D {
> > +       {
> > +               .compatible =3D "mediatek,mt8365-seninf",
> > +               .data =3D &seninf_8365_conf,
>
> Now only support one SoC, so it's necessary to select the SoC data and
> you could directly place the data in the code. After support other

Typo.

Now only support one SoC, so it's not necessary to select the SoC data
and you could directly place the data in the code.

Regards,
Chun-Kuang.

> SoC, so we could know what should be placed in struct mtg_seninf_conf
> (Now we have no any information).
>
> Regards,
> Chun-Kuang.
>
> > +       },
> > +       {
> > +       },
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_seninf_of_match);

