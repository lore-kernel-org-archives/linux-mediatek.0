Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A303C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QL+lGx6841G8gfl/bjowZRwIdw7qo/vrHQjFMqcY+e0=; b=FqMKRPZq6OooLVEgMu90olAsHV
	Go7Iu5Woa5Jrokpxy9L7spupZRx0ZJ7EJ4/qTAlYLdlnZmgrH2NGf4ds5lhF8cB4r6pp7E6ET1bUZ
	FRcOwJ7DcBNxGqJTLQeqYYSfsxTOEw2iTZgVaJxlMNXkYFJJChIW0N285Ezxc857kOCNUP8ct1E2P
	YeTU3H7m2qBqs6KA194WbYQsWSxKzJdVbcfdNpGPsnLXb7PEfHm5rhLdjgtjHJAL63kENH0Aw0wZ5
	XoIb2l1Ho7EJ5W3iHdu26QykwjRNIyFEk4enpW8vFl5XMsYQlM5WFjs3Z1dL7cyURE/eIzQMTq0Tn
	Jm4biFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM103-005uqG-0U;
	Wed, 19 Jul 2023 06:49:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM101-005uoZ-1H
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QL+lGx6841G8gfl/bjowZRwIdw7qo/vrHQjFMqcY+e0=; b=n/SLFHw9+0q/tWcYUNxQm02kHz
	9krDkGvj1y9JJhCzVMPbD4xHHxYTj7oxJ6F+W/Yrvq1pOuP2JbifOu8NYQ/VsxuHfCTyRBZGC2U+K
	PGUNyfRsL+iqYtgYlYHs54ucYfCl6WU2C1L9pArka+n0VM6WUEBV9FJdoEn87Mc7RK2lf/iKy2t2O
	ORMqFRGKX3XuRvKaP41jkXeuFAdYUO58yYqSo5LI/6A5HlB7LQ83wunWRVHqAoeE8OFW8TkdjaMt/
	L6kDf0TsownnKM/pe9Z2qaDq/YX8ocvRrxG6NV47HwEHOXuyPOv/s45nLS5DA3OxGP7jPgWyutSzM
	3pqcVYKg==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLfMB-00BGUo-0x
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 07:42:53 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-992f6d7c7fbso760510366b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 00:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689666104; x=1692258104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QL+lGx6841G8gfl/bjowZRwIdw7qo/vrHQjFMqcY+e0=;
        b=VUZ1dCMlD+XiY9Vc/ofh3RfnE54QF9J84WOyWPkTQMOJQW19u5GAfwKfLwVo8hoJLq
         CwRmxnCQPrukLePatF69KQUbRm47xZWqoDdiETHE09Sj8FtZHreSYbfIGg2Kr7KjLNjL
         BG3MNw1RX8iEuVLzKtnpOFyfBvAGQ5g8REK/OdQ8gjirCjvueX73HUCBwWMbfpfGZcsx
         3bRuKHgg/BnaDDsQljM9822YzXN398eOBMlVdeT4l34mIQcDJhLRyTIYZO6AmFzpcLm0
         WedJyJMDohrHAGqvL22focw21ESkD0J3iJJz7Uge55VuPiowim1+Q/SYi1xTB8ZQQNoz
         rlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689666104; x=1692258104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QL+lGx6841G8gfl/bjowZRwIdw7qo/vrHQjFMqcY+e0=;
        b=K9Lrp3iSShmgia08NqVw1ZxjsatxDc5B9P82IpiXI7tjIw2lL5yeEgclqmA9/ct8Wl
         AgRZwSCYUp9VAXS3JH/OHzvUWqOP+R29HhL1KcV1hUAlMJHFOvmHtuCnlU/1movBszIU
         pr126TkNMSJu7I9crZTETCAXpkbNywpjxzesqYYGVkPyq0WYx4ofpP1rc9CSzzZHV/Ck
         4eQ9vYI8mw2HG56zSC1Sg/8DuI0kzMtqb6VLAYezu2JLEV/EVl1FikEvcL6Go9SlPF4f
         Hl9gBtpKwtCRpIob2Sc3VJ6XWHhJK2ZFMg2+ZTNSKYD9N+ahORLULkyQSc7biC+A5X1o
         zcOQ==
X-Gm-Message-State: ABy/qLYFLMSY5EUSgY/jtjsn7j2ItPudwQQjiVoIA237Ch/IgxCqE2mm
	18MqbLXkbeZz27bS+crowf/Hcg==
X-Google-Smtp-Source: APBJJlFLSWTia11KHMNO05afcHQNkDKS0eaGs6mD+/2wIgRR2oI6rJIHTPuEIuK9JTlDDMYic6RRJQ==
X-Received: by 2002:a17:906:7a5d:b0:993:f996:52d3 with SMTP id i29-20020a1709067a5d00b00993f99652d3mr13643450ejo.25.1689666103744;
        Tue, 18 Jul 2023 00:41:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id i18-20020a1709064ed200b0099364d9f0e2sm671308ejv.98.2023.07.18.00.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 00:41:43 -0700 (PDT)
Message-ID: <42e4d678-d114-332d-f1c5-61575cbc0e3b@linaro.org>
Date: Tue, 18 Jul 2023 09:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/4] arm64: dts: Add MediaTek MT8188 dts and evaluation
 board and Makefile
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20230717120300.21388-1-jason-ch.chen@mediatek.com>
 <20230717120300.21388-5-jason-ch.chen@mediatek.com>
 <43ecf0b0-4b55-ab11-3b80-b9243b971c2c@linaro.org>
 <f0055b0f42388ff0da395bd9de7b86ce40bf77c1.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f0055b0f42388ff0da395bd9de7b86ce40bf77c1.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_084251_896326_03286AB9 
X-CRM114-Status: GOOD (  18.22  )
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

On 18/07/2023 08:36, Jason-ch Chen (陳建豪) wrote:
> Hi Krzysztof,
> 
> On Mon, 2023-07-17 at 21:58 +0200, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 17/07/2023 14:03, Jason-ch Chen wrote:
>>> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
>>>
>>> MT8188 is a SoC based on 64bit ARMv8 architecture. It contains 6
>> CA55
>>> and 2 CA78 cores. MT8188 share many HW IP with MT65xx series.
>>>
>>> We add basic chip support for MediaTek MT8188 on evaluation board.
>>>
>>> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
>>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>>> ---
>>>  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>>>  arch/arm64/boot/dts/mediatek/mt8188-evb.dts | 401 +++++++++
>>>  arch/arm64/boot/dts/mediatek/mt8188.dtsi    | 951
>> ++++++++++++++++++++
>>>  3 files changed, 1353 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-evb.dts
>>>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile
>> b/arch/arm64/boot/dts/mediatek/Makefile
>>> index c99c3372a4b5..9bd2324259a3 100644
>>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>>> @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-
>> krane-sku0.dtb
>>>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
>>>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
>>>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
>>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
>>>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
>>>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
>>>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
>> b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
>>> new file mode 100644
>>> index 000000000000..d8906172390e
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
>>> @@ -0,0 +1,401 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/*
>>> + * Copyright (C) 2023 MediaTek Inc.
>>> + */
>>> +/dts-v1/;
>>> +#include "mt8188.dtsi"
>>> +#include "mt6359.dtsi"
>>> +
>>> +/ {
>>> +model = "MediaTek MT8188 evaluation board";
>>> +compatible = "mediatek,mt8188-evb", "mediatek,mt8188";
>>> +
>>> +aliases {
>>> +serial0 = &uart0;
>>> +i2c0 = &i2c0;
>>> +i2c1 = &i2c1;
>>> +i2c2 = &i2c2;
>>> +i2c3 = &i2c3;
>>> +i2c4 = &i2c4;
>>> +i2c5 = &i2c5;
>>> +i2c6 = &i2c6;
>>> +mmc0 = &mmc0;
>>> +};
>>> +
>>> +chosen: chosen {
>>> +stdout-path = "serial0:115200n8";
>>> +kaslr-seed = <0 0>;
>>
>> It does not look like you tested the DTS against bindings. Please run
>> `make dtbs_check` (see
>> Documentation/devicetree/bindings/writing-schema.rst or
>>
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
>> for instructions).
>>
> 
> Thank you for your review.
> I actually ran dtbs_check, but it didn't display any problems here. I
> will remove it in the next version.

Ah, right, it is coming from dtschema, so the property could stay. I
don't understand though why adding 0 as seed. Shouldn't your firmware
set it?

Best regards,
Krzysztof


