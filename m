Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B41BC4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 07:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2xoYW3vwrZLwzBr/kjmxRicWAWxAyGeYufVkjpsFQ0=; b=4+fRYOgTLkmACQL9FC7TAq6QSc
	jAEifcNmJ8n6rH8kk9kqmbBD6qYzGEsnR66TWgnMsJrYnqi9D8UAYiuAd5AW5BoV3qChoga5PJlbZ
	jAz0475a0tAHtCbwOhL14x0OfTPxu4HCWYiBqauJC5h/MoMalutwhKyiw17FDQ3f4gSBL2duIUfv/
	Uz2suahPcdW73WmO1GUl6P0AJzkHln43dL3CJD4JgihuiGolVHvNyNqRD5PuF2fzRbPU1Hsg015kX
	OsE3248yGzTa1sH7EVGjoCv0npeB4LA4h65XYPXvd1lru3bm/w3ooCJeIcHyUlZlXYicIMrS9pgu5
	UVrXB/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRocL-00ApzC-2Z;
	Mon, 22 Jan 2024 07:21:13 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRocI-00ApyX-0g;
	Mon, 22 Jan 2024 07:21:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-339208f5105so2453288f8f.1;
        Sun, 21 Jan 2024 23:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705908067; x=1706512867; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2xoYW3vwrZLwzBr/kjmxRicWAWxAyGeYufVkjpsFQ0=;
        b=G3GZ/3ixnH3jY3uA8afUoL2lv6ZUmSanvT2On3Xh1qb/1zMBSAwxSB7nTBJHo81pSn
         S1WgxowgMnZvpY/eeG/byqbx8A8PT/FzcXMVfhrvxp9xdpOnOnLgZ+U/WrCLGy6EAZS7
         dJeG7+J2tkaudOTcDZDF3injL7Zxm/HrEKWJMRxtwpMREPw/TufxvdILda6AbjWpZVPD
         9sPN6CneQu62Bs++IcGJ4u+6FbbUiWAu74PLp20VIUynIsIllPr03qWhz0IHkSpS1Moa
         KcZROJE4risQElz1+LBsx3sZtcRzU7gE85YPPhJodhp9OCobvZSASJPfLtGI4Og863vc
         elyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705908067; x=1706512867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2xoYW3vwrZLwzBr/kjmxRicWAWxAyGeYufVkjpsFQ0=;
        b=rFg7H0qUZE8dparU+dw1cXfaTiiqH/ukURFJtyvVV2gxkMVRJhtwaUEYWUQLloUN8o
         ivAZpcTuWFRGBfvOcY/pEDItgOAyboRoxPuDVrWO6QSogYOrClWiOtlB9OsjhC+ZRi26
         AI0eYF7FwyBROR8bgQ30ErsDTL6SDYx0irxWn4/uE0WThh2gL5d/xZTlN4b8gb5ur21H
         wTjd5+5lu82Kj7crc0ouhIWazfyeIzQNrILSjQJWiWPfoBfYt7qZDusZLi2cTBbblQGF
         M0k3l3KoRkzYhWThHGSMOVT8XTZdM/KCWfK3Fz4OP8y+zewvqpqqKBXTC2afGVoSBE4o
         /Alg==
X-Gm-Message-State: AOJu0YxX2fx+5k70epJsCK9RMNolxmnu271A8s++dJwQ4RNDkaaLQ6p/
	LuDl9z9qRpM4i7JZxS0eY36iww+SXSz+Gc7TlAnjxOlKKlpd+fB5
X-Google-Smtp-Source: AGHT+IFSdUHlPehFk6CdUCFbPc3w/j9QMSEf6x4Izkgt7TGsdoGsXe6HzAKCTiDDW48G4vqg/r18rA==
X-Received: by 2002:a5d:5752:0:b0:337:a76c:84fb with SMTP id q18-20020a5d5752000000b00337a76c84fbmr954441wrw.38.1705908066561;
        Sun, 21 Jan 2024 23:21:06 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id d12-20020adfe88c000000b00337be3b02aasm13076149wrm.100.2024.01.21.23.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 23:21:05 -0800 (PST)
Message-ID: <a0716d15-3956-4555-9bea-c6032579027d@gmail.com>
Date: Mon, 22 Jan 2024 08:21:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: mt8183: Move CrosEC base detection node to
 kukui-based DTs
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240116-mt8183-kukui-cbas-remove-v3-1-055e21406e86@collabora.com>
 <720dc418-16f7-473c-b33c-f0c9786c02e2@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <720dc418-16f7-473c-b33c-f0c9786c02e2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_232110_259617_898D0554 
X-CRM114-Status: GOOD (  17.54  )
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



On 17/01/2024 11:14, AngeloGioacchino Del Regno wrote:
> Il 16/01/24 22:38, Nícolas F. R. A. Prado ha scritto:
>> The cbas node is used to describe base detection functionality in the
>> ChromeOS EC, which is used for units that have a detachable keyboard and
>> thus rely on this functionality to switch between tablet and laptop
>> mode.
>>
>> Despite the original commit having added the cbas node to the
>> mt8183-kukui.dtsi, not all machines that include it are detachables. In
>> fact all machines that include from mt8183-kukui-jacuzzi.dtsi are either
>> clamshells (ie normal laptops) or convertibles, meaning the keyboard can
>> be flipped but not detached. The detection for the keyboard getting
>> flipped is handled by the driver bound to the keyboard-controller node
>> in the EC.
>>
>> Move the base detection node from the base kukui dtsi to the dtsis where
>> all machines are detachables, and thus actually make use of the node.
>>
>> Fixes: 4fa8492d1e5b ("arm64: dts: mt8183: add cbas node under cros_ec")
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Applied, thanks!

>> ---
>> Changes in v3:
>> - Instead of deleting the node in jacuzzi, moved the node from kukui to
>>    the dtsis including kukui that are detachables
>>
>> Changes in v2:
>> - Moved cbas node removal to jacuzzi dtsi
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi | 4 ++++
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi | 4 ++++
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi  | 4 ++++
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi        | 4 ----
>>   4 files changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
>> index b6a9830af269..bfb9e42c8aca 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
>> @@ -360,6 +360,10 @@ pen_eject {
>>   };
>>   &cros_ec {
>> +    cbas {
>> +        compatible = "google,cros-cbas";
>> +    };
>> +
>>       keyboard-controller {
>>           compatible = "google,cros-ec-keyb-switches";
>>       };
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
>> index 306c95166f3f..5c1bf6a1e475 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
>> @@ -339,6 +339,10 @@ touch_pin_reset: pin_reset {
>>   };
>>   &cros_ec {
>> +    cbas {
>> +        compatible = "google,cros-cbas";
>> +    };
>> +
>>       keyboard-controller {
>>           compatible = "google,cros-ec-keyb-switches";
>>       };
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
>> index 382e4c6d7191..0f5fa893a774 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
>> @@ -343,6 +343,10 @@ rst_pin {
>>   };
>>   &cros_ec {
>> +    cbas {
>> +        compatible = "google,cros-cbas";
>> +    };
>> +
>>       keyboard-controller {
>>           compatible = "google,cros-ec-keyb-switches";
>>       };
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> index 5506de83f61d..66eb099e15f0 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> @@ -937,10 +937,6 @@ usbc_extcon: extcon0 {
>>               google,usb-port-id = <0>;
>>           };
>> -        cbas {
>> -            compatible = "google,cros-cbas";
>> -        };
>> -
>>           typec {
>>               compatible = "google,cros-ec-typec";
>>               #address-cells = <1>;
>>
>> ---
>> base-commit: 0f067394dd3b2af3263339cf7183bdb6ee0ac1f8
>> change-id: 20240116-mt8183-kukui-cbas-remove-657b62aeced6
>>
>> Best regards,
> 

