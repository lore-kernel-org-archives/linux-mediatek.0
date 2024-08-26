Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCCEC5321D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 05:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBi6WqSTf8FC6xwJzYMYM89MMQd/hd27NLSyQMmk8BM=; b=GQkOj/7nfhl5ZkfvFWf0K+zMVC
	anymedZZfUI0Abt7/4SZIs5c9afHB+zIEAsF5RHIlfjOUVxj2AzvEqK2pJVPaviA2hryP4yr8yMWZ
	O2lyrm5Pm8kshQacbAd5QfU0NuePKoWPTFQrcHLJz/OUkwPfisa5BF/u9T/zjy1a+YoAtzTsP6yn1
	M7NHYMDDkn5ebZww3yRM/Sj7QlZqS3PVbOpzmg7qLnV97VByRXF39yyexbrwSTRyDHr71BI5GzJgF
	uZzeQLoazOqJyRs0CBMcZKIO/jFDVC3gf/y6P+a5qotJSZBLWkO1u4Trtw/KX/yuAXIVaPSQy5MMD
	r4/MovOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siS7D-00000005rGy-0wa4;
	Mon, 26 Aug 2024 05:18:07 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siS7A-00000005rGC-2jfs
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Aug 2024 05:18:05 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53351642021so4420647e87.3
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Aug 2024 22:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724649482; x=1725254282; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBi6WqSTf8FC6xwJzYMYM89MMQd/hd27NLSyQMmk8BM=;
        b=EDHOH82MXk2aMvsPmlLuCl4jqlwDM1tqKS6AtKvQUsl7ZYF7wwWSnDC+mh0G2lL7z5
         2deXcQlyODfGVTqH1HskrruVzKAMzQGIyWyLMTX+YXxFNaekI8S9sXeYaMvXa1uGloGJ
         oFF1uQSbtfyTbO1U7mUX2EOQDmgYHw1xNI4hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724649482; x=1725254282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBi6WqSTf8FC6xwJzYMYM89MMQd/hd27NLSyQMmk8BM=;
        b=dgFlAV6yNqeRccdZNtoXgJCxYWktjhV5vJsMHOyHyZ4401TFyDLW16N5iAo8EVvme5
         XvTekztIxri4xRet/tgDxwC+9Pngh92voaOUcMwn7C+x5B6Qts5rBVBQ2Rg+GkFTzE8F
         LLq5miAEt4lAFWUHPeHBeF1QNS7FXyrxPoJC90WRYKrFtq6Mwd5a2WnMXVM1mk28E7NS
         QqM3kYKNokhk2BAS1xIuXlZZGsDKl95eWoJAlAfynnZXhqBbee5e/0aT6XJ7MktGsgK5
         zi+vaag0CaP+kQXVlqnDOJVjKCIiXIrxGjZ3/7yDdOZ1tC9YSajpT9DQLvVoaqomDz/i
         S6eA==
X-Forwarded-Encrypted: i=1; AJvYcCU/XBz2A0F0YFp3bbIufLcfhED6nio3V31tBuUQJ8D6c2kLpGOIa9Gq3FhUqCY54CWq6ViauZgdqJq8Mm+6ew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw77yE/Rln/8bzCRIrpW0bbxufy00Dzm9+PTc76IxB/VG5Iq+Tt
	eSP1l1CrSe2WDiCGOFUIANqn/H9mU/3K9nhKTF7H3NStixW292JNSmbT9bnxkFOW6NqUEH9PU+x
	s35pfLdcYtf2L5eCJsNEAjkBxgGBFbFUNMEmM
X-Google-Smtp-Source: AGHT+IHVTY5sJTAr69bRtw0O0k6zDRln3oL7Hx6o0x/ihjgK98b9yiE0d0nBhAd2Q/s80ymcCqEG9Bl7y/fyoZTQUjI=
X-Received: by 2002:a05:6512:1048:b0:533:1cb8:ec6e with SMTP id
 2adb3069b0e04-534387858b2mr7000897e87.33.1724649481695; Sun, 25 Aug 2024
 22:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240826014419.5151-1-guoqing.jiang@canonical.com>
In-Reply-To: <20240826014419.5151-1-guoqing.jiang@canonical.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Aug 2024 13:17:50 +0800
Message-ID: <CAGXv+5G6AToabUmvPvcHQZaU-A6b-Y82ErUGxBVDojK5gMBz+w@mail.gmail.com>
Subject: Re: [PATCH] hwrng: mtk - Add remove function
To: Guoqing Jiang <guoqing.jiang@canonical.com>
Cc: sean.wang@mediatek.com, olivia@selenic.com, herbert@gondor.apana.org.au, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_221804_722525_AFBB5B28 
X-CRM114-Status: GOOD (  20.84  )
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

On Mon, Aug 26, 2024 at 9:45=E2=80=AFAM Guoqing Jiang
<guoqing.jiang@canonical.com> wrote:
>
> Add mtk_rng_remove function which calles pm_runtime relevant funcs
> and unregister hwrng to paired with mtk_rng_probe.
>
> And without remove function, pm_runtime complains below when reload
> the driver.
>
> mtk_rng 1020f000.rng: Unbalanced pm_runtime_enable!
>
> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
> ---
>  drivers/char/hw_random/mtk-rng.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mt=
k-rng.c
> index 302e201b51c2..1b6aa9406b11 100644
> --- a/drivers/char/hw_random/mtk-rng.c
> +++ b/drivers/char/hw_random/mtk-rng.c
> @@ -149,6 +149,15 @@ static int mtk_rng_probe(struct platform_device *pde=
v)
>         return 0;
>  }
>
> +static void mtk_rng_remove(struct platform_device *pdev)
> +{
> +        struct mtk_rng *priv =3D platform_get_drvdata(pdev);
> +
> +       pm_runtime_disable(&pdev->dev);

Instead maybe just replace pm_runtime_enable() with devm_pm_runtime_enable(=
)
in the probe function?

> +       pm_runtime_set_suspended(&pdev->dev);

Not sure if this is needed? I'm not super familiar with runtime PM.

> +       devm_hwrng_unregister(&pdev->dev, &priv->rng);

The fact that it is already devm_* means that you shouldn't need to
call it.


ChenYu


> +}
> +
>  #ifdef CONFIG_PM
>  static int mtk_rng_runtime_suspend(struct device *dev)
>  {
> @@ -186,6 +195,7 @@ MODULE_DEVICE_TABLE(of, mtk_rng_match);
>
>  static struct platform_driver mtk_rng_driver =3D {
>         .probe          =3D mtk_rng_probe,
> +       .remove_new     =3D mtk_rng_remove,
>         .driver =3D {
>                 .name =3D MTK_RNG_DEV,
>                 .pm =3D MTK_RNG_PM_OPS,
> --
> 2.34.1
>
>

