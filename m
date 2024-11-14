Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE951D65C58
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2024 08:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbnV33FhcFC7/cGoyMMFFLq5a4Zv2Ee9N0Kjjcgq5eo=; b=y4cGCT9f1RzFRNWLQXUaqUkFIr
	+7HxKvnEkL7V3oQjLR7kUcRnHIARq78zDiqUSCxtONy5dN1afGKovZEfdMW43w/c9YUM3U+1UPBuZ
	5K3GzAQMK0dnXGe146I6SLSpCNEI3KCnlAesxuTHxExW/VXfGOoA4mZmiRa8J1ykmMe+Yz/5HHNDh
	3/nHYdebYqpRH/QEq7Hgmm+H7sTcdiCMg465e8bPITI9IjU6ze3vxVh408QeSKmS9X6X6oyiKeEWE
	N/fq8MUOEQLjo0cVksLurJv93z1cSvM6YdFsUoNP4N48TdquaB5Azp9RBnuC4DuYBzc9pOPkS6/+y
	QIwsiiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBV11-00000009BFj-1wsv;
	Thu, 14 Nov 2024 08:15:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUzB-00000009B5V-2tHC
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Nov 2024 08:13:55 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-432d86a3085so3317195e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Nov 2024 00:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731572030; x=1732176830; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hbnV33FhcFC7/cGoyMMFFLq5a4Zv2Ee9N0Kjjcgq5eo=;
        b=J02VUQk+g+naUi0nnswEi1+pfjxUisd/q65lXoQt0oQTUuxXRrzQdPZLhk/b73Xln/
         LeY0Yuf+5J7mQwYI9PgXCrHurldOqTVoD1AyjZ4q78k0a9na+5PhJchmXI/AJisWF2cO
         mmRT6BkcUcQSrf6gL7w7bhcYLf6qmAJO69jO5r3GLoSQlV1wD6ho6ZB8QtUIHUFhgUQV
         ya5u6NOMwZhPMmCY39DDJKUGBbkNuHn9Ez98K0Bi4pFZ9IfeDgpaKU2fyeofWN0nNS9C
         tD2B3AKlku6Fyc4nu1PmiOFF3a8gYVUFh39qcSzc0iUZX4hV+oP37uIW/TTbC2AeTWRY
         KlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731572030; x=1732176830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hbnV33FhcFC7/cGoyMMFFLq5a4Zv2Ee9N0Kjjcgq5eo=;
        b=l15u3PehuwiLJ0Qa9ipaK9evDYURrFp1MLflBAzE3JhSdTeOyscu1bSSXIZzZITnvM
         0WDVK3H3IuvbhFLxOHU5edhYgo9q5YxX9XPB9aKuBea6GeUFZeYJMMun00peHqaRbbMQ
         CuLTFGtx1AlPtrwgKQFmPKt+qyI+jr72zrsmdhT0CLqLHzXOhb9Up0/UnVNqi76eluAz
         dsmXbGbvTgXBA/C+7T5yMQln+dGmcagbWt6fSBuFLTqNdam/fIm8wf6hrCFVgaVn2UdG
         o93w6peVZaaMW/FngM0bgm2iRD9514h97FbJt1y+1LtjAInXe5A3GtT2E08Chs/io9oI
         G5hw==
X-Forwarded-Encrypted: i=1; AJvYcCW7EjMV+g/GTbQqz4eXogNDFlOy9//ktvPItVqqReJOhQ4C3UUB3uB5/9TaSfQ479Rbr/Kt5atgtF27Juwniw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB5Pufs2zT388flDESC4wzYJTuw8trrUmD+ievCQ60iyTg41L/
	dX/mmLbDf0bmB5aPgi88MAXXroXmnjEGRh9CkvMd5M+Bdb/8otLWyy9ihMpzlWY=
X-Google-Smtp-Source: AGHT+IFFoxrNuaonAlRHjVX4wkH6xAAN6jsZ9Y/Av/d6Vo1BPZjRFjen1gyTOIm6baYSxW8QIjmFGQ==
X-Received: by 2002:a5d:5f46:0:b0:382:d79:842c with SMTP id ffacd0b85a97d-38218502c87mr829097f8f.13.1731572030308;
        Thu, 14 Nov 2024 00:13:50 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3821ada3e7bsm788452f8f.7.2024.11.14.00.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 00:13:49 -0800 (PST)
Message-ID: <02bbfb8c-817c-447a-92b9-bd03d76b66b1@linaro.org>
Date: Thu, 14 Nov 2024 09:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Switch to
 IMMEDIATE_MODE
To: Hsin-Te Yuan <yuanhsinte@chromium.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241108-lvts-v1-1-eee339c6ca20@chromium.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241108-lvts-v1-1-eee339c6ca20@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_001353_802319_5F2D5423 
X-CRM114-Status: GOOD (  13.73  )
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

On 08/11/2024 07:46, Hsin-Te Yuan wrote:
> Currently, MT8192 cannot suspend with FILTERED_MODE. Switch to
> IMMEDIATE_MODE will fix this.

Given the comments and the different changes related to the filtered and 
immediate modes, I won't apply the patch until this is clearly sorted out.

> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 1997e91bb3be94a3059db619238aa5787edc7675..daad52f14fc03d0c4131f2ffdf3eb6b49a4a43d0 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -1541,7 +1541,6 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] = {
>   		},
>   		VALID_SENSOR_MAP(1, 1, 0, 0),
>   		.offset = 0x0,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>   	},
>   	{
>   		.lvts_sensor = {
> @@ -1552,7 +1551,6 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] = {
>   		},
>   		VALID_SENSOR_MAP(1, 1, 0, 0),
>   		.offset = 0x100,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>   	},
>   	{
>   		.lvts_sensor = {
> @@ -1567,7 +1565,6 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] = {
>   		},
>   		VALID_SENSOR_MAP(1, 1, 1, 1),
>   		.offset = 0x200,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>   	}
>   };
>   
> 
> ---
> base-commit: 906bd684e4b1e517dd424a354744c5b0aebef8af
> change-id: 20241108-lvts-f7beb36efc59
> 
> Best regards,


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

