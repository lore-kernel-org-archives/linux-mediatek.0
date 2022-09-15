Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1955FECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 06:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaIR9ac/WNESLZgIJ7NfWDPlOEsbmM5EMrQeBc4rRcQ=; b=ZrUk9dCrg3czyeyCxmaWszPpc3
	UU4RvKUoYelaZx6CY0BMNn0DnnH3geGl5hD9R79KTv/oub2VgfDgNMehER9qUeYmdxuporlGuo+Eq
	dEwwzjnTRwXke3MwzdbUygQn0su3MHY5K/6uvWobnEjYew2tcJldaoQjLLM08gII0CHXWbOCdgH/i
	m6kS/yJU5dogIBcgrOW0tqcPXt/sTrkJSLdk2GeRes3yW/t1mX3LKKOpEV+sBPjD2QOA8/T22RnSs
	QR2CIf8X7Jsjm/Cngxuf72+MUeqMfThjGd0Zx1qehxwHY7/DpjFZQFS2JX6+EI25gplLNPkx+Ti4d
	eNNewCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYiJb-0021Mk-4r; Thu, 15 Sep 2022 06:25:35 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYiJD-0021CP-BR; Thu, 15 Sep 2022 06:25:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663223085; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QhT+tIPCFvVSGigO6Bnk6e6Bh2/EWYUf/infZjmQGj6iO1TGNFp9mXguDuOUm/DpWvf1OgKkKfqzIb7ZN6l9ctq0lWG5/c7d1CSAjTq9cvsm/EE5alr2+5SNHKUxhuVbtlW8IBJ9ao1FlLD5+bECDV2zoGW0ERjC6wFnGpVteZ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663223085; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=SaIR9ac/WNESLZgIJ7NfWDPlOEsbmM5EMrQeBc4rRcQ=; 
	b=GuqatCqi3aNs0LWmQ5GNwlHSYYwAWDsF+H0n4REekizZUb117F/XuatyMC2g/jcD0YiW3vzn3hJN0FaaKwBPpjtMyOueJBdmUDuH34d8RrIXUsWSeagJIFN/B5GVfqb3tgRyCWelbulAdkRevrMZE3eXoEl767I/gNWhoQyVQ4Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663223085;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SaIR9ac/WNESLZgIJ7NfWDPlOEsbmM5EMrQeBc4rRcQ=;
	b=XDIDPnVMmzMdjdr4PWLtYOkpEuSco+I7L4NEGf6+WLphaJt9VGVtFjp9BCrmtJuU
	7ij/J6uM1EF/jrYfl1rkVfuPnaeTFjQfXrlAeYxX/MKVqAxa1Ngir6nbwhzyqohMOwn
	1gQDBTSmHpK+ZKrFbJ0+d3Q77xQtFQSvBjt7EQxw=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663223084388940.7928349747789; Wed, 14 Sep 2022 23:24:44 -0700 (PDT)
Message-ID: <aca736cd-a2f9-2af9-df59-7f8be7c991b6@arinc9.com>
Date: Thu, 15 Sep 2022 09:24:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/10] dt-bindings: memory: mt7621: add syscon as
 compatible string
Content-Language: en-US
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, erkin.bozoglu@xeront.com,
 netdev <netdev@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>
References: <20220914085451.11723-1-arinc.unal@arinc9.com>
 <20220914085451.11723-5-arinc.unal@arinc9.com>
 <20220914151414.GA2233841-robh@kernel.org>
 <44045164-692d-c8f5-3216-b043fb821634@arinc9.com>
 <CAMhs-H-0XV9ocrG3_MuVc3Q=o8HnYso2CqUURjVR3OMc=dAMYg@mail.gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H-0XV9ocrG3_MuVc3Q=o8HnYso2CqUURjVR3OMc=dAMYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_232511_511254_13DDF2AF 
X-CRM114-Status: GOOD (  16.83  )
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

On 15.09.2022 06:21, Sergio Paracuellos wrote:
> On Wed, Sep 14, 2022 at 5:19 PM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>
>> On 14.09.2022 18:14, Rob Herring wrote:
>>> On Wed, Sep 14, 2022 at 11:54:45AM +0300, Arınç ÜNAL wrote:
>>>> Add syscon as a constant string on the compatible property as it's required
>>>> for the SoC to work. Update the example accordingly.
>>>
>>> It's not required. It's required to automagically create a regmap. That
>>> can be done yourself as well. The downside to adding 'syscon' is it
>>> requires a DT update. Maybe that's fine for this platform? I don't know.
>>
>> My GB-PC2 won't boot without syscon on mt7621.dtsi. This string was
>> always there on the memory controller node on mt7621.dtsi.
> 
> The string was introduced because the mt7621 clock driver needs to
> read some registers creating a regmap from the syscon. The bindings
> were added before the clock driver was properly mainlined and at first
> the clock driver was using ralink architecture dependent operations
> rt_memc_* defined in
> 'arch/mips/include/asm/mach-ralink/ralink_regs.h'. I forgot to update
> the mem controller binding when memc became a syscon so I think this
> patch is correct. I also think the sample should use 'syscon' in the
> node name instead of memory-controller.

Will change to syscon in v2.

Arınç

