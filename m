Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0053AC64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 20:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwUDGKoPgiuo5lALlHpfmsp5MEL6Xw8SNKbG9NQwr4c=; b=VAF23lzfkuVsp4p3P2ylKElxht
	MT5yWlOnGs2mQbyD1gAjCqFMWvhMfl+5d53luqpQIJCHlrPhMtFuZuufAyf+SfOXcaNYJQn3ZJiN4
	YXke5cGLTdWnrbR9E1VB8sqEFA4ielhecy+AqkOsbbYMuRPKI1tM5G9k5msbYNn4V8NIFCy5GYaeo
	C0f4SwblOtjF12geaZ9Fvm7YdB4JBnPK2HhhEk5FRQNJkC7oo+Xopnh0oGBnj9StghUKiBBA4vQXS
	2cc24LKE8gcBwTEECpQopDF3JAI5RNGsG04dFbGbpiMQ8K4mfpyfXmISqzWkVosRDvNdrKihjjCK4
	cVhHvBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUvHl-00DvQZ-Ik; Wed, 22 Feb 2023 20:00:17 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUvHj-00DvLj-0f
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 20:00:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id c12so8905516wrw.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Feb 2023 12:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwUDGKoPgiuo5lALlHpfmsp5MEL6Xw8SNKbG9NQwr4c=;
        b=zOmfsgm2oMNxKfdD6mf2QSJdaBYIpimqxO7NODPiEeUMgGgv085WJYS348gnwWhHVO
         yYI52yy56Eq4bZm7M9Dq6It/xcvCrr95hSlJWHgc4C7/4ZtBgT/XDwLJ6HXOVIZrWcB7
         ISd9tRZsD5wNPj0n5+30x2gOEO7R9QANEoKYXKhb2AAV96d3fJxhz/5nXWTx48TtvUxW
         MD+mBPJXf1CtL823mD5BEqqyHe5IOQlTdjkQf7KUjC22OEr3GeUGrpHv9kpJEZjJQchf
         WH6BW4wdOQzomqelOeqIqkFJhKSFekix9WkDi8JaSMBOwd4FoxXg02RfgCjKK9dp+UCG
         lpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UwUDGKoPgiuo5lALlHpfmsp5MEL6Xw8SNKbG9NQwr4c=;
        b=TqC2kk6NPmircgvAfq6ECXcyc5WVM+7SWavFjLQoGrnXdchhg+1e3Id53ResS6egfx
         kEz2zu39OZSpJ+IkytnqTNBjDR7UVQKs41k09LPO3ZWe94Bb2loL8cLKP7OVER8Nm3MJ
         bv6JXkWytj5YBTy3fc7c2RD0oeq+4BVNy1iGcX7DO+cG41tfAfeJjLmL3/msKC7/9kWV
         VnG8P3XE/M4YNZY2MLSeQsvhSMfMNlUaVcy7jVdBjeNvz72dKEU9/Nna8qq0wEYNhLF3
         SXRtfIzqYg1GVfwFk0VSl7LAa/i5ibJLX8HYm4A3lhm25MQ5pVzWM6f6eyAQqPP+6S61
         vwnQ==
X-Gm-Message-State: AO0yUKWbhrYNXCVsKFtmh5iRmUdal7A17fE2KPtqMYd07bfZ2b5YggLv
	JX4dVLxa54GGvvMOu09YZAacMQ==
X-Google-Smtp-Source: AK7set8QV+TEp7mcc79CNUS9FSeQrKu89ZriCplsTFQ+8TXFTLjX8xXl7kACrCDQdWkkGS8vanVjIQ==
X-Received: by 2002:adf:f208:0:b0:2c5:4b22:bce9 with SMTP id p8-20020adff208000000b002c54b22bce9mr9293747wro.47.1677096008681;
        Wed, 22 Feb 2023 12:00:08 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:be67:8d59:7eae:a15d? ([2a05:6e02:1041:c10:be67:8d59:7eae:a15d])
        by smtp.googlemail.com with ESMTPSA id j7-20020a05600c42c700b003db012d49b7sm3227982wme.2.2023.02.22.12.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 12:00:07 -0800 (PST)
Message-ID: <0889767f-d187-0cb4-895e-c149517b6636@linaro.org>
Date: Wed, 22 Feb 2023 21:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 06/16] thermal: Don't use 'device' internal thermal
 zone structure field
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Balsam CHIHI <bchihi@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ido Schimmel <idosch@nvidia.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
 <20230221180710.2781027-7-daniel.lezcano@linaro.org>
 <CAJZ5v0gTmi7ZeDDdHWGWju4m3bv2366oVqSP1dGOT+3jLV-jaw@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAJZ5v0gTmi7ZeDDdHWGWju4m3bv2366oVqSP1dGOT+3jLV-jaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_120015_124566_DF781E15 
X-CRM114-Status: GOOD (  17.02  )
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

On 22/02/2023 20:43, Rafael J. Wysocki wrote:
> On Tue, Feb 21, 2023 at 7:07 PM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>>
>> Some drivers are directly using the thermal zone's 'device' structure
>> field.
>>
>> Use the driver device pointer instead of the thermal zone device when
>> it is available.
>>
>> Remove the traces when they are duplicate with the traces in the core
>> code.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Reviewed-by: Balsam CHIHI <bchihi@baylibre.com> #Mediatek LVTS
>> ---

[ ... ]

>>          thermal_zone_device_update(data->ti_thermal, THERMAL_EVENT_UNSPECIFIED);
>>
>> -       dev_dbg(&data->ti_thermal->device, "updated thermal zone %s\n",
>> +       dev_dbg(data->bgp->dev, "updated thermal zone %s\n",
>>                  data->ti_thermal->type);
> 
> The code before the change is more consistent, because it refers to
> the same object in both instances.
> 
> It looks like a type field accessor is needed, eg. thermal_zone_device_type()?
> 
> Or move the debug message to thermal_zone_device_update()?

Actually it is done on purpose because the patch 9 replaces the accesses 
to 'type' by 'id', the thermal_zone_device_type() accessor won't be needed.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


