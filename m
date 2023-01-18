Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B38C38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cb36DGiK3tJG27Cs4Fs0g+zV5Qzr68EAvHoTeY6Mfgk=; b=vRtszEbltmnO/x
	xlJ/JIkhH+MiJtYmIGe/DXAkPcOYZ0MtZRsj+9BpF5EwjD1Y1usCOgRV4/Gl5TvDUWj+fbO8zDJfL
	fqIvwz0jew4L8aMizpxHBQKhVszRXDQgAt6iHeMfDrDbYNhBdE4wYFRIAGzlrbnsedSMSUgLqp4wq
	yDGeLqAyzdpGq5dmYC50f9wF8tzQ1M7Xw68pB8AbtBCrGO+OZWSZk7rc1WfMrHb/oHUyRI6ygZMWv
	i0Lz1jqb5nl3HiPU9s4Xo4g4AggYlVe+cdd6yHNttC67h1qcOGPKWISqKHe6E33Q/3Qk10iC6qeXf
	r8jBjNQ81eYcy0JbMG/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7xN-000zL8-5T; Wed, 18 Jan 2023 12:54:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7x5-000zEf-5m; Wed, 18 Jan 2023 12:54:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D4EE76602DFF;
	Wed, 18 Jan 2023 12:54:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674046441;
	bh=W0maxCKa2xr4pnTX1HqInnogwxcqmMSgRc+NoZCdKOY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P2GIpFG0pdcWYxZdlMkFPN/2kgFVwaVu/WECh/MB7dooeOxYJSI3SVx1TjURSjkWx
	 cYudLUfd27Y7Qc8W81DBRt9wKpZ+4zoDh0jfRjVpYCQCGtMjHnbXO6PFj3dUA/5OoG
	 7XvrrhjKbvXAGvFHmT5NmfZbHsWdBLIO9XioxvzbaIr68WFGnK1pC6FjzDox/Arvzl
	 0kXG3FdVlnqa3RZCci0FnSw/4gNJA7YdUl5V5L0Jr9PCu5igDqZBJ+tLEMkXGZwm7X
	 +Ts+zuQJHrbag4d/u6Bc//5N/NzyFIXeLn+Dlu/PS9xY7AWQ90lMv3Whp4Pa3ZWmhG
	 PL6tC9Z1wmLAw==
Message-ID: <0dc9466d-9baa-451b-98fa-7caf424acd4c@collabora.com>
Date: Wed, 18 Jan 2023 13:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 2/2] thermal: mediatek: add support for MT7986 and
 MT7981
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <cover.1674012985.git.daniel@makrotopia.org>
 <aa957c759b1182aee00cc35178667f849f941b42.1674012985.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <aa957c759b1182aee00cc35178667f849f941b42.1674012985.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_045403_379476_F4DD7D5C 
X-CRM114-Status: GOOD (  19.50  )
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
Cc: John Crispin <john@phrozen.org>, Steven Liu <steven.liu@mediatek.com>, Chad Monroe <chad@monroe.io>, Henry Yen <Henry.Yen@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/01/23 04:55, Daniel Golle ha scritto:
> Add support for V3 generation thermal found in MT7986 and MT7981 SoCs.
> Brings code to assign values from efuse as well as new function to
> convert raw temperature to millidegree celsius, as found in MediaTek's
> SDK sources (but cleaned up and de-duplicated)
> 
> [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/baf36c7eef477aae1f8f2653b6c29e2caf48475b
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   drivers/thermal/mtk_thermal.c | 137 ++++++++++++++++++++++++++++++++--
>   1 file changed, 132 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 992750ee09e62..171f485a809bb 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c

..snip..

>   		.data = (void *)&mt8183_thermal_data,
> @@ -1068,15 +1186,24 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   		goto err_disable_clk_auxadc;
>   	}
>   
> -	if (mt->conf->version == MTK_THERMAL_V2) {
> +	if (mt->conf->version != MTK_THERMAL_V1) {
>   		mtk_thermal_turn_on_buffer(apmixed_base);
>   		mtk_thermal_release_periodic_ts(mt, auxadc_base);
>   	}
>   
> -	if (mt->conf->version == MTK_THERMAL_V1)
> +	switch (mt->conf->version) {
> +	case MTK_THERMAL_V1:
>   		mt->raw_to_mcelsius = raw_to_mcelsius_v1;
> -	else
> +		break;
> +	case MTK_THERMAL_V2:
>   		mt->raw_to_mcelsius = raw_to_mcelsius_v2;
> +		break;
> +	case MTK_THERMAL_V3:
> +		mt->raw_to_mcelsius = raw_to_mcelsius_v3;
> +		break;
> +	default:
> +		break;
> +	}

Either directly use a switch in your commit [1/2] or follow `else if` here.

I would prefer if you changed your first commit to use a switch, but I don't
really have strong opinions, which is why I gave you a Reviewed-by tag on
[1/2].

Your choice - but please don't "change the game" all of a sudden in a commit
whose purpose is to add support for a new version of MTK_THERMAL. :-)

Cheers,
Angelo


