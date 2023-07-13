Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834CAEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 07:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWwEsAQnXaQRkW6Shvt1/+D7e1Ci6uGSzgoWth1dUeg=; b=hiIl2h75UZOCmlXKN3MKDP++b6
	wXi7q/1q9MTqrFHi8eHKbtbbbKZBv6q3bB0KNJJ3MdHn9nS7Pv1ioLqrMAKE1T/X39iAxWcQPuEZ5
	CWBg1ME2lz/nKSbOrBqfkWXJe0KdYd6XHE9rzk05rKDaI94Mu0kpaFIQGZFO2e5jpqQmlNbhPiLZO
	DieiQPZs/pEda9qQM2PrI2xiR/UtIS1WndlIE7qy3MevfaFmRU5xePEBM5+V9QqBxDBow0yuoGyFc
	eGu/wKLJO8+Nr38E6btLZijWcw8BDfCTVqI1vBBEaxs62PU37bAxFFe/af9cUGVh5dusG0OdCnl0V
	Kljg4LpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrBp-002IwJ-0V;
	Thu, 13 Jul 2023 07:56:41 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrBm-002Iuq-0P
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 07:56:39 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-78362f57500so12317139f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 00:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689234997; x=1691826997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWwEsAQnXaQRkW6Shvt1/+D7e1Ci6uGSzgoWth1dUeg=;
        b=n0SzY4H4kCH+4yBRfg+Ryn5JJzBOHQwYfP72Z54T9imN35vX4sSyky7tpSC/O7+Bvw
         u2owW/HzgWThDmMAkkfjheDgSCjycdrGijw3uWC9m1+gWLj8WDh7nTFpMMqE/qTmJP7a
         9wnJQAHSKZd82Q1YFCWTYhYL5wAqjupkpPVnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689234997; x=1691826997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWwEsAQnXaQRkW6Shvt1/+D7e1Ci6uGSzgoWth1dUeg=;
        b=No7b5raw+wSRyI4swiuISCJmXTYzeXC4gK7DK+Konx+yAAYfbjuAVu+MLn6EynzXcW
         aQWKOyHn79HACt51c2L1RDQca5YQ2jdPZNgtHXI9G3wDfMXbzIegMTX0qJvk1pWAkb59
         5AkCjtw1oxKCop0y2S3wQCa/0q3nwdK53HJQjURPv2RLQzbSUdug5Gt1hjDpCl/mQdcL
         ae4UWQJfC+6Role57UjMXXd91Yyv85ebv48RLp7986O/IZiNeKzd31IfWym2fnA/NlYf
         DL7Mfy81cJJSA7Va8YWEkuwfZKFTACQ/UihRoR85NbaO5Gp+VEo+JlOONgpnFNLIvIA3
         D72Q==
X-Gm-Message-State: ABy/qLYihNmuiJ4FxyF20xjtJ6zJtr/OvjmVo+n6nilfttXMvc5C4OtL
	cIySXo7z54GBJgT34QuB+McoX3K4rPEcLPsPbm0=
X-Google-Smtp-Source: APBJJlFSY8M0OpjCwvCHifRxUMup67ROnFNkMFUeBOxphR5yEGYzF/cP247xO5TGDGxj8oNbaumzuQ==
X-Received: by 2002:a5e:c010:0:b0:783:58d1:823a with SMTP id u16-20020a5ec010000000b0078358d1823amr1380357iol.9.1689234996733;
        Thu, 13 Jul 2023 00:56:36 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id h26-20020a02b61a000000b0042b16c005e9sm1754771jam.124.2023.07.13.00.56.36
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 00:56:36 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-78372b895d6so12333039f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 00:56:36 -0700 (PDT)
X-Received: by 2002:a5d:850f:0:b0:786:6180:76f6 with SMTP id
 q15-20020a5d850f000000b00786618076f6mr1349053ion.12.1689234995825; Thu, 13
 Jul 2023 00:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com> <20230412115250.164899-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412115250.164899-2-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 13 Jul 2023 15:55:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1nivzyX9+3EBtAG5dPmy-c6je74zmY68AXjyFvV2Pigqgg@mail.gmail.com>
Message-ID: <CAC=S1nivzyX9+3EBtAG5dPmy-c6je74zmY68AXjyFvV2Pigqgg@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005638_201388_B689F29B 
X-CRM114-Status: GOOD (  15.31  )
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

Hi Angelo,

On Wed, Apr 12, 2023 at 7:53=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change drm_bridge_add() to its devm variant to slightly simplify the
> probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 948a53f1f4b3..2d5f3fc34f61 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -1090,11 +1090,12 @@ static int mtk_dpi_probe(struct platform_device *=
pdev)
>         dpi->bridge.of_node =3D dev->of_node;
>         dpi->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
>
> -       drm_bridge_add(&dpi->bridge);
> +       ret =3D devm_drm_bridge_add(dev, &dpi->bridge);
> +       if (ret)
> +               return ret;

And also drop the drm_bridge_remove() call in mtk_dpi_remove()?

Regards,
Fei

>
>         ret =3D component_add(dev, &mtk_dpi_component_ops);
>         if (ret) {
> -               drm_bridge_remove(&dpi->bridge);
>                 dev_err(dev, "Failed to add component: %d\n", ret);
>                 return ret;
>         }
> --
> 2.40.0
>
>

