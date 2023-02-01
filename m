Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC19C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 17:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3v4lvgMJrNqsvAO9VMzJDJpTxWMbyB0Tj1uMZ3edH4=; b=0aTSoqCJlZ6+pMHEemjkfFtxqH
	t2gyGqMFXr6QdCQomvFUqHiZzQ6oMKzjphmk1CbAb/0lMdVw71sF/MH2ET64CgK93UiXyFtb/iM/N
	EXjcnQf+SbpkS5j8OXVhjsBF1H2/uLVXFHL9x8c27kk/tGFAhtDip4p7aVs14J/hO+LoqEqM54yU5
	LiCjo5YXcm3kgbZOQcvz7G/fhf9Dir+8fUtUlG+gY+Fntzik8VjooDBGRW9Q0zH+7fwX+Xqwl/3IX
	v48WYuFt5uKczgmg7ww7SgG3VJJd88SZn+SFPSaCdNKpiZM2vY6gQnXAAydNrh/YF4VEkb79iq90+
	zLipdbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGfV-00Cz75-Fs; Wed, 01 Feb 2023 17:13:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGfI-00Cz24-LT
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 17:13:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id h12so17966985wrv.10
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 09:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3v4lvgMJrNqsvAO9VMzJDJpTxWMbyB0Tj1uMZ3edH4=;
        b=jveV7rE6VkRhavv5UZTPo6oGPvccJ5HfKD92qZWtbyJpxrqdRXX9MEY8T+XIZatBEa
         Tvl8zhkPJuwdAzyExpZ1cDy7KuOnLUtg/lpOWt67jjBZfpR0tkSCpx+oLyOoIgKywKpN
         GAb/zREN8Hav3nJAwOTimNAaI3a8s8/9nK0GEUa1pCQbt5uMIskVilVCQJSN887YJ5uJ
         NqzTzPqmL8LAG5DtlM7klEOyEptCnKFM2/0V3Z3wfM/9t2l4B+3jE+Ofu3hiiDgDSdmk
         KP3Q4GrbaVgEhXnR5yp9KWXgKP5fbGBk19wrb6VLPH0UCvB7A6j0nCXTFrisjv/rWDDu
         cOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3v4lvgMJrNqsvAO9VMzJDJpTxWMbyB0Tj1uMZ3edH4=;
        b=qXMvo2sh+4mOzV4e8v1d8SHUzOjLu0qNzIt/eV/H0B92dAerZQie3eEWoevwUQt4uD
         L4brUTIuJBIOqfSiFkZDj1/hSITfOU1rsC8tKlppiX+3S+Ss/EuiK+Gaw8wovLxTp9eU
         XSzqLsLbE5dr0vmgshi8JzvzgPwrr/JY7zwzaS9e4FimfRx2qqWrnjJo/r4DTfAneST5
         omah3zZ7YvCETBJXUqiXkE2jJZ+nK56qwsUttL0FlgoTJ9FKEISXoTaIBE1MQiA99gEN
         p3kxnfhoFgxHIlzl3WGEtqad/trViKlIzNS6sKhH9mvciqWuqNF1p+J6P0wVfOMSXHUj
         I0/w==
X-Gm-Message-State: AO0yUKX+k1IYy4s2vCj2UuZgeghemv+dseXJwEuZEdhEVRkl6WvWYUdZ
	hdn3M8s7Ecx98Ch3KUOc6ZKkLw==
X-Google-Smtp-Source: AK7set9vFVx2h/65GJtKCAcoqYhL2uenVpmVGmEzti3KxJGPZTdKkO9JVCu2AFbygJ/RAySdrArmIw==
X-Received: by 2002:a05:6000:a04:b0:2c3:bc42:2ff9 with SMTP id co4-20020a0560000a0400b002c3bc422ff9mr1145931wrb.25.1675271574640;
        Wed, 01 Feb 2023 09:12:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m2-20020a056000180200b002bfb5618ee7sm17827215wrh.91.2023.02.01.09.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 09:12:53 -0800 (PST)
Message-ID: <8662c6bd-b32d-3d3d-b3b7-7f4aeb028309@linaro.org>
Date: Wed, 1 Feb 2023 18:12:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage
 Thermal Sensor driver
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
References: <20230124131717.128660-5-bchihi@baylibre.com>
 <20230131153816.21709-1-bchihi@baylibre.com>
 <ab1e4822-d5f4-79f6-ea38-47e2342ebe49@linaro.org>
 <CAGuA+oqLiCxb1g7pwf+RwUTWHV37pXdAWUXHV51TnUy1-xUOXQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGuA+oqLiCxb1g7pwf+RwUTWHV37pXdAWUXHV51TnUy1-xUOXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_091256_727597_6A8AFF06 
X-CRM114-Status: GOOD (  19.64  )
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

On 01/02/2023 17:46, Balsam CHIHI wrote:
>>> +#ifdef CONFIG_MTK_LVTS_THERMAL_DEBUGFS
>>> +
>>> +static struct dentry *root;
>>
>> How do you handle two instances of driver?
> 
> This root node is the topmost directory for debugfs called 'lvts', the
> different driver instances are below this. It is a singleton.

Indeed. What about removal? Aren't you remobing entire directory
structure on first device removal?

(...)

>>> +
>>> +     of_property_for_each_string(np, "nvmem-cell-names", prop, cell_name) {
>>> +             size_t len;
>>> +             u8 *efuse;
>>> +
>>> +             cell = of_nvmem_cell_get(np, cell_name);
>>> +             if (IS_ERR(cell)) {
>>> +                     dev_dbg(dev, "Failed to get cell '%s'\n", cell_name);
>>
>> Is this an error? If so, why debug? dbg is not for errors.
> 
> AFAIK using dev_dbg does not increase ELF size when DEBUG is disabled.
> If this is not a good reason for you, then I will change it to dev_err.

But also dev_dbg are not visible in error or warn level logs. If this is
not an error, then indeed dev_dbg could be fine. But errors should be
verbose.

> 
>>
>>> +                     return PTR_ERR(cell);
>>> +             }
>>> +
>>> +             efuse = nvmem_cell_read(cell, &len);
>>> +
>>> +             nvmem_cell_put(cell);
>>> +
>>> +             if (IS_ERR(efuse)) {
>>> +                     dev_dbg(dev, "Failed to read cell '%s'\n", cell_name);
>>> +                     return PTR_ERR(efuse);
>>> +             }
>>> +
>>> +             lvts_td->calib = devm_krealloc(dev, lvts_td->calib,
>>> +                                            lvts_td->calib_len + len, GFP_KERNEL);
>>> +             if (!lvts_td->calib)
>>> +                     return -ENOMEM;
>>> +
>>> +             memcpy(lvts_td->calib + lvts_td->calib_len, efuse, len);
>>> +
>>> +             lvts_td->calib_len += len;
>>> +
>>> +             kfree(efuse);
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int __init lvts_golden_temp_init(struct device *dev, u32 *value)
>>
>> You did not test it, right? Build with section mismatch analysis...
> 
> I'm not sure to fully understand this comment.
> Would you explain, please?

git grep -i "section mismatch" leads to lib/Kconfig.debug and
DEBUG_SECTION_MISMATCH

(...)

>>> +static struct lvts_ctrl_data mt8195_lvts_data_ctrl[] = {
>>
>> Why this cannot be const?
> 
> I've got the following warning when I added "const"
> drivers/thermal/mediatek/lvts_thermal.c:1286:27: warning:
> initialization discards ‘const’ qualifier from pointer target type
> [-Wdiscarded-qualifiers]
>  1286 |         .lvts_ctrl      = mt8195_lvts_data_ctrl,
>       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~

As with every const... Do you need lvts_ctrl to be non-const? If yes,
then how do you handle multiple devices (singleton)?

Best regards,
Krzysztof


