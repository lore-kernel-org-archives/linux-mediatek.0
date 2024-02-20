Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D71C48BC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 06:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/5CK/+MMawYXzgUqe9nAD7tYKluMjye+ze/3Lc+fRc=; b=TvUyvBozsKID4c0x1nJ48nxMSW
	blqtusPRGTTZ18ntpg45C9rklWQfEYMUj/9v6AEkqOra4eGZkc3/dxom0U4DS6A3IJoOTyTaDTN1U
	NPtDtAZFmFoSxg3UrKTlU4DeC3uM8uP5X8WSo+IJyqEXefLXxaMESWrnLtZcH/8HnrlGJnHDb6IuS
	0vwy/66a5osTNFRp2t2tIQ7v48RiB143xTpipPQQ+1v2dE9ZWhZfMMraFfyP+rX6gBoObVbY+R+R/
	ZEiz7sOkk+pRTZrqsm9FY/nEuejlFbRR29SIiFhzaMcLl8QsiBvn8pjHxzCL6pJ7GRQp2tAiNZVHG
	OZ725Iew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJoR-0000000DOSu-35Uy;
	Tue, 20 Feb 2024 06:41:07 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJoM-0000000DOS9-14zu
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Feb 2024 06:41:05 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2d22fa5c822so30719211fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Feb 2024 22:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708411258; x=1709016058; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/5CK/+MMawYXzgUqe9nAD7tYKluMjye+ze/3Lc+fRc=;
        b=LesMhka2eYIlCIXMtb9I7TvIxycRd2uzi2W37ZoRAoskoI5n3TwmL40SDfdgUVgqJX
         0B+AC3jZNxIxyjUzJz65tc5N3+URX2tjSIDZvTJm0GwErYWhbK4CzLQg/B6fUJq8UtbS
         Bd8e2Zg8o+XdQZfNGUomT+VTsFU0uhwxfZl5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708411258; x=1709016058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/5CK/+MMawYXzgUqe9nAD7tYKluMjye+ze/3Lc+fRc=;
        b=QmCBLl/jd2lI7gLs1MaZYcWGyTHrIBwjegmro/vxlkGfGYL48kozQpd5xrcZ1ALRxd
         MSZTIZfWpMsWcmRg7eXlBf7/kO07XUKhQaNxBIMgiFufX6ZsH+XVg9OoTG3ZG4sr0zWM
         HJ+EfR8huPom8KcR6yjUf+ojv9V8HagUDWIN4scSS6Xfg8sA22I5/zDvWKLaE8t9R8yN
         t9xSEZO9lcBachkt2TZIP7955Z0ffk5+c7O14hY+McrzGnX9EV/fEKvLm8JicsSWnAwu
         QQxszvM25yVpO6eUimIrbJeqfgkda9vwHKRRNx+en6D9DR8V7jXeEjp/O6QK3KP+xRye
         rRXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyOknIHooHKe2Geb9JvkQ2gWV1iQLywq/h6hllIF0r6Azm1k/3f3HJzhp+/X43bvqQpCyITKKsCuXNdddcVggUrJbeiPKK3eSDk0XHOsIP+6in
X-Gm-Message-State: AOJu0YyUNwXBpGpPSTH1f+Rk7VTRy7/WQQMlL5HtI2N8NTZPbTVsI08i
	yEvFjEqthSh7rZ+tWo9aU61BCwIzTPe3JFsY5OrgYIDSfWBh1taXJ15o9Cx27wmEehDCPmwhsSh
	iicrjTJEeUos7P8rpTYB8Snp6iplSLvGYR6Dg
X-Google-Smtp-Source: AGHT+IFAvIfiLLEefmtgMPYY07Aqu1hwGfMKyTgdkfDKmAASXhQwN2PXQaCsktOFc75kGcOj9WcbRcx14GnXb0fm0fY=
X-Received: by 2002:a05:651c:b21:b0:2d2:360a:2810 with SMTP id
 b33-20020a05651c0b2100b002d2360a2810mr7133668ljr.22.1708411258681; Mon, 19
 Feb 2024 22:40:58 -0800 (PST)
MIME-Version: 1.0
References: <cc8f7f7da5bdccce514a320e0ae7468659cf7346.1707327680.git.daniel@makrotopia.org>
In-Reply-To: <cc8f7f7da5bdccce514a320e0ae7468659cf7346.1707327680.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 20 Feb 2024 14:40:47 +0800
Message-ID: <CAGXv+5EKCrvsvZwc2zYiMWAeT9vqvU0JnDrz=WBoebBBbcgp0g@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: depends on CONFIG_SOC_BUS
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	William-tw Lin <william-tw.lin@mediatek.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_224102_348092_30C688AB 
X-CRM114-Status: GOOD (  19.22  )
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

On Thu, Feb 8, 2024 at 1:43=E2=80=AFAM Daniel Golle <daniel@makrotopia.org>=
 wrote:
>
> The mtk-socinfo driver uses symbols 'soc_device_register' and
> 'soc_device_unregister' which are part of the bus driver for
> System-on-Chip devices.
>
> Select SOC_BUS to make sure that driver is built and the symbols are
> available.
>
> Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getting =
chip information")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Angelo, I believe this should be picked up for -next?

Also, mediatek/v6.8-next/soc is missing from mediatek/for-next in today's
linux-next.

> ---
>  drivers/soc/mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index 50c664b65f4d4..1b7afb19ccd63 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -72,6 +72,7 @@ config MTK_SOCINFO
>         tristate "MediaTek SoC Information"
>         default y
>         depends on NVMEM_MTK_EFUSE
> +       select SOC_BUS
>         help
>           The MediaTek SoC Information (mtk-socinfo) driver provides
>           information about the SoC to the userspace including the
> --
> 2.43.0
>
>

