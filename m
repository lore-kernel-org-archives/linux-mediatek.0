Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C594C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQeGra2iBmmyFMexo3SqyeNsqV++ufvz/AJLf19SFYk=; b=K4pBqeAJ8OnkVQRfE1UyDz2n0G
	OS7aKX9/SAMkMgRlQOvbKQhX7zeixBso2wufg6PB2mrIONCtrEfpnEb2ha2zDYBYjnic+E1fhMk7d
	jPLL+662xfUcN+L09BeQDtOPmmSr2VX756/IsB5hmbr8rIf/EmeDVSVDNKB65OZoHar0QsOmXNuMV
	fmOeJ5NPLuNMFWuuuaeJjgulGx6lABPgyj8l52zqDelGyZx5G624iX+9tVn/N3MR3Va5CSOBz36MJ
	rdp4yaIW20mpCeKx+a9qC6tl2qcW2x5AGFFop9KW+3sqJmmOAoemvGRktGUS3e6qBTBjGjcsVYpVM
	gqx0QxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsev-00000000oIG-32RZ;
	Wed, 19 Jun 2024 10:35:21 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJset-00000000oGp-2DUo
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jun 2024 10:35:20 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-80acfd81899so1658690241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 03:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718793318; x=1719398118; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQeGra2iBmmyFMexo3SqyeNsqV++ufvz/AJLf19SFYk=;
        b=ElYiCwmfG9+hFZJgnujnJeL/w0T4Qb8rjISeSJ9SGYiDmh1zmHAD3N/y+YXjRyyh74
         AaYvoXOStGGa6HZh6pB724/wJrFY59MjTWHDM4aWxoDwcGwN1u7084bHjhs8A/Y0epfG
         GvNfFGzX6/eav+MjSW1DFF8ZGAGCCF/vcF9as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718793318; x=1719398118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQeGra2iBmmyFMexo3SqyeNsqV++ufvz/AJLf19SFYk=;
        b=wwMsidEaR0LszIiaLH6Xos+QxPcGEtxRprAwZB/7FxlSP34mojga8uBssndvIts8Ge
         VU0eZ/9eXrn0pVUoy81I+SI2t2PbtyspI3gzSeevdr3pLoBkzcjnrCffmHkEeO4Gfs0W
         KaPyX3nDr0a5mX//tUkky1IMdCV29o6iyliq8wVX4IRi38MDQFVOzWmAbTN19UScKn1m
         HUeH1FlAxNzLF5ETgMTMNqJb/hYHHdWujBe1Yp7REN4ePYR430jKlzDCndMYJEYWHZas
         vCGa/CkBDZIvbXgI7KlzH5xgYO+XQhXIDkBWMcWGBMZ6EhYMzY8qqNnYPrMvrgXorNW+
         RdVA==
X-Gm-Message-State: AOJu0YwRPjn5YUPV0BfPtiTgldliGqRV+hz1RYjhqPqr0luy0Ar/4VqO
	zdyKPY2JnlB2GBb4NdGEoOaLZfFF7ct4naV5mTp/nwaesStjvmrwPvySqWCyKNJa+sp4alGbB6o
	=
X-Google-Smtp-Source: AGHT+IHMRT02lkkfck5HI3nzr4cMEpCyqkkt6aIek9js4MY0CTlmVYbJ9nRWvIFwb9gmlmMn8hasKw==
X-Received: by 2002:a67:f6c4:0:b0:48f:1da6:cbd3 with SMTP id ada2fe7eead31-48f1da6cc1emr199029137.22.1718793318115;
        Wed, 19 Jun 2024 03:35:18 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-80d78708875sm2550556241.6.2024.06.19.03.35.17
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 03:35:17 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-48c52d0fe6bso2037617137.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 03:35:17 -0700 (PDT)
X-Received: by 2002:a05:6102:2926:b0:48f:19b5:2685 with SMTP id
 ada2fe7eead31-48f19b52895mr915741137.26.1718793317187; Wed, 19 Jun 2024
 03:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240619103034.110377-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240619103034.110377-1-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Jun 2024 18:34:41 +0800
X-Gmail-Original-Message-ID: <CAC=S1nikgOVAqwHDEv5yQAQAKT4pBDwcC3zCduwf64nwtATY7Q@mail.gmail.com>
Message-ID: <CAC=S1nikgOVAqwHDEv5yQAQAKT4pBDwcC3zCduwf64nwtATY7Q@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-mutex: Add MDP_TCC0 mod to MT8188
 mutex table
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_033519_679459_A77FE794 
X-CRM114-Status: GOOD (  15.60  )
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

On Wed, Jun 19, 2024 at 6:30=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MT8188's MDP3 is able to use MDP_TCC0, this mutex_mod bit does
> actually exist and it's the same as MT8195: add it to the table.
>
> Fixes: 26bb17dae6fa ("soc: mediatek: mtk-mutex: Add support for MT8188 VP=
PSYS")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  drivers/soc/mediatek/mtk-mutex.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-=
mutex.c
> index b5af1fb5847e..01b129caf1eb 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -524,6 +524,7 @@ static const unsigned int mt8188_mdp_mutex_table_mod[=
MUTEX_MOD_IDX_MAX] =3D {
>         [MUTEX_MOD_IDX_MDP_PAD0] =3D MT8195_MUTEX_MOD_MDP_PAD0,
>         [MUTEX_MOD_IDX_MDP_PAD2] =3D MT8195_MUTEX_MOD_MDP_PAD2,
>         [MUTEX_MOD_IDX_MDP_PAD3] =3D MT8195_MUTEX_MOD_MDP_PAD3,
> +       [MUTEX_MOD_IDX_MDP_TCC0] =3D MT8195_MUTEX_MOD_MDP_TCC0,
>         [MUTEX_MOD_IDX_MDP_WROT0] =3D MT8195_MUTEX_MOD_MDP_WROT0,
>         [MUTEX_MOD_IDX_MDP_WROT2] =3D MT8195_MUTEX_MOD_MDP_WROT2,
>         [MUTEX_MOD_IDX_MDP_WROT3] =3D MT8195_MUTEX_MOD_MDP_WROT3,
> --
> 2.45.2
>

