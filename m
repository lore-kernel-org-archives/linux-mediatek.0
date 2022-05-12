Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD955C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FI1/5e4Xl2QJ/mP2WOo5KR2FZl7umzN1ON8tsmE59wU=; b=pFAVLaKxw74SG8
	K5JMbCqbizptTm+fso1W2Rxa6iYw2iLmSfjvUX+Jd+KXhjk9S70aeHFHjxkUgwu3oxhfgRJrmXjVQ
	lKgWm/DzHn2NSZ6H1T00XpoU0XniDCU7t33Ql7XDNi7WOiteKHtLMT3GmD76OQMebWvYoaJHBF25T
	R/6wW8GsXuFimdeBx+BP+b/a/nRCwPJa0SuBdzje+mKpLU//wyVgFcr3FOLAWCut9iYrRVceKeorL
	Fy11tg+W4kzXUnIcUfkCN/Avz6noWKY5klUY2LHzPTfUpklr130FLnjdeyHuyO+lx1Re8q09/ZSuN
	RL6Oop11qI8b8V68FuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np9pF-00COEh-7n; Thu, 12 May 2022 14:29:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np9p2-00CO7u-SF
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 14:29:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso5251454wme.5
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JNALxnAWg/RB4ftyPTFGyO08kdlCOl5dDwY/ypUbBdo=;
 b=vv3IDjm8Tyx7CBSFBAtnXGxyliRf7UhnqgRYzgf8yZBzrff+gM7dOzhTff/Nfs44Po
 ko9AJRVN0rBf+Z+aHHYzLVIm2PABJET1bYeGKywXc8CXI8XhfUhkmpdis9XM2ReXGsfw
 eeTv3J8V7HTSa+whbjvrFmo6iW1ZZrnmxZ5fB/LhGWjej6BgqP9enQF3wDlJV1lJvkmL
 TQLu3TVqJEDp+N0T65d1u//yxKXisewPLxMXl1vZcsfvRz0OeddDn3O8Nr5P7rC41Wmf
 wzbx9tS3lzEcNM2dZqHRbppTnE3Gs9SsjhrP4F6olTHI3yiRZa6f+iYinzSftkvRjJhC
 uwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JNALxnAWg/RB4ftyPTFGyO08kdlCOl5dDwY/ypUbBdo=;
 b=Xnbue6GKrs2bzax7J3NzPnpySBkP/DJMYchjeaVqZ2GDswRGAMs/G3E6ByYJSjPzSE
 5fHMludXFkc9G4baHplrnQE6EEHyhbuMG45QKMi1qA1FMBRgw+96+npqG1RrIHqKRknk
 XRMSKsBW/KHQTDRwTTDKgdOqWYlw+wuNLKJmDtw4QyZuYNpRwJqr5zx9CeTWfohB7lGO
 4P08/jZP5FGY1dVE0AoK7g19AhOuUJTXwo2qCGVkx6d1cr9zjksFx864ImTx1IyapwG6
 OBX3XsShK+TGdn8F43LSLWlpnbJgtX9bbdwvgAd4pl9NqhcnAEzUNLU2J69npsvOPolO
 gtEQ==
X-Gm-Message-State: AOAM531O4blu7o5IOT/2jP/lJLqD9+VlOdw+lAtIYSVA9I+pS5rtNsbw
 Kie9IUzxe2kd210rIb5F0Y7opw==
X-Google-Smtp-Source: ABdhPJyh/dY4n39UQoYMzWrkC/u4Z77eD8JBr2hkW1fTmbgUW+lkY5scWMqpGUpq6ZtfWnA5Xx2cVg==
X-Received: by 2002:a1c:a301:0:b0:392:9bc5:203c with SMTP id
 m1-20020a1ca301000000b003929bc5203cmr66474wme.67.1652365780943; 
 Thu, 12 May 2022 07:29:40 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 i10-20020a5d630a000000b0020c5253d8d4sm4346458wru.32.2022.05.12.07.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 07:29:40 -0700 (PDT)
Message-ID: <21e2b6ba-8053-2a8d-3bd9-a8f4012bd5cb@linaro.org>
Date: Thu, 12 May 2022 16:29:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 3/7] thermal: mediatek: Add LVTS drivers for SoC
 theraml zones
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de
References: <20220512122433.1399802-1-abailon@baylibre.com>
 <20220512122433.1399802-4-abailon@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512122433.1399802-4-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_072944_949064_C91A583F 
X-CRM114-Status: GOOD (  23.65  )
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, amitk@kernel.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, linux-mediatek@lists.infradead.org,
 rui.zhang@intel.com, ben.tseng@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/05/2022 14:24, Alexandre Bailon wrote:
> From: Michael Kao <michael.kao@mediatek.com>
> 
> Add a LVTS (Low voltage thermal sensor) driver to report junction
> temperatures in Mediatek SoC and register the maximum temperature
> of sensors and each sensor as a thermal zone.
> 
> Signed-off-by: Yu-Chia Chang <ethan.chang@mediatek.com>
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>


> +		.domain_index = MT6873_AP_DOMAIN,
> +		.addr_offset = 0x200,
> +		.num_sensor = 2,
> +		.sensor_map = {MT6873_TS6_0, MT6873_TS6_1},
> +		.tc_speed = SET_TC_SPEED_IN_US(118, 118, 118, 118),
> +		.hw_filter = LVTS_FILTER_2_OF_4,
> +		.dominator_sensing_point = SENSING_POINT1,
> +		.hw_reboot_trip_point = 117000,
> +		.irq_bit = BIT(5),
> +	},
> +	[6] = {
> +		.domain_index = MT6873_AP_DOMAIN,
> +		.addr_offset = 0x300,
> +		.num_sensor = 3,
> +		.sensor_map = {MT6873_TS7_0, MT6873_TS7_1, MT6873_TS7_2},
> +		.tc_speed = SET_TC_SPEED_IN_US(118, 118, 118, 118),
> +		.hw_filter = LVTS_FILTER_2_OF_4,
> +		.dominator_sensing_point = SENSING_POINT2,
> +		.hw_reboot_trip_point = 117000,
> +		.irq_bit = BIT(6),
> +	}
> +};
> +
> +static struct lvts_data mt6873_lvts_data = {

Most of your structures should be const.

> +	.num_domain = MT6873_NUM_DOMAIN,
> +	.num_tc = MT6873_NUM_LVTS,
> +	.tc = mt6873_tc_settings,
> +	.num_sensor = MT6873_NUM_TS,
> +	.ops = {
> +		.efuse_to_cal_data = mt6873_efuse_to_cal_data,
> +		.device_enable_and_init = device_enable_and_init_v4,
> +		.device_enable_auto_rck = device_enable_auto_rck_v4,
> +		.device_read_count_rc_n = device_read_count_rc_n_v4,
> +		.set_cal_data = set_calibration_data_v4,
> +		.init_controller = init_controller_v4,
> +	},
> +	.feature_bitmap = FEATURE_DEVICE_AUTO_RCK,
> +	.num_efuse_addr = 22,
> +	.num_efuse_block = 1,
> +	.cal_data = {
> +		.default_golden_temp = 50,
> +		.default_count_r = 35000,
> +		.default_count_rc = 2750,
> +	},
> +	.coeff = {
> +		.a = -250460,
> +		.b = 250460,
> +	},
> +};
> +
> +/*==================================================
> + *==================================================
> + * Support chips
> + *==================================================
> + */

This is not a comment in Linux coding style. Please skip all such
headers. Code should have pointers to const when not modifying...


> +static const struct of_device_id lvts_of_match[] = {
> +	{
> +		.compatible = "mediatek,mt6873-lvts",
> +		.data = (void *)&mt6873_lvts_data,
> +	},
> +	{
> +	},
> +};
> +MODULE_DEVICE_TABLE(of, lvts_of_match);
> +/*==================================================*/
> +static struct platform_driver soc_temp_lvts = {
> +	.probe = lvts_probe,
> +	.remove = lvts_remove,
> +	.suspend = lvts_suspend,
> +	.resume = lvts_resume,
> +	.driver = {
> +		.name = "mtk-soc-temp-lvts",
> +		.of_match_table = lvts_of_match,
> +	},
> +};
> +
> +module_platform_driver(soc_temp_lvts);
> +MODULE_AUTHOR("Yu-Chia Chang <ethan.chang@mediatek.com>");
> +MODULE_AUTHOR("Michael Kao <michael.kao@mediatek.com>");
> +MODULE_DESCRIPTION("Mediatek soc temperature driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/thermal/mediatek/soc_temp_lvts.h b/drivers/thermal/mediatek/soc_temp_lvts.h
> new file mode 100644
> index 000000000000..77c64145aa17
> --- /dev/null
> +++ b/drivers/thermal/mediatek/soc_temp_lvts.h
> @@ -0,0 +1,312 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_SOC_TEMP_LVTS_H__
> +#define __MTK_SOC_TEMP_LVTS_H__
> +
> +/* LVTS HW filter settings
> + * 000: Get one sample
> + * 001: Get 2 samples and average them
> + * 010: Get 4 samples, drop max and min, then average the rest of 2 samples
> + * 011: Get 6 samples, drop max and min, then average the rest of 4 samples
> + * 100: Get 10 samples, drop max and min, then average the rest of 8 samples
> + * 101: Get 18 samples, drop max and min, then average the rest of 16 samples
> + */
> +enum lvts_hw_filter {
> +	LVTS_FILTER_1,
> +	LVTS_FILTER_2,
> +	LVTS_FILTER_2_OF_4,
> +	LVTS_FILTER_4_OF_6,
> +	LVTS_FILTER_8_OF_10,
> +	LVTS_FILTER_16_OF_18
> +};
> +
> +enum lvts_sensing_point {
> +	SENSING_POINT0,
> +	SENSING_POINT1,
> +	SENSING_POINT2,
> +	SENSING_POINT3,
> +	ALL_SENSING_POINTS
> +};
> +
> +/*==================================================
> + * Data structure
> + *==================================================
> + */
> +struct lvts_data;
> +
> +struct speed_settings {
> +	unsigned int period_unit;
> +	unsigned int group_interval_delay;
> +	unsigned int filter_interval_delay;
> +	unsigned int sensor_interval_delay;
> +};
> +
> +struct tc_settings {
> +	unsigned int domain_index;
> +	unsigned int addr_offset;
> +	unsigned int num_sensor;
> +	unsigned int sensor_map[ALL_SENSING_POINTS]; /* In sensor ID */
> +	struct speed_settings tc_speed;
> +	/* HW filter setting

Missing /* in starting line, it's not a network subsystem. Same in other
places.

> +	 * 000: Get one sample
> +	 * 001: Get 2 samples and average them
> +	 * 010: Get 4 samples, drop max and min, then average the rest of 2 samples
> +	 * 011: Get 6 samples, drop max and min, then average the rest of 4 samples
> +	 * 100: Get 10 samples, drop max and min, then average the rest of 8 samples
> +	 * 101: Get 18 samples, drop max and min, then average the rest of 16 samples
> +	 */
> +	unsigned int hw_filter;
> +	/* Dominator_sensing point is used to select a sensing point
> +	 * and reference its temperature to trigger Thermal HW Reboot
> +	 * When it is ALL_SENSING_POINTS, it will select all sensing points
> +	 */
> +	int dominator_sensing_point;
> +	int hw_reboot_trip_point; /* -274000: Disable HW reboot */
> +	unsigned int irq_bit;
> +};
> +
> +struct formula_coeff {
> +	int a;
> +	int b;
> +	unsigned int golden_temp;
> +};
> +
> +struct sensor_cal_data {
> +	int use_fake_efuse;	/* 1: Use fake efuse, 0: Use real efuse */
> +	unsigned int golden_temp;
> +	unsigned int *count_r;
> +	unsigned int *count_rc;
> +	unsigned int *count_rc_now;
> +
> +	unsigned int default_golden_temp;
> +	unsigned int default_count_r;
> +	unsigned int default_count_rc;
> +};
> +
> +struct platform_ops {
> +	void (*efuse_to_cal_data)(struct lvts_data *lvts_data);
> +	void (*device_enable_and_init)(struct lvts_data *lvts_data);
> +	void (*device_enable_auto_rck)(struct lvts_data *lvts_data);
> +	int (*device_read_count_rc_n)(struct lvts_data *lvts_data);
> +	void (*set_cal_data)(struct lvts_data *lvts_data);
> +	void (*init_controller)(struct lvts_data *lvts_data);
> +};
> +
> +struct power_domain {
> +	void __iomem *base;	/* LVTS base addresses */
> +	unsigned int irq_num;	/* LVTS interrupt numbers */
> +	struct reset_control *reset;
> +};
> +
> +struct sensor_data {
> +	void __iomem *base;	/* Sensor base address */
> +	int offset;		/* Sensor offset */
> +};
> +
> +struct lvts_data {
> +	struct device *dev;
> +	struct clk *clk;
> +	unsigned int num_domain;
> +	struct power_domain *domain;
> +
> +	int num_tc;			/* Number of LVTS thermal controllers */
> +	struct tc_settings *tc;
> +	int counting_window_us;		/* LVTS device counting window */
> +
> +	int num_sensor;			/* Number of sensors in this platform */
> +	void __iomem **reg;
> +
> +	struct platform_ops ops;
> +	int feature_bitmap;		/* Show what features are enabled */
> +
> +	unsigned int num_efuse_addr;
> +	unsigned int *efuse;
> +	unsigned int num_efuse_block;	/* Number of contiguous efuse indexes */
> +	struct sensor_cal_data cal_data;
> +	struct formula_coeff coeff;
> +};
> +
> +struct soc_temp_tz {
> +	unsigned int id; /* if id is 0, get max temperature of all sensors */
> +	struct lvts_data *lvts_data;
> +};
> +
> +struct match_entry {
> +	char	chip[32];
> +	struct lvts_data *lvts_data;

Please do not mix up indentation of members. In one place you use it, in
other not. Entire code should be consistent, not a mixup of ten
different coding styles.

> +};


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
