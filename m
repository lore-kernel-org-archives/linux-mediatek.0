Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC87CCD199
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Oct 2025 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oJhR7TQR33Hs7zmN9Ew/2XEnO2MDjLO5t6uKC++Vuk=; b=bfule7EA1FuPkkDGrIX00+EyAw
	z6XyB7hb16ZQz9PWSkKZsEvUtluk+8ydNwdPY2Hc706GdIwKETGNPdY0graABtwhCddebbuz8WQSj
	VnzjiENcKE8BSH+6WpJZRVhmL2+YUxO1REkNK6Xr7nzXMLhbQO5P0XgKd7MZ9UagXVci2G5wQmkL8
	x/rMmXEvz2dIr+r8Q9W/jEr/npASzFo8Qix+1ywL/f+3Dog8Zf1Wx7eVQrvRTIqDbkQqTZzqvU7Wu
	41ZWINhAPftx/4KQAD+S9rkZtLfFTuzLXMg/lClrnWiLef8pX1sAdIPAzZCGb0efjCNsk7VAr8Ho9
	GlvlaGlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqEj-0000000DqbZ-1Jgk;
	Mon, 20 Oct 2025 13:47:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqEg-0000000DqZX-1wXb;
	Mon, 20 Oct 2025 13:47:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FCBA16A3;
	Mon, 20 Oct 2025 06:47:30 -0700 (PDT)
Received: from [10.57.36.117] (unknown [10.57.36.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF81F3F66E;
	Mon, 20 Oct 2025 06:47:32 -0700 (PDT)
Message-ID: <ef6434a9-cde5-4d68-a3a3-1873ba7912d3@arm.com>
Date: Mon, 20 Oct 2025 14:47:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] drm/panthor: Use existing OPP table if present
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
 <20251017-mt8196-gpufreq-v8-4-98fc1cc566a1@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251017-mt8196-gpufreq-v8-4-98fc1cc566a1@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_064742_617977_F2D7880E 
X-CRM114-Status: GOOD (  19.42  )
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

On 17/10/2025 16:31, Nicolas Frattaroli wrote:
> On SoCs where the GPU's power-domain is in charge of setting performance
> levels, the OPP table of the GPU node will have already been populated
> during said power-domain's attach_dev operation.
> 
> To avoid initialising an OPP table twice, only set the OPP regulator and
> the OPPs from DT if there's no OPP table present.
> 
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 32 ++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index a6dca599f0a5..ec63e27f4883 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -141,6 +141,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	struct thermal_cooling_device *cooling;
>  	struct device *dev = ptdev->base.dev;
>  	struct panthor_devfreq *pdevfreq;
> +	struct opp_table *table;
>  	struct dev_pm_opp *opp;
>  	unsigned long cur_freq;
>  	unsigned long freq = ULONG_MAX;
> @@ -152,17 +153,30 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  
>  	ptdev->devfreq = pdevfreq;
>  
> -	ret = devm_pm_opp_set_regulators(dev, reg_names);
> -	if (ret && ret != -ENODEV) {
> -		if (ret != -EPROBE_DEFER)
> -			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> -		return ret;
> +	/*
> +	 * The power domain associated with the GPU may have already added an
> +	 * OPP table, complete with OPPs, as part of the platform bus
> +	 * initialization. If this is the case, the power domain is in charge of
> +	 * also controlling the performance, with a set_performance callback.
> +	 * Only add a new OPP table from DT if there isn't such a table present
> +	 * already.
> +	 */
> +	table = dev_pm_opp_get_opp_table(dev);
> +	if (IS_ERR_OR_NULL(table)) {
> +		ret = devm_pm_opp_set_regulators(dev, reg_names);
> +		if (ret && ret != -ENODEV) {
> +			if (ret != -EPROBE_DEFER)
> +				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> +			return ret;
> +		}
> +
> +		ret = devm_pm_opp_of_add_table(dev);
> +		if (ret)
> +			return ret;
> +	} else {
> +		dev_pm_opp_put_opp_table(table);
>  	}
>  
> -	ret = devm_pm_opp_of_add_table(dev);
> -	if (ret)
> -		return ret;
> -
>  	spin_lock_init(&pdevfreq->lock);
>  
>  	panthor_devfreq_reset(pdevfreq);
> 


