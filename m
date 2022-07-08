Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89D6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Akov7SZtUyEX9D0+3zzLnuIGNu/dLwAPRoI7n7xKXwA=; b=TjYzUE2Cd3x1KCWfUrtHAJekT5
	7pcDYipd98Y8rsywxp9kO1IP25DigZclXgHOyQecFokXpykMcHN2H0WjjjDZtqMrul5zPRFVyXysa
	2GOjIM/LplnFi4fqcSEYnGijBp9bDd0lHKrGGzaZi7y8urdtJLyl2Dm/ZSo/83yuiChDxIvkTYyeP
	jSZzdy8Kk/YKfgMhlFNQXYqL88nsk70Nj8+WZPP6psnvlxigmoAn6X9gNoT/tBGpY1TsMyaakY540
	g4SBoII5zePo9gCFVNcHB+dQrEx20HX3lX5a9lFfD3U+5gt1U255msM5DlsPsF4sRBpe6i0hnnfKS
	j31UlFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jHy-002Vvv-5S; Fri, 08 Jul 2022 08:24:38 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jGL-002V8c-53; Fri, 08 Jul 2022 08:22:59 +0000
Received: by mail-io1-xd2a.google.com with SMTP id l24so19059640ion.13;
        Fri, 08 Jul 2022 01:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Akov7SZtUyEX9D0+3zzLnuIGNu/dLwAPRoI7n7xKXwA=;
        b=TRV50Pwd5sFVo2E1gPlLsmgMiLSKMpheIV4nJ2xcXHBx97J8Am/NdIsQmb5jiSueRF
         khKbAvo7q6avJHCZi7XdEzpRx9PIwpak6EdVOisplHkLfW6Vsbsr7bljDySt/V/2BEbJ
         q1gMNptzMFfKjBChwI0lnmtdrb+RPDAPzhWyYuoqe10Lo71y9vleLsbPmakin0OmMVKL
         uWXfsHI9iEjKUEe6mpVLpjQo1HRjDLZFP499HogUkQ598g5o9PWJ4CrLEXomSYOP9vGh
         mMPyIME28eRynOIhLPAsTuFMOwg5M8CMFxst36RJIp/b74fT0wj00cAxc8zxkpGNp29I
         YsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Akov7SZtUyEX9D0+3zzLnuIGNu/dLwAPRoI7n7xKXwA=;
        b=ot2qQfJWinmzCxDybO41uCmeAnw4GjIa9L5MflEk2sSLyEQ7jlu1sTiRf5VikHG8Xy
         y2ha505Fp1yBE0zUqsEpn1CYSmEFY2FOPCNlTB7VYirNUe4RH5IovxPrpOxv5REm13MG
         U03Pn9J9xRJjycQjk1zQjJX9b27fMo1CFK5FWUHq5CZg16P9qDBMQ1ViI3uhFIlp8mRb
         4jqh+x0Kb95zo20l2Ce0PyWCwg3vw+Z5lwmc1bh9Jbf+4vLRr600wE5dajBbJgdr57fQ
         5UIzRb+EsRCshbjsPJ+KaCFmSO3Fdfmamg5bgGwNkhqtqRO8H5lS/Xk7a5qZwrFfl/kd
         QZWw==
X-Gm-Message-State: AJIora+JKckEdgF01rZRNOsxmH/HRW0X97nOYYMsOMeMWRzr0XLa/fCT
	gshBNXGrkCf7FTQVejTC7To=
X-Google-Smtp-Source: AGRyM1tfdSkTBt7EaCr+m3mYoeilSPCzVf9/PiNlHAX15oqMZh5CVi/9v4QlhKpiOcCqveypnOPygw==
X-Received: by 2002:a02:a70f:0:b0:339:de0d:4ed6 with SMTP id k15-20020a02a70f000000b00339de0d4ed6mr1413393jam.292.1657268575018;
        Fri, 08 Jul 2022 01:22:55 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r3-20020a02aa03000000b0033cd78a3612sm10838734jam.18.2022.07.08.01.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 01:22:53 -0700 (PDT)
Message-ID: <184ce9e3-6031-98ab-cae6-a4aa2015b5c4@gmail.com>
Date: Fri, 8 Jul 2022 10:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] arm64: dts: mt8173: Fix nor_flash node
Content-Language: en-US
To: "xiangsheng.hou" <xiangsheng.hou@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bin.zhang@mediatek.com,
 benliang.zhao@mediatek.com, linux-mediatek@lists.infradead.org
References: <20220630090157.29486-1-xiangsheng.hou@mediatek.com>
 <20220630090157.29486-2-xiangsheng.hou@mediatek.com>
 <24bf3c0f-7070-0bcd-2fae-9fe086d146b2@gmail.com>
 <e4a50d4e165887ac4741c0b8d68470dc2f060655.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <e4a50d4e165887ac4741c0b8d68470dc2f060655.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_012257_283460_C840359D 
X-CRM114-Status: GOOD (  13.52  )
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



On 08/07/2022 03:40, xiangsheng.hou wrote:
> Hi Matthias,
> 
> On Thu, 2022-07-07 at 16:43 +0200, Matthias Brugger wrote:
>>
>> On 30/06/2022 11:01, Xiangsheng Hou wrote:
>>> Add axi clock since the driver change to DMA mode which need
>>> to enable axi clock. And change spi clock to 26MHz as default.
>>>
>>> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
>>
>> Applied, thanks!
>>
> I will send a new patch v3 since there need a change in [PATCH v2 2/2]
> by review.
> 

Thanks from letting me know. From what I can see, 1/2 in v3 did not change, so 
as I already applied it, you could have dropped it from the series.

Please correct me if I'm wrong.

Best regards,
Matthias

