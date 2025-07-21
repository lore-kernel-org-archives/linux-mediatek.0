Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD18BC83F25
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hD8rxQd2ghX7oxkvwv9EZVZXOQiPMsFApAotllBQSeg=; b=xSoO43FuHbo1+iliT46ru4/lJh
	FQfK44d1JbwArt+XZkQRgWLsJbAWPlLfgh4cBPt1I6d7tA2ILACKFf9axBYumnu/b/gSubmTo38EF
	zS6vBWvAagI5jKHgFNx8cMNxsYQOyuP5m5UqLmJmeMSvOM5td+Z0qMXnIcDEThOH1DrzuKAF01+ve
	RbHQy6xqxY1ZtgGfZBvWd/hfdufe6chsaoKWSZHKGjiXhXDgRhIHszNCViRudnugwmxGW18ypA+xi
	zv0s2rffstVVsmfhTRmODyby42AiJKPHZ8JfXOXa5nAar5mAh4FZTFGnd8T+CfEb9T1MtCtmtz9Et
	bIctoFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorM-0000000H7Ch-3a8z;
	Mon, 21 Jul 2025 11:39:08 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnRV-0000000GunZ-3XAG
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Jul 2025 10:08:23 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-32b3a3a8201so36561251fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Jul 2025 03:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753092500; x=1753697300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hD8rxQd2ghX7oxkvwv9EZVZXOQiPMsFApAotllBQSeg=;
        b=ngdlnpZ5Pa9q5NDx+osyQLh416upn7lfIkd0S/vINA5hP+S9ZVgJTl/yV9sXJgNnjN
         4t6kpuR2fkKjMpxqvul/Fo4AAdNCm81vvfbRr8iUfU0xP0KUP1NgZZLHx60NVXGLct80
         zZVg6UNowWT0H3LrofMLTd+wEc5J/cweCD6+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753092500; x=1753697300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hD8rxQd2ghX7oxkvwv9EZVZXOQiPMsFApAotllBQSeg=;
        b=p8Ycqh+C1hwhPvWKwgyFt+/ctSnLZ20+TiNtvBIJgmhVqhL7fqyEcXWSBQcM0ZI7jJ
         C3K4WIh21lIyTbwo8EJkPbnbzD8KmJHdWyZ/+Qe/9X8BBzzFwN8srHDRSqtd3A0ztyeC
         By95I0K1aH7glWryEQda/a5VRE7P6qi3oEAWocwe0UlZuhP0377tnLj1czFgXeM0xS07
         DJJAT+Onrnk8UMT03w07uoUlzY6yK96TdbgbnQjpzlOmpbRIF8gXme7I4XQmZMREjisM
         Wy1jFJFjH5A+pIjJpZnTL2tdIqDGhBhogf+MEIyMZpXqi0/BsiyvofzcAKqcoEX0yk3x
         6LYg==
X-Forwarded-Encrypted: i=1; AJvYcCXlqLu+V455Pl+Hehh/sJm14F/zo83NcLraAxuZiYT6JzRaLuKGn/jhiv6J7hFN8lGciMMGy8KI73M4s0ntsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXIxB/O758qvzLiYgWa6aanPR75HajBgBRAiy/KnAq9O5sO+sK
	HRd2kNZCcIOoKGxJ9uIt5uvnnsu064JVO2hM9DI4XF2NOXfcIlhuLdZxx7v/M9MLmdN5FNqhxh+
	8lzrCW8CnB7Np4d2c0I9ouTiSfVXCJQ8Hdym8Rnwr
X-Gm-Gg: ASbGnct6m0mkj40c16nwTSk18S5YJH+oeREmW5aAW47HoIhycoj97IH3owur8mQ7A5/
	0THFuXeEIlobeblCWC2RyET85JUMCCaSsfChNxGgilO7IpGR+idNRkNRLVRp9v76U4m2P1PGw7j
	htjl6iP73M14L8s7VonRt5Kbsrdbn3S/xb2f/u/MlNHPXw7EuaoKmGqMBEKB8KTQj4wckhzvxO+
	K7BV9JZf8EqLrjNJg/9l539bMf7o09Ol+k=
X-Google-Smtp-Source: AGHT+IHi6PdCwFOePdyUiSBZQls+DPW7XtyOQBhq5kUoIJmQhohNKReJGJb1oSImXRjY6TmgwESv8Tvn2SOgxE98754=
X-Received: by 2002:a2e:a99a:0:b0:32a:8916:55af with SMTP id
 38308e7fff4ca-3308f4c5e9cmr53974251fa.2.1753092499826; Mon, 21 Jul 2025
 03:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250721081459.16278-1-laura.nao@collabora.com> <20250721081459.16278-4-laura.nao@collabora.com>
In-Reply-To: <20250721081459.16278-4-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Jul 2025 18:08:08 +0800
X-Gm-Features: Ac12FXzBhOOgbkI7YQgVr-Zp96LKQsUci_34ENr1pVVGZfl3HxcKeWbG5MiHa8I
Message-ID: <CAGXv+5F51DiCHi_QPeDKOGCwvgM6HpmRjEjSgS8-mh=Fg1Fr5g@mail.gmail.com>
Subject: Re: [PATCH 3/9] thermal/drivers/mediatek/lvts: Guard against zero
 temp_factor in lvts_raw_to_temp
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nfraprado@collabora.com, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_030821_873980_3CA8204A 
X-CRM114-Status: GOOD (  15.34  )
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

On Mon, Jul 21, 2025 at 4:26=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add a guard against zero temp_factor in lvts_raw_to_temp() to prevent
> division by zero and ensure safe conversion.
>
> Fixes: 6725a29321e4 ("thermal/drivers/mediatek/lvts_thermal: Make coeff c=
onfigurable")
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Code wise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

However I assume this would only happen with bad platform data? The
factor should _never_ be zero. Maybe also issue a warning in the probe
function?

ChenYu

> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index 8d5259b9d03b..b80c2929ae74 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -280,11 +280,14 @@ static int lvts_raw_to_temp(u32 raw_temp, int temp_=
factor)
>
>  static u32 lvts_temp_to_raw(int temperature, int temp_factor)
>  {
> -       u32 raw_temp =3D ((s64)(golden_temp_offset - temperature)) << 14;
> +       u32 raw_temp;
>
> -       raw_temp =3D div_s64(raw_temp, -temp_factor);
> +       if (temp_factor =3D=3D 0)
> +               return temperature;
>
> -       return raw_temp;
> +       raw_temp =3D ((s64)(golden_temp_offset - temperature)) << 14;
> +
> +       return div_s64(raw_temp, -temp_factor);
>  }
>
>  static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
> --
> 2.39.5
>
>

