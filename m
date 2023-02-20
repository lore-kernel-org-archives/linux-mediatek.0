Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D27C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6vcpwkMfGzN9vRBy1DWixkIdHmHqwgh90gCl6PUprg=; b=Vu0AfIlqExmrZiUR12F4Z/ct6y
	EVKZ4tu1yfO3NUzbVm7V6tfr2yubd+Zis9HPZ3CiuyWqyVOfIw+c9pGy2zxdskT2Bii0DJhJm9a7P
	Y5FWPbFZ9WyDAoipj4lBtQiMSIheN0UXl2FeBrBUvs6OL8KWK4gasdIl0qRJ7lLRv0DY3lvKMLpE1
	+5CwMI7+dBLFGMDtWEp0Le3K7+MncCgTZEg0LziRcL6svA7waFwDU0zDYpHHue/zVAjzFUYeuv7yx
	ehHWhfwC+dZHiQ1j689zQx128te4sG2/onkaMdTyhM3myalWOV1vF7OdfuyklYBRbrmCg2jcpvWgW
	8zNY3d1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU3lg-003jGH-VU; Mon, 20 Feb 2023 10:51:36 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU3kr-003ijY-UQ
	for linux-mediatek@lists.infradead.org; Mon, 20 Feb 2023 10:50:49 +0000
Received: by mail-ed1-x52e.google.com with SMTP id eq27so7579988edb.5
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 02:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v6vcpwkMfGzN9vRBy1DWixkIdHmHqwgh90gCl6PUprg=;
        b=2xvrF9DiUf1wVU0sbqrSYqYY/J46TTjyn+AFw/ZJQqaX3vaiVjroK29XQpSQ6X4uXU
         CqR4k/pUUZHOSeaI+2wOWIQjUPUSZyXIcID9R9tTcT2YRa8wOIn6Dr7h/KfnC4K8gosm
         MjsuU4bRsCeDvCX9duE+M0rYbikkZcSx34NMdWH2ukJcd2yPcDpH/TO2v4fldisKBHx9
         47OXR1yCXBKWIPniESJq28E7wJIa70ouQZWfqRzKxKCK18+ulsnyeVsHgphI0aIfkCZb
         KX2GItPNwYdjRHdjOaNayLCtcpX4x8kYqRhh3/PmApG6U1Rd3ahvqymiAwATdT78ZjHP
         J+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6vcpwkMfGzN9vRBy1DWixkIdHmHqwgh90gCl6PUprg=;
        b=k5Sw6biJRYmIXVWNV2aImNuuhVHhKpcRvsKCkShphQkNPqKR9YCUgATFjodIrELBv/
         spXt6IC+p/TPP5aMpeEdvv4c2WJu4URc+tCr/b3ybe8xuBHqWJ43dxN9Zrz4IOvCFQey
         Rfgt3wNOBXu3O+pDwV6S4iD/I5WZA/CdYNRIAhZNx6e19ObARKq0UfbcFs04IYrG6ym2
         jW0FakPeFLkFctbREAzvevCDFb57G5gCnl2XFkx1QsGSyR13PVo60l9n2QskXMD+dp1h
         rGY/YVOUR1ry1qGiRKqYXl1XPNBLrxkVXuA0IgqwuisVWdFC0cPtPiDio6e7IuXmGv0h
         D+nQ==
X-Gm-Message-State: AO0yUKU5fvJO8OZOC3wcixmykfe/5XlMZbrEZ2ciKyI4fq28L3S+cB8D
	y9vM9O6qi9Ua0TBleZYlbDV6w8t0LxxRuxh5arzQTQ==
X-Google-Smtp-Source: AK7set9188hMr+cpqZ98qqvqAVQNUFC+YjeVhfGQ2IlXTuOYn1ExJNxWmgV+aqN4Ov3E6ql2A1G9+xnfD6WaYWvd8c4=
X-Received: by 2002:a50:9fa8:0:b0:4ad:6052:ee90 with SMTP id
 c37-20020a509fa8000000b004ad6052ee90mr1324993edf.7.1676890244471; Mon, 20 Feb
 2023 02:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20230219143657.241542-1-daniel.lezcano@linaro.org> <20230219143657.241542-7-daniel.lezcano@linaro.org>
In-Reply-To: <20230219143657.241542-7-daniel.lezcano@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Mon, 20 Feb 2023 11:50:08 +0100
Message-ID: <CAGuA+oqpVX-xQ+00NfcgxuvL=9Jqfi9YhAkvJ+e4gaix2GLn2Q@mail.gmail.com>
Subject: Re: [PATCH v1 06/17] thermal: Don't use 'device' internal thermal
 zone structure field
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_025046_788329_E383D2A3 
X-CRM114-Status: GOOD (  16.52  )
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

On Sun, Feb 19, 2023 at 3:38 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> Some drivers are directly using the thermal zone's 'device' structure
> field.
>
> Use the driver device pointer instead of the thermal zone device when
> it is available.
>
> Remove the traces when they are duplicate with the traces in the core
> code.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

>  drivers/thermal/mediatek/lvts_thermal.c       |  4 +-

> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 86d280187c83..a65a81114cc5 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -305,7 +305,7 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
>          * 14-0 : Raw temperature for threshold
>          */
>         if (low != -INT_MAX) {
> -               dev_dbg(&tz->device, "Setting low limit temperature interrupt: %d\n", low);
> +               pr_debug("%s: Setting low limit temperature interrupt: %d\n", tz->type, low);
>                 writel(raw_low, LVTS_H2NTHRE(base));
>         }
>
> @@ -318,7 +318,7 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
>          *
>          * 14-0 : Raw temperature for threshold
>          */
> -       dev_dbg(&tz->device, "Setting high limit temperature interrupt: %d\n", high);
> +       pr_debug("%s: Setting high limit temperature interrupt: %d\n", tz->type, high);
>         writel(raw_high, LVTS_HTHRE(base));
>
>         return 0;

for MediaTek LVTS :

Reviewed-by: Balsam CHIHI <bchihi@baylibre.com>

