Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F22C369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 10:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVONgDkywsv0iUs1Rs/iF4ZeRFnwYCs7FWkvBJg2vb4=; b=3y9sJH0o+4Scb27DaQEuAexE/7
	Y0n4eCZ0EFiGs3X91nIZ7ZL1LOl2wh/aGB7NQ51H+3KUdz3k3vEVe69iULyNhs5rRDth1q3EuJ19+
	9mD3uycEwh9nV4zQxTkiaun27M2w0Kg6BoIoI7PdYlL4Obabci8SzThy5ORVhQwcEW6yDb8d82mv9
	+66rm26xTieDL+Wgb4YyeaU8aXLcRFGCEDhIPHJ2VXWtEhV9lyO8Yx6hUDIPpaUtzfp4x6YZaBtzs
	lf1C/GUJcjs1HPv7JXLHsUzGQDh2AgDN+kIKe4ehipTzFSr4pbafQyuWIXzSxaLmtyevjMaHQVjRO
	QfAXsuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tNp-0000000Db7W-1rbf;
	Thu, 24 Apr 2025 10:00:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7svk-0000000DVlH-0vOt
	for linux-mediatek@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uVONgDkywsv0iUs1Rs/iF4ZeRFnwYCs7FWkvBJg2vb4=; b=C1zefnul8vXfOq4Syzuu37dEm2
	lj5ir68Iiep8yOXkjTH6MW2AFPrJdH2IfiojhLIqoQBhB6Eo0Ygxmapg0pzInNtgdc9o8s//O6+Lj
	z6Qpo6vnhtrPnqE9ihuGgOOVvtyWczr3/pD1PC27WyrMt9WOwS9qE1XeR1Oto6fkjTaHrJmjNgny4
	QmlE05m33yIre3s8/2vmLaAHAxN9hZq8qK51Qzkk9Pj+8oGb8UuT9+XtfZKySMAvrJILk2AysccZu
	oCf+CKnqXfQcqlX1bhJr2qfn+tTFkgIGikFrNOyEU3ufcjrFLHq9TemkG5qUaU/Fnw79voCSnLwW3
	gzu4PtFw==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7svh-0000000BgCp-29MN
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 09:31:39 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54e816aeca6so27338e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Apr 2025 02:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745487096; x=1746091896; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVONgDkywsv0iUs1Rs/iF4ZeRFnwYCs7FWkvBJg2vb4=;
        b=PhRBqhQV1fs+N61Ytymlh+zVIUkaso4+/mc71FD4YBl2NeCl1MNrRJ1LUvOqR3GTn5
         PMCxiY9hAbawOGQ0aFpOfU75rNh3C8Un753IBbAwPb6GDHG0kxZXRCIXnXcrp5/jMizM
         K/CeiDtINQLJ23G5me5B6DeQ1kfOYY4h8cpzeAQfGqUUExBpmfjdEraqPodNDbPiA576
         sehrc0kQWN6sPEhOlvSQjv//5Eb33MZo7V2i9PIJpwelESUU7V6yw009bR6+OYc0xRX9
         cHKBENN+lxz13bff+OAVZxtM17aBDmlD9IdBrCG2Kkfu09+pWWFhoShQAbbYSR+usVQ4
         TLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487096; x=1746091896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVONgDkywsv0iUs1Rs/iF4ZeRFnwYCs7FWkvBJg2vb4=;
        b=ZzBV7Ty8HplK6/dEu81QDll/vNUy6Zq7tB5r0L/gHHc3KZTzdCOQUKpvWUKSL/AMYg
         wlQ7zUsrFMVtAGIDg0tosEpXueL7Xtk5Sdy9dCrTwG3gI0KW88T2j72PwKnGjgO1DKjL
         1U8OuIound58rjSvsxNwpqWWbjRm35W+j0BaVfJhD0OqL0VhkLgbxPyH48wFK1ytt9/L
         PQi3uCqa+hZ3Kwk5tozaNV375WVVqw2+lEKnQZqdyAsSKeYyPOSIE0P5F7JRm20qXukF
         mMAyXtwqV2+03PbcChKlmIj8vIx62bK9IZyUgROUCPEo0NTKDNGbKzaiVQIphcbZobxa
         rojw==
X-Forwarded-Encrypted: i=1; AJvYcCXnMGoXHefwYJDNKYj3dRXm+l1fWuggjjpnu2xkXSZ1YJTTaJU67hiWKGNACJer61uaGoaTz96QOwyTHM12YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw+hMvjmALBHex6rkXq/ai+ZWvjaqK9MfRTFxjx/D1mEI0PMcV
	WV5psvS5YaSrnUQv+j3ilTuSAcBIaSnv6TMP4qYHkJOv9fLamKrRunzGQHSv3MZuQPym/iENmOT
	NWE8V3mb/h1cd4//2H16a50dF7AKzlsxbaTu8Lw==
X-Gm-Gg: ASbGncuLamBhNGqTDzf12unphoc+6d4/a/I9rlzQDT6nrKTsHR1CvVxvwYAMXU7Pf7f
	3MLyLHc7pplERGzfk2QwdsTOd0mUD7fNVVI32+YxSE4P+w6dcV0bMJAYS06uaj1f4l0F3KXMXGB
	eZfWlNwjyX7zqrdmE+Z5VEUPbvYlASz8Oi6X6cENlc9TyBNZjsYSB7Tg==
X-Google-Smtp-Source: AGHT+IHGzfqVm5DiI57G06hdv0RbA4ie/G2gk+CyiEFdlczu0797VWCMAj3KLEFzAK3ogReXfsixBadmL2wpmlPxhpM=
X-Received: by 2002:a05:6512:e84:b0:545:3032:bc50 with SMTP id
 2adb3069b0e04-54e7c42255fmr500642e87.19.1745487095942; Thu, 24 Apr 2025
 02:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
 <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-2-f3fde2e529d8@collabora.com>
In-Reply-To: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-2-f3fde2e529d8@collabora.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 11:31:24 +0200
X-Gm-Features: ATxdqUHuYt0fFmQbTufFKrTTQ50DPP7STko6I100ngQ7wHqRNewsR7rV0zZ35ts
Message-ID: <CAMRc=Me20ZLb-vb6jJyy9pvWbwWsxVrxREbQOrmVyBY-S046gQ@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: ethernet: mtk-star-emac: rearm interrupts
 in rx_poll only when advised
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Biao Huang <biao.huang@mediatek.com>, Yinghua Pan <ot_yinghua.pan@mediatek.com>, 
	kernel@collabora.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103137_626373_A0E894B8 
X-CRM114-Status: GOOD (  15.37  )
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

On Thu, Apr 24, 2025 at 10:40=E2=80=AFAM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> In mtk_star_rx_poll function, on event processing completion, the
> mtk_star_emac driver calls napi_complete_done but ignores its return
> code and enable RX DMA interrupts inconditionally. This return code
> gives the info if a device should avoid rearming its interrupts or not,
> so fix this behaviour by taking it into account.
>
> Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_star_emac.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/=
ethernet/mediatek/mtk_star_emac.c
> index 23115881d8e892a622b34b593cf38e2c8bed4082..b175119a6a7da517f20267fde=
7b2005d6c0bbadd 100644
> --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> @@ -1348,8 +1348,7 @@ static int mtk_star_rx_poll(struct napi_struct *nap=
i, int budget)
>         priv =3D container_of(napi, struct mtk_star_priv, rx_napi);
>
>         work_done =3D mtk_star_rx(priv, budget);
> -       if (work_done < budget) {
> -               napi_complete_done(napi, work_done);
> +       if (work_done < budget && napi_complete_done(napi, work_done)) {
>                 spin_lock_irqsave(&priv->lock, flags);
>                 mtk_star_enable_dma_irq(priv, true, false);
>                 spin_unlock_irqrestore(&priv->lock, flags);
>
> --
> 2.49.0
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

