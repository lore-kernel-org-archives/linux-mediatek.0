Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C6FCFD345
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Nov 2025 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tT3hJS80cNjtdeK1a1hTCAW6GUTi3Z7+AdwEEe81LCI=; b=eVyZaPVXF2bc/1
	vcrjExUICEhzWLct8i+lOfnqQuC+A1rKUGU8dfIoVUszZTA65Lmnbm2iVCzRrmW1ONzYu4JRFBdBN
	NaKhnaeCMHTaS7PeTtuf3xy93jTccV1hFAjrMYmc80FKKZrEK8lc1Z5HEGWW6kg6ermtsyILE/iU+
	JuiFOwW7LnGzvruoS9F0YG1epujxC2R4k9HOlmP9cVd2piO05bh9u4bPN/pz+nGA6RSYtARLiq+Rx
	cN5+KuY0jElnO/aSTOQlWTJ0bklo1btqnrO2O82KF44Mjyawg5nU6eDfUkiws4fn6oaZyOpPmSWq+
	q7g1laY7CwoBfp7qbbbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbFZ-0000000CB0e-34ZI;
	Mon, 24 Nov 2025 18:25:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbFW-0000000CAzf-3AHY
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Nov 2025 18:25:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso50160385e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Nov 2025 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764008717; x=1764613517; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tT3hJS80cNjtdeK1a1hTCAW6GUTi3Z7+AdwEEe81LCI=;
        b=iL+j+91D/uno1IU/VD6uUb90j8JbPmw1QiYEmTpZFJ2b4zONTK4sRnQ/uk56RU4B4a
         d/ZkdtGWWSTys6UGwu/SQKurOu4ZenSHK2dTGM30NRPBaSAgdLUpTD51xsLmS+Yw+xKI
         mVqobcEZTdtQnVGJh46o/eOA9CY+sOc1/5/Fz29AW1ztTqrSrO1UTjnn1DyycFw8U+d6
         d0+oojkNOFfTZc0dOuB4ejvTHhQdd1ZK6S28vNzS4KLXmwAuxnB3jtnQIH3DmgLs/cDc
         zJ1VI5STas73axofiv78QIngwkEJNYHZgRWzGgNIvNrHR/sYJ6q16fkq/5qnY5jK5Fqe
         zSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764008717; x=1764613517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tT3hJS80cNjtdeK1a1hTCAW6GUTi3Z7+AdwEEe81LCI=;
        b=A735ebb5Z+/zfUDzwrP/4IcWPlddyfAlp0t6KP/+e2E4Ph6N5ySW1sr4GsHu9yIX07
         BMKfbtNH2n52VmHMdVM3bhBCuxV19F5zvFrIwb5q0WR9enfQH+4HsBUrGVhS8UU2q5Rj
         D/qQGHDl6wv1riUpBz5nVSWPtz900uPoyQZNFT8F6oMNAnlzh4xSFfl8mLmotwmuR5Qs
         KmXhZ0dZLi+JUwsWZwmojakVdjWmKeDorV6XPefU2L5tFyAnJXhhqf930B9yJRPgLdVi
         VVHia8SLouQxRd35F3fPTesOggHv3rwIwcskc9r2iYh9GN3MDws5udjwEMnLFQIZmbcU
         12Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVoQ5P1pL15m7JM7JPsSqCZ8mI31/ojqcJqL5O1vc2f+cHuV6gGu/akFfhiEA8U+kqJus6efiH2/iXFZx5hkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQUakZaEApn+fib2456CURNtYB0+IxuBoSQqxaWjG3jrUeil6j
	CKUJwEmH9CJrk5FoUqd+WMpOy/6REGPWGST4zfpz9CmB7DVLciOuXG5rPdHt4lCHTKQ=
X-Gm-Gg: ASbGncvGITl9Fha8+33RUl80/4/uhDkAZZDfQ68FZXMt2vCbXBCaGllgbdtpk3JY1rg
	JB+azF10VbdUE7y4RRNuY5xymzC/efJHS9WsBI0RSBmX2PhJ85EgPjtvo6bigMnKV1znKDZoimk
	DU1z641tXjII0Wq/obyirn016+JIULFqb2mzAtA+H1s6M0UdmkJuWXf4nwXrR5oRQcl4NSej+ej
	t8saicMGLsIhhqZmALW51RoQ+D5RI8GXE32RmsmMosNLN4AOJWxKI1fr18j58di16pYVVNi3oBy
	RG2xksCWLaRSPkD0Hd2UK+UilElp6Q6YaOrZcBY/Q6XoCRTlSJDNTEjhLBbhGfjDag8MEW52o9+
	ZjXd5jsW/4xdVfPQTUyU/fWrYc530QSuyOM3m2olz1yJ2fyvj+rMdqofq1WSc7SBAJuA+F2kkZc
	eOWZaTGFot6htdk6bVi63TxBJXym5zz1AWIoFSHfBJD5yAuE2cs5y7fYrH+SOB47yKdQ==
X-Google-Smtp-Source: AGHT+IEp/+xfgqCCD0AdpFxMvmOtmfqswl3tOTSPHA1XXl6DHcUQiOYz7lT/1lNZ+sQorO1fAsI5XQ==
X-Received: by 2002:a05:600c:4ec7:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-477c1138445mr126058885e9.35.1764008716859;
        Mon, 24 Nov 2025 10:25:16 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:a756:bb6c:7b35:af9b? ([2a05:6e02:1041:c10:a756:bb6c:7b35:af9b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf1f365fsm209857255e9.8.2025.11.24.10.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 10:25:15 -0800 (PST)
Message-ID: <24a5bd31-a79f-4f18-a190-6a4d886a29b2@linaro.org>
Date: Mon, 24 Nov 2025 19:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] thermal/drivers/mediatek/lvts: Make number of
 calibration offsets configurable
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
References: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
 <20251121-mt8196-lvts-v4-v4-2-357f955a3176@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251121-mt8196-lvts-v4-v4-2-357f955a3176@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_102518_855984_5D760E44 
X-CRM114-Status: GOOD (  19.84  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, nfraprado@collabora.com, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/21/25 12:16, Laura Nao wrote:
> MT8196/MT6991 use 2-byte eFuse calibration data, whereas other SoCs
> supported by the driver rely on 3 bytes. Make the number of calibration
> bytes per sensor configurable, enabling support for SoCs with varying
> calibration formats.
> 
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index ab55b20cda47..1c54d0b75b1a 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -96,12 +96,14 @@
>   
>   #define LVTS_MINIMUM_THRESHOLD		20000
>   
> +#define LVTS_MAX_CAL_OFFSETS		3

I suggest LVTS_NUM_CAL_OFFSETS then below,

> +
>   static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
>   static int golden_temp_offset;
>   
>   struct lvts_sensor_data {
>   	int dt_id;
> -	u8 cal_offsets[3];
> +	u8 cal_offsets[LVTS_MAX_CAL_OFFSETS];
>   };
>   
>   struct lvts_ctrl_data {
> @@ -127,6 +129,7 @@ struct lvts_data {
>   	const struct lvts_ctrl_data *lvts_ctrl;
>   	const u32 *conn_cmd;
>   	const u32 *init_cmd;
> +	int num_cal_offsets;
>   	int num_lvts_ctrl;
>   	int num_conn_cmd;
>   	int num_init_cmd;
> @@ -711,7 +714,7 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
>   					u8 *efuse_calibration,
>   					size_t calib_len)
>   {
> -	int i;
> +	int i, j;
>   	u32 gt;
>   
>   	/* A zero value for gt means that device has invalid efuse data */
> @@ -720,17 +723,18 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
>   	lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
>   		const struct lvts_sensor_data *sensor =
>   					&lvts_ctrl_data->lvts_sensor[i];
> +		u32 calib = 0;
>   
> -		if (sensor->cal_offsets[0] >= calib_len ||
> -		    sensor->cal_offsets[1] >= calib_len ||
> -		    sensor->cal_offsets[2] >= calib_len)
> -			return -EINVAL;
> +		for (j = 0; j < lvts_ctrl->lvts_data->num_cal_offsets; j++) {
> +			u8 offset = sensor->cal_offsets[j];
> +
> +			if (offset >= calib_len)
> +				return -EINVAL;
> +			calib |= efuse_calibration[offset] << (8 * j);

May be worth for a comment here, ideally a separate function to clarify 
the code

> +		}
>   
>   		if (gt) {
> -			lvts_ctrl->calibration[i] =
> -				(efuse_calibration[sensor->cal_offsets[0]] << 0) +
> -				(efuse_calibration[sensor->cal_offsets[1]] << 8) +
> -				(efuse_calibration[sensor->cal_offsets[2]] << 16);
> +			lvts_ctrl->calibration[i] = calib;
>   		} else if (lvts_ctrl->lvts_data->def_calibration) {
>   			lvts_ctrl->calibration[i] = lvts_ctrl->lvts_data->def_calibration;
>   		} else {
> @@ -1763,6 +1767,7 @@ static const struct lvts_data mt7988_lvts_ap_data = {
>   	.temp_factor	= LVTS_COEFF_A_MT7988,
>   	.temp_offset	= LVTS_COEFF_B_MT7988,
>   	.gt_calib_bit_offset = 24,
> +	.num_cal_offsets = 3,

LVTS_NUM_CAL_OFFSETS


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

