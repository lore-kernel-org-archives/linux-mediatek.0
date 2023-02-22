Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F271BC636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 19:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xirph8ZaZs/FfoVibB+3ZRkHICfPfH3p+X5lk5hXus=; b=ryjiRR5feiOpJ7Jxa8CO1Hzpph
	BkeKsG4y4NWoVCoWQLp5ReRouEQJ+D4yLoIJQdKeYxn16ICzuVwFnZopbxJin4c0sb6KtMdhLGNTm
	NC72QccvL7wq5vrg2KQ45Kj5sUKOT6AGLBB8SJ5m6d+B/ETXL3hKBgqnnu1sqkQX2ihhjzMLJwu4T
	hmJGywksbaUXf1GIr64aLpZ/C3mNsqSo0N3/dF/gpnqrcDDPPoXBBeVSyNt6T0RMMNZF2unfFShjy
	D/USH8HElWB0HFpxtKaZw0hs5OKPI6TCb5tv9SCYhpdktApR2ECqWoggNA1/+LGz+onnf60RkMYcq
	aF+fKQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUv65-00DscE-Kz; Wed, 22 Feb 2023 19:48:13 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUv5v-00DsZb-GM; Wed, 22 Feb 2023 19:48:04 +0000
Received: by mail-ed1-f43.google.com with SMTP id ee7so19935136edb.2;
        Wed, 22 Feb 2023 11:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xirph8ZaZs/FfoVibB+3ZRkHICfPfH3p+X5lk5hXus=;
        b=e/2xuVgzmqJZXuYAEBl9/4enW+V5aZkZAnerLBP8r5JQeLvr4SgbGldN4NDGLqj4fY
         eT26gvL1k+IlXOwxBj4eBV2kzSvCcZ29EqGCd1C+gEUrydDlg4kwdxI7BLQqa+C6H1Vg
         eKvtrWTHGjaBUOILeq46B0dAbsfkaLh9+LflFFHMcqUwzRhBTv5dzLSk/ES9l9xNCad0
         o3HqpG7gdBn+NyPvmF1zx7mv8S2TkAn/5h6lm46Z2b7Zn7yL3UsPE1qWlXuTzDW69dNh
         ByHKoSaAU+rDvHq81gLzQWWgIoF9PRKMBUb7IbVGr56cSO2yTelYHhQR7XLhuEA8/fLf
         wiJQ==
X-Gm-Message-State: AO0yUKVfpcZ+Exj+Z2b2JHhnZXbCy5aHTg7/advsoEC107wL3iGoCFX2
	yJxspRqTbel4cXMBUXj4wxHlxe+lRG2A+HPJxnnjv6lf
X-Google-Smtp-Source: AK7set9kCY98R+CyM0V7JuOsXpiSKOjZhntRws2CYg4MiPUEc2u4pqQFZKOHMs/+YLxV0+q4CvfwqG60Wm+gmXE9Z/8=
X-Received: by 2002:a17:907:2076:b0:8b1:788d:1fbf with SMTP id
 qp22-20020a170907207600b008b1788d1fbfmr10129118ejb.5.1677095282047; Wed, 22
 Feb 2023 11:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org> <20230221180710.2781027-10-daniel.lezcano@linaro.org>
In-Reply-To: <20230221180710.2781027-10-daniel.lezcano@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 22 Feb 2023 20:47:50 +0100
Message-ID: <CAJZ5v0idDA74D3paCmbFdb2R3Ce77Mmn5xh9Sg3smoTy6j_Mag@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] thermal: Do not access 'type' field, use the tz
 id instead
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ido Schimmel <idosch@nvidia.com>, Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, 
	Petr Machata <petrm@nvidia.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Amit Kucheria <amitk@kernel.org>, Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Balsam CHIHI <bchihi@baylibre.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"open list:ACPI THERMAL DRIVER" <linux-acpi@vger.kernel.org>, 
	"open list:MELLANOX ETHERNET SWITCH DRIVERS" <netdev@vger.kernel.org>, 
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_114803_567913_ED6EAF95 
X-CRM114-Status: GOOD (  22.09  )
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

On Tue, Feb 21, 2023 at 7:08 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> The 'type' field is used as a name in the message. However we can have
> multiple thermal zone with the same type. The information is not
> accurate.
>
> Moreover, the thermal zone device structure is directly accessed while
> we want to improve the self-encapsulation of the code.
>
> Replace the 'type' in the message by the thermal zone id.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com> #mlxsw

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/acpi/thermal.c                             | 2 +-
>  drivers/net/ethernet/mellanox/mlxsw/core_thermal.c | 4 ++--
>  drivers/thermal/mediatek/lvts_thermal.c            | 5 +----
>  drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 4 ++--
>  4 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
> index 392b73b3e269..b55a3b0ad9ed 100644
> --- a/drivers/acpi/thermal.c
> +++ b/drivers/acpi/thermal.c
> @@ -842,7 +842,7 @@ static int acpi_thermal_register_thermal_zone(struct acpi_thermal *tz)
>                 goto acpi_bus_detach;
>
>         dev_info(&tz->device->dev, "registered as thermal_zone%d\n",
> -                tz->thermal_zone->id);
> +                thermal_zone_device_get_id(tz->thermal_zone));
>
>         return 0;
>
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
> index 722e4a40afef..a997fca211ba 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
> @@ -176,8 +176,8 @@ mlxsw_thermal_module_trips_update(struct device *dev, struct mlxsw_core *core,
>         }
>
>         if (crit_temp > emerg_temp) {
> -               dev_warn(dev, "%s : Critical threshold %d is above emergency threshold %d\n",
> -                        tz->tzdev->type, crit_temp, emerg_temp);
> +               dev_warn(dev, "tz id %d: Critical threshold %d is above emergency threshold %d\n",
> +                        thermal_zone_device_get_id(tz->tzdev), crit_temp, emerg_temp);
>                 return 0;
>         }
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index beb835d644e2..155cef8ed3f5 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -304,10 +304,8 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
>          *
>          * 14-0 : Raw temperature for threshold
>          */
> -       if (low != -INT_MAX) {
> -               pr_debug("%s: Setting low limit temperature interrupt: %d\n", tz->type, low);
> +       if (low != -INT_MAX)
>                 writel(raw_low, LVTS_H2NTHRE(base));
> -       }
>
>         /*
>          * Hot temperature threshold
> @@ -318,7 +316,6 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
>          *
>          * 14-0 : Raw temperature for threshold
>          */
> -       pr_debug("%s: Setting high limit temperature interrupt: %d\n", tz->type, high);
>         writel(raw_high, LVTS_HTHRE(base));
>
>         return 0;
> diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> index 060f46cea5ff..488b08fc20e4 100644
> --- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> +++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> @@ -43,8 +43,8 @@ static void ti_thermal_work(struct work_struct *work)
>
>         thermal_zone_device_update(data->ti_thermal, THERMAL_EVENT_UNSPECIFIED);
>
> -       dev_dbg(data->bgp->dev, "updated thermal zone %s\n",
> -               data->ti_thermal->type);
> +       dev_dbg(data->bgp->dev, "updated thermal zone id %d\n",
> +               thermal_zone_device_get_id(data->ti_thermal));
>  }
>
>  /**
> --
> 2.34.1
>

