Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FBAC74A4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 20:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZpqs5siL4Ymiuu8Rnql+zUqmGWcS+ZbAUBpWJ9W4K8=; b=JZhVY+wf4CDIUKqSEuNu36MJxh
	sVTwH4eu79cnNa8d0+nRvl6T8NyYNHNUoibPPgHSUfLKeug6heoS86xQhfdm7AIZWpw5GrXv6TLYC
	iRzEM97oD27WuHhtmRiVAu82OVF9PoK/n6WkRWzsMwzcV97Xy23LUGo5whay9SRE+pYBG/giO3QQ1
	WWhvl1Ri5QPxygxYG8Y9hN6eds6us2C2nj+VRwBfGmO7FBvgc9SK9JtqjAhLBZWQp7hPq6JQdHRdb
	OJnoQKuzj0rKnAbVOk2TkNnX3rJ9tcEOd8J3u/ejPLf8GctsTc95Yu2QhE42eTcUO5GbLql7cBuZE
	amQGCXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpB3-007jhs-LI; Mon, 13 Mar 2023 20:53:53 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpAs-007jf4-GZ; Mon, 13 Mar 2023 20:53:43 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-541a05e4124so78026927b3.1;
        Mon, 13 Mar 2023 13:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678740820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZpqs5siL4Ymiuu8Rnql+zUqmGWcS+ZbAUBpWJ9W4K8=;
        b=KDTS7fZaclyphgJmqC5N15uD3+Gq9l4SliqQgO+pQM5PW7JyjCgsme6Ge6zXtsqVxx
         AW1l83xNB2ZVX6w+QoQcccw87e1AscXRvCCeZLy1nzrLKUU1XU34faaYkOiDyN24nAY+
         v6AuBphGSYHv2//9OqQZjdq/Jw5V0E+1129tns66JhFazayIQv6o62288nii6Zp5HB1N
         TVhCN3L0l+bFus5xhnnmZ3CJCowu7SEkSE+SVTPEf73wBpgQuZlxkq1PIFew5GxN8BkQ
         9o66TpI9Ei8fIKOQHLzaO+QfgzHm0YuUjG7Vicxxh0QA7Gdwclqym4Dwdmdr6Txlz323
         wNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678740820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZpqs5siL4Ymiuu8Rnql+zUqmGWcS+ZbAUBpWJ9W4K8=;
        b=hljnd2CuDckgGY5bYNRZpPtOekkYPWcL5pQwG/bR2iHNnEQXYFEY8VIebv2wgYEmje
         7QPJ6S8ICS8NOHPf3FbPWV9KrUEMyF4odXo8tQZk87gHf/nU0xsXCGBJwuHuH9+5mY3B
         kQZaoc0+P4fEoOIQ3ZFQCRD5iSiGxC6en9rZRO5MAmkJICZwBwxIzIMc8m181q8hMaGM
         CybjAQV9lqNLcog6ajlgYanvYeq/zmvzCrqG68QyppJ+rIqqMkpeTNhUoBxdV6yf1DR2
         BZeTdtGcX/3Ftv8UixDcsHka1rL9V6NZeuX619DglK4xtyA8cMuqeFlsa+rRprkAt/7z
         eZ4A==
X-Gm-Message-State: AO0yUKWrSh4hK8E1YX1YGMZPEtCa7qLGHU6Z9Vn8hIW/jsxeqwX6+jn/
	jM/arxX8nDECq51TJ7Uyx18gjumITr1JSc/zPiA=
X-Google-Smtp-Source: AK7set+bkApoxdat3t4mM5yzrnKSLYecVccpJe9yYCQX9Rk8pbyyHXlR/QgC7cJyNYCPNbj0eloQSjFebG86/6a1CaA=
X-Received: by 2002:a81:a9c6:0:b0:52e:f77c:315d with SMTP id
 g189-20020a81a9c6000000b0052ef77c315dmr8791180ywh.3.1678740819961; Mon, 13
 Mar 2023 13:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org> <20230312131318.351173-11-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312131318.351173-11-krzysztof.kozlowski@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 13 Mar 2023 20:53:13 +0000
Message-ID: <CA+V-a8sPwMax7A=k=8bz9SDbWJt7mNHG0-27UXsC=bEhAP3zQw@mail.gmail.com>
Subject: Re: [PATCH 11/28] media: platform: ti: am437x: drop of_match_ptr for
 ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>, 
	Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_135342_595389_29D7677A 
X-CRM114-Status: GOOD (  17.70  )
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

On Sun, Mar 12, 2023 at 1:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
>
>   drivers/media/platform/ti/am437x/am437x-vpfe.c:2620:34: error: =E2=80=
=98vpfe_of_match=E2=80=99 defined but not used [-Werror=3Dunused-const-vari=
able=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/med=
ia/platform/ti/am437x/am437x-vpfe.c
> index 2dfae9bc0bba..fe89b8e250e7 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2629,7 +2629,7 @@ static struct platform_driver vpfe_driver =3D {
>         .driver =3D {
>                 .name   =3D VPFE_MODULE_NAME,
>                 .pm     =3D &vpfe_pm_ops,
> -               .of_match_table =3D of_match_ptr(vpfe_of_match),
> +               .of_match_table =3D vpfe_of_match,
>         },
>  };
>
> --
> 2.34.1
>

