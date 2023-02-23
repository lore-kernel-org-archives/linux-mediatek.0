Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D76C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 22:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cikNiAl3CsaUVzCtk0AInA3PwE1/TMQnMlzjF1gGdG0=; b=vt2RptoXCaqQt3T2o3iF+/he82
	1DinQ8bYW5R8h7FxpJrsiIWXIBnBW1H9hh2ZuGadU3sXTamCfMveQfeFPCPzRp5vVuXwqKeKIvy26
	fFeV78OWUmasV5+JoZXvflCrTy3tU02Lwsn91CXCkSDJosGkwYCqL/eZjK3TcUKJT1kq30bLXin9m
	akOaDNZPeGL1uXZO0XMbqCo1NXwBmwWD02/9Sl4KX9MK2Dul5yUuC3i9P1NcXT7tct0bhlp5mDMq4
	aKnlRYlUkjm61+UA0pW4tCfSmi3t1DgOkZpGT+0tGySoqIo+6aVquMbU7BjfwhwnFZzozIYOIKOlq
	JL41Qelg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKWQ-000YDu-Jz; Thu, 23 Feb 2023 22:57:06 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKWL-000YAd-PD
	for linux-mediatek@lists.infradead.org; Thu, 23 Feb 2023 22:57:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id p16so8005037wmq.5
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Feb 2023 14:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cikNiAl3CsaUVzCtk0AInA3PwE1/TMQnMlzjF1gGdG0=;
        b=DRN7VfySjUL0rYZq24bKTqYo1a7eMqo07ygSwMFUqHzuTKP65b9sTMEH8VZt0hxwu1
         dmHGRYaPf3ggH9KZmEyIo+flPWm4zpT9CAN4fb3bb2UwUttx3rmo4vx8zo6F2tPiEUOK
         kQWqn6QOgf2ZhhgOZ653j1GAMDb6AMca6ljq3tiMi06NSCiMzWp0EPnd6Uvs6JK9LOIe
         r43kHvJdLLA9VFyPJO6M+KZDTGdMEFaMKztCR+nTATohFgvC9r80+cCMQ12KHZsj+SUY
         jwwZvlnmtS9kLRvR3sEhulVIN5kRwRQDmQ/AX297OlmgtRWEUsWG1kh7J/OLhfLYqjHy
         599w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cikNiAl3CsaUVzCtk0AInA3PwE1/TMQnMlzjF1gGdG0=;
        b=0Yiyjx1VG4N8RobcbOUsyfS3VLB1COO9nR2blFkKmbEMLudljHsG7+ASxdH/IrH5vF
         hQhh6jAzrsa/U6GERRpFpkBodJCdQZHSpzSjFnE6wIiVYvzyYmMJECI2UzQ/J+Znra4H
         bp8thjgRbPn9LbuNZBcE6tZWUb5tWyZe954d2XCyXxctqcTpyq8jQoesu7QBjxiH/sgR
         RSdUt9iuS6luCY/ylUrWYEXrASsBRAsbXrcvbkdc+CvcUYzGbNg5PeSuZ4tUn87OJCmI
         ht0GWihcnLirCcyUp2uTgWBFKbSkVcbPreHiFVy9pKDO/+AMcz/mwL7zeabNNXr1lFA+
         BudA==
X-Gm-Message-State: AO0yUKWtMZdxnJB3CA5CIHP66X2U82Gv2OFCVEA2iSi0mvqlC3a8Zpd5
	+nbiz6VcV6sZzuc0yNR2l96hLw==
X-Google-Smtp-Source: AK7set9Z52yxWv52zRMDow6DF+DTZQX7KbVMepo+DRQCwOeMkXAXaJBNJ2zYwaSnuLVGEj/k1hBdjw==
X-Received: by 2002:a05:600c:a695:b0:3e2:2f9:b8e2 with SMTP id ip21-20020a05600ca69500b003e202f9b8e2mr10908094wmb.35.1677193009641;
        Thu, 23 Feb 2023 14:56:49 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:3e6f:e90a:1fc9:3708? ([2a05:6e02:1041:c10:3e6f:e90a:1fc9:3708])
        by smtp.googlemail.com with ESMTPSA id d21-20020a1c7315000000b003b47b80cec3sm662936wmb.42.2023.02.23.14.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 14:56:49 -0800 (PST)
Message-ID: <37b3b835-e992-0090-56e5-bd4d58e547a7@linaro.org>
Date: Thu, 23 Feb 2023 23:56:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/17] Self-encapsulate the thermal zone device
 structure
Content-Language: en-US
To: rafael@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
 Gregory Greenman <gregory.greenman@intel.com>, Kalle Valo
 <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Amit Kucheria <amitk@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Vasily Khoruzhick
 <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Zheng Yongjun <zhengyongjun3@huawei.com>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Daniel Golle <daniel@makrotopia.org>, Balsam CHIHI <bchihi@baylibre.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-acpi@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230223224844.3491251-1-daniel.lezcano@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230223224844.3491251-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_145701_836484_14E5A31E 
X-CRM114-Status: GOOD (  24.62  )
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

On 23/02/2023 23:48, Daniel Lezcano wrote:
> The exported thermal headers expose the thermal core structure while those
> should be private to the framework. The initial idea was the thermal sensor
> drivers use the thermal zone device structure pointer to pass it around from
> the ops to the thermal framework API like a handler.
> 
> Unfortunately, different drivers are using and abusing the internals of this
> structure to hook the associated struct device, read the internals values, take
> the lock, etc ...
> 
> rn order to fix this situation, let's encapsulate the structure leaking the
> more in the different drivers: the thermal_zone_device structure.
> 
> This series revisit the existing drivers using the thermal zone private
> structure internals to change the access to something else. For instance, the
> get_temp() ops is using the tz->dev to write a debug trace. Despite the trace
> is not helpful, we can check the return value for the get_temp() ops in the
> call site and show the message in this place.
> 
> With this set of changes, the thermal_zone_device is almost self-encapsulated.
> As usual, the acpi driver needs a more complex changes, so that will come in a
> separate series along with the structure moved the private core headers.
> 
> Changelog:
> 	- V3:
> 	   - Collected more tags
> 	   - Added missing changes for ->devdata in some drivers
> 	   - Added a 'type' accessor
> 	   - Replaced the 'type' to 'id' changes by the 'type' accessor
> 	   - Used the 'type' accessor in the drivers
> 	- V2:
> 	   - Collected tags
> 	   - Added missing changes for ->devdata for the tsens driver
> 	   - Renamed thermal_zone_device_get_data() to thermal_zone_priv()
> 	   - Added stubs when CONFIG_THERMAL is not set
> 	   - Dropped hwmon change where we remove the tz->lock usage
> 
> Thank you all for your comments

The series has been blocked by gsmtp because the next patch has too many 
Cc. I'll sort out this and resend.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


