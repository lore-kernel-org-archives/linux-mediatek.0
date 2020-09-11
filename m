Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74086C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 07:05:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05437221EE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 07:05:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lbueag0U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FNRrNT1v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05437221EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kP8LLhAEysjhHs5lK71AQWjWMh3iypn31q5ie1iY4WY=; b=Lbueag0UH3Svi7nSjo2GLr5AN
	dZ61epBGaDwifTEugmG+tYo0Twonf7jagz8Fsy+3eMjMkhopDqohqnGlYtfQLejbRIdsik06lF6Fz
	9a3XeUwAEPowR3hl2Os8le9fsd1AP8eB9Ka51e6doV4bydO0B11qU7GaByaBGspTgATFyeoVTgvr5
	7BcvoVbyD7nAxZyy2Y9Q9M0H2N4H5CbbmaLp6THbveuFIVA8i0VeF4hxZDCV46Q5ueUwb6vGhm2W4
	MtqBTlV6TmSwoSBJa1B/NCqTY6TkvNN1D3ilPAF42S2fy0uoBSg8PpOsKnPoN5h5jqkFAMCNXBo0l
	rmhhsf+gQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGd7P-0002AW-1J; Fri, 11 Sep 2020 07:05:11 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGd7M-00028v-Mc
 for linux-mediatek@lists.infradead.org; Fri, 11 Sep 2020 07:05:09 +0000
Received: by mail-lj1-x241.google.com with SMTP id w3so11376178ljo.5
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2020 00:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ccFFbA9B/80814O047PWW9IYr+YcSRpx5Jz4CVkD9V0=;
 b=FNRrNT1viu436RH4fQuWLx7CxRGHkp9KJGRLQAfP58OGhvAUHAqPH70pcezhd4bbJn
 pt/z0CTcG1EOVjs03KytRaGjTljrUdlRSZReupBDG0eNoCAHEnMVZRQqayw9Luu9UbH+
 KtqKGi4SxcfZIJ/++LwOclntQXmdDZjw8iVrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ccFFbA9B/80814O047PWW9IYr+YcSRpx5Jz4CVkD9V0=;
 b=WbANtN+5FO+GF3Ew+Yhk7b/xmzY2JHJ13a58sacN+uTlRd2ABJ4AM3/FpGcikaTr/6
 SOZvy8yaJcSt4W1qWbAvkB5krnlUgXIO/bJWIWLkchzOcPCixNFaMighoNNOIRVchEac
 HEFxrYDst0zTkxmySjLOZrhKNU3rJ/WggWsTEzKqS8jUDETKwTnZhsCxFueUCRQKGxR9
 gEPCAx8vKuJkev6JXRIeoPdQsmNC8KakIqRkzDr2aINAEbxAtP5DEaKLQp+r3bqQFqz0
 3yq+EQD+V7H765TQvArGVIXaEZLlpXRi5X7wb+qW9kPOpEp73fi2PEM36TI5tbdDPacd
 HGdw==
X-Gm-Message-State: AOAM532anSkTQkbdEBxPDYO302Oxyddadqi3vHKqDoMJGKEsPNvwmNjE
 iVNLf9nSSpTEkDbJVk6494YKJuiXKj46NVg4OsOttQ==
X-Google-Smtp-Source: ABdhPJwv6DXrKoR0IN5OWRKjTqCiKrPiykNlvWutGaeY/OwjMRAOdZqKocPqRHR2iYhu2W6z5TehyPBdDRmIQ2lvr24=
X-Received: by 2002:a2e:6c03:: with SMTP id h3mr245615ljc.212.1599807901466;
 Fri, 11 Sep 2020 00:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200730120054.1.I5e6f8c262031d0451fe7241b744f4f3111c1ce71@changeid>
In-Reply-To: <20200730120054.1.I5e6f8c262031d0451fe7241b744f4f3111c1ce71@changeid>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 11 Sep 2020 15:04:50 +0800
Message-ID: <CANMq1KDqDgdKcDWa0A15XLhS6ny3btejx5CKs07eLC8j-3Li=g@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: Check if power domains can be powered on
 at boot time
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_030508_796680_C8097824 
X-CRM114-Status: GOOD (  18.53  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Matthias, gentle ping on the patch below >>>

Thanks!

On Thu, Jul 30, 2020 at 12:01 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> In the error case, where a power domain cannot be powered on
> successfully at boot time (in mtk_register_power_domains),
> pm_genpd_init would still be called with is_off=false, and the
> system would later try to disable the power domain again, triggering
> warnings as disabled clocks are disabled again (and other potential
> issues).
>
> Fixes: c84e358718a66f7 ("soc: Mediatek: Add SCPSYS power domain driver")
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> ---
>
>  drivers/soc/mediatek/mtk-scpsys.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index f669d3754627dad..0055a52a49733d5 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -524,6 +524,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
>         for (i = 0; i < num; i++) {
>                 struct scp_domain *scpd = &scp->domains[i];
>                 struct generic_pm_domain *genpd = &scpd->genpd;
> +               bool on;
>
>                 /*
>                  * Initially turn on all domains to make the domains usable
> @@ -531,9 +532,9 @@ static void mtk_register_power_domains(struct platform_device *pdev,
>                  * software.  The unused domains will be switched off during
>                  * late_init time.
>                  */
> -               genpd->power_on(genpd);
> +               on = genpd->power_on(genpd) >= 0;
>
> -               pm_genpd_init(genpd, NULL, false);
> +               pm_genpd_init(genpd, NULL, !on);
>         }
>
>         /*
> --
> 2.28.0.rc0.142.g3c755180ce-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
