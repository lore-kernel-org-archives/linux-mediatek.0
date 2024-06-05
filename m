Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B074C25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 04:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waT0AcrUOg+uWZ0+qjh1ei9vxb3C0YTsDDg3ERd1AtM=; b=GD2iRfbIO6BP9as4bf98BQB57n
	xeuB3Y/+1xZAkeIK14dtr4JdiBgJ3Y8bWu1tHG5nj60NwLMSmp0+OqI5JppanvziHny76NQRvcCJk
	zw0/0ujHhxHxtqUG1nRN9yKryeAHlG3/LI489PcbKHNJKVleAcgLc9GMEUr2tEjK6chNn5CmUAMqN
	8lDVgCQH1yv+Y3pRPReX8EVRDhhvfAeSozVZyPdifcz8bn71VmxnsQE17IH35C+yAjZuazFuxA3sx
	lis0RATITpvhgqoo1g5Csk9vo2e3sz7LPsq2MjIzyEbymEnWv3YCsB5EPMFAmyt9JkQzrvYiq4aDZ
	gu/XM7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEiDh-00000004bG9-3Fij;
	Wed, 05 Jun 2024 04:25:53 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEiDd-00000004bE3-46Qx
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Jun 2024 04:25:51 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52b950aa47bso2475105e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 21:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717561544; x=1718166344; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waT0AcrUOg+uWZ0+qjh1ei9vxb3C0YTsDDg3ERd1AtM=;
        b=XLipe3XkOFXId4vhW+zD9DWc/MqgSD3rDuazSwsoAGLWAlgDdEjsb3Em3snELo7Y15
         Nt2E5z2ovhcdIcNV2wfhgcS0ppFv9VBr19POICCqCV5cysn2Lye3yfFZFWQpbVCeDpYZ
         2Cp16FTs2Ar7f9LOk0ErX1v3L2FoQZK27Dc0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717561544; x=1718166344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waT0AcrUOg+uWZ0+qjh1ei9vxb3C0YTsDDg3ERd1AtM=;
        b=jnZ3zbQkBqKidS331LoAou2+1V6RKYF+Rt8uxc0FrQwcuIeVrD4fUddW1ldR2GXBTO
         x0Q6+Ov7mBkRR3iMu2mZj3qNLm+fTw6c5ED3vk0VQQNh298p16yRegCoAi5Q+Fwr14Dj
         Hn0RIECBvoMtAyv+kFjxu2GDzlVMg3+QpEMRM4D8KDERmtp/pLzuM7ujNI7n29i/pAlm
         i4kxFubtGi9Hd99s5tAtL6JV9p6JBt0qhb3OEAxRXci7gCJcQjrkSjfmIylfS/FXu1nf
         wX7KxGQ8nKq28HoHICD7vJK1LHTFZWGHYDAElYyr8zS3U/cKfb8tVeLodBLoqmGQnxJt
         W3dA==
X-Forwarded-Encrypted: i=1; AJvYcCXYqkfY8pp+rGAd/Pn4rl6sIA6pbOsg46fOJ9e+CTY0j4hQ+XgNqOJ4RDjPeUav80g8oJDci/SAMSVbXI879sVTPYrDXJ5Wo35oiMzxvfvi2vuj
X-Gm-Message-State: AOJu0YwG5QSWx7CYpHcupCf0Jjw7PA3mElJW1i39bhmYI/GxjwV857rl
	N0NJI0cFTTTfg3g4fUnVCHN9IT2oHixfRQnBqxIuE6ZnwJW40SYP3GURoKLsNRePv0idQ5fNd4T
	6lE2PmhjJAI08gp7G/zcYFt3hPw19YguXTtss
X-Google-Smtp-Source: AGHT+IFVvcQWi5hirg6VyE5D099E/X3a3I1qA1m27sAUZLgof8ZGt7kAYof4SoSo6C5SbiaD1MLWTK9P2pF1kHV7ZcU=
X-Received: by 2002:a19:520b:0:b0:52b:874a:a44 with SMTP id
 2adb3069b0e04-52bab4dd1c0mr658131e87.25.1717561543571; Tue, 04 Jun 2024
 21:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com> <20240604123922.331469-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240604123922.331469-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 5 Jun 2024 12:25:32 +0800
Message-ID: <CAGXv+5GXphBp-YMDtkNh1Q-FNQq4cmELR0tB6M==5tKptr8bZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panfrost: Add support for Mali on the MT8188 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	steven.price@arm.com, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_212550_029797_78CB040C 
X-CRM114-Status: GOOD (  16.03  )
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

On Tue, Jun 4, 2024 at 8:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MediaTek MT8188 has a Mali-G57 MC3 (Valhall-JM): add a new
> compatible and platform data using the same supplies and the
> same power domain lists as MT8183 (one regulator, three power
> domains).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index ef9f6c0716d5..4e2d9f671a0d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -777,6 +777,14 @@ static const struct panfrost_compatible mediatek_mt8=
186_data =3D {
>         .pm_features =3D BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>
> +static const struct panfrost_compatible mediatek_mt8188_data =3D {
> +       .num_supplies =3D ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> +       .supply_names =3D mediatek_mt8183_b_supplies,
> +       .num_pm_domains =3D ARRAY_SIZE(mediatek_mt8183_pm_domains),
> +       .pm_domain_names =3D mediatek_mt8183_pm_domains,
> +       .pm_features =3D BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +};
> +
>  static const char * const mediatek_mt8192_supplies[] =3D { "mali", NULL =
};
>  static const char * const mediatek_mt8192_pm_domains[] =3D { "core0", "c=
ore1", "core2",
>                                                            "core3", "core=
4" };
> @@ -808,6 +816,7 @@ static const struct of_device_id dt_match[] =3D {
>         { .compatible =3D "mediatek,mt8183-mali", .data =3D &mediatek_mt8=
183_data },
>         { .compatible =3D "mediatek,mt8183b-mali", .data =3D &mediatek_mt=
8183_b_data },
>         { .compatible =3D "mediatek,mt8186-mali", .data =3D &mediatek_mt8=
186_data },
> +       { .compatible =3D "mediatek,mt8188-mali", .data =3D &mediatek_mt8=
188_data },
>         { .compatible =3D "mediatek,mt8192-mali", .data =3D &mediatek_mt8=
192_data },
>         {}
>  };
> --
> 2.45.1
>
>

