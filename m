Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E633BC83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Jul 2025 04:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1REz7lxNqCP0vRE/ucDmbyORYxFecR0vhh1/DbBdVo=; b=o+5MdYJbIBr991A28EO7q64ty1
	Xr3xsHOMWR9XWnQXJktFJMh9IziZqrzhQi04jb1DFTlJ50Z5Rtjhr5NajN/Wua8IDqKcjNG19co5A
	vVGadvt5m47dINSip45yfpyXojTKXC1z4LEX0eVOSTul0JSDgU9XTRh5dcTo+KcQeWDWHcIbVm2zl
	3n52D8q+8kgUAd7ITnV37/ZF+G7MaxP+n78cT3cc6ykrHi2m81zmhrp7iaYP5FPN55/wf1F5wD3Yu
	a20V/yokdQGxIXFM9HYj5vhCBEfMG7gkpbj9uEIwpqtCO2Ugg4TQc5E76E56Z7cnfOqne++52tIHK
	S5vY2SIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKcB-00000002rcR-3NUT;
	Thu, 31 Jul 2025 04:09:59 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKc8-00000002rbW-3AS1
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Jul 2025 04:09:57 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2ffaa884a44so273193fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Jul 2025 21:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753934995; x=1754539795; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1REz7lxNqCP0vRE/ucDmbyORYxFecR0vhh1/DbBdVo=;
        b=Z91X2dTM0KjY7uFdiX1x6aETQDtK1vy0bzLpXgdpCR7igabDK0gy4VilKLGyS+vWvg
         HyY0QrWwDplR88FzlY5Id1RcQrACHzTIzv3srxqzUVPhGlUdTZAwmPDWJ7i5b9iprFOw
         lpsFg/vYpMMIRPAsF7/snYI/yJ/oljBuE1nUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753934995; x=1754539795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1REz7lxNqCP0vRE/ucDmbyORYxFecR0vhh1/DbBdVo=;
        b=ukYrE8rIUMt7+jq4yVHoK2k18DA1XEo+xGxq7/B8WSJ9Sihzi7zG31l5NtY8PexiEP
         LyClqPgDer+aWcJuBTucSuU87unyqNWs6glrgIMWeR6lIaCCkb6t4hlDBLYCio9eDX+Z
         JF5a0+R3bYPYjt5S+DD2lRJdbUrNUnvHKTS6UNXMTAZSrcZByIS3KxlLxSp/yWQZEK/B
         aIND0rSCTVUvvrmwTnJMRXjYGxEyXR1AavholCpsjlTqBORyvfASoRckqsFXcAYxHNwu
         Vo/hPJciDHwdLa2jjhz4FPDCsT0/MomVcf/cvFRppt3LR+/sKytPf8O7AfN+pCzAuIig
         AIxg==
X-Forwarded-Encrypted: i=1; AJvYcCW1e82ucPOg7mwZjDwTwig/r++XDw/ZRIGB9zQ7KbNAvJx6mZOa+vzP3ZYP1YLufxP7v0T7rlY0e2LxWOEEdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAn4YV1njDMZdXdn1ecD1uwt1P/WND8iiikiSEULWmOud10C+2
	fkaaRF1RMq2j8UPQUq4cydxdEBA7GcteRH38MjTZ5Hs1uuXYM2rgKrL9lOb6xpedNW7rtp/HJpT
	//lk=
X-Gm-Gg: ASbGnct5yVt2tLohEq1lAGVzCrrnaW0XqOHM0FRYmpHfouThIDJNDR7Qoq1fjHK4VaQ
	K4eWvD0v9YQgWStp6wJKwn7FcrVtR+U9kzImtYNQoRHonVTY70p+9xrDx/atnvhHySZChpgiZDy
	PHwEWd8256qvO5YjDCQxp5mTxDzQed4vrGwoX+qQE3GK26va6YDfoCLAqim7FHBr3gW5fz0WkRi
	9R3b7DYrN9KHBgrfRXOCLw6/O1CbACaf7YsrAF/1yQsyqFsZRk9FNmWxTHpokcH2iAsDGdy2f0W
	bnOzQ49xZP+qJgkOJPV3OMmZtx3b9bJ0p689t+pzA/fUh+0EAnSLhfbyVd+utJtIVXHCnL1QSFU
	+agi/hDqkbx4rh2mE8RAYDzC14hWaAn8M9iAoeZYoS2dg2N6LE1o0J61EsFtKSw==
X-Google-Smtp-Source: AGHT+IGvH+IaOsA0/DEZs2ya2Qiubc3JDf7rHZZrgVXNGve63nR0f8Ilobi2Qp8pelktjgQT22GZ6w==
X-Received: by 2002:a05:6870:7316:b0:2ff:d18b:5b39 with SMTP id 586e51a60fabf-307aa51358cmr359687fac.6.1753934995118;
        Wed, 30 Jul 2025 21:09:55 -0700 (PDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-307a7391f84sm203982fac.20.2025.07.30.21.09.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 21:09:54 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-432ae370f7dso448533b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Jul 2025 21:09:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV019HdlWkIv5KlrqyjG77z+AExo8EpTfTg9rdbjjjCBKYQtkCV8T4Jg1QpV0XzZlV+yBZjmbY/dwuDX1sPdw==@lists.infradead.org
X-Received: by 2002:a05:6102:5122:b0:4e7:be09:df07 with SMTP id
 ada2fe7eead31-4fc100ad7d7mr227087137.12.1753934630495; Wed, 30 Jul 2025
 21:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250730152128.311109-1-laura.nao@collabora.com> <20250730152128.311109-5-laura.nao@collabora.com>
In-Reply-To: <20250730152128.311109-5-laura.nao@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Jul 2025 12:03:14 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngvS9z-KOZXeV4kLiW_pDx2F+3AOMcTokaq9O=-E4Pneg@mail.gmail.com>
X-Gm-Features: Ac12FXze0WWvW6KolXpxHVZ5mr5bsteDEMGk6n5CvaPH_JsjnG6BTJ_hncHj4Ic
Message-ID: <CAC=S1ngvS9z-KOZXeV4kLiW_pDx2F+3AOMcTokaq9O=-E4Pneg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] thermal: mediatek: lvts: Add platform ops to
 support alternative conversion logic
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
	linux-mediatek@lists.infradead.org, bchihi@baylibre.com, 
	colin.i.king@gmail.com, lala.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_210956_796515_D9B78D97 
X-CRM114-Status: GOOD (  15.84  )
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

On Wed, Jul 30, 2025 at 11:35=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Introduce lvts_platform_ops struct to support SoC-specific versions of
> lvts_raw_to_temp() and lvts_temp_to_raw() conversion functions.
>
> This is in preparation for supporting SoCs like MT8196/MT6991, which
> require a different lvts_temp_to_raw() implementation.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 46 +++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index 8398af657ba2..6e4a35ecaf34 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -125,8 +125,14 @@ struct lvts_ctrl_data {
>                         continue; \
>                 else
>
> +struct lvts_platform_ops {
> +       int (*lvts_raw_to_temp)(u32 raw_temp, int temp_factor);
> +       u32 (*lvts_temp_to_raw)(int temperature, int temp_factor);
> +};
> +
>  struct lvts_data {
>         const struct lvts_ctrl_data *lvts_ctrl;
> +       struct lvts_platform_ops ops;

nit: I think this can also be a const struct, since ops are all
initialized in the platform data and never change.

Anyway, the changes look good IMO, so
Reviewed-by: Fei Shao <fshao@chromium.org>

>         const u32 *conn_cmd;
>         const u32 *init_cmd;
>         int num_cal_offsets;

[...]

