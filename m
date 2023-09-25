Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D75CE7A81
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xL2fRR5i7Z8ytWJZ8fikuI0CzZNxyMwNZkn7LWwPIBc=; b=x36aIAbb0zPm5IzoCP/4Vdbn4K
	fni65Y3g/GESKq+osURIUMQ126Juw4+6HIjMPRUVA3oyuGfaB3xhVUaBbC/rUE95Hm0AEeOF7C+tm
	1wKCJX0wUtC7tN9j4Xp+4nkQIHRWvFvWFxlSQS6Cr/9b9DU3Md8latApU1xH7/3qCyAjCebFDpUji
	ZwuuVuR+gS3QISjSF1OOtaLhuSuPNfbeHFlhU8uwkLcv9UV8SUJ2sh+SBQD3uP2vvKVlgF8dDXvgH
	falScaA/MW3ZDCFqoHtMOUkf7tvGgZscjIwmMSwKe6AQdGnS0HGJ3Z2QEz7nweyOLzfXtCtabbHeI
	owPzuUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkfIy-00DTOm-1l;
	Mon, 25 Sep 2023 06:42:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkfIv-00DTNb-2I
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 06:42:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4053c6f1087so47970045e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 24 Sep 2023 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695624168; x=1696228968; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xL2fRR5i7Z8ytWJZ8fikuI0CzZNxyMwNZkn7LWwPIBc=;
        b=yyjH8js1MEmyjQ++x4V56miT/1TAXiG6OawDxQsslSNAQkR/LhmoDKYBKsdl+sr+cw
         ua/9hqHwslKbxkmQHcIpcGj5qG9OjmH3X9LkN/ADHMno4XbJhaMLmx6Hp0VwgLElECNv
         jBqASBi8Z0/Z/uJtVH2Ber+rwNU62RI2FBGPv7jUGnYdS3I2iULlfCBoGUKG5+1B7G6b
         fMC27S6RthIENZCndu8rB/4iqYXRqHqePgBriwOObrdixaPqLaNWmwrmBTFjYtdcpb3V
         MqRCtquBxjWeCFncEGGnHuwmq9+hY4CeIWKp7qFwrfG7qs+Wi5lthKpHz397DckcQI1N
         lqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695624168; x=1696228968;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xL2fRR5i7Z8ytWJZ8fikuI0CzZNxyMwNZkn7LWwPIBc=;
        b=WTKCwWr4GwRSNT9HdNZ/t+yaYAG1x27oxRGTMs+6Q/O9Q5pXfXhwBZTMvsYX5RuHP7
         CttuXHdi5DwEiik2QBlZXvoGTXAW2JO2IhN+uVk0ucLrdSGEurqM0WPxAFnYQ9/27LKj
         12yjI+xPvDIWFSi2xwPDDgmePRwEjrK7kTXa+vGxQGpFV3EY80DYrN0VMRIVgRmNGfbC
         q3iZ5dYF50kD7BZ0QzPvvXOAVKcSbnkew4v0GGpf1P2CZQdUYLBANcQVAOBFN7jJyHvH
         YrVuKVm747riVMBP6vvuziz/eAcwrnn+ua1XLLw5/NUrVRZ1qsiwpEoI6BoPgvpa7WXU
         fUtg==
X-Gm-Message-State: AOJu0YzHhJjMW22qmXwP81BqnH3wuuU8l9pqcs8NKMMERKlFrY9v5S7k
	0dwDryI6lfi54PrUiC2hrqcJpg==
X-Google-Smtp-Source: AGHT+IEukJx2vgrSb3uUJj0dsvdzKXDJQ9VzA6AXnsQw2puF6X0hzj2sui/dwJxOawyQrv4B2sAg/A==
X-Received: by 2002:a7b:cbd1:0:b0:401:b2c7:349b with SMTP id n17-20020a7bcbd1000000b00401b2c7349bmr4399555wmi.7.1695624167950;
        Sun, 24 Sep 2023 23:42:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id w10-20020adfd4ca000000b0031762e89f94sm10899573wrk.117.2023.09.24.23.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 23:42:47 -0700 (PDT)
Message-ID: <c6983f0e-9a62-4fe8-bb1a-01c44ec43985@linaro.org>
Date: Mon, 25 Sep 2023 08:42:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] soc: mailbox: Add SPR definition for GCE
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-4-jason-jh.lin@mediatek.com>
 <797fc698-54d2-4848-3a4d-43ca631eb96d@linaro.org>
 <d2fee308c86c23e98e99497d2de138e31ad72537.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d2fee308c86c23e98e99497d2de138e31ad72537.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_234249_772322_ABA051F1 
X-CRM114-Status: GOOD (  12.11  )
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

On 25/09/2023 07:08, Jason-JH Lin (林睿祥) wrote:
> Hi Krzysztof,
> 
> Thanks for the reviews.
> 
> On Sat, 2023-09-23 at 20:02 +0200, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 18/09/2023 21:21, Jason-JH.Lin wrote:
>>> GCE has specific purpose registers, abbreviated as SPR.
>>> Client can us SPR to store data or programs.
>>>
>>> In CMDQ driver, it allows client to STORE or LOAD data into SPR.
>>> The value stored in SPR will be cleared after reset GCE HW thread.
>>>
>>> There are 4 SPR (register index 0 - 3) in every GCE HW thread.
>>> SPR is thread-independent and HW secure protected.
>>>
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> ---
>>>  include/linux/soc/mediatek/mtk-cmdq.h | 5 +++++
>>
>> There is no user of this... Why do you add unused defines?
> 
> It'll be used in cmdq_sec_insert_backup_cookie() at [PATCH 10/15].
> Should I merge this patch into [PATCH 10/15]?

Yes, because what is the purpose of adding unused defines? I asked
before and did not get answer...

Best regards,
Krzysztof


