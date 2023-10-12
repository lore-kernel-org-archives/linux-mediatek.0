Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5D1CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmBkcHAkPFx5rOPRPDBllwN3fSbL73RuCNWurkhctsI=; b=mmnYCZRFerUvL3xHX4Z9qXSaQR
	MQvaPXJx4aW+pzyfR0syG8vC6vBxQFvdxKfw0dL0YWhsUSbV9aIGzoJ+CbIgXigthGHXDfOdfuMgj
	Z8DU08buqnHwcu57sZrFBw02dh2A3Y9s2KfR+zuCsgofi8dLkidno5K3Bfk1MTTHMjbvCDz+AqCJ2
	ys2Woha3xmx9O5CMspVSNyRu8hTe18EDVVWg8TGxC/qtAHT6mbNGgspH6TLBV9R6ltDSPorsQ7+le
	DGkNLKhjb9XdkO3epyDOmM+tT1scCaVjxJLHWZFDKxf/UvfTBfG489RuvIUs9X75D7wjs+AXd2ti5
	blghKpRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsuo-000fAr-1G;
	Thu, 12 Oct 2023 10:27:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsuk-000f9T-2s
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 10:27:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32d895584f1so715401f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697106451; x=1697711251; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lmBkcHAkPFx5rOPRPDBllwN3fSbL73RuCNWurkhctsI=;
        b=lCmScTlgxqvSWHWCuHCrtpVpNMCrmw+4pFXIIASG5hvT8SupVxZAgE5az1d1GcJM+8
         HG99q6mT+Btdl1MedscvZNrMSMQMINYoLP/DYeEmjUgOVBaJl5Zmc2F6h85XJF6fEBeq
         dR/0LHBLKwzh20Jf/exCkkA4SZPXD4JdQDBSvsvjAF8k76uQYuy4Vv1c+hg+sXzIvtYB
         YWVm5whf1AZtpg5kKirgyEsUi0cW9Oa+9kAJq1c2xMyY3Za9pTIwcGjSCr0vTTMtXMfr
         iSmstr8G+FJ0zo4/h7Yz0e+n6BUcpm3Dwxj1JjYJc2UfnsLGupGzA2VKbBQbM1xwKu0l
         ypFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697106451; x=1697711251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmBkcHAkPFx5rOPRPDBllwN3fSbL73RuCNWurkhctsI=;
        b=GsbRbxpQUPcYPnE8cAeOpr4SEFOhPwk23vQCdBq8aZNNNPkGwm4TKdv8tE8doesTVu
         1VcczQE/Pi7FPPrdvLoWb311rp86latObUAB49djTuel8OSdyjh+TAwAKwEoQKTnIRMP
         onh68vWQTQVDogB/4SK+bAFCiHiyGVQx30GfDGYpQ9o4K3N8afj9Nb6pCFJtU2J6hZZO
         2w99s6OdbIYN+f3xUin5M3bWGP1mnDGqc9gKRqadKy+LZP114Jd6w0m/mVm10KoRLXnH
         7NGhxv07rUMtj0La74sj4uiPv3Sy/SjkeCTN/+gVQMi24oblPO1YiOWxeHfyyqQePQJx
         7UMQ==
X-Gm-Message-State: AOJu0YxTVEfnuiKV/lvi7HIhVLBAEPS48GqlwFJL7sTzZl0dbyLDA7iR
	2v8ZzvB6AmynyCop5O7GguXOcw==
X-Google-Smtp-Source: AGHT+IHI1GZ3O+8Vul/1ATMdkAYGJnPS9jhdVvjZ8iYcdUltF97CUA2PT7IYjpRMObjiWrOl4/DhyQ==
X-Received: by 2002:a05:6000:91:b0:317:5f13:5c2f with SMTP id m17-20020a056000009100b003175f135c2fmr19207742wrx.0.1697106451193;
        Thu, 12 Oct 2023 03:27:31 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id f16-20020adfdb50000000b0031ff89af0e4sm17968546wrj.99.2023.10.12.03.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 03:27:30 -0700 (PDT)
Message-ID: <54ed1269-8699-4531-abc6-09b602adece9@baylibre.com>
Date: Thu, 12 Oct 2023 12:27:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: mediatek-gen3: Fix translation window
Content-Language: en-US
To: =?UTF-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
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
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <088559162e5ec4e2d6d38d8a5707c6e0e12f5ac6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_032734_964806_04F8FDBC 
X-CRM114-Status: GOOD (  29.40  )
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



On 12/10/2023 08:17, Jianjun Wang (王建军) wrote:
> On Wed, 2023-10-11 at 17:38 +0200, Alexandre Mergnat wrote:
>>   
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  
>> 
>> On 11/10/2023 14:26, Jianjun Wang wrote:
>> > The size of translation table should be a power of 2, using fls()
>> cannot 
>> > get the proper value when the size is not a power of 2. For
>> example, 
>> > fls(0x3e00000) - 1 = 25, hence the PCIe translation window size
>> will be 
>> > set to 0x2000000 instead of the expected size 0x3e00000. Fix
>> translation 
>> > window by splitting the MMIO space to multiple tables if its size
>> is not 
>> > a power of 2.
>> 
>> Hi Jianjun,
>> 
>> I've no knowledge in PCIE, so maybe what my suggestion is stupid:
>> 
>> Is it mandatory to fit the translation table size with 0x3e00000 (in 
>> this example) ?
>> I'm asking because you can have an issue by reaching the maximum 
>> translation table number.
>> 
>> Is it possible to just use only one table with the power of 2 size
>> above 
>> 0x3e00000 => 0x4000000 ( fls(0x3e00000) = 26 = 0x4000000). The
>> downside 
>> of this method is wasting allocation space. AFAIK I already see this 
>> kind of method for memory protection/allocation in embedded systems,
>> so 
>> I'm wondering if this method is safer than using multiple table for
>> only 
>> one size which isn't a power of 2.
> 
> Hi Alexandre,
> 
> It's not mandatory to fit the translation table size with 0x3e00000,
> and yes we can use only one table with the power of 2 size to prevent
> this.
> 
> For MediaTek's SoCs, the MMIO space range for each PCIe port is fixed,
> and it will always be a power of 2, most of them will be 64MB. The
> reason we have the size which isn't a power of 2 is that we reserve an
> IO space for compatible purpose, some older devices may still use IO
> space.
> 
> Take MT8195 as an example, its MMIO size is 64MB, and the declaration
> in the DT is like:
> ranges = <0x81000000 0 0x20000000 0x0 0x20000000 0 0x200000>,
>           <0x82000000 0 0x20200000 0x0 0x20200000 0 0x3e00000>;
> 
> The MMIO space is splited to 2MB IO space and 62MB MEM space, that's
> cause the current risk of the MEM space range, its actual available MEM
> space is 32MB. But it still works for now because most of the devices
> only require a very small amount of MEM space and will not reach ranges
> higher than 32MB.
> 
> So for the concern of reaching the maximum translation table number, I
> think maybe we can just print the warning message instead of return
> error code, since it still works but have some limitations(MEM space
> not set as DT expected).
> 

Ok understood, thanks for your explanation.
Then, IMHO, you should use only one table with the power of 2 size above 
to make the code simpler, efficient, robust, more readable and avoid 
confusion about the warning.

This is what is done for pci-mvebu.c AFAII.

If you prefer waiting another reviewer with a better PCIE expertise than 
me, it's ok for me. With the information I have currently, I prefer to 
not approve the current implementation because, from my PoV, it 
introduce unnecessary complexity.

Thanks


-- 
Regards,
Alexandre

