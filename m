Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960B2C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihlezRqcITV1t5VrxWs36/KEu/R5kWIKk2jGkvvj46Q=; b=wrsdDuqdGCOkB10zExk3wdBWVG
	YpVHLH56TQNbBmSRkWGUqppCxTo3fY4el0TQG/xPNrEwiVUWuWIEKsoo7fFtiFq60rC1C5KeBWZIn
	5HGZo4KMf0jBm6POam9QfHO2KbyT7ZELHtIl9DaKXPNSZ6GOpE7IPLpwIC2b0NArTwbkQpBmtf6wr
	iL2GISsyB22WvS6srSi9hwPwEH9iO1P1SXIvbHaRhdAHz0DwzqHYvCZXvZYeHS2Mndjs4DHQDtnbz
	L0UnG3KnYUVc3WnESH2Peoq2vKAgRDybLbLHBG2TnlORJQfzFmAXLzYad0+VB16Qxa5s8crdBK1Wv
	t5t+cQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5yh-00DXmM-JU; Mon, 21 Nov 2022 12:32:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5ye-00DXjE-Pc; Mon, 21 Nov 2022 12:32:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e11so6711174wru.8;
        Mon, 21 Nov 2022 04:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihlezRqcITV1t5VrxWs36/KEu/R5kWIKk2jGkvvj46Q=;
        b=lQzcaMH5l0I+lGRkhWY51kvuNPkwMrle6rYkvK9vgGG0PjxuZ7UOfpDYgwSRrtIBlS
         PwiyzHFySexh9j3pbdm6QVbSdtjBvN1gHcamwOseND5bJ35IaZ7X4e3MfAnIbBBTUD8u
         blM94qRWeBDLpX/rdNDGWxtM9UUUD3YtgQkkSfbgVBk+fzHqd3D4iYLynAOePNkLmv3Z
         7SSufJT8npMq7u/VBLU4L2phNF+pNUsnQ5mNOK5A7wPA+U2THVMCB66iU0zlDPWKxhrv
         cOjgzuypq2p78E0ZZICv32HHA6kb/tFFrmQlKNEauHHtw0aurVK1dOCpXkv05/LtmEBV
         8EiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihlezRqcITV1t5VrxWs36/KEu/R5kWIKk2jGkvvj46Q=;
        b=SQzuD3KPzcx8+KBV9SwbskQk1Qj26nPcfgE2PQHdvzNfPfU27buIPX1aUG3WdE/2/m
         8W8uzyVYSxV7L929VbMVRPGle1YrTMD0peUSrOkIrF75Y77S3fKPxCzAzAQMs9vVRuN1
         bIq9KTWEnqAExCp3ZOZRRLZbeQ3Ml7g/79UyQAxHDtZa1cxsSI1GfFJ6jBjIBRVuSiHV
         KPi9Py85PzRFbvTU5FcqlkuKmVxmsLHftM2/pkKdmYgrk/cTF95fNwm7rW6X7DMU2EOd
         oijjBO9isvTkXsZI3YxJtaSRM8BAsKhgZGwGIy8LdEy8kY6kNHemHZ0zc9rWp8AQVQHC
         cbeg==
X-Gm-Message-State: ANoB5plBvrNUSv/b63bThkVqrognKhOOpZP6Z2iUItImiMbVuiWhDggk
	AkapoIsa4f1tWgWxdR0Tu80=
X-Google-Smtp-Source: AA0mqf577Y1OPlh4rlwG6Iw49Hb6fyYNvMdkAsPUPbkoFgBFS31v+A5SYUnOsRJMGzn+5OuD40OwIQ==
X-Received: by 2002:a05:6000:1b86:b0:241:9606:1123 with SMTP id r6-20020a0560001b8600b0024196061123mr5219385wru.537.1669033960260;
        Mon, 21 Nov 2022 04:32:40 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id w11-20020a1cf60b000000b003cfbe1da539sm13487333wmc.36.2022.11.21.04.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:32:38 -0800 (PST)
Message-ID: <5b28a9b0-3c31-75bd-3161-0ff9bddf0c54@gmail.com>
Date: Mon, 21 Nov 2022 13:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/9] dt-bindings: pinctrl: mediatek,mt65xx: Make
 pins-are-numbered optional
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-4-bero@baylibre.com>
 <8afd5100-9cef-50bd-2b53-e1a550973835@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <8afd5100-9cef-50bd-2b53-e1a550973835@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_043244_851519_64B2576C 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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



On 21/11/2022 09:00, Krzysztof Kozlowski wrote:
> On 21/11/2022 02:54, Bernhard Rosenkränzer wrote:
>> Don't list the pins-are-numbered property as required
>>
>> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
>> ---
> 
> And how about making them deprecated? (deprecated: true)
> 

I think that's we want to do.

Regards,
Matthias

