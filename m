Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEF9C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 01:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5fSNqHi9NEqILrnhCWCR3tGDVIu+LDzvUUnKDBNWDM=; b=XgSFth9BTZutViSub8YjNz9nwy
	3cDA/vhGLKoW2177DBYNgH6TBKl5iMl3VRb2iDacvMWYMc2FNddXtLX8aHTMcPye1gIWSACt/beLN
	gg4K7AUqYY9+VSb5WR1y8SMc/D6wmEGQak0PbL//621lf1A25wmn021AUZnH1HP1PPYg9liSWlygL
	ts/J1P0o0U721TtNW9IVVGb3Dwehttk1VBmll3OSmAN57xKExoxj528qeAivL9jYSIISPZSvDntnh
	zd4DdKmIlzIUDf+nRNLii84Itz63u1qsf6h/8cPRLJ3lTfVQaYyL6+UY3qTpugNtfrAHmd1r0qYuf
	pExE33eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJm3-0000000GdOP-1BuI;
	Mon, 12 Aug 2024 01:23:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJlT-0000000GdMZ-1VSf;
	Mon, 12 Aug 2024 01:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=A5fSNqHi9NEqILrnhCWCR3tGDVIu+LDzvUUnKDBNWDM=; b=A/nmvgqUPcIaMxD3Uv+G6cpYcL
	CYeo++M2AxH+lS/hD/sJ7cOqoz6eJuhrvRbSryADq/3PobzEOZsMHdm2F9/8Cx5VuC3BqfMuBpqI7
	TaND4ABi1a1NSULAHiedVIlWVRqRWs2H79eEF41MHgFWnc8DW9s6OQh03oIatioooZbJz7iiNYMmg
	a9oLMXgMfOUiNKWrGhEV+c+M/BAabyl/aekF4XOqEfsVEUxqWwC8+JK5yheHHK1ZiMG3FhYrAQqoP
	IBGJ64k5UYMA5zCjoT87uUlYF1jfyzkq59voKYu4Yx7NOVV/Z3Ax56exXL5h7x3Y9zUKrMYddybM7
	lN6Atnog==;
Received: from mail.manjaro.org ([116.203.91.91])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJlK-00000007RZR-48tW;
	Mon, 12 Aug 2024 01:22:22 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1723425725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A5fSNqHi9NEqILrnhCWCR3tGDVIu+LDzvUUnKDBNWDM=;
	b=UvNEosSziXo3OIwb8LAWlDOA7gMZRS0gU8LGeBcoAttZl8r13bUVa0J0DAz810IsP4hqEK
	ihDRwja9yYXx4BqV2Ol0YvRngaUi+hKQB4bEbHrDCxi3c+mBPStcfxHSTYB658B1OJIKEb
	tqYlNfa0ZrU7b+g97LC1AXT8UjobuoFh1K/wb4OmZ/hhcfCBZGWF6eX9rSpe6H7D0qOCDy
	YiMlyOGClyet/g00T4Gv/eUub8YLeYVuo3KicN+GEKgux7eYUTjwPO7eD6STdcLnpODw8C
	v+o1nX5JGpcGzfQrvnBSTyXWB9mQP5uVRCPZcBlU4AacFq9k8m+cJtnHwIBr2A==
Date: Mon, 12 Aug 2024 03:22:05 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Icenowy Zheng
 <uwu@icenowy.me>, Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Pra?=
 =?UTF-8?Q?do?= <nfraprado@collabora.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Hsin-Te Yuan
 <yuanhsinte@chromium.org>
Subject: Re: [PATCH v2] thermal/of: support thermal zones w/o trips subnode
In-Reply-To: <20240809070822.2835371-1-wenst@chromium.org>
References: <20240809070822.2835371-1-wenst@chromium.org>
Message-ID: <b00273d65dfc4b48cca474784184c62b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_022220_812620_924C5E89 
X-CRM114-Status: GOOD (  24.72  )
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

Hello Chen-Yu,

Thanks for the patch.  Please see one comment below.

On 2024-08-09 09:08, Chen-Yu Tsai wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> Although the current device tree binding of thermal zones require the
> trips subnode, the binding in kernel v5.15 does not require it, and 
> many
> device trees shipped with the kernel, for example,
> allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64, 
> still
> comply to the old binding and contain no trips subnode.
> 
> Allow the code to successfully register thermal zones w/o trips subnode
> for DT binding compatibility now.
> 
> Furtherly, the inconsistency between DTs and bindings should be 
> resolved
> by either adding empty trips subnode or dropping the trips subnode
> requirement.
> 
> Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Resurrecting this patch specifically for MediaTek MT8183 Kukui devices.
> 
> Changes since v1:
> - set *ntrips at beginning of thermal_of_trips_init()
> - Keep goto out_of_node_put in of_get_child_count(trips) == 0 branch
> - Check return value of thermal_of_trips_init(), if it is -ENXIO, print
>   warning and clear |trips| pointer
> - Drop |mask| change, as the variable was removed
> 
> I kept Mark's reviewed-by since the changes are more stylish than
> functional.
> ---
>  drivers/thermal/thermal_of.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_of.c 
> b/drivers/thermal/thermal_of.c
> index aa34b6e82e26..f237e74c92fc 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -128,16 +128,17 @@ static struct thermal_trip
> *thermal_of_trips_init(struct device_node *np, int *n
>  	struct device_node *trips, *trip;
>  	int ret, count;
> 
> +	*ntrips = 0;
>  	trips = of_get_child_by_name(np, "trips");
>  	if (!trips) {
> -		pr_err("Failed to find 'trips' node\n");
> -		return ERR_PTR(-EINVAL);
> +		pr_debug("Failed to find 'trips' node\n");
> +		return ERR_PTR(-ENXIO);
>  	}
> 
>  	count = of_get_child_count(trips);
>  	if (!count) {
> -		pr_err("No trip point defined\n");
> -		ret = -EINVAL;
> +		pr_debug("No trip point defined\n");
> +		ret = -ENXIO;
>  		goto out_of_node_put;
>  	}
> 
> @@ -162,7 +163,6 @@ static struct thermal_trip
> *thermal_of_trips_init(struct device_node *np, int *n
> 
>  out_kfree:
>  	kfree(tt);
> -	*ntrips = 0;
>  out_of_node_put:
>  	of_node_put(trips);

It might be a bit cleaner to keep the "*ntrips = 0" assignment
in the error handling path(s) only, with the positions of the goto
labels adjusted a bit, and then assign -ENXIO to "ret" and jump
to the right label when of_get_child_by_name(np, "trips") fails,
instead of returning from there.

If it's unclear what I'm talking about, please let me know and
I'll send back the proposed hunk.

> @@ -490,8 +490,13 @@ static struct thermal_zone_device
> *thermal_of_zone_register(struct device_node *
> 
>  	trips = thermal_of_trips_init(np, &ntrips);
>  	if (IS_ERR(trips)) {
> -		pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
> -		return ERR_CAST(trips);
> +		if (PTR_ERR(trips) != -ENXIO) {
> +			pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
> +			return ERR_CAST(trips);
> +		}
> +
> +		pr_warn("Failed to find trip points for %pOFn id=%d\n", sensor, id);
> +		trips = NULL;
>  	}
> 
>  	ret = thermal_of_monitor_init(np, &delay, &pdelay);

