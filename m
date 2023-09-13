Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3131FCA5507
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8g9QnAYxu7jH2oPkHe7B0mZE6PM7b4EkxaojHJvU4kA=; b=O/wSKvtPstljnp
	GpvVDVxROtF1IgOOKAZ96rfIbghl6um4MwZO+CH4S2+g5B1s5J+I5CukD32FajC4Rvms4BsfG47Bc
	dMnnsWaTVtdPYaKx1g7aajmsIzjrZUb9tPvXw4iRUjSbNq4QtaqbBzl40k8oQv5A9wmyUwRMew0Ml
	iawFcXE6CGqQFx63yVTHGW1WwtXv2HgQ73v8MXpeFvyFTLv3EKalHoFT6Bxel5A0x8fwiG0G4eQKo
	KPHWL39MZH9ssKebSOPwXHGoKn6YiRU4bvWiid9/R/ElpodoIT5eDOWqDnobsxbegy+JNRdXfFkqp
	ewdsWCtvDOycN1CCFFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgL3e-0053th-0k;
	Wed, 13 Sep 2023 08:17:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgL3a-0053qj-1I;
	Wed, 13 Sep 2023 08:17:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EA3DD6607328;
	Wed, 13 Sep 2023 09:16:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694593014;
	bh=mU5VTMmj4Bk5zwC02IZiyizGeuYAnQMM+ZrqhTcpD2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bju3Cw55iBAwyWfAl/xdZy4PJepo6+Cje/AxJ8knGzUCWoaMNZzPFiAw5gl8ULUH3
	 1f6TqU9NiqEL06G9YGpC85RC2aA4PFdsvHvfExXRH12jg0P3mSzlWo1DF/xcjcS1HN
	 0/0OiHyeI21EghuCJMQs7w4o7aVUHU1+f73mcm/NQNKNl0tdjxMnF7TMawL/PzYTfv
	 dEJGSjvghHQV5DK8dUIX4hvoMG7soRfDBzmzIih8ZRu3BN/XqYpSJ1p2B+NSsqNra4
	 lm6kjqNHOrkoldvOzFOnqCVDvfoEv7RU4hI7rMFkuwWBx8YHSID/9K456vmSaP5hnS
	 LvWNHiugycxEw==
Message-ID: <8949cbfa-acae-d6ac-e5fb-f238a29630bc@collabora.com>
Date: Wed, 13 Sep 2023 10:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC v1 3/3] thermal/drivers/mediatek/lvts_thermal: add mt7988
 support
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230911183354.11487-1-linux@fw-web.de>
 <20230911183354.11487-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911183354.11487-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_011706_568124_8C4D4617 
X-CRM114-Status: GOOD (  20.74  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 11/09/23 20:33, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add Support for mediatek fologic 880/MT7988.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 73 +++++++++++++++++++++++++
>   1 file changed, 73 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index c1004b4da3b6..48b257a3c80e 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -82,6 +82,8 @@
>   #define LVTS_GOLDEN_TEMP_DEFAULT	50
>   #define LVTS_COEFF_A_MT8195			-250460
>   #define LVTS_COEFF_B_MT8195			250460
> +#define LVTS_COEFF_A_MT7988			-204650
> +#define LVTS_COEFF_B_MT7988			204650
>   
>   #define LVTS_MSR_IMMEDIATE_MODE		0
>   #define LVTS_MSR_FILTERED_MODE		1
> @@ -1272,6 +1274,67 @@ static int lvts_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +/*
> + * LVTS MT7988
> + */
> +#define LVTS_HW_SHUTDOWN_MT7988	117000

Are you sure that this chip's Tj is >117°C ?!

Looks a bit high... if it is exactly 117°C, I would suggest cutting earlier,
either at 110 (safe side) or 115: after all, this is a life-saver feature and
the chip is actually never meant to *constantly* work at 110°C (as it would
degrade fast and say goodbye earlier than "planned").

> +//enum mt7988_lvts_domain { MT7988_AP_DOMAIN, MT7988_NUM_DOMAIN };
> +
> +enum mt7988_lvts_sensor_enum {
> +	MT7988_TS3_0,
> +	MT7988_TS3_1,
> +	MT7988_TS3_2,
> +	MT7988_TS3_3,
> +	MT7988_TS4_0,
> +	MT7988_TS4_1,
> +	MT7988_TS4_2,
> +	MT7988_TS4_3,
> +	MT7988_NUM_TS
> +};

This enumeration should be definitions in bindings (mediatek,lvts-thermal.h).

Besides, the LVTS is about internal temperatures, so those TS3_x and 4_x can
be renamed like what was done for MT8192 and MT8195: this is because you will
never see TS3_2 being CPU2 on a board and CPU4 on another, being those - again -
internal to the SoC, hence unchangeable.

Another reason is that you'll anyway have to refer to those sensors in the
devicetree to configure thermal trips and such, so... :-)

Regards,
Angelo


