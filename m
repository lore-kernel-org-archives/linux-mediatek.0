Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782B1EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 06:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDXRZ/E9io/51ukbLFISpRHZSMAt3CAsusimpt3aOJ0=; b=pt0QudxWMbLWqbKpMRSDBDKGsw
	JRYiOWzFTB3Q+vRYDEJmK8Tc+3JL0pvkH7ULxDWmekZI/sic74GE71wz1vLnEHhfuiYa6txMJZsD2
	sfVVHemqXfJsCAyEHgv0E3YuscCANrrblSKENa+jeM5QOBkLgPezEVXkYJEBYKVJEmm3JoUBleQSA
	5S4FmI6o4nc0NZkotfHcnXKiXEBq+lucu25jTGWV99ttFewCjQT2Zm+ZOamkXQAUpc0hc9u8/nUkv
	zFk6trBn/deaaSmDyF/wY0PGVPeTDliUV+y9lp9WhSb0s0Z3O84R0YbGtb3BxO9t/634p7vv7VaSd
	gIbV9xDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJq6V-0028YQ-1N;
	Thu, 13 Jul 2023 06:47:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJq6S-0028X7-2P
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 06:47:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso2581385e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 23:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689230822; x=1691822822;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDXRZ/E9io/51ukbLFISpRHZSMAt3CAsusimpt3aOJ0=;
        b=Y2TgwIcpW0GqU2VbKjQAsG2KFmUQpWcwvXEXNuJ6lsWeayFiZTSrj4IfIO8+EYOCnK
         Gs4WcbzE1N9+9N+NWfSBBg6lXMqgPqM/ozQXThnRdqmJxeeSYBRR9ZOhCfXjK1/ghD/C
         2jIVuUHEKaFCH/bOzsQ6UPnvI9+ulKSXqSts/H0HyXZVcw6Jp03vv3oryA2uheQmnjee
         4Wc9UkRZRCyyu3j41EcLtEtdMBtli0zmlF3xeIm1GV+mOLW1zNQGSeayCsr74Zkckh1N
         h1FueLXrFBmE0SxjRIR8ZeG2h86TnAHvk3hwcA+ZUSaULVRORUuPbVWTClnVbgHMxsnt
         OOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689230822; x=1691822822;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDXRZ/E9io/51ukbLFISpRHZSMAt3CAsusimpt3aOJ0=;
        b=Zho+JyDwchyxeUwS/crLNp7vy1L+MGdF79QAsNd8iECdBvntFmTdvw0sxQlaxaAQWc
         PCw5SG3gjogSdenP9uCuHy8kIhTrSQ/8xYFpISm+XU0cGd/1pLX2y78IRq9QT1lqYXtn
         ow8t1EoJOp0GI7iSb0UefwbZu+249HgxQWHO2+LjWVQlNJteFTUox/7+jOHB/JvkJL6C
         TvqLSnb/Hs5GodrcQkU/LVV2GXdfoMti1AfK0ktFVKHXoxoqEQs0AH5GIN4hZR4LUjJb
         VJhdwcSQY/yCNyYXk6DKDKyomIPIuifOZ5WJBAkXDCgT0qTWg92V6Pypxofx+0eLWxUA
         K1dw==
X-Gm-Message-State: ABy/qLaGTHskGIdLoV+4BarIIxuObyi8SSM5teDX/tS10IAyPQxg1rQp
	rTDpbZYpokOLobozmSZEu/n/5g==
X-Google-Smtp-Source: APBJJlH81v8zuibmeCPcWRJ4UoBAP0+rpVBJJvKoujWGteihPBYQ8w1aAtLN/pbTLVkcmOj/G6M4mA==
X-Received: by 2002:a5d:42cb:0:b0:311:142d:5d97 with SMTP id t11-20020a5d42cb000000b00311142d5d97mr604664wrr.31.1689230822204;
        Wed, 12 Jul 2023 23:47:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id i16-20020adffdd0000000b0030fb4b55c13sm7005237wrs.96.2023.07.12.23.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 23:47:01 -0700 (PDT)
Message-ID: <ce217ae6-6dd5-26ea-2ce7-95d97ef791c4@linaro.org>
Date: Thu, 13 Jul 2023 08:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sakari Ailus <sakari.ailus@iki.fi>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Joe Tessler <jrt@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Bin Liu <bin.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <98a77653-ec58-56c4-9893-3b424f67c87e@linaro.org>
 <5afcec8b-b8f6-35b0-278a-5de185e4a7a2@xs4all.nl>
 <ZG9XJCD98VWjGjTN@valkosipuli.retiisi.eu>
 <ZG9ger4WE2VWoVEF@valkosipuli.retiisi.eu>
 <158425ec-86e8-ca3e-eed8-e14b37c42730@linaro.org>
In-Reply-To: <158425ec-86e8-ca3e-eed8-e14b37c42730@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_234704_816752_28DCC852 
X-CRM114-Status: GOOD (  19.94  )
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

On 19/06/2023 16:13, Krzysztof Kozlowski wrote:
> On 25/05/2023 15:19, Sakari Ailus wrote:
>> Hi folks,
>>
>> On Thu, May 25, 2023 at 03:40:04PM +0300, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Sat, May 13, 2023 at 11:57:33AM +0200, Hans Verkuil wrote:
>>>> On 12/05/2023 18:35, Krzysztof Kozlowski wrote:
>>>>> On 12/03/2023 14:12, Krzysztof Kozlowski wrote:
>>>>>> The driver can match only via the DT table so the table should be always
>>>>>> used and the of_match_ptr does not have any sense (this also allows ACPI
>>>>>> matching via PRP0001, even though it might not be relevant here).
>>>>>>
>>>>>>   drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]
>>>>>>
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> ---
>>>>>
>>>>> Hans, Sakari,
>>>>>
>>>>> Can you pick up the patchset? There was positive feedback:
>>>>> https://patchwork.linuxtv.org/project/linux-media/patch/20230312131318.351173-1-krzysztof.kozlowski@linaro.org/
>>>>>
>>>>> but it seems it was not applied.
>>>>
>>>> I see it is delegated to Sakari in patchwork and marked Under Review, but I don't
>>>> see a corresponding pull request for this series.
>>>>
>>>> Sakari, did something go wrong?
>>>
>>> I spotted this as Hans notified me in IRC, I wasn't cc'd. Apologies for
>>> this --- I intended to take these but I think I must have missed something
>>> important in the process. I'll take them now.
>>>
>>> Thanks.
>>
>> This no longer applied cleanly. Mostly there was fuzz near .of_match_table
>> changes as probe_new (and remove_new?) changes have been recently merged.
>> There were other issues as well, I marked a few patches in the set "not
>> applicable" as other patches had already done equivalent changes earlier.
>>
>> There were substance-changing changes in the 20th patch, replied to the
>> disuccsion there.
>>
>> I've pushed the result here and intend to send PR to Mauro soon if there
>> are no issues:
>>
>> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=of-match-ptr>
> 
> One month later, I still don't see this set in the linux-next.  What's
> happening here?
> 

I don't think this was merged in v6.5-rc1. It's not in linux-next,
either. Another month passed...

Best regards,
Krzysztof


