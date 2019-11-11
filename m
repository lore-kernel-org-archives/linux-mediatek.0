Return-Path: <SRS0=Eirx=ZD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D44C43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 13:05:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77DE2190F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 13:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r3OIATIS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mr3jgn8X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77DE2190F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zulndWtxG9DgNDsSOXOXPZ0DOUWahz3h+HXk791ftbk=; b=r3OIATISK1AHYj
	EsYsiuHfMApECuX92pExrhj8M+pMhxkg/JaeK8Ukw7TdjWli89wKLZy8avDsQEURpZhLuSd7a/udN
	G7rNT3siH9bje+HfdwZ50QEWKMHsOLsyM7FjvOFgID6CC16IjAIynr/gOw5PNJwYxCtOH90mbgLkr
	fUVIphIaHcYkIj4xtQ7Qwux6uRjLDRAk0AtUUlhRPn485+SgFkQwqWXUjRVkjTX1DlP1hIShyYOuk
	k27sRuBbI+d4ckjj4VCnqgqTyhNAWFTUccrG9yLCEjA2Fxzqv1/EdNC+ev9h6d6ROOmeYzsHfWqEm
	uUTJYKlX3rHTXz+RS/Rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU9Nm-0007pj-Dj; Mon, 11 Nov 2019 13:05:26 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU9Nj-0007oY-8e
 for linux-mediatek@lists.infradead.org; Mon, 11 Nov 2019 13:05:24 +0000
Received: by mail-vs1-xe44.google.com with SMTP id n9so3618869vsa.12
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Nov 2019 05:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t8vYvx18GD5TBNd1q0mA7jDSSmkQRIuSLUp/v+fUMPA=;
 b=Mr3jgn8X85TRmMABlrppdjqKXTw3KoQ0tkejNY2UUpSNRBX4S1su6qu9/bD/8aiibf
 vL7rp++v1RVTiZIvvNVJG1X/INTj3uzIglB6Lyo55sqFpH6itTcsrScfFVE1T58FOimr
 ZDpg3mH6j2crHZMGuJxEGRFJFiTE4Yn/uC750/u4TFUbXzj7VdPV4YyqpdGkK1wT4RIw
 HW+GpYCl/MWI9UYpf/EyAJaVnNN5MtuI0IR1iSyP3EXmAE8jtWaOlh35qGKFwLNIJOig
 jTo0hoeXucWpQ678zzjlmCLNoBYMP+40Mv0yOB3CVGTFgwkYSpRAzw9qOvdR88GOxXtZ
 2r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t8vYvx18GD5TBNd1q0mA7jDSSmkQRIuSLUp/v+fUMPA=;
 b=caQ22yL9wZVFawzHpg6JV3+6pJbisrdW2Q3zMU8OYWOz3/MjF/ozH10mv0WKSlgVJ5
 Jyz+4cmN0Dn6z2xK5hCxwKj/NlT15Q5jUVoPSBiidEld0Xff/DApnBwLCHkrpj2FuWWS
 MFXQkgccWj+kR4vBwuEM2aGH45bnCU4yUSN1rJawbqTq8DMFubUWilDIGyH+oniSI8YN
 1U8c+blsuuYkW5zm/tkp1WnaLXZOxtAwtaqjAEKqwg6ZsMuZP2Fa7+neeMQM93tAB8vu
 oktARR8LJPAatw8Uo97mVWOePlF6X20N+VtVIx738BSt/IL5mVgJuy0qrMDVDIvQX008
 eDlg==
X-Gm-Message-State: APjAAAUTzdCVq3wJiDkh31JtaPsILCNHD8rTRM6SkRFNBoTquxQ96njT
 wZjPK7GLNRMNAs1IJ1LEFpiAFoGLjWWGL28+JHr86w==
X-Google-Smtp-Source: APXvYqxGAuQCp/8AvEDPLKZli/PbYKhYU1pS5j8TWO3nkfvlnOb8NUdy0lHofs5UupjfdckHmocertmwl5UWj2f467A=
X-Received: by 2002:a67:2e0f:: with SMTP id u15mr19259795vsu.89.1573477521399; 
 Mon, 11 Nov 2019 05:05:21 -0800 (PST)
MIME-Version: 1.0
References: <1572590582-11056-1-git-send-email-chun-hung.wu@mediatek.com>
In-Reply-To: <1572590582-11056-1-git-send-email-chun-hung.wu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 Nov 2019 14:04:45 +0100
Message-ID: <CAPDyKFropF-au2OTgyRL8-sO0MKXs3GtZGMqYpWpsKHtfdtpyw@mail.gmail.com>
Subject: Re: [PATCH 1/3] [1/3] mmc: core: expose MMC_CAP2_CQE* to dt
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_050523_339583_8D7A7C49 
X-CRM114-Status: GOOD (  14.11  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, wsd_upstream@mediatek.com,
 DTML <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Pan Bian <bianpan2016@163.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 1 Nov 2019 at 07:43, Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:
>
> Expose MMC_CAP2_CQE and MMC_CAP2_CQE_DCMD
> to host->caps2 if
> 1. "supports-cqe" is defined in dt and
> 2. "disable-cqe-dcmd" is not defined in dt.
>
> Change-Id: I3d172e6bcfac34520c3932a6f8df2e20f2c0d05b
> CR-Id:
> Feature:

Remove these tags please.

> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  drivers/mmc/core/host.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 105b7a7..efb0dbe 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -319,6 +319,14 @@ int mmc_of_parse(struct mmc_host *host)
>                 host->caps2 |= MMC_CAP2_NO_SD;
>         if (device_property_read_bool(dev, "no-mmc"))
>                 host->caps2 |= MMC_CAP2_NO_MMC;
> +       if (device_property_read_bool(dev, "supports-cqe"))
> +               host->caps2 |= MMC_CAP2_CQE;
> +
> +       /* Must be after "supports-cqe" check */
> +       if (!device_property_read_bool(dev, "disable-cqe-dcmd")) {
> +               if (host->caps2 & MMC_CAP2_CQE)
> +                       host->caps2 |= MMC_CAP2_CQE_DCMD;
> +       }
>
>         /* Must be after "non-removable" check */
>         if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
> --
> 1.9.1
>

Otherwise, this looks good to me.

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
