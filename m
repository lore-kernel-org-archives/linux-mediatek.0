Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C004C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 14:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6fqLv/UnsGBNSc1Mg2An/wLaAUk0qhAVQW6Ibj1PBg=; b=Bro8iP88AZE+tmStXgq7rpK+Lv
	b3ruxZnLmJuNrxFRR7pkVYUV93GG5qbyyR4gzVnXM6/euU4LfIStitIKz1w3lMrHSIpYQlu3Xl3OW
	hsS7GYngHTOFgT/VXgPx7eTJFOH72Q5m97Y1G0OzAwxFAQRNtx0v4R9KVnqJWIE11jBGJ5cHC5rem
	NmXlqhMCIIxoA5rRv/qfiijTTSSqzsq+PmPlx+AMgOAAqA0P2SmU3GBnMWg9ex1Jkn2UO9XTO0MAj
	MQQ5UONkmqxKlnhavMQgbleFicq5zxEcHMP9P8zf5JwnRTjRub7q6kkGzVGRpw2lUjX/DR5kh5gKB
	VxsyfSKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI9Sb-001Kaz-Vb; Wed, 18 Jan 2023 14:30:41 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI9SY-001KaK-La
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 14:30:40 +0000
Received: by mail-wm1-x32d.google.com with SMTP id q8so13011867wmo.5
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jan 2023 06:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y6fqLv/UnsGBNSc1Mg2An/wLaAUk0qhAVQW6Ibj1PBg=;
        b=uSwrEp6ZoJZh6sAuoGCD4UCnDtztV6IpGP/AtZLvPmNNrN9xz/jnx5F8XJMVHPBqn5
         ZzcZzqX0tvwa9jZAPnNb9Iir1I4A3yJpVI6pELJJZ/reofaXSE+ykAPOL9zkoaWypm4c
         dFDBuJBzKtRQsxUsPNxYQunkXbxsH+rTEPJ0YWB744+v7U7SGNb404KVu0RxlW2ZS2P9
         fn3p6hvdQYoNOOyI7OWuf3xzjM84jsVF+aQx7V2oF6MOXWagF3jni9AWzSRyJMt/Yo/9
         01FTIhNrN54CvWR8VmxYaozTjid29UxEWxMal0tY0lReyeq4362SFO21i1sEMCT6+ttu
         XLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y6fqLv/UnsGBNSc1Mg2An/wLaAUk0qhAVQW6Ibj1PBg=;
        b=44eAE87BNqRWruh6O1Yapn7wgbJWybyji9i77ZNM+zOmZlPSeV7BtUaRIBcBrojSAD
         M78QYZkEjkGUxUCzhtc1uNbB7iEt1MgkA7TvyM+OqEyFH/hh6BCD2b5dg7vTCcKmtD7e
         E/wCWVbxLE4ihc+tYS/eq7BJG3f73G8dirEGbSEnObRq+zI9XbaeCIDb04pWsSUB3nF6
         zXrMtYa3uvoMyz/GpK7fjykVdI/dp2p1Lo3iuWIz9WLam4swwJB7wzQJQMbUR+nfNBYQ
         DhE2sS9cusUKyt/+AEi8fCgoMletg6Hn1XxGSSF991U8RJXNWyb3TfxQ7UPgGeX9oZh5
         QvtA==
X-Gm-Message-State: AFqh2kowCfBGeLnp6+mVpYtfpwg10EOtSC80suT/RiILLienJcpLs/By
	SNK5d4izepfzLeVf5f16mP2nCA==
X-Google-Smtp-Source: AMrXdXvLSN0PHBbiULtPldAnGFmVmcZkI5nbWAR+T2eQFEX0x8wEip7qwseRQfUhjWZgAKhOO6oFSQ==
X-Received: by 2002:a05:600c:540a:b0:3db:a3a:45ac with SMTP id he10-20020a05600c540a00b003db0a3a45acmr5788450wmb.32.1674052236293;
        Wed, 18 Jan 2023 06:30:36 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id l23-20020a05600c1d1700b003db0dbbea53sm2418963wms.30.2023.01.18.06.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 06:30:35 -0800 (PST)
Message-ID: <71e5c68a-dbc7-caac-d6d4-5a8cd5b20d5e@linaro.org>
Date: Wed, 18 Jan 2023 15:30:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v10 4/6] thermal/drivers/mediatek: Add the Low Voltage
 Thermal Sensor driver
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230112152855.216072-1-bchihi@baylibre.com>
 <20230112152855.216072-5-bchihi@baylibre.com>
 <feab4ff4-b874-aa10-2031-ad6b84cbc004@collabora.com>
 <CAGuA+ooxTf-j957gQ1zRe2-+u2kphaaLGvTDi1=kit5Q3bKOxA@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAGuA+ooxTf-j957gQ1zRe2-+u2kphaaLGvTDi1=kit5Q3bKOxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_063038_735548_C4FAB0F9 
X-CRM114-Status: GOOD (  14.58  )
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


Hi Balsam,

On 18/01/2023 14:58, Balsam CHIHI wrote:

[ ... ]

>> You're describing the register with nice words, but there's another way to do
>> the same that will be even more effective.
>>
>> /*
>>    * LVTS MONINT: Interrupt Monitoring register
>>    * Each bit describes the enable status of per-sensor interrupts.
>>    */
>> #define LVTS_MONINT_THRES_COLD  BIT(0)  /* Cold threshold */
>> #define LVTS_MONINT_THRES_HOT   BIT(1)  /* Hot threshold */
>> #define LVTS_MONINT_OFFST_LOW   BIT(2)  /* Low offset */
>> #define LVTS_MONINT_OFFST_HIGH  BIT(3)  /* High offset */
>> #define LVTS_MONINT_OFFST_NTH   BIT(4)  /* Normal To Hot */
>> #define EVERYTHING_ELSE ........................
>>
>> #define LVTS_MONINT_SNS0_MASK   GENMASK( ... )
>> #define LVTS_MONINT_SNS1_MASK   GENMASK .....
>>
>> /* Find a better name for this one */
>> #define LVTS_MONINT_EN_IRQS     ( LVTS_MONINT_THRES_COLD | LVTS_MONINT_THRES_HOT |
>>                                    LVTS_MONINT_OFFST_LOW ..... etc etc)
>>
> 
> Given the complexity of the controller and the number of registers,
> if we create a define per bits, we will end up with a huge list of
> defines (~300).

Yeah, that is too much for a little gain.

However, a few can be added for the interrupt only.

Instead of LVTS_MONINT_THRES ..., it could be LVTS_INT_THRES_... and 
reused for LVTS_MONINTSTS and LVTS_MONINT setup as the bits position are 
the same?

[ ... ]


>>> +static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl)
>>> +{
>>> +     u32 period_unit = (118 * 1000) / (256 * 38);
>>
>> #define SOMETHING       118
>> #define SOMETHING_ELSE  1000
>> #define ....
>>
>> const u32 period_unit = (SOMETHING * SOMETHING_ELSE) / ....
>>
> 
> Constifying "u32 period_unit" generates the following compilation warning :
> ./include/asm-generic/io.h:273:61: note: expected ‘volatile void *’
> but argument is of type ‘const void *’
>    273 | static inline void writel(u32 value, volatile void __iomem *addr)
>        |                                      ~~~~~~~~~~~~~~~~~~~~~~~^~~~

That is strange. period_unit is the 'value', not the 'addr'. Are you 
sure about the warning?




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


