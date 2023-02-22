Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A48C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 20:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FrhnmpFXYJ2ruds7IcpiLVKaKCtCwhucB8NT2yoBtA=; b=ZppBkqX1k3jp3BLlNERYLRcajH
	SbTxXW3IA2smOKeMClKZInkEEOs3V9s4HPmNoudBYl3llHDdDhm+4GJ+aCFoRQQpWiptqEaT09r+K
	0IEgOYZoVrDruX5Dr0Utukl4PDnKJeZ2/0MZUC/3mGcwIeIN43tmSLbZXOKU9cZmzVaCGWEMgDGsH
	jmRFKq4uT1DxaAqYLQz8IKXzecpF0IuBxxXVY5n3+E7SsfvLVKJPxwoQcXEnTBVCjhcIh2rjkKCf3
	83iqW4ILD+OJzWKt7oHZgglFky6lo0k1M/8fo4VEbUWt7Jn3T8/PiO9l+LnZpFVts2nSxFSQh3Cvy
	aB1xEp9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUvNq-00Dxa9-BR; Wed, 22 Feb 2023 20:06:34 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUvNf-00DxWG-8O; Wed, 22 Feb 2023 20:06:24 +0000
Received: by mail-ed1-f49.google.com with SMTP id b12so35175809edd.4;
        Wed, 22 Feb 2023 12:06:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5FrhnmpFXYJ2ruds7IcpiLVKaKCtCwhucB8NT2yoBtA=;
        b=7/Ww+UKetVia9z1zw27o2oMbvx2J1e3OAgrwjzreDpBi1MHBqkj6wQKbGNBS7fGtF4
         oj0iy/1FuWKITOHd5onoSawfmAjJni7chRs8BnUOVIqezcxNoOgRykk4XAyng7szU9/o
         PDMvCFNdx201M+qRGnK+6mOGWXSknhpAuoOKkHWly+DYbG2fOJidMDtHdu/bSlf+0pDT
         bpRjAl8cY7OvZzqh2/aZ/nTE1d1oVGvnwJm7HmiJDbFA3s5L+4BusIDSEg71w2as5kf/
         /XArim3YEySfN5h6j9wHx830sr+dbhoLB/Os9UFx+OwINegZim4D07qBj8hFfhy6v6Rh
         JTBA==
X-Gm-Message-State: AO0yUKVoS3ahSgRvGH+3J8hjbXAKXOIqbomQvGj2rwvpmL3FzzbOeqaN
	VCchC4gvHAyB/12a1A1mWabfpYFhBHWdoU78+Ms=
X-Google-Smtp-Source: AK7set/po3VyktwxEsvJqz0FpIkkq7uzVUEz8zFA6NgPjaNe3NoxjdDwF5w8A3dbosoUaeENbiJ8bZNdJt2gAN+dbw0=
X-Received: by 2002:a17:906:3b84:b0:877:747d:1108 with SMTP id
 u4-20020a1709063b8400b00877747d1108mr8024476ejf.5.1677096380241; Wed, 22 Feb
 2023 12:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
 <20230221180710.2781027-7-daniel.lezcano@linaro.org> <CAJZ5v0gTmi7ZeDDdHWGWju4m3bv2366oVqSP1dGOT+3jLV-jaw@mail.gmail.com>
 <0889767f-d187-0cb4-895e-c149517b6636@linaro.org>
In-Reply-To: <0889767f-d187-0cb4-895e-c149517b6636@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 22 Feb 2023 21:06:09 +0100
Message-ID: <CAJZ5v0h=UCOyJ88UgEdqch4NZK+DaT8jWnDaguQGNx-KOMhPPA@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] thermal: Don't use 'device' internal thermal
 zone structure field
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Balsam CHIHI <bchihi@baylibre.com>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ido Schimmel <idosch@nvidia.com>, 
	Mark Brown <broonie@kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_120623_319965_73F0CF4C 
X-CRM114-Status: GOOD (  22.23  )
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

On Wed, Feb 22, 2023 at 9:00 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 22/02/2023 20:43, Rafael J. Wysocki wrote:
> > On Tue, Feb 21, 2023 at 7:07 PM Daniel Lezcano
> > <daniel.lezcano@linaro.org> wrote:
> >>
> >> Some drivers are directly using the thermal zone's 'device' structure
> >> field.
> >>
> >> Use the driver device pointer instead of the thermal zone device when
> >> it is available.
> >>
> >> Remove the traces when they are duplicate with the traces in the core
> >> code.
> >>
> >> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >> Reviewed-by: Balsam CHIHI <bchihi@baylibre.com> #Mediatek LVTS
> >> ---
>
> [ ... ]
>
> >>          thermal_zone_device_update(data->ti_thermal, THERMAL_EVENT_UNSPECIFIED);
> >>
> >> -       dev_dbg(&data->ti_thermal->device, "updated thermal zone %s\n",
> >> +       dev_dbg(data->bgp->dev, "updated thermal zone %s\n",
> >>                  data->ti_thermal->type);
> >
> > The code before the change is more consistent, because it refers to
> > the same object in both instances.
> >
> > It looks like a type field accessor is needed, eg. thermal_zone_device_type()?
> >
> > Or move the debug message to thermal_zone_device_update()?
>
> Actually it is done on purpose because the patch 9 replaces the accesses
> to 'type' by 'id', the thermal_zone_device_type() accessor won't be needed.

Cool.

However, this is a change in behavior (albeit small) which doesn't
appear to be necessary.

What would be wrong with having a tz->type accessor too?

