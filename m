Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B325CC00528
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 09:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xPeMw/tdJ7IioEcDvwAyboMLZ4pz6UEfuXX/4uGyxA=; b=RGpy6ZgsUiAClMJbnj+di0IaVT
	aVgGlDjjWW6yxnONN9NwCQzwaZUdz4/qHIf0vSoxOZCST77y7GR1zYLuoMQNWd23H6fyyfoPhDq5N
	/CY2os+xnhedYr12Qw79x0MnWVt24p6tjewrTo00/NTzKgO7Y0CcclE7oeRZNE8p9cMGXH/1CacXy
	CQCMCvhz5kMVODLQrtziOl+JmsxlvsjIMabJweEaRzsIhptJCR89UFV2S3cLqbYq4eAYds9AOPkjY
	JURdXB91AW4gke0CludsH1MwdyHU3UL2TvCk6pBzAunog+uJLE2Dj+KU6sZ5b4+a1qBL6b0I8QILu
	k+xp16RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrNO-00C3Jb-2m;
	Fri, 04 Aug 2023 09:45:42 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrNL-00C3IJ-1I
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Aug 2023 09:45:41 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-522462d8416so2378356a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Aug 2023 02:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691142335; x=1691747135;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1xPeMw/tdJ7IioEcDvwAyboMLZ4pz6UEfuXX/4uGyxA=;
        b=FLyAljQ1t8b3Xk/pCIKYZrMFdYexo+hFibSNEUp2p3wd64yBa2ddbVuCdDrlswKKlx
         +tSS4CUQ1j8xWfs/JLtTG0hZmgDZOoJcRz/AvsNvA8uA4o7Ubo9dEDD5yrYtIOn20Qj0
         gbelwu6DcDfbQRUyKbYb6Iio0eb2WVn4o0WSswkPqcnGMmYZumCBnFZj+cAP+Trxdjpf
         We1i0/GrNkkIfZmIt1B6hrEr0Z+Fl/QiC2l9ZxPJQVc/oYLW6VQF+ZKYZEV2nKnq4T2k
         QvdENM2dG5mzNO61iE2XdVwJY950YBmDWnP5uB8XQS/mdCP38qao1kbUIk6TXDAXvY8e
         T1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691142335; x=1691747135;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xPeMw/tdJ7IioEcDvwAyboMLZ4pz6UEfuXX/4uGyxA=;
        b=NqTwZlrdRDnKPMr0R/sok0TUwLlQauXNilmJNrGnDu9pz8KUPE27yrpjyWhgxLoZy6
         aTkxaU2GoCaY5IAuyBxXHhznzEgryc5/7wXLONQjyN9qySdEqwU6pizGALRd0yAh5U4M
         nZDvm5NXJm77fhAjtO648EjQt4oaIYw3emnq2fktoSuQMEC/VT4T8YOgQjf2bdHbuCYx
         HKAx62HinjjEvEBmxrF0mSfDs1g3Gwu+nF5MVcbqXgLTVaPSzcc1tfG+IWTIlWo4V89M
         nNKL9aw3pZr+E6XGa7HirNGKVCyUOpY0dRAesCYyPw2rNymefMPx7NcPrdLVgQDN3MTH
         aCGA==
X-Gm-Message-State: AOJu0YzA1iu3weI0eKnX47+xyBu/HHDc9HuxbafCxwhE4ImkTS4Q60Xg
	VXvm008XH2GVNhA+PTL8VidL8g==
X-Google-Smtp-Source: AGHT+IEKy6dK//8+SePubKh4DJRoYWXex01cl/WJEu49hdwZPoBKQhqGx2/J5yCGkCRtvETRm0rtUw==
X-Received: by 2002:aa7:c783:0:b0:522:bae5:282a with SMTP id n3-20020aa7c783000000b00522bae5282amr1270942eds.1.1691142334837;
        Fri, 04 Aug 2023 02:45:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id bc5-20020a056402204500b005230f06de15sm1016539edb.78.2023.08.04.02.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 02:45:34 -0700 (PDT)
Message-ID: <c2cb5781-f2da-eef8-50db-6bfbaaed685e@linaro.org>
Date: Fri, 4 Aug 2023 11:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 6/6] ASoC: dt-bindings: mediatek,mt7986-afe: add audio
 afe document
Content-Language: en-US
To: =?UTF-8?B?TWFzbyBIdWFuZyAo6buD5Yqg56u5KQ==?= <Maso.Huang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "chenxiangrui@huaqin.corp-partner.google.com"
 <chenxiangrui@huaqin.corp-partner.google.com>,
 =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
 <Allen-KH.Cheng@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "arnd@arndb.de" <arnd@arndb.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-7-maso.huang@mediatek.com>
 <a4f071a0-9e41-4de1-6721-f8d47475f41e@linaro.org>
 <5d005f518d974b7912c832101b5cfbde77f57270.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5d005f518d974b7912c832101b5cfbde77f57270.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_024539_466693_A5EA0403 
X-CRM114-Status: GOOD (  12.18  )
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

On 01/08/2023 10:25, Maso Huang (黃加竹) wrote:
> On Fri, 2023-07-28 at 14:51 +0200, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 28/07/2023 11:08, Maso Huang wrote:
>>> Add mt7986 audio afe document.
>>>
>>> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +  - clock-names
>>> +  - assigned-clocks
>>> +  - assigned-clock-parents
>>
>> You should constrain your clocks per variants. I doubt that they are
>> really so flexible/optional on each SoC... or maybe missing clocks
>> are
>> result of unimplemented parts in the driver? But then this should not
>> really affect bindings. Bindings still should require such clocks.
>> Your
>> DTS can always provide a <0>, if needed.
>>
>>
> 
> Hi Krzysztof,
> 
> After internal check, assigned-clocks and assigned-clock-parents are
> not required on this SoC. 
> Maybe we can just drop these two options?

It's separate issue, but yes - why requiring them?

I wrote about missing constraints for your clocks in the bindings.

Best regards,
Krzysztof


