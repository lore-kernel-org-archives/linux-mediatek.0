Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD33FC77B6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 10:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ2h7QdLnKKNLnQNg2CjqOluQMEMdPRUm8cojK6u8bE=; b=k2Zidsgj7RHXXqFEw5Uq8Ku8Uy
	WFzjdsrimEq369DHWN16LmWqvqsCgvdPLE0PjuewGcMrAeVD2XV3SqetHmIpmZco38bfK69SssvIf
	v3K9J2GdCBtDPRlu+Sty1XlaH0nk1bjtnP6sOk+d9Dhr+BLzyWwSpdJPVJi8psw2BelSFEegd8Eny
	ljOzyGg/1fJOArPuppH2fjTliaAxySHCZ3ti7HJYwQKOA5PONGSl9kxKDYM0dwBezHQ+Rr3dM6+26
	u9WTpNf0ozIfMzymKW7J9RKRKSQr4fg0EmAt8UQPVCeYEe2cGG8PgkuUcnuuIlv1TgXhocjm2acdx
	BpOj0T8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnGWZ-00930A-1X;
	Fri, 14 Apr 2023 10:19:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnGWU-0092vK-2u;
	Fri, 14 Apr 2023 10:19:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5052A6603221;
	Fri, 14 Apr 2023 11:19:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681467550;
	bh=VeLJmPRvnvEQ5IsnqXZVpDeqo2cwm0kmKEbVshVuBp8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D4l4IvXvCtqC3q5kEPR63kKHkXr3NXvxuaNRo9Tu3sa2jvRz7b6V543y+h/1EObv5
	 UzpIhgf2ablwIZJHwB3fKsigC0ozALklq9Bu1D9+Bk635GloxxsT2oTvjFU+0E7m8a
	 hux5psPRVFbuKQT/p1/o1MSsLzFyReEIeuvshJ6BUZ/1ywpiWV59Sht2JvsCOG+EKc
	 fm9fWjVZn+XubQ2RVUMNyKx1Ll1e6qF2eJcAft3lXVL65oktw3u5RhmWgODO9O8Myh
	 ZkC33DerM75vwRrpMwG+MTzFxteIVSodfbzBMp41kGdwTGH2beS9ACWzW4gLXXAIys
	 VEMo3Vlw5OoMA==
Message-ID: <d1f54cd7-99c0-3d1c-460b-9f15f33b95c1@collabora.com>
Date: Fri, 14 Apr 2023 12:19:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 7/7] leds: leds-mt6323: Add support for WLEDs and
 MT6332
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, pavel@ucw.cz
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-8-angelogioacchino.delregno@collabora.com>
 <00c0b699-ba1a-951c-185a-ef8f09abf6f3@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <00c0b699-ba1a-951c-185a-ef8f09abf6f3@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_031919_159444_DE643905 
X-CRM114-Status: GOOD (  19.88  )
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

Il 13/04/23 16:15, Alexandre Mergnat ha scritto:
> On 12/04/2023 17:33, AngeloGioacchino Del Regno wrote:
>> Add basic code to turn on and off WLEDs and wire up MT6332 support
>> to take advantage of it.
>> This is a simple approach due to to the aforementioned PMIC supporting
>> only on/off status so, at the time of writing, it is impossible for me
>> to validate more advanced functionality due to lack of hardware.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/leds/leds-mt6323.c | 171 +++++++++++++++++++++++++++++++++++--
>>   1 file changed, 164 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
>> index 5d95dbd9a761..202b38ac32f6 100644
>> --- a/drivers/leds/leds-mt6323.c
>> +++ b/drivers/leds/leds-mt6323.c

..snip..

>> @@ -418,6 +538,7 @@ static int mt6323_led_probe(struct platform_device *pdev)
>>       int ret;
>>       unsigned int status;
>>       u32 reg;
>> +    u8 max_leds;
>>       leds = devm_kzalloc(dev, sizeof(*leds), GFP_KERNEL);
>>       if (!leds)
>> @@ -428,6 +549,7 @@ static int mt6323_led_probe(struct platform_device *pdev)
>>       leds->pdata = device_get_match_data(dev);
>>       regs = leds->pdata->regs;
>>       spec = leds->pdata->spec;
>> +    max_leds = spec->max_leds + spec->max_wleds;
> 
> I haven't access to the datasheet so I have to ask you:
> Why the max leds value is the addition of max led and wled ?
> 
> IMO, the datasheed give you the max supported led OR wled on its bus function to 
> the maximum supplied current by the PMIC (I assume LED or WLED have different 
> need). Or the PMIC has 2 bus, one for led and another for wled ?
> 

I don't have access to the datasheet for MT6332 as well - but anyway, the only
purpose of the max_leds variable is to validate the maximum number of 'reg'
spaces that we're supposed to read from devicetree, that's all.

The alternative would've been to check if there's any led, then any wled in the
mt6323_hwspec from platform data - then:

if only wleds, max_leds = wleds;
else if only leds, max_leds = leds;
else if leds and wleds, max_leds = leds + wleds;

You see that it doesn't make any sense to do such check, and we can go with
just adding wleds+leds.

Regards,
Angelo

