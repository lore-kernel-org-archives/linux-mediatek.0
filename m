Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58218E77170
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2024 00:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blIrJbErtJBhmg6i7GQdINtKp/1t5xm0HORWyHzR8zA=; b=R0KrmpNDoOSXda/ase81JySXYp
	pa/KFlZZyOK3g57tToP8Nxm8LbK5ZGtg/U7qLtlPrK+eIqP92Sn+94dUNluqsiWH6v05+lM2kmCh/
	rtniVxNpwzOKCxWM9xNNO7eWRkvrS1OsGZEHu2Swm9moxOFLRJASL6nJ2/XZCH6rCRYJqJvD3Tjjx
	LfMNcDFOsKiGp7DxKeVhn6+FPxTBEAI0AjyoqRxtr3O1mML9CSIM853OybjGT/WGEeuZICOAT8sMI
	qsV3RWFWyuF+dcBbw5W9hETnGZg2iLpaUhuWgltBKH3gxxUv90SNF9lMXClCSKoE+l4+AKazL78Mr
	cf4qWXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLtl-000000002LJ-1A2g;
	Fri, 06 Dec 2024 00:08:45 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLse-0000000025D-1Kh4
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Dec 2024 00:07:37 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53de8ecb39bso2073087e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Dec 2024 16:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733443655; x=1734048455; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blIrJbErtJBhmg6i7GQdINtKp/1t5xm0HORWyHzR8zA=;
        b=CR/Vkdoj2AXy5M1xnfspZk/Y1HCPmCASJcLvp39oMNQrcK9TeUL4PpvFHR0EXC/pLq
         50Z1P3brcaxQQ9HrRKS2QjB6QEdRbeuExdyUqedxtpQE8bxnvIb6+Eg6eEF4QWt1knY+
         Ab7Wf7wb8y/jwhFHw8B4PMqJMZXV/klwngJjey8eimJiSkv0h4xICDcyW2gY9xjmePz/
         a6JzBq0qLV7gaRGeoPUp1U1hiSegJcPb0xncS1uh/nykg9m25IAQ2g/SBkrb+Qdk8ULQ
         UalYOpP05v0ogp2XaURoWCX6S5CxkOGcnX0hqLXOr0fuzsQirG+y1tTSdZKi34nax4xA
         kc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443655; x=1734048455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blIrJbErtJBhmg6i7GQdINtKp/1t5xm0HORWyHzR8zA=;
        b=d3xAb8A3nhFF4S72OItU+OTuY1xQXzQQR4jbbCzbvBYiwyCvxQ6jWrE1gWfU7CK7rE
         3JBTRB2ioHOdnjXZcrrQFLURcocZdYnlszAwe3UdlQoNo9W3rs4Fw+Be6FHU05lxHejo
         ZI6xeKi6+EYG3Ulsa6O7CO6YgoTRgHXMzfKSkncA5ACxc/nYgdVEWRNy+d2Z7crZFrGQ
         fVcUrlgK7tVqlkLQ9vf93qgV8WKhYy9EwnNlqq3JlGljZDQJDBCSIvi65h4y/O7REsy0
         Ga6HAqw3SPtaIax8MFrRXrEiwkTwveo9emyFnltrJu06T17hka+jvpg76GaBWniqZbNz
         bKag==
X-Forwarded-Encrypted: i=1; AJvYcCVDfyL60U8beGCeh12JcDvTYLeNxk+9IafxK/nFgQOoxkApzx+V/snEXGD3NEgaNbK4tfEVZOazZOnZyySeuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBLDkOw6dPJddjP/f2Pmq48odn93uLbXBmFGFgIX2AKeviLjFP
	kLweVJ3GqErwI49hEU/C4AXTGBRzCPvFH7DcP23Vdhn4R2ZJdRPqAtm7qJnEUudEpgWLwY12YxU
	nEoccWRqxPh6ENwAN6JmQgP2g+yADUZzRfwKL
X-Gm-Gg: ASbGnct7qI5ydjoPFYL1Gu1utYRH9GdG14AtwWE22aSGwDeJKp7RM++nbwCPBqOejUC
	sROS8Qxg/tmG8RLE9WlqhaH1zK6CyuQ==
X-Google-Smtp-Source: AGHT+IGwkB+5shyB5Uw7Uf9fUCWUSk4ghNB6iVijhuSWeVK3ZvAmFf8V/NY25l5TehZEnnHMKB1Y4S3fEVzEwkI2dcY=
X-Received: by 2002:a05:6512:220c:b0:539:e65a:8a71 with SMTP id
 2adb3069b0e04-53e2c2c1873mr420862e87.34.1733443654651; Thu, 05 Dec 2024
 16:07:34 -0800 (PST)
MIME-Version: 1.0
References: <20241204221627.2247598-1-sashal@kernel.org> <20241204221627.2247598-8-sashal@kernel.org>
In-Reply-To: <20241204221627.2247598-8-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:06:58 -0800
Message-ID: <CAGETcx-8nwfbCHN7zG7XuOM+CRevEU6M8fqaw1H4h+yz-H2BoQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.12 08/15] drm: display: Set fwnode for aux bus devices
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Thierry Reding <treding@nvidia.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	matthias.bgg@gmail.com, elder@kernel.org, sumit.garg@linaro.org, 
	ricardo@marliere.net, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_160736_365708_CBA478DB 
X-CRM114-Status: GOOD (  14.69  )
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

On Wed, Dec 4, 2024 at 3:28=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> From: Saravana Kannan <saravanak@google.com>
>
> [ Upstream commit fe2e59aa5d7077c5c564d55b7e2997e83710c314 ]
>
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) wit=
h backlight-lcd0
>
> Reported-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@=
notapiano/
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
> Link: https://lore.kernel.org/r/20241024061347.1771063-2-saravanak@google=
.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

I'm okay pulling this into 6.12 as it's recent enough.

-Saravana

> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/d=
isplay/drm_dp_aux_bus.c
> index d810529ebfb6e..ec7eac6b595f7 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -292,7 +292,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
>         aux_ep->dev.parent =3D aux->dev;
>         aux_ep->dev.bus =3D &dp_aux_bus_type;
>         aux_ep->dev.type =3D &dp_aux_device_type_type;
> -       aux_ep->dev.of_node =3D of_node_get(np);
> +       device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np)));
>         dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
>
>         ret =3D device_register(&aux_ep->dev);
> --
> 2.43.0
>

