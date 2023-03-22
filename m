Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4879EC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ml/8rgHxnh/Rcizr/HTKMeYH4wxYvAVSv7sbApQZNB8=; b=e9xIYTxw/A0+9cyTRAiMAku03Q
	WgGT9ObFh2ngpcObcjlqlqSDj+lS2H1ADNJvdyTO+T/Qdw5trYsMqtgWWpQH9RqfeOibO2qlGXP6q
	C80kSsyjjXQt4SXVTdiOufXlBxa8b2musFUZajciihlnkZ70JwDXR+p9rd0lMQ+qRzgnM3IA4GUAi
	9Gbv6SWYx38yWWXDrgvm0kBb6FQ1xJVmafpzbUe5/PdXl2nxlGJ7khXI3tDnmsUrPZ5x1YhQy6Frw
	T4fvIXtKX0c94stsHUmAUTP7Tz0fvV/NIhCsd7M6jvKIBB+7R5z3GM8VubxgbAAinPbocZq0w5lFP
	ISwfCZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pezef-00GL2o-10;
	Wed, 22 Mar 2023 14:41:33 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pezed-00GL1m-0L;
	Wed, 22 Mar 2023 14:41:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id l12so17318981wrm.10;
        Wed, 22 Mar 2023 07:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679496087;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ml/8rgHxnh/Rcizr/HTKMeYH4wxYvAVSv7sbApQZNB8=;
        b=XtAadWtr79aVV3gfVOVZS5A7aLvnPaZTy8EJEW+i7VzFaja/BFTha8SWE9A5XVQGky
         /06tFDul6XXHZNW0UXWggE9j/BrfU9CFumViSPVXEglGdEhf3Xn06+4HLUObE1Ak19Lh
         oYMLYyDEddYkJ0l6/9d6UQRanmmR56HdSjjzuVHvcAcyKvuCzk3Cq3AWOlqE3nRJMPe3
         yTBQ/BIlAqulEWcs2oyeGL89UxCrmJ3mTYMw6DkjLip3s1AX+Lp45E0dVOh4oZ9QodpH
         lwk/bIWJ+f7s1iDG4iB/9twuAISYsmVOaQKTjsOdMghMsyNcfiJsdmWoJK6d9xL1HHOb
         dNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679496087;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ml/8rgHxnh/Rcizr/HTKMeYH4wxYvAVSv7sbApQZNB8=;
        b=S11CFwHMYRPrbeI+rl9taSZkFUCmGdDZ7iNmA6UtNQuda+B91rgM3OJ65xOt2o1qoi
         SlgNMX3eYpL04kiAmcXfGBqjyMvNGY641Lsg2FaqVcYlfcxL+iCsDYTF0SzvQODoRyus
         5/Qb1zz9nJQss2bLRDjiqCTtgRxq/KKllp5xE6+KtCLT59t7ilnXw8SBWD1Qr4TnVTec
         zkEwr5xMgpCe1+RqNJiZTWyQH59GEX24jxPsH+f0gxg9NhISagY89hhvP1FdCIbuMyTu
         iz79i+n5pDTrySs1PDwkU9QyiZMse8+dBl0OCeyIqEeoeSJbXn5ReH1zb3YH790fUQD7
         thwA==
X-Gm-Message-State: AAQBX9fv4+/lL0Ujdwj4pzQ0jzH2pQy4b4s3mxSTdf+VMFFmuhzN5Nws
	lkUA+qFNiaT4A3SRDj4vjMUjdn9dEdQYVg==
X-Google-Smtp-Source: AKy350awk2lLLkW6dcFjDzGAIqtfddOFvqewsAvecdc1km7DwkYiRTaHdnj8Boip9ea1915tUxvCvA==
X-Received: by 2002:adf:f043:0:b0:2c7:70d:cc36 with SMTP id t3-20020adff043000000b002c7070dcc36mr69865wro.5.1679496086739;
        Wed, 22 Mar 2023 07:41:26 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id v7-20020a5d4b07000000b002c56af32e8csm13896207wrq.35.2023.03.22.07.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 07:41:26 -0700 (PDT)
Message-ID: <ed1f9faf-cb4f-9ff1-ab6b-813035a051bd@gmail.com>
Date: Wed, 22 Mar 2023 15:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v11 3/3] arm64: dts: mediatek: Initial mt8365-evk support
Content-Language: en-US
To: Kevin Hilman <khilman@kernel.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, maz@kernel.org, tglx@linutronix.de
References: <20230309213501.794764-1-bero@baylibre.com>
 <20230309213501.794764-4-bero@baylibre.com> <7h8rfqwf5u.fsf@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <7h8rfqwf5u.fsf@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_074131_162940_C595424B 
X-CRM114-Status: GOOD (  11.30  )
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



On 21/03/2023 11:51, Kevin Hilman wrote:
> Bernhard Rosenkränzer <bero@baylibre.com> writes:
> 
>> From: Fabien Parent <fparent@baylibre.com>
>>
>> This adds minimal support for the Mediatek 8365 SOC and the EVK reference
>> board, allowing the board to boot to initramfs with serial port I/O.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> [bero@baylibre.com: Removed parts depending on drivers that aren't upstream yet, cleanups, add CPU cache layout, add systimer, fix GIC]
>> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
>> [aouledameur@baylibre.com: Fix systimer properties]
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Tested-by: Kevin Hilman <khilman@baylibre.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Tested (again) and things are working well.  This is the last patch
> remaining to be merged.  As soon as this lands in linux-next, I'll add
> this board to my KernelCI lab.
> 

Applied now, thanks for testing. This should show up in linux-next in the next 
couple of days.

Regards,
Matthias

