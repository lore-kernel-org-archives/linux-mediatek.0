Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525D0CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 13:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EwAhxT4YGeUjPFFndZrOLQbhs4tGDZqtUU/Z9A6IQ4=; b=nsWfmIeEbqCBl2ZQtRtEAyqnbw
	o+EfRmyR+1sx7P7N1hIlZbRsp2u1hmVxgLqWBn7qwbr4qbeQEFQCH6uh3YlPwopO78gdMcOcXiz/f
	Xr5hsLsDCp4s6pQFxSM/jvGN/TCYhyB38c4ITvcDlIuUI0W4Jc0YecAvwR56Thpa1iirOPU0h4OFH
	PPN446jh4E/aJUflib3WkZ4vF9UmEHTN5juSpCsvzkrTBDJSZr2KG01Yt2wajyDpaB5gy5zeL6ANy
	OBsDGyRiQM4JsYNz0rDtYxs5oMh+FCQHccqdP4VYjgKr1fy7CQXsiMHuheavdGPWe+lY6OfzIZi0p
	fPIHDBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvle-0015AA-3D;
	Thu, 12 Oct 2023 13:30:23 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvla-00157w-2Q
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 13:30:21 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32167a4adaaso888023f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697117414; x=1697722214; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4EwAhxT4YGeUjPFFndZrOLQbhs4tGDZqtUU/Z9A6IQ4=;
        b=eV5UrJjdrMOlA2/x28CS2uvoHR3O9UnHF6YcDr3aHiXn94a+s/LJ9MsqzvbxvudMRN
         dGjrx7uorkZCD3p4ZNOJ57A3axQ+bfjMJ96Q7fxgQActAojZFZ7M/9G/rPjdscxQuhSx
         s+u7PCZzZcckRBV5k+ZfnRpalFCmBkNnUzfoZINZItnal4NOlTCWwNwPgnjk2HTsZ2aV
         i7uZ5TCI2ZkwQyNWsbmLcfZdS1FKUNu4t+N8ngXi2d/Sw1fs2ude0Qle1koTd2m/MDwe
         D/fDijlhGO5tBe3Fmgh1ZS48yzgDKPWIG1DfgtHKQSOVTi7kdbnZFWq4iRddQmy52hf2
         xplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697117414; x=1697722214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4EwAhxT4YGeUjPFFndZrOLQbhs4tGDZqtUU/Z9A6IQ4=;
        b=Tno0OfnCQhRzL1nSVWKVQkl7ALAp8jpcRSR19+G0+y8SvUj7rBZ9Mjm2gKpnwmfuFW
         XRLwMmb1APah6YS/KN9tG2VcXgXH8+L1TGQkfYLm7sqkTF8twbssAdPUqRgZ6fhXsEL7
         CBSuAd6oms1XiMTDosYxnAoxeF5SBlc11NLfT/nSNK7TgijLpSsvXSv66LJBcG5mxc3z
         D68zoPy9hbrw8OpD4OSiHgqMn0hEIq2e8aHgYTkWDu4pFzJ+68uqIPJXkdrzsIuAQqGV
         1PRrlCaqOynQIGEHNmE8vrDRMs06hvc/gxZ/0TBor0HY+8lFG5NxflfCfYTQpaME1RHR
         FnDg==
X-Gm-Message-State: AOJu0Yy6xdDTi1FdyxKTDpDPXJIGWNKBv7WD43312UbA/9x7hKNRFu6i
	oRYxQbpr+MCWQX5BKQjHzFWA+5poP6L1fIba9MM=
X-Google-Smtp-Source: AGHT+IFHQ7HxXxsqXfAzOkIVktufvVAO6I0nfPVfdVYLFENpEEGacyyf0/x61sNni9aSspa4HfOOmg==
X-Received: by 2002:adf:f7c4:0:b0:32d:9740:5a27 with SMTP id a4-20020adff7c4000000b0032d97405a27mr295406wrq.9.1697117413894;
        Thu, 12 Oct 2023 06:30:13 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id hn32-20020a05600ca3a000b004053e9276easm21902592wmb.32.2023.10.12.06.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 06:30:13 -0700 (PDT)
Message-ID: <2e9766db-da12-42e6-80a8-b9ef6f2de724@baylibre.com>
Date: Thu, 12 Oct 2023 15:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: mediatek-gen3: Fix translation window
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlleXkgWWFuZyAo5p2o5rSBKQ==?= <Jieyy.Yang@mediatek.com>,
 =?UTF-8?B?Q2h1YW5qaWEgTGl1ICjmn7PkvKDlmIkp?= <Chuanjia.Liu@mediatek.com>,
 =?UTF-8?B?SmlhbiBZYW5nICjmnajmiKwp?= <Jian.Yang@mediatek.com>,
 =?UTF-8?B?UWl6aG9uZyBDaGVuZyAo56iL5ZWf5b+gKQ==?=
 <Qizhong.Cheng@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Ryder Lee <Ryder.Lee@mediatek.com>
References: <20231011122633.31559-1-jianjun.wang@mediatek.com>
 <899c7275-ccca-43bb-b1ae-a3403dd18622@baylibre.com>
 <088559162e5ec4e2d6d38d8a5707c6e0e12f5ac6.camel@mediatek.com>
 <54ed1269-8699-4531-abc6-09b602adece9@baylibre.com>
 <930f6df4-3267-59df-ad75-244f5b9cee84@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <930f6df4-3267-59df-ad75-244f5b9cee84@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_063019_050934_B1DB0A2A 
X-CRM114-Status: GOOD (  24.84  )
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



On 12/10/2023 14:52, AngeloGioacchino Del Regno wrote:
> Il 12/10/23 12:27, Alexandre Mergnat ha scritto:
>>
>>
>> On 12/10/2023 08:17, Jianjun Wang (王建军) wrote:
>>> On Wed, 2023-10-11 at 17:38 +0200, Alexandre Mergnat wrote:
>>>> External email : Please do not click links or open attachments until
>>>> you have verified the sender or the content.
>>>>
>>>>
>>>> On 11/10/2023 14:26, Jianjun Wang wrote:
>>>> > The size of translation table should be a power of 2, using fls()
>>>> cannot > get the proper value when the size is not a power of 2. For
>>>> example, > fls(0x3e00000) - 1 = 25, hence the PCIe translation 
>>>> window size
>>>> will be > set to 0x2000000 instead of the expected size 0x3e00000. Fix
>>>> translation > window by splitting the MMIO space to multiple tables 
>>>> if its size
>>>> is not > a power of 2.
>>>>
>>>> Hi Jianjun,
>>>>
>>>> I've no knowledge in PCIE, so maybe what my suggestion is stupid:
>>>>
>>>> Is it mandatory to fit the translation table size with 0x3e00000 (in 
>>>> this example) ?
>>>> I'm asking because you can have an issue by reaching the maximum 
>>>> translation table number.
>>>>
>>>> Is it possible to just use only one table with the power of 2 size
>>>> above 0x3e00000 => 0x4000000 ( fls(0x3e00000) = 26 = 0x4000000). The
>>>> downside of this method is wasting allocation space. AFAIK I already 
>>>> see this kind of method for memory protection/allocation in embedded 
>>>> systems,
>>>> so I'm wondering if this method is safer than using multiple table for
>>>> only one size which isn't a power of 2.
>>>
>>> Hi Alexandre,
>>>
>>> It's not mandatory to fit the translation table size with 0x3e00000,
>>> and yes we can use only one table with the power of 2 size to prevent
>>> this.
>>>
>>> For MediaTek's SoCs, the MMIO space range for each PCIe port is fixed,
>>> and it will always be a power of 2, most of them will be 64MB. The
>>> reason we have the size which isn't a power of 2 is that we reserve an
>>> IO space for compatible purpose, some older devices may still use IO
>>> space.
>>>
>>> Take MT8195 as an example, its MMIO size is 64MB, and the declaration
>>> in the DT is like:
>>> ranges = <0x81000000 0 0x20000000 0x0 0x20000000 0 0x200000>,
>>>           <0x82000000 0 0x20200000 0x0 0x20200000 0 0x3e00000>;
>>>
>>> The MMIO space is splited to 2MB IO space and 62MB MEM space, that's
>>> cause the current risk of the MEM space range, its actual available MEM
>>> space is 32MB. But it still works for now because most of the devices
>>> only require a very small amount of MEM space and will not reach ranges
>>> higher than 32MB.
>>>
>>> So for the concern of reaching the maximum translation table number, I
>>> think maybe we can just print the warning message instead of return
>>> error code, since it still works but have some limitations(MEM space
>>> not set as DT expected).
>>>
>>
>> Ok understood, thanks for your explanation.
>> Then, IMHO, you should use only one table with the power of 2 size 
>> above to make the code simpler, efficient, robust, more readable and 
>> avoid confusion about the warning.
>>
>> This is what is done for pci-mvebu.c AFAII.
>>
>> If you prefer waiting another reviewer with a better PCIE expertise 
>> than me, it's ok for me. With the information I have currently, I 
>> prefer to not approve the current implementation because, from my PoV, 
>> it introduce unnecessary complexity.
>>
> 
>  From what I understand, using only one table with a size that is a 
> power of two
> won't let us use the entire MMIO space, hence the only solution to allow 
> using
> the entire range is to split to more than one table.

You can take the power of 2 above, which is directly returned by fls().
That let us use the entire MMIO space.
In this example, if your size is 0x3e00000, the you will allow 0x4000000.


-- 
Regards,
Alexandre

