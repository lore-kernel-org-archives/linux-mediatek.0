Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00778C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 11:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkHuEvWnBbmn6J9IHM/XCzxQvuZdAVkzVZy6DwR1zSo=; b=ZudqMqXLX+vhu0YyYlfrRqx/ko
	NHtT4GHqoVYmQeGJVoXZF0mzdL7z/5zv83A9HDmZLpxGQfw56q9XFB2RpLIftEzNuOpINvrE7qIIv
	KhaFkWQ6gFmt89unBwHAPs81tHTqfHz/U52MWYnkcX7ZartQKS8AnHFlVk+EL623qPZlAE5XYnBoS
	jk1eklGPlnymmmfekZ/NvqM9ZvYfSGpx9X7w890Q+sxavgrkuIosmPRpUsLLhhRjLLRlwz0MzZOnP
	Nq/Dbn0dbM4d9sGw/0FZX29qC0niu/5e73Hz/USqjNVG2b9AAD6t2a8WWE0s/w6kYZvFMuHCYm/cR
	I1xE9qkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgid-001nps-Hq; Thu, 02 Mar 2023 11:03:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgiY-001nmI-0x; Thu, 02 Mar 2023 11:03:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so1434981wms.2;
        Thu, 02 Mar 2023 03:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677754998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LkHuEvWnBbmn6J9IHM/XCzxQvuZdAVkzVZy6DwR1zSo=;
        b=BDwGZkebAseiLNLVCP3fUulwLJK3BAX6aOcYlZdJ+9o6XbspZwfiY6Nq+XWUlz6nDj
         wvkfkvOMwBz+Y3CSBSqSj/Mr/0HLiTSpB60Refn0RsFsoUYV9EQKiEUyXDO2C2j3vsXn
         3wPXBf36Se2Y/sJRwqyv4Cc4TAoxUMqulXfIaPl9A+jxUUK98tgYRx0MDJ/fCDyptD9k
         3c3hnIyvs7sHYFIMFJqW7cnHazcSl3v8w2HjnJ68GuCKLiPLFXRnQynkxeVUch90WOhG
         Z9BGa+3XNat+LQZFAB0HGYdd7kdeoTzQaOqrczqzPqeQDKdYfnkr6TLlHpJ0Pclfalt+
         Inpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677754998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkHuEvWnBbmn6J9IHM/XCzxQvuZdAVkzVZy6DwR1zSo=;
        b=mFlIM7jSXSyoaSg3uRKxIbZtRq9VL12jtv1CMEojpJyJMHDwXY+Uffd2pmguAPGJNO
         8X6iBJIva+kIw5+pLfkSUJ0ZLt2kl5vYKO60L01Qj2JK0qC7cH0gTGl8/5EJLeE8QZJK
         XTuoheYtRkySkg2gj7l+zBqildUc6omF2ZFGObYs1ulGXNGdR8GdcQ6ZMPu8xNmjvxDw
         Q+fB3kg4XOo6WtUayIsMrUjvYNDX78geq2vQhplkwMPGinzsvqKMRP7hmZXt08/EXlW0
         ACvwg8rO0hkPL2KXU3JTCW/mj9K/1Ydktq8x7ZpG4vSTT+99phxLiPPGHRKIFfN9JCRL
         8Mbg==
X-Gm-Message-State: AO0yUKXS6y0R6l51UTcolGHl+7PJ4/Uxnhu12o7Lqm62ZLnX9bFAIvK/
	r4Oq5UB+hJ729TcLVMzDDT8Pnp/7sIrfOg==
X-Google-Smtp-Source: AK7set/JlzFceze8hhK3/4uajo1mpfVadvTq9TwAVwpchmL5fNm1Ggc9LQk17dnZcbn2PRNdl/6H1A==
X-Received: by 2002:a05:600c:458b:b0:3e9:f4c2:b604 with SMTP id r11-20020a05600c458b00b003e9f4c2b604mr8193890wmo.24.1677754998008;
        Thu, 02 Mar 2023 03:03:18 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j40-20020a05600c1c2800b003dd1bd0b915sm2893847wms.22.2023.03.02.03.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 03:03:17 -0800 (PST)
Message-ID: <dcd653a3-3f7c-7bfb-f096-033f62cb9074@gmail.com>
Date: Thu, 2 Mar 2023 12:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 4/4] Revert "arm64: dts: mt8173: add mmsel clocks for
 4K support"
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230209160357.19307-1-matthias.bgg@kernel.org>
 <20230209160357.19307-4-matthias.bgg@kernel.org>
 <3db45ca3-9104-826c-9f92-549e07471296@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <3db45ca3-9104-826c-9f92-549e07471296@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_030322_110644_B6F7F4FC 
X-CRM114-Status: GOOD (  16.52  )
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



On 10/02/2023 12:59, AngeloGioacchino Del Regno wrote:
> Il 09/02/23 17:03, matthias.bgg@kernel.org ha scritto:
>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> This reverts commit fc6634ac0e5380aeb1063275a2e9a583d41b2306.
>>
>> The mmsys is a clock provider but does not have any clocks connected to
>> it. Therefore assigned-clock properties should be applied to the users of mmsys.
>>
>> This fixes the DT schema check:
>> mediatek/mt8173-elm.dtb: syscon@14000000: 'assigned-clock-rates', 
>> 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> About solving schema checks: agreed.
> 
> Since this is impacting on multiple subsystems (display, vdec, venc), can we
> instead move this to the topckgen node?
> I didn't check if that would trigger another schema check, but I remember
> doing that on Qualcomm DTs a bit of time ago.
> 
> The alternative would be to copy that over more than 10 nodes, which would
> be a bit ... ugly.
> 

Thanks Angelo and Chen-Yu for your feedback. I'm not able to reproduce that 
problem right now, so I'll drop this patch from the series.

Regards,
Matthias

