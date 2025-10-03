Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A75BCCA471
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Oct 2025 20:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ec07GK8IeebwUTlhOReO08byQCiI8XurDvMqhbTfpDs=; b=O6Pti/tsdj2lmsZ7wOnblfJd2z
	GGWiqLwm1WCVTwqnuagndFuF37zx/3pVvr3VNjoS7P+QRdO6PE2jWXmumjeIa74ZMffWus9fCdahy
	+hPxLTmyc/qX4Y0uvYo5hO9n2ybRss3ixUQR2A1/kH83B3Jb8kRH4b7zXxPm/3hm7JPENXs6U/hVN
	NSeBT/D/USjqH35e2cLZli6W/f7Wwb6nZ/H80uemWvMTWcf8pLnFpq7AlN6iNvUnncRhFzkuWqOX8
	89fbLDpx/uZrow5gitLhNRLvSVlgcdmhBdZvU5ACsIIaTUGnGJdP12cqIGRbPt29k67X9WrqwfDji
	3YLxSNJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mh0-0000000D7BT-3DFv;
	Fri, 03 Oct 2025 20:47:54 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mgy-0000000D79d-0H8z
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Oct 2025 20:47:53 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-71d71bcab69so29448897b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Oct 2025 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759524471; x=1760129271; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ec07GK8IeebwUTlhOReO08byQCiI8XurDvMqhbTfpDs=;
        b=mcPZYozbWFVo0pStj0/+1GzChaAOXUEWOYG9V8evrsZSqZ3PiJCvvL50dl7SKbpv7g
         xiW81sbdnwkYXGQvHQw2zmomVrkGlvtm+cY88jHyVvxuAXd3WuidzI+BCEF1UWR4+52T
         lda5LOKsFn2yiq5MDFHYsD7YIUOy/VUSZHtc3o5znSYTRiJKTIIpfUEanT/BGx6ljfTs
         zRINw3EYJpy6q/V2tq7VFmb4RicqshhQTiN5k8mMbqVK/2QKbyR9JCG9AWr/cs+gBE7D
         RptbP+GslQkBEMLITOcZ4p+8l8NEFOvBgfD8niy3gMlFuZnqQ2aot8c1FBZeuVbScmmn
         RBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759524471; x=1760129271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ec07GK8IeebwUTlhOReO08byQCiI8XurDvMqhbTfpDs=;
        b=Ez4yRU7hlg/DuaNqsfdLF36tePH8WD6+XHjszDYXi+Yl5nAyiXTRBs+EAot4fPXOP3
         m0sd4rTqMKuWbHuFFvOk6A/0f1JS/H3Bot3+ChaafiIoCWn68/eznGI/lDPN52MKplIY
         yWYSF/TByOWE3Va+KqU7qX2QAU07HrJ02GdwgsSYUcEvXVQ+EbXGpOrXUNNRy5jbVgn8
         7DZWpwkqJjE9YbobNEgnP1DQb+Via1VZFvv56xOjn/9x8VvZ8j+HhgY5um2lAWGsexDA
         HYFx/sIYckOc9mDEJF1C0paZ3/KAcl6nE55P0QIPvBPGHlsEjwAZ3wd5BI/ZL6wkl0sQ
         JYWg==
X-Forwarded-Encrypted: i=1; AJvYcCX5jVweGHs1Pq9ccN/RAbjOq3HO7WP6CSAI6TY72X2kqzr/wkm0HrfIlCHReSR5c3cRvUs1cKZM1pE5IAuv5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKrKZ1M4oJUj9IGE08v91CG4IoEv7HlVYEKmoDkV/j++Yljej2
	27SyjwrO8t4UH/zEZSpy/4/yWF2vvbly+BrGIvqsnGdVLJ2LLA8qGcDgUDy7cQpwAA3aM2owxyM
	SSsv6bDjJHbAj/buM5SnayESn5G3/ZFo=
X-Gm-Gg: ASbGncv+jf3GAqOegVpOC7/xx11EL3A6nxHFruIGXWDeB4SuZaDqB/MQTgVNDkCsRmb
	DZODFRCymQDiO+u0NJasbzqLAiB+5QM4zedUvmo9aenqaxkkXLtQrG5vDe1apaDKqYshaT8k6w/
	qOIr3z49SaPUgaOSfCx5nbsxd7D+yygrT9qI6wDKlGHmQvyfVCBCYzU4lTluH5w85fcN0cr/Pdj
	YRiTIN3hp0n6efeiZBNQ2vczctq9XV0OPCI545Ka30FGnGUv6h/M6uDOAse6ognjo3EktD2Zsr6
	bqBAdFLjf/oiTBpLzUZCXw==
X-Google-Smtp-Source: AGHT+IGbRtPbh98BClkNFwaUaMJb45w8kt4Jk0KxRGScag36Tw0xGWcnBknxDwxYEhQPRsDsxQjX2aqyBPDcA2KuG7Q=
X-Received: by 2002:a53:8550:0:b0:638:53e9:bab0 with SMTP id
 956f58d0204a3-63b9a0ee753mr3639824d50.24.1759524470895; Fri, 03 Oct 2025
 13:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com> <20251003-mt8196-gpufreq-v6-6-76498ad61d9e@collabora.com>
In-Reply-To: <20251003-mt8196-gpufreq-v6-6-76498ad61d9e@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 Oct 2025 13:47:39 -0700
X-Gm-Features: AS18NWBGD0pXXLOymrZv-_f8nOh4HIhBGy-SAER5xKOoIW_DOui92j81TfsOhUs
Message-ID: <CAPaKu7Q==RvuZR-pgJekF++Y4HOdkryEvYV8QGJd_os0_if_vQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] drm/panthor: Use existing OPP table if present
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_134752_127362_0E8F2C1D 
X-CRM114-Status: GOOD (  20.70  )
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

On Fri, Oct 3, 2025 at 1:16=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On SoCs where the GPU's power-domain is in charge of setting performance
> levels, the OPP table of the GPU node will have already been populated
> during said power-domain's attach_dev operation.
>
> To avoid initialising an OPP table twice, only set the OPP regulator and
> the OPPs from DT if there's no OPP table present.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 26 ++++++++++++++++---------=
-
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> index 978f193a2aee561fadd9a976e9b1417118260889..6beb6170d6eea3dd65880dfe6=
4a61abbdd5f08da 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -143,6 +143,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev=
)
>         struct panthor_devfreq *pdevfreq;
>         struct dev_pm_opp *opp;
>         unsigned long cur_freq;
> +       struct opp_table *t;
>         unsigned long freq =3D ULONG_MAX;
>         int ret;
>
> @@ -152,18 +153,23 @@ int panthor_devfreq_init(struct panthor_device *ptd=
ev)
>
>         ptdev->devfreq =3D pdevfreq;
>
> -       ret =3D devm_pm_opp_set_regulators(dev, reg_names);
> -       if (ret) {
> -               if (ret !=3D -EPROBE_DEFER)
> -                       DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n=
");
> -
> -               return ret;
> +       t =3D dev_pm_opp_get_opp_table(dev);
"t" is too short for a long function like this one. We should either
rename it to "opp_table" or refactor this out to a shorter function.

dev_pm_domain_set_performance_state is new to me. It might just be me,
but a short comment explaining that the opp table might have been set
up by the pmdomain can be helpful.

With that, Reviewed-by: Chia-I Wu <olvaffe@gmail.com>.

> +       if (IS_ERR_OR_NULL(t)) {
> +               ret =3D devm_pm_opp_set_regulators(dev, reg_names);
> +               if (ret) {
> +                       if (ret !=3D -EPROBE_DEFER)
> +                               DRM_DEV_ERROR(dev, "Couldn't set OPP regu=
lators\n");
> +
> +                       return ret;
> +               }
> +
> +               ret =3D devm_pm_opp_of_add_table(dev);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               dev_pm_opp_put_opp_table(t);
>         }
>
> -       ret =3D devm_pm_opp_of_add_table(dev);
> -       if (ret)
> -               return ret;
> -
>         spin_lock_init(&pdevfreq->lock);
>
>         panthor_devfreq_reset(pdevfreq);
>
> --
> 2.51.0
>

