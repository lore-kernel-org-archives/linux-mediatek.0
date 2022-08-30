Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2FCECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y50L5GZVbvvACJzqECIw6k5gdho7yrllYoPqCWoxaDo=; b=xDxL9zFXMaZc+4mZKD5qnKJ6S4
	vnczoHJySEo+OQ3jj0GYkIroWriQNZ0ZX6QIyfCM4xxp/6JSiJP9dakKkHdEVWlzEgjbY/W/zcwB0
	L4zcc9B3b/ZuBIcytLzGCqhI9TN8sFdAcvR7e/7RVBX3arOcG5Fg+XTuc2Cg9pAHThXxOelg+XSoO
	/7OhmFxrLy1UkEckOZDL/fsKs91UMQ2yTH7bESR5EERYxGz3eJxQn8I3OdbGlhzXiKp/BOcFkGqci
	Wu6HnOh64QpmZttTVwBwOBx5wy3XncOOK8Hd4Ze+D8ePnl+f5x6e9Foex14bdaUYWrhNR6uMeTMnX
	nR7fXPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwxd-00FKyd-Sr; Tue, 30 Aug 2022 08:51:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwxM-00FKqg-3x; Tue, 30 Aug 2022 08:50:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bu22so12894169wrb.3;
        Tue, 30 Aug 2022 01:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=y50L5GZVbvvACJzqECIw6k5gdho7yrllYoPqCWoxaDo=;
        b=f0jtaBsjiMBC3be5ItKoe1oj1Gdhn1LRjaXKzjv50t2jVwnOQdKsRvEPxxAOoQXv/s
         b6OPiQZGWzOxDzzxMxy4LkHZZ/TJSdjCD+ndZVdmAveCUIW3hO7wJn9Zui/UKkz3GX4L
         YPHvWtIWIQdPOaI9s6IMzQUL2mHoQaQWHtwrFrX5D8r9Ywb73r0ENDcR/uaxk0GqO1HN
         jjwcwM+GxemCvjuYfrT8ptsn0UV8Bz3QtHcrauQlLbq3a6uYWrKyn+P8IhwKyH/9CMMx
         cxHD08S6H9fv2a1OhlU66XEtsZgwe+SSl0dRQuUiAH5hPPq9/d2Dp9URU8rDmuhERegK
         rdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=y50L5GZVbvvACJzqECIw6k5gdho7yrllYoPqCWoxaDo=;
        b=Pvz/9ycRSEiZu99NJcSXKiyFsK56VAR59qlq2KWYpsZVejaUmt51wE2pzchjsBWP+G
         VzNtSGpDUqxhvnuYt9yxUaA/IjPOUAvE8BtXrt92uY3CSBjwfiDx1Q7aQxULqJc4dRQz
         azRo44MFJMz8H9gGqE9XwYdT+/j9DfTBGOfOnlkFaQFWRhk/o8UNg+gmEP+pWpVQHZTZ
         vEEHa1/GGBeQRp8ZqW8onPmTL0iZlnB0oKi2u8KIFeEuxn2OEQ9nDZKI8P0KqSvOHJ5x
         sgCCYlDvERFyB3FDElI8s2FSlzHIJjCFk3N49qOiPPkxc6mwtL18hMf30s/ZMSstWP46
         EZlA==
X-Gm-Message-State: ACgBeo3VpnEYzaNof1QWRwILEgfccptLTjpMc9lDHnaagwm5iCgy0GwA
	LyWCcQkGD1vGPuotrqBCtg8=
X-Google-Smtp-Source: AA6agR4JM5gMgpsO9Zqy3pj9N336WW9LiFLW8FuJvAQhVnkzNddi+ZGLzibe3hEckMcQF6t9Xugq7g==
X-Received: by 2002:adf:a490:0:b0:225:2da4:10ff with SMTP id g16-20020adfa490000000b002252da410ffmr8390266wrb.1.1661849443627;
        Tue, 30 Aug 2022 01:50:43 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n25-20020a05600c3b9900b003a50924f1c0sm14464215wms.18.2022.08.30.01.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 01:50:42 -0700 (PDT)
Message-ID: <88030f8d-45e3-e880-48cc-d119858e8139@gmail.com>
Date: Tue, 30 Aug 2022 10:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] arm64: dts: mediatek: Add missing xHCI clocks for mt8192
 and mt8195
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220708194314.56922-1-nfraprado@collabora.com>
 <5a4e0bfe-e332-42af-5888-b59b3afff24d@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <5a4e0bfe-e332-42af-5888-b59b3afff24d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_015048_455967_6CE15072 
X-CRM114-Status: GOOD (  14.79  )
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



On 11/07/2022 11:34, AngeloGioacchino Del Regno wrote:
> Il 08/07/22 21:43, Nícolas F. R. A. Prado ha scritto:
>> The MediaTek xHCI dt-binding expects a specific order for the clocks,
>> but the mt8192 and mt8195 devicetrees were skipping some of the middle
>> clocks. These clocks are wired to the controller hardware but aren't
>> controllable.
>>
>> Add the missing clocks as handles to fixed clocks, so that the clock
>> order is respected and the dtbs_check warnings are gone.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

applied, thanks!

>> ---
>> A previous attempt to solve this also made all clocks required and
>> updated all MediaTek DTs using the xhci binding [1].
>>
>> To avoid the DT change noise, the binding change is now being reverted
>> [2] and only mt8192 and mt8195 DTs are updated in this commit to get rid
>> of the warnings.
>>
>> [1] https://lore.kernel.org/all/20220623193702.817996-4-nfraprado@collabora.com/
>> [2] https://lore.kernel.org/all/20220708192605.43351-1-nfraprado@collabora.com
>>
>>   arch/arm64/boot/dts/mediatek/mt8192.dtsi |  9 ++++++---
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 18 ++++++++++++++----
>>   2 files changed, 20 insertions(+), 7 deletions(-)

