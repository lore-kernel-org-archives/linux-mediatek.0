Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1C8C7EE24
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 08:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mO/RY3F3B8GPgwLB+7S4hwzVRXzzO6lIPxIO1gccjeg=; b=DzAQLsBjHf8sduFSr7en828NHi
	EoqRL4lBuLj4jfSNn2LGlmHavPIujOhLzZ1EiC4ATxFGvCWGqKiYk4tCRQaWrXVOt4HACMPxbToER
	Gd9Q3ncz++lDQX0rucxgtFmLIXblmJO3Y+OBSdenAAnp765ZSOnCimLXMeQxbTo/hf38CkxxEhocW
	MWP61rAtFYE4JFb6wqYm62wAVKZ9oCSRuUXu8CaG5D1lbA4gvWTCSnVUWNfzfKwx9OSyvx/ksVRgx
	RUY/R4ISaoDHb6CeLVpqIytwEDQBFwuPzSxeBlR1Xd3aK41Bpk0BuJKvgkle6GmWEFDEDtHDh28VY
	ursQ3Kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4zow-0066S4-2H;
	Fri, 02 Jun 2023 08:07:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4zot-0066Qv-2E
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 08:07:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30ae4ec1ac7so1581899f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jun 2023 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685693251; x=1688285251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mO/RY3F3B8GPgwLB+7S4hwzVRXzzO6lIPxIO1gccjeg=;
        b=A598VmaeQlIXU5K1gtsDSH/qH+2fNkD6meglLxmoet8DKTfui5H2P1hC+6+8TtYUOW
         MnB9VrNtFdGkSFg/mEQ9TN1U2/FtVCU7hqcQ74JZWpxANY+fABdbkCnz68Zv0kuFqkO1
         A1XgwUfJXRaIcHo73epEQZGz8+43hPhrR37OP4u1kG5lPH2M7bk6mQB7bADLWEt6GoUz
         VD7/LilwTL4qKynoEcDLjk9Nwb+fRuhjY2W59L6SaO8K8ZSU8vT5BZ4908x4/t8tT1nu
         1cvIHtGamhZCJp4HSp6kFt0K9ubiiiwsG8u8oRn8DiY/E1uiOdqr05TTbzeBb0zX7kTO
         1xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685693251; x=1688285251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mO/RY3F3B8GPgwLB+7S4hwzVRXzzO6lIPxIO1gccjeg=;
        b=AWRkexhB3zwF80VEp/909QkHS5H5I53lCV3Ik2+p+f4wV+drdUf/CWdGJuJkIvgt/l
         1aRXm9dofyQLgz2FsnG0GM/7UDejsSkSeGz8Jdd67uQPe1Uougx3MJuYlQK3eSWMtKaq
         sul0ZC88Kv2zmeS2/HeBscMB5za9zjtfGFNNvmRXngqvVPcnwNHWZM1So2K7VRetvNmv
         U0ayX/PpBXvS25HiOViuQrSZ1ZZsOoRnC59yqUOSbpyVO8Xg9ZDPqy7QtxYEe8nA3eBa
         GhH17j7QoIIZTgwawG+tp1dGrKn1+OUU+Pa6WwBFWFhpGhrQkAh8IPlUCbGpSgn/lUST
         0HPw==
X-Gm-Message-State: AC+VfDyg7IC+hxXbBaLU2aWW6BGUs9WiSGLn1NJGIu12mKX/UM+zfNET
	O4TKK91W9qjK57J3AjLJYk+xyA==
X-Google-Smtp-Source: ACHHUZ4iJjab6zb7VKTRm84jdXYQvx32T3lqpuKG6BtYc68C7Lg6oyRp4fV/jUzSTe+AMMJXE2XPLw==
X-Received: by 2002:adf:cd8b:0:b0:307:83a4:5860 with SMTP id q11-20020adfcd8b000000b0030783a45860mr3794370wrj.68.1685693250955;
        Fri, 02 Jun 2023 01:07:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:548f:8f7e:a3c2:888a? ([2a05:6e02:1041:c10:548f:8f7e:a3c2:888a])
        by smtp.googlemail.com with ESMTPSA id d8-20020adff848000000b0030ae849c70csm929300wrq.37.2023.06.02.01.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 01:07:30 -0700 (PDT)
Message-ID: <68393044-9d28-8402-e190-7cbb28442f6d@linaro.org>
Date: Fri, 2 Jun 2023 10:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: Fixes to the
 interrupt handling
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Alexandre Bailon
 <abailon@baylibre.com>, kernel@collabora.com,
 Balsam CHIHI <bchihi@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230428195347.3832687-1-nfraprado@collabora.com>
 <20230502103344.GA3388518@google.com>
 <87b0f5cd-67a8-fbd5-5ca7-a286b543d796@linaro.org>
 <8a38a0da-3a4f-4e39-9f9e-42682edfd9bf@notapiano>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <8a38a0da-3a4f-4e39-9f9e-42682edfd9bf@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_010735_726942_3D999FDF 
X-CRM114-Status: GOOD (  17.50  )
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

On 30/05/2023 21:46, Nícolas F. R. A. Prado wrote:
> On Tue, May 30, 2023 at 02:27:36PM +0200, Daniel Lezcano wrote:
>>
>> Hi,
>>
>> On 02/05/2023 12:33, Chen-Yu Tsai wrote:
>>> On Fri, Apr 28, 2023 at 03:53:44PM -0400, Nícolas F. R. A. Prado wrote:
>>>>
>>>> Fixes in the interrupt handling of the LVTS thermal driver noticed while
>>>> testing it on the Spherion Chromebook (mt8192-asurada-spherion) with the
>>>> MT8192 support series [1].
>>>>
>>>> These are standalone fixes and don't depend on anything else.
>>>>
>>>> [1] https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/
>>>>
>>>> Thanks,
>>>> Nícolas
>>>>
>>>>
>>>> Nícolas F. R. A. Prado (3):
>>>>     thermal/drivers/mediatek/lvts_thermal: Handle IRQ on all controllers
>>>>     thermal/drivers/mediatek/lvts_thermal: Honor sensors in immediate mode
>>>>     thermal/drivers/mediatek/lvts_thermal: Disable undesired interrupts
>>>
>>> This series seems to have solved all interrupt storm issue I ran into, so
>>>
>>> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> I gave a try on a mt8195 board and I don't see any interrupt firing when
>> crossing the temperature thresholds.
>>
>> Did I miss something ?
> 
> No, indeed interrupts seem to be completely disabled on mt8195, even after
> setting the controllers to filtered mode (a requirement to get interrupts).

Really? interrupts work only on filtered mode? That sounds strange

What board are you using for testing?

> I
> haven't investigated that further yet. This series was validated on mt8192,
> which did have working interrupts, but they were being triggered too often.

Ok.

> Also note that I've sent a v2 with even more fixes:
> https://lore.kernel.org/all/20230504004852.627049-1-nfraprado@collabora.com/

Yes, I'm reviewing it closely

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


