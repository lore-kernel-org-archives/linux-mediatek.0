Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C453AEE57E1
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPDESv49pcfgvvRs+av7qi+myt8HGgnBUBdeMrU3aMk=; b=I79q6SLsDEDRHeo0jjbfEiMwa5
	fY5e9tubgU9ZiYUNRTOinv2JqQFoYb5rUloOPjBaCx6sAvq4MKCwNu29p4YRY/CrC5FhyRBE4Pffb
	GQizSEwGKfiJLSO1u4fu7Hj7usbYRAJ2FfcHqnc+X52hGtF4R3tac2wJSKs2Z5ewddkUUtxXF1qQl
	j38xhNih5/YTetoFO3al75Ma/S8kXj2ilAJxOeH2eSvZXDWLoRKQLE7fHFc7UP7XSCOc9Uc4cZvbc
	kC7DVVK47dAbH3I6vYzbvIT2W6SXusGR//88lXSg8gQa6/sqMNopVjVxlYMYy0RpaT+qyQJWbXb8z
	8gzKZjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeWJ1-00DGo2-2C;
	Fri, 08 Sep 2023 07:53:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeWIx-00DGmZ-1x;
	Fri, 08 Sep 2023 07:53:28 +0000
Received: from [192.168.1.23] (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DEF3566072A2;
	Fri,  8 Sep 2023 08:53:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694159603;
	bh=1Be9Ga17gksJsOil0d5EZoQWNEzJGykPqruhkf331P8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AZ8K5q+HuIaaU6/G04eKJSX0xrkxKxQB3FT9sj7Ftu3/eZFbcjcUuN0wZDB1Uru/+
	 SRRAaZZY9CpqexRRTVJwqqy2gLir7pE2gZVNT1DV4X/m0nKY7UEX8kzAk1oZgSXQdL
	 Lmq3zfkiEKO5O28VvgFGJu7mu2A9LXIHs4XR/1wUMTNnQo25S7RIs7xdl152ZM7Lwk
	 lZi/4cDySYL16Pemg1Mc/OnqIxALgeq5SLlrMVZt/Gj/AY3Xl27NJXEHwaFZnjvpyL
	 DFbNN+wBQgmXV+uLAfoCeQfeyyzzPlysSiOmAuLvMu3+DuB7yAYXGyUnQUfJlUSQrX
	 Oj81GmCXY/TKg==
Message-ID: <ff99380a-cb0d-dc6c-0442-7aa60d14cec2@collabora.com>
Date: Fri, 8 Sep 2023 13:23:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/6] drm: ci: Enable configs to fix mt8173 boot hang issue
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>
Cc: helen.koike@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
 daniels@collabora.com, emma@anholt.net, robclark@freedesktop.org,
 gustavo.padovan@collabora.com, robdclark@google.com, anholt@google.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, corbet@lwn.net,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, heiko@sntech.de,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
 <20230825122435.316272-5-vignesh.raman@collabora.com>
 <6da8136b-be1f-6867-b2af-c636877ef189@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <6da8136b-be1f-6867-b2af-c636877ef189@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_005327_802487_4598ED9A 
X-CRM114-Status: GOOD (  11.63  )
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

Hi Angelo,

On 07/09/23 16:16, AngeloGioacchino Del Regno wrote:
> Il 25/08/23 14:24, Vignesh Raman ha scritto:
>> Enable regulator
>> Enable MT6397 RTC driver
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>   drivers/gpu/drm/ci/arm64.config | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ci/arm64.config 
>> b/drivers/gpu/drm/ci/arm64.config
>> index 817e18ddfd4f..ea7a6cceff40 100644
>> --- a/drivers/gpu/drm/ci/arm64.config
>> +++ b/drivers/gpu/drm/ci/arm64.config
>> @@ -184,6 +184,8 @@ CONFIG_HW_RANDOM_MTK=y
>>   CONFIG_MTK_DEVAPC=y
>>   CONFIG_PWM_MTK_DISP=y
>>   CONFIG_MTK_CMDQ=y
>> +CONFIG_REGULATOR_DA9211=y
>> +CONFIG_RTC_DRV_MT6397=y
> 
> I wonder if it'd be a better idea to simply add those to the defconfig 
> instead as
> 
> CONFIG_REGULATOR_DA9211=m
> CONFIG_RTC_DRV_MT6397=m
> 
> Any opinion on this? Matthias? Anyone else?

CONFIG_RTC_DRV_MT6397=m is already present in defconfig.
We can also add CONFIG_REGULATOR_DA9211=m to defconfig.

Regards,
Vignesh

