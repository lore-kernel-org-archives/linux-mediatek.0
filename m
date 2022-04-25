Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431A5C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmGfsLRRSSqJ7hKmC0BLCKMjO0BQmyVLfFcjRENTb1E=; b=k6jlCK+AZCod6A
	DhE6wnQiZ7HuO1ILuL5nwO8CpaWdFhLlm0/PUzVP6zmrLB4B8buPi9WzeF8xDtv9X+oXXYh+ORszY
	9QFZfz63BH/BCu0rAzA35MGwLKzHFi45CcHy/APUzLSubF4AVJofNE63Pq7WcCf/+DO2Z6f56M08J
	YUbXfrVEl37QWgN1yoBHy88H1OsIBn7+TWFMxxmf4wzBjfKCxmkaugm1HocTnOLSpkZsBl531z3fu
	zWTnAfFVmEcLrFn/22Vy5lXfn6/uWh2a81HFx888QhWE7AyBCas9AVwKZ0S9hHqMTJpibedumucP8
	Nk3wLlC1ceNE2Tw/ospw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nixZt-009Rua-1Y; Mon, 25 Apr 2022 12:12:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nixZh-009Rs3-Lh; Mon, 25 Apr 2022 12:12:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id p189so9137199wmp.3;
 Mon, 25 Apr 2022 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hfArQsxLDPbKG60y1rxFfA0sfKPu7Sy6y67SgmgIDrE=;
 b=iKLWQ9RN5FcUHXptcwQFmAdmvwIU3KnwEGu5UpxeO9JXNTSe3gp+26wEWZZEn5BQIq
 wR8QcQCsrte9lOhLzIs3d3io2ZkLfjJgnaClODcWcuaLazGmGRaIk5ZgbrxXqZskRrTx
 TNOg54m/cAcrSJ9JkRhMVds+iwi8Op28FKGrbxTbbyd6ydOMU1oBzQS269oJY6a1AV/b
 +NGk4n2xim63lbf1rNYH28dNDkiCkhqROanJXG9sqozfYDYuQL5nQjneoEXOofM5JNTN
 WDLtYUYXzjwmIwH2rrQUR3fmkPcGxBtVt6R+aGVMi3brstrzrM71YbKy4aymCbLmejXH
 prAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hfArQsxLDPbKG60y1rxFfA0sfKPu7Sy6y67SgmgIDrE=;
 b=I2coDuw/1u5nzCXlFjY7tibyFf5RJuRdKQg4/hZD9PYvkKeUqPSSiEHvxL6+ktTUeU
 WYasWygAATOoQwOw05AACafvkxIxBV6Xzo+C2wTvmi1spj569j2T7zqmkou0AoXVIL/E
 tmX2vIqxROSXk0izidmhsaYZ6sI8VdBnhOJQiYbkSvoIRmFWrA34p/H52EvqLkI22oMf
 O+anlFEJNEhs4vgklMkUGo/ZIZ0bBpCJVO4bZ9vGuRC2v3o1SjPXVemNiS0pVGhnDpiQ
 /cr6FibnaCx/mi2RXtxtTwFVk6B2Hva9+DpAz0WwBgHt85dL2p/3E3CyxP/flTBrvMJg
 CD4Q==
X-Gm-Message-State: AOAM5312pomZxtoMy62kAaJSXwxCTlDzGePUsXU09e9t8BBJWnJA8NUf
 bqfEbeGzHVVaixfopsA/Beo=
X-Google-Smtp-Source: ABdhPJxe6gi+jX3wdAk0cAwQiWsNQPehHNbGOPia8YoJj3YwqOp+9rGFjzm4NWMcpiS5q9Eb6YAqTw==
X-Received: by 2002:a05:600c:1e1f:b0:38e:c3eb:2d9 with SMTP id
 ay31-20020a05600c1e1f00b0038ec3eb02d9mr16898851wmb.90.1650888734942; 
 Mon, 25 Apr 2022 05:12:14 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c1d0e00b00393ed37f63bsm2017780wms.26.2022.04.25.05.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 05:12:14 -0700 (PDT)
Message-ID: <562f65b6-033b-9dc5-10e5-b665b7b83267@gmail.com>
Date: Mon, 25 Apr 2022 14:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: mediatek: pumpkin: Remove input-name property
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Dang Huynh <danct12@riseup.net>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220425064850.246228-1-danct12@riseup.net>
 <87tuah7cwg.fsf@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <87tuah7cwg.fsf@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_051217_754742_76FDD047 
X-CRM114-Status: GOOD (  15.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 25/04/2022 11:03, Mattijs Korpershoek wrote:
> On lun., avril 25, 2022 at 13:48, Dang Huynh <danct12@riseup.net> wrote:
> 
>> This property doesn't seem to exist in the documentation nor
>> in source code, but for some reason it is defined in a bunch
>> of device trees.
>>
>> Signed-off-by: Dang Huynh <danct12@riseup.net>
> 
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 

Applied, thanks!

>> ---
>> This patch is a split of this treewide patch [1] to ease the
>> maintainers.
>>
>> [1]: https://patchwork.kernel.org/patch/12633497/
>>
>>   arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
>> index fcddec14738d..7a717f926929 100644
>> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
>> @@ -25,7 +25,6 @@ optee: optee@4fd00000 {
>>   
>>   	gpio-keys {
>>   		compatible = "gpio-keys";
>> -		input-name = "gpio-keys";
>>   		pinctrl-names = "default";
>>   		pinctrl-0 = <&gpio_keys_default>;
>>   
>> -- 
>> 2.36.0
>>
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
