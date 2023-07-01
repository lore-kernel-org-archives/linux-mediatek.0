Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FA7EB64DD
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Jul 2023 23:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnU8AK7Y3gGvWOHP+g1W4GHtTC+5dcfW7t19l1xZwuU=; b=JdJFyHHpMrUYdFhjPIyfnSr4/z
	YTJoQ3/QNiw2SRrhF1WiN6e6fmV6f8bgqS2w0AXL4zrHIcmW31HcScu7b+jNJVsX2zAi78BZ0hiMZ
	SJmsWXoZ4BQct10aji4+f5vcXHdU6mAFNeETZzY2BfhyRDU2QOx+2V0w3o1a4Z0smQqP6ZLSQG8E+
	B70iJ3C8XTt0NtB+daz+eNIzssPzG6JdT8ET9Uj5x7Tl5v0y+ZcZEzqkRhDPWQ6UgFoKgWiJlcsE5
	RSwxzXO5p+uOxk1Pan6eDexKqxrb59LnL2EFjxvQQYE1rpxzMjKb3h3JDeX2UvIO+aO31AaAqsXc5
	p9ZaMP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFk7p-006oL6-21;
	Sat, 01 Jul 2023 23:35:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFk7j-006oJt-1i;
	Sat, 01 Jul 2023 23:35:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB99360A08;
	Sat,  1 Jul 2023 23:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36882C433C7;
	Sat,  1 Jul 2023 23:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688254526;
	bh=PJQy4/1p5EsjFhKhO/qYY2FRfK0oK1uwx8Obk6wyd3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ImIdfomfjxVZZ0ycehvi+hOi7iRCrcFuxAmQNRY0/n40l4c0ACk7KUddmkDzXw0zA
	 6FimANH9VzNgmTdfWB6/BRCHh5wzRB70cdhT5nItmFjwToX5I5Lw8HQp7mqAt+nDQ4
	 pQZTUsac+vEjiBj4ZkxLdHDUNcq0OGy7Vs80jvJgeY50p6jRwxY7kvjmf2aikP4vw3
	 hfRVc5bZkRF4adFrJpzkpllK9GS94DOH4MUqQ22rXhCmQgOUpVaWSsozaqN1V5cpoX
	 J/5u3Gx9ihPhWrsNxU1fkE3X1t8yS0BznuQPUzJDNc/e1ke8+P+/lfWRiMzv1pbvsr
	 dLydA7KNsMx1A==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b6a152a933so49592721fa.1;
        Sat, 01 Jul 2023 16:35:26 -0700 (PDT)
X-Gm-Message-State: ABy/qLaOX0Euk0H6ojAxDszPRgy/VtsUAuQX8Ac/5xK0lUISW4VrUsKM
	8ShRpG5R56lxVSgNDM/jiTXv1mJ0Q4HF0avEpg==
X-Google-Smtp-Source: APBJJlGXb97S4LcC81WPYNWzCLE4ubtRDMfQc+w41cN33vqI4+yfgrMOBvquGaWnyjqwJEnQwSWD1+OZZGu2/rbGrDo=
X-Received: by 2002:a05:6512:2094:b0:4f9:5396:ed1b with SMTP id
 t20-20020a056512209400b004f95396ed1bmr4223084lfr.28.1688254524241; Sat, 01
 Jul 2023 16:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230630100321.1951138-1-jstephan@baylibre.com> <20230630100321.1951138-3-jstephan@baylibre.com>
In-Reply-To: <20230630100321.1951138-3-jstephan@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Jul 2023 07:35:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-qu2RWr496wXxc1Cp14eZfzKt4QgEH8fJns2LOjpwi8Q@mail.gmail.com>
Message-ID: <CAAOTY_-qu2RWr496wXxc1Cp14eZfzKt4QgEH8fJns2LOjpwi8Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
To: Julien Stephan <jstephan@baylibre.com>
Cc: Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>, 
	Florian Sylvestre <fsylvestre@baylibre.com>, 
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
X-CRM114-CacheID: sfid-20230701_163527_657293_9271D9AA 
X-CRM114-Status: GOOD (  13.55  )
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

Julien Stephan <jstephan@baylibre.com> =E6=96=BC 2023=E5=B9=B46=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:05=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> From: Louis Kuo <louis.kuo@mediatek.com>
>
> This will add the mediatek ISP3.0 seninf (sensor interface) driver found
> on several Mediatek SoCs such as the mt8365.
>
> Then seninf module has 4 physical CSI-2 inputs. Depending on the soc they
> may not be all connected.
>
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>

[snip]

> +
> +static const struct mtk_seninf_conf seninf_8365_conf =3D {
> +       .model =3D "mtk-camsys-3.0",
> +       .nb_inputs =3D 4,
> +       .nb_muxes =3D 6,
> +       .nb_outputs =3D 4,
> +};
> +
> +static const struct of_device_id mtk_seninf_of_match[] =3D {
> +       {
> +               .compatible =3D "mediatek,mt8365-seninf",
> +               .data =3D &seninf_8365_conf,

Now only support one SoC, so it's necessary to select the SoC data and
you could directly place the data in the code. After support other
SoC, so we could know what should be placed in struct mtg_seninf_conf
(Now we have no any information).

Regards,
Chun-Kuang.

> +       },
> +       {
> +       },
> +};
> +MODULE_DEVICE_TABLE(of, mtk_seninf_of_match);

