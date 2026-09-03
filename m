Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9D5C61DD6
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 03:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=; b=URWVqaeWwcgSTub7q0bP5rxVdM
	eSN/6zhJaG6r86+ZdoipXIpYNE0saTQCoIj/WHfPSL4tpcvzyaBE68ZfMRoq0+SWnj7U9LArP332U
	5gYCWgUJR1Hv6SLYAd1AO+pZCvOaEh5Arr+MeQAI2E7IsMs9APJ905LD3oMiH/BoJhoTN4mb4NlgI
	iS5YSYQZE4jGgAr+6C4acalFetWukEUz9/PlHCIdQXPwG37uKZWoTAHYMULn63UNLslD6Fdpi979Y
	1JCtLPscWq+BqWSGnMdtTY6ktllxHtkgZlaqHb587yFczosPq+LRst6b8SB57+gGANVHeWJX5GkVi
	pDEZA7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xoK-0000000GFuR-2ryb;
	Thu, 03 Sep 2026 03:08:20 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xoG-0000000GFsp-338q
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 03:08:19 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-66f78cba2e1so2019480d50.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 20:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788404895; cv=none;
        d=google.com; s=arc-20260327;
        b=lguzLeeCD2r/HC1t7AvdVwSFGOkXayg8jWwonZpH21OQfdUXwx/JMgws1CjU+j2LNM
         uqazjhG83sXAfxhNg9oJKPjSngrbbIEv12xpqhDmaabAOA6xQuaEi6wjAxPEdSATNzda
         Qpc7DLp3pC76TzVTCs6X8D/PlwFTkMlrrnQuiRI7VPqMdR9opUJKqTr1nyCf80WxfiJF
         Of6A2BbomB6GHpC99hyi8J99voxouG8s5KnmWdO5AHnHuRBhK7ypXYYJxveBGtUFAc7Z
         UFa/PpkMYUoSwB/UzgIupCcIDJRqNgU9tLOdbXBT9mZPmyBfzUApHd15O8FqjZLOoTvA
         6kuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        fh=tIUdmkuJGz7RF/SimFceUYYCrAWendkZJ7mur4URsXo=;
        b=DQ/ZlVmlyWUQFnr6IhUfKJivXMy/5HzaZvpqTECWIghYAIdyJcn1sM1SK6c7S4sWzp
         2wbg/GEiaPdDW7S2L7reJBLCVDmnyH61dopM7Hq26a5/lYTQz3CS0yKXtdZ1MmiWnf8q
         f7PS+tVpRmHFHKOS1lNGzeSPcdihtOToy+yGQJOYTKOgLP571FJVqvlOBKaqa9Qx2PXZ
         Oo5DDODOEr53UWXyLh9Ffojh00Nb7t/A+BIHzPBWfA/zM1NuRfUUzEs8EKuE2PkVSlh3
         MMS+OziM545pPg2sQ3z6JJcMDul7sEPBFkDzVOTUybpKw1wiLQ5O8TNkRW5hohQ/DhgS
         4v+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788404895; x=1789009695; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=TWVudepD++E/n9uwdnZm/S8Ggbxzl9yFQUYuQRgT+e+2iAF13m7GCQuziviuHrJ+An
         QhbNcW57xIf6X9bjxiXgMPoIi9Wo75Tt6G1NWnekasvrykt/aaMvGwGPDQIcDlsT3yJZ
         7I0ToW1U9BXMfb2f8KXobktc+/ZZAE4RPkbiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404895; x=1789009695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=MCJXVOQfxi+HcMK5n3J/KrsDLSZqVaNxv55k48Aw1lGd8rPXFgzg4K18uVSGd6dZyT
         2AyvDaIyu78NGppHb0Dyl8wGs1TV4o0JV7nS1MjTLNjAzHcNyf88+Bz3sRnPahLXUznn
         011Idtxmzd+0rWUA22Gd5DK28SPu+2b3aVA52nXcGgyCCFxSJ3eblovg3Wjamxh3KpA4
         5ArKQsru/lGIYOf051Tm9qlaklXOIimhGMnVjl/yfMp09DAO8nrOGcFiVtPQxVbycPYY
         LCtNWDrLDFHD6O1lbnLbMoKr2DiWjSkm8ZyRX7d27a6O4TqRV9aS669siq+caDt4aEe2
         NuCg==
X-Forwarded-Encrypted: i=1; AKwUvBzOOGKuhAKXfc1gRyAq8mu0RA2bhciAQDWTCHePxqZL1m+8osKmFEqsdW7Slg5bjd2KkktwIJPZ6QRZjSyH6A==@lists.infradead.org
X-Gm-Message-State: AFuF++lyQSCFYEWRwbrhjg8uIoLXBukHSbBNMGK6jZTasGV+qvpS1Oan
	Bk4Ql2BCkd4IdjTk+sGrkiHhk5pVllnaLRTGHKEaRpMCn0wIGONCS9tBv5qttPtgtl8CaTa421d
	43HS8lFkv1Lo9EkJk/kGmaOzutMS+i8UAuXiA8t7y
X-Gm-Gg: AYBFou1weJwyhIrd43y1KdXDiG8B4AhrTdZpLq4lceobGPo2ysdqLNi+PY1rLhUR1uH
	gomb+VQvvOjhN+hVw7+Z9QSBndZAYDmh9knzimTXkM3vJkwnWYi+8ESQKUUQjoNuEbNAgRbxjUU
	KjAzd1/fHdftnnaOSgaSk+vDnTsHqMyqGo1IFswKhYkwwgT6PguaN+adNcRVbs8cur3F4U6lE0u
	rWG3lAY8qjcihIiHwUsAQN2Q2D91577w5TdouojerufZlDAB8Dan9OLX+fxEG01P0YcifSU1hUK
	VyYgYlw8UbZtk1lUCmc2Hx3w6qRj2IjdrCDep9BKgit5A3B2F3knA/m+fZpGYSogZ9NvDHwGe60
	=
X-Received: by 2002:a05:690e:400f:b0:66d:113a:3928 with SMTP id
 956f58d0204a3-66f9bb6f3famr3574226d50.12.1788404894746; Wed, 02 Sep 2026
 20:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com> <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 3 Sep 2026 11:08:02 +0800
X-Gm-Features: AcwNN1Wn32BWTc7gvrI5NCynGubfvPlrWgUmvLkoMfGnpAB8yTnTJoIOOvbhgBM
Message-ID: <CAGXv+5E9zs7LsK=d08NB6QcuHkaPw4GcifuDuMDz0CVB6gB=8A@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
	Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_200816_820342_C464EDAD 
X-CRM114-Status: GOOD (  17.63  )
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

On Thu, Sep 3, 2026 at 4:08=E2=80=AFAM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..557bffb2c2f1 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>         dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
>
>         if (vpu->enable_4GB) {
> -               ret =3D of_reserved_mem_device_init(dev);
> +               ret =3D devm_of_reserved_mem_device_init(dev);

There are non-devm calls before this. Inserting a devm call in here
messes up the unwind order and leads to confusion. In other words
this is a bad idea.


OOTH, the remove function is missing a release call.

>                 if (ret)
>                         dev_info(dev, "init reserved memory failed\n");
>                         /* continue to use dynamic allocation if failed *=
/
> @@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>  free_d_mem:
>         vpu_free_ext_mem(vpu, D_FW);
>  remove_debugfs:
> -       of_reserved_mem_device_release(dev);
>  #ifdef CONFIG_DEBUG_FS
>         debugfs_remove(vpu_debugfs);
>  #endif
> --
> 2.55.0
>
>

