Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F20C76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 06:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Kz8SNhi1cpYQJqD/AT3lCWMWGthZUaWRueclcoldFw=; b=Wrwrps05k4DP6gj/YnJwthGr0U
	/G7BZhu1dBKGcEgyveSIySmt7DA0+20aNxyp/yJEAdL5yJILIqItFB8zOpro8ViltXd6s80fTJM0a
	kSwRGr28tCcUuVrEj9QvFTGi04zukPFJ2ouKj0KXYPfgOHyGmiL5k2NCBnHgAH9cuY+uafhwC+dVs
	qXf++n0NjFKC/SkDmkeiKF0z25ZEEaMBAt3SyBvFanhcx0iNYcE+bPX5/2HSsgrklSjZoRJwQS+yI
	uZyp7tbLMcopJlHchLsHtDrWrDhYWifILijxG3Nkw9RpuMxvFMtSXD57OZDy9kQBYATdO2lG+pTjN
	Gz5eMHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIzU-006Tmd-1H;
	Thu, 06 Apr 2023 06:21:00 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIzP-006Tic-2B
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 06:20:57 +0000
Received: by mail-ua1-x92f.google.com with SMTP id t20so9695939uaw.5
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 23:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680762052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Kz8SNhi1cpYQJqD/AT3lCWMWGthZUaWRueclcoldFw=;
        b=mPvWNRiVsTupIoec66q+0JGs7s/4YhEwZZ04g/jmghXnDUFI/6nyTIM1XQon4YhQ+d
         sUeW9y2q+BiIUCu5oCuJ39jm6hTaGPLWUN9o/Hyw+LUaoZQ6CaysXslzfjHm/cOGUY3J
         luBsHTXmU8iyVg2z19eX9ALbgMcoSCgUvfohw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680762052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Kz8SNhi1cpYQJqD/AT3lCWMWGthZUaWRueclcoldFw=;
        b=TXpdHKJEsKdhLNTpp+XXZ8u4vXzI7XnNsqGMMVrexTHpWBsjt8WwyWWZn5iF6dAqiG
         Zq3+dlKm6dfDd6upOpcjAd7DyIJgymvTD/mC7ZUK3rPiU4jpzwYM9PZJzxjv3jPXLiHx
         k5zMDBO3Mdajo1/YcpeuewAb5E71h6+x4KmVsPxPAz/V9Eax/SlZYe6a7YdQe452qd/F
         Ra+wDs52djIBUTjR1yluf19V8H8kU9HDqTgaoixN8mQ3F9OGaiyxP1kfLwhJ5/Y/jUuj
         Ncr1V3dXYzK19c7cknLjst2hbrZEsEE1y+eeQUv1ka3BtT1a+WhkrBEBtOw59MOrA8Hb
         3rMg==
X-Gm-Message-State: AAQBX9de8djiHt70sBSg/6Nu8pXWiGcnI7JA64EBnRbvImnfvcCCGtnm
	ApV+Cm2626+xZwSsJ8TMh9tBZpspk+67T12AshcR/g==
X-Google-Smtp-Source: AKy350Yp2FIaz+ilkqlK7ibx9rFilAky16tPkK48Dbsh+GzGOd0UvkGhSb+M4eo0JEvts5cE5ZH/AYrK9lJqHNhSarI=
X-Received: by 2002:a9f:3110:0:b0:68a:a9d:13f5 with SMTP id
 m16-20020a9f3110000000b0068a0a9d13f5mr6292638uab.1.1680762052315; Wed, 05 Apr
 2023 23:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com> <20230404104800.301150-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230404104800.301150-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 6 Apr 2023 14:20:41 +0800
Message-ID: <CAGXv+5HTPd_2r0Bb2nY94gUwWzpn_wvU_ZMYu6u9hWBeaVzrwA@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_232055_920409_C1ED96DD 
X-CRM114-Status: GOOD (  18.99  )
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

On Tue, Apr 4, 2023 at 6:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change logging from drm_{err,info}() to dev_{err,info}() in functions
> mtk_dp_aux_transfer() and mtk_dp_aux_do_transfer(): this will be
> essential to avoid getting NULL pointer kernel panics if any kind
> of error happens during AUX transfers happening before the bridge
> is attached.
>
> This may potentially start happening in a later commit implementing
> aux-bus support, as AUX transfers will be triggered from the panel
> driver (for EDID) before the mtk-dp bridge gets attached, and it's
> done in preparation for the same.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index ac21eca0e20e..19b145cf2e05 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -849,7 +849,7 @@ static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_=
dp, bool is_read, u8 cmd,
>                 u32 phy_status =3D mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3628=
) &
>                                  AUX_RX_PHY_STATE_AUX_TX_P0_MASK;
>                 if (phy_status !=3D AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE) {
> -                       drm_err(mtk_dp->drm_dev,
> +                       dev_err(mtk_dp->dev,
>                                 "AUX Rx Aux hang, need SW reset\n");
>                         return -EIO;
>                 }
> @@ -2061,7 +2061,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_au=
x *mtk_aux,
>                 is_read =3D true;
>                 break;
>         default:
> -               drm_err(mtk_aux->drm_dev, "invalid aux cmd =3D %d\n",
> +               dev_err(mtk_dp->dev, "invalid aux cmd =3D %d\n",
>                         msg->request);
>                 ret =3D -EINVAL;
>                 goto err;
> @@ -2077,7 +2077,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_au=
x *mtk_aux,
>                                              to_access);
>
>                 if (ret) {
> -                       drm_info(mtk_dp->drm_dev,
> +                       dev_info(mtk_dp->dev,
>                                  "Failed to do AUX transfer: %d\n", ret);

This part no longer applies cleanly due to

    drm/mediatek: dp: Change the aux retries times when receiving AUX_DEFER

Also I think all these calls could be collapsed into one line?

ChenYu

>                         goto err;
>                 }
> --
> 2.40.0
>

