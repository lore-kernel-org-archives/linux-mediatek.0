Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0E3C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 07:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQzLUCh+3vNzZPd/OO/j4AbCmXn45QZuaXbRQn+MMsc=; b=VwZUz+shzia0acEio2LV4EinMY
	yn5jNK1tC5OOCGGNRWUBuCMM/BJAuSMHvra895oyGqvSB3bMjWTDqkCEnubsMHrvDssAwVn6Ww3/8
	OOu5k4n6Cj0w3Gy3z4xS+i3VDjoCUSa5b8CgrdnrwF4tT1Wih7+vOKgd26cb0lMYV2GXcsFUhYjwi
	5Ym4lBLX3Foa+cFNSeggFIzJfLzjNsyCGKyV01U1ap902xAMAesxRQrqFJtucxnW7jCrHpGOUqDEr
	hoWZdTVd8NDphXKnYP44bSN9efDkbTSwzHSNepb34rTK+Ao846mpH8bU+J1zBRrnmRX/N5Akstm1o
	U0EJ6Usg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnDYY-008Vye-2l;
	Fri, 14 Apr 2023 07:09:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnDYU-008Vwc-2s;
	Fri, 14 Apr 2023 07:09:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A4506603219;
	Fri, 14 Apr 2023 08:09:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681456146;
	bh=U5N+jJxH6HE3r7En//JC+y3anV8kUBxIvdmCQ40tbVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=knC+7Ivdk4BhD7brVOF56moGdveXZXswraELz1DRd92QuFCPmgiZ/JVsB+hgeuLyn
	 PqvpTtgUWzfdxTox23jfj3uSVQ0uGUq/oDoGmjP8IvIUOfoCyQjlWtwUCMTg0cdOrh
	 2qRictBPzwtx7j0smxP+kXKiLnemdwjmUkTaw6Bl/LvPYrFVk2F2iwFWqNbkx2kBpJ
	 mOIZD8ppSp4DP9HRzfMy9d5nJqVVVR6pxEQ9ZG4vTh8zAb5oci48o5ibZa4GlUP1t+
	 oi7GSMB/mtT0D4pFvbx3f/UQamQ2hsdiUQXBLnge3pqbp+oMi5tS4uv/Ntp+glMM8y
	 x7w0Xa1mivybQ==
Message-ID: <0a297b99-a1f2-eeec-b3da-e2a510e0a714@collabora.com>
Date: Fri, 14 Apr 2023 09:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 7/7] leds: leds-mt6323: Add support for WLEDs and
 MT6332
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, sean.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-8-angelogioacchino.delregno@collabora.com>
 <ZDfiNSAs3Bc7xe1l@duo.ucw.cz>
 <76c89ad1-a189-c907-590c-35ae6b7edd9e@collabora.com>
 <20230414070748.GB1036697@google.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230414070748.GB1036697@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_000911_144221_5099C8D2 
X-CRM114-Status: GOOD (  15.71  )
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

Il 14/04/23 09:07, Lee Jones ha scritto:
> On Thu, 13 Apr 2023, AngeloGioacchino Del Regno wrote:
> 
>> Il 13/04/23 13:06, Pavel Machek ha scritto:
>>> Hi!
>>>
>>>> Add basic code to turn on and off WLEDs and wire up MT6332 support
>>>> to take advantage of it.
>>>> This is a simple approach due to to the aforementioned PMIC supporting
>>>> only on/off status so, at the time of writing, it is impossible for me
>>>> to validate more advanced functionality due to lack of hardware.
>>>
>>>
>>>> @@ -467,14 +590,24 @@ static int mt6323_led_probe(struct platform_device *pdev)
>>>>    			goto put_child_node;
>>>>    		}
>>>> +		is_wled = of_property_read_bool(child, "mediatek,is-wled");
>>>> +
>>>
>>> This needs documenting in the binding, no?
>>
>> Yes, and I forgot to. Would it be okay if I send a supplementary patch out
>> of this series to document that since the bindings are already acked?
> 
> You can add the support as part of a new patch.
> 
> Please resend this series with it attached.
> 
Perfect - will do!

Thanks,
Angelo

