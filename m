Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E3FC19F2C
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKgtTNEBRcEuJKNYzz9fav0XLRpqgY1r5hhJ/ETR5F4=; b=sbS3STFQKSWKmFlT1Wnx0jWzHZ
	sQD2g0skx+aZEc68bnUAHZPKBQ5Z198dr8SZxRaSvDvq0g/Q0OTsymSR7Ikip4GOrJIAo/1LOMpxj
	vWn80AEeD++3YpQ/dM1TgL+VAI96Ri69VwRYg6x2kuNjOIYM4w7s9/CBj3wEgmvpxau6lcHQZL4in
	gDcX2Ysy6j6caQ6Uj3GsJYMN8apHga8wkLEhEHcj2hRHpj/0Tke1XDkNFoE4Z4Xy9iNWBwgRpBCqp
	6MLOH9nPa+YW9vB9HkNkPDEgTAx6XrUux3KAkmEJa0rnfz5xluHMgKAg/GLQNlQw9IP0fxJX5I6vD
	skcjO6Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJC1X-0052eL-EU; Wed, 03 Aug 2022 10:54:47 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJByZ-0051OI-82
	for linux-mediatek@lists.infradead.org; Wed, 03 Aug 2022 10:51:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id n185so8500777wmn.4
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Aug 2022 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=UKgtTNEBRcEuJKNYzz9fav0XLRpqgY1r5hhJ/ETR5F4=;
        b=l1j1LNiLEHPl29Pqd5P8h+R7lQ9danPifmXUoG1hTfeY7KvWVeWx4Abd/xixiNrTZ9
         JBlyQVkJyX80pZtlMqZ6Zbq0haNbmZHQinkkW4C8DIpLFF0kl4WJPthEg6PNo2p6eTCp
         attrMx7gN07hxshRXfb9PDygzeU0NjnkZhcnRjJ6DAgsr6WsA9grBWaP5hMz0rPsDIlh
         OhW7WsQJxFhhOVrOT3KtkmQqcemojHqyp6C37wCh3drpgH1D4H6IuVjlNJF8eQYJ6AY8
         SeNbscjbVDScrpQ1WsxQGbjQLluEMJUv13H4KPRayh0XvtQIJxmLIKNRGUukTiwDLMFr
         Oncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=UKgtTNEBRcEuJKNYzz9fav0XLRpqgY1r5hhJ/ETR5F4=;
        b=u8H5vbn4vwWCpQ9a0w5uswUd43A6x7HUhpmXEsx6CwpM86kcuU47L028InHks9pfhn
         PGeKXRFLOR3iwOexuZrEp64iQNhx8b/okTrx35nLJNBHavXBGeaqWRFh3t4kTujWkwWo
         IRy0HuZRGOsgjLHx8VB2YvM91Hi1HoXh2pjURbbayu8WOSksu9Pe4Wtu+UxxB72mrtnm
         7av2k1g2s6btK0gZfK6B+a42dhiy1S9ARIg7HIKAIsmCh53+lvYWmchKVY052CRmN79I
         us5gQYXJcvLiukbYrqFlxB7LgoSujSnIgk4iT4PTL+/JFlyClcshBZjB0FikKmdntMZd
         gFhg==
X-Gm-Message-State: ACgBeo1DBB9qB4PFnND0OjEo0bT6SEc4bLwulPqVTftmtvzDTCIzKqHN
	equXEKx7raT4EjdH3kX/lQQILw==
X-Google-Smtp-Source: AA6agR4ooQgNyvGSBedKzPOVSNxL7PaXRTSiaL3eh/8HzCV27FgkpUxBQmODfbbFRFzAFLhywsacXA==
X-Received: by 2002:a05:600c:3845:b0:3a3:227d:c1c6 with SMTP id s5-20020a05600c384500b003a3227dc1c6mr2467572wmr.9.1659523900775;
        Wed, 03 Aug 2022 03:51:40 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:6e48:fbdd:280d:6dac? ([2a05:6e02:1041:c10:6e48:fbdd:280d:6dac])
        by smtp.googlemail.com with ESMTPSA id g11-20020a05600c4ecb00b003a02cbf862esm2331719wmq.13.2022.08.03.03.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 03:51:40 -0700 (PDT)
Message-ID: <57687bbc-580a-ef07-bc50-6bc9f5c14ec9@linaro.org>
Date: Wed, 3 Aug 2022 12:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 1/6] thermal: mediatek: Relocate driver to mediatek
 folder
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, amitk@kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220726135506.485108-1-bchihi@baylibre.com>
 <20220726135506.485108-2-bchihi@baylibre.com>
 <24250d03-b25f-e521-5abd-f36109885c36@linaro.org>
 <CAGuA+opxZ7DDrWHcnTRhMcm7YveCAypdy9MDSytt58asgekayw@mail.gmail.com>
 <CAGuA+ooOUXaBM+uPvEEohFLtO8sRd4T=DMcc6Fvo9P92gsq4yg@mail.gmail.com>
 <9b224465-e9e5-43d3-50eb-3614decbd8b2@linaro.org>
 <CAGuA+op-mO5ZMz_EvSOYUNiZ_4OOwLFQqFqMrCQBVMcG3mbcPQ@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAGuA+op-mO5ZMz_EvSOYUNiZ_4OOwLFQqFqMrCQBVMcG3mbcPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_035143_343252_D13801DB 
X-CRM114-Status: GOOD (  14.31  )
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

On 03/08/2022 10:41, Balsam CHIHI wrote:
> On Fri, Jul 29, 2022 at 5:35 PM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>>
>> Hi Balsam,
>>
>> On 29/07/2022 17:21, Balsam CHIHI wrote:
>>
>> [ ... ]
>>
>> You may want to wait next week before sending a new version, I'm still
>> reviewing your series (note you can send it anyway if you prefer)
>>
> 
> Hi Daniel,
> 
> Thank you for the review.
> I have finished implementing the changes requested by the maintainers
> and would like to resubmit the series.
> Do I still have to wait for your feedback to send it again?

At your convenience, I'll review the new version if you send it



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

