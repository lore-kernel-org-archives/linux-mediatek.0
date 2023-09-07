Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6384BEE14D3
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 09:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIoLp5XXQ39mqOEdi2Fut58kJrY8OrFaYs3AYQpM6CQ=; b=Gf5rJRkVsFwZt8
	AsgbjzIN5DliT8lJIBZLZwQVZSj2vNZXbB3qxIcM4jCg6pHlxCESdZk9bCkf52RVpymZaB8sLMNd8
	kt1MGzBeosYNkeODDQRheaCManL/CJbtt+AriDd4edfHt5rKQEU/QI2XU7/xMFVJREJJqaz79wKkm
	mYnydjeEVqtrZrX6rDnTncb20/hTGob1gmK/VEfrwCqFWoNFdOzbzC51FC7oHIH9fXp9/vvjsp5ux
	5N7oSOIFYhc3gUpvnzoSwoLdP/q7272LUnSRcM0rxe0lrjiRWHCT45BdSYQvG/aUSgzQ0qUWyEmlK
	KaFC0uqyisBYnhfjW3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeB44-00BedN-11;
	Thu, 07 Sep 2023 09:12:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeB40-00BebL-1n;
	Thu, 07 Sep 2023 09:12:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6248466072F2;
	Thu,  7 Sep 2023 10:12:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694077952;
	bh=txj28e2rFnpZ/La9QTIPO2i7dPQpL4MVK8cI2Wz9RV4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z6KERubW6Sf7yxuxP8OS2Q8ygMnvH6e/8FLKTuDdX0hX3BxowDU7BeD+FbyysPmCX
	 mducm2u2B8Z5rJqGyXnoZejgKQK9tobFqO1C87HCrDoy87sGlJa0CItY6q+WbkMSLF
	 0QDN8Y8VHKMmX6fvXmfqVwCfKkqsZmgqB25pBGMp72frDopeR3+JHUWz4Pn7c4ToVC
	 bDJWPXk5mEo2chli0T3KFXj31UpsUwLknnBSy3DGtuFqHfHsfniHDSkJahxGUuCZH7
	 Aezx/lcYvT1OOV4BgIRHWto0fhNlHVN3hi7qXJDK6X3JgT/itoXzbj9wLAhNH5OeC0
	 Gw43YRFrU7unQ==
Message-ID: <adc88393-da14-90ff-82c2-b00a9771856c@collabora.com>
Date: Thu, 7 Sep 2023 11:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC] thermal/drivers/mediatek: fix temperature on mt7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230901063730.7577-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230901063730.7577-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_021237_079575_EA3AF399 
X-CRM114-Status: GOOD (  18.19  )
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Daniel Golle <daniel@makrotopia.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 01/09/23 08:37, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Reading thermal sensor on mt7986 devices returns invalid temperature:
> 
> bpi-r3 ~ # cat /sys/class/thermal/thermal_zone0/temp
>   -274000
> 
> Fix this by adding missing members in mtk_thermal_data struct which were
> used in mtk_thermal_turn_on_buffer after commit 33140e668b10.
> 
> Cc: stable@vger.kernel.org
> Fixes: 33140e668b10 ("thermal/drivers/mediatek: Control buffer enablement tweaks")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

If you resend this commit without the RFC tag I can give you a R-b.

This is totally correct, as the buffer control is for version >= THERMAL_V2, and
the others being V1 don't need it - the only one that was left out is effectively
just mt7986 (probably because the commits landed around the same time).

Though, since you have to anyway resend this, I would suggest to change the commit
title to something more effective, like

thermal/drivers/mediatek: Fix control buffer enablement on MT7896

Cheers,
Angelo

> ---
>   drivers/thermal/mediatek/auxadc_thermal.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
> index f59d36de20a0..ed08767eaa60 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -691,6 +691,9 @@ static const struct mtk_thermal_data mt7986_thermal_data = {
>   	.adcpnp = mt7986_adcpnp,
>   	.sensor_mux_values = mt7986_mux_values,
>   	.version = MTK_THERMAL_V3,
> +	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
> +	.apmixed_buffer_ctl_mask = GENMASK(31, 6) | BIT(3),
> +	.apmixed_buffer_ctl_set = BIT(0),
>   };
>   
>   static bool mtk_thermal_temp_is_valid(int temp)



