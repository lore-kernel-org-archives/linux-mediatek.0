Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A33C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 16:20:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B206960D42
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 16:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B206960D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8GEQjkaAMDddOSCubK72WDocO3Pjuo99DHyw6vZ9hk=; b=eHiyok92Aljqql
	uEWqt1P540vLEIr9aZpGbQMwDDqQEb+7LUaK6hQh6Hf1WgET9p/TArrImbqet6lt0EuIITBLTECk0
	Ha+VSlNGq+0Q/hi+aCalNAGbvdGNb7Uqx9tUpU9RTuSjmMRJk0jsf/ZPR/rQKOQr8eKVNLOGgDyc5
	B99BkUD+oMyRCN5IDTweW4mV0NGQlBHW/4+2bm7AB1sLLuV+QTz3RgvBzcNmweG2OIkqZIa8l3uFl
	mYl1BPz7sP0MbcZch2zjpMRiwBqLVD1MDolVH/ZLOWPKWYd4tXlPXEXHzaKr15J6W8UvEUnv1n/3k
	uDr9ri8vNS/gxMOfBDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1magzj-0000fc-KT; Wed, 13 Oct 2021 16:20:43 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1magzf-0000e4-Ve; Wed, 13 Oct 2021 16:20:41 +0000
Received: by mail-wr1-x42a.google.com with SMTP id i12so10193337wrb.7;
 Wed, 13 Oct 2021 09:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=0WQtejUs0U+1oNTFLhT9yrIgvAfHwe1zgZIDzP381OQ=;
 b=LIKdnhYCduCXhInUyS5BRlABtNFROrwdW/EsLhswGTImNb51Qv+m7tO7Q+UbNx6d7I
 D1I4uq3Po+1HPFpssO8o/bCYubjv7OSHBw/7yI6yhb5F9UMdJ1kRqTkE6ProseNlymbD
 DLH65t2Spme47VNFQY++FPKcfIKkTqvu4YD+WDUEMB3vANa0SUBQ84L+KohX7s8P/Fvq
 bB2vzf79xwQedrDSPQJALNT2f/u9ZSACdidUPyFJVJHAWXi4j2y+f+O712iYn2awRqCU
 pxaJDjfSVc8rFNbXPtG1533QKhPfo0AfATriXepb0fbaoFVWBl0Zc3WviK14fmjUXw+I
 cewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=0WQtejUs0U+1oNTFLhT9yrIgvAfHwe1zgZIDzP381OQ=;
 b=57KLWGtC+EvxyqzUefo2iJEcr5n4GQ+a2vTxwVbkvFThdbAN0yzDp4+ArcNfVmxCvF
 /SL/Q+BM8QeAal9Ue7OlagwGvJkD1FIZ1TLQmqLxVALhDWjttAmoOcBJR1vEX5VL740x
 oK5UG6pB5sCZbIB1lFqyKSVdaD2t1Lf33UGiZFy1Ctvc8oSC8kycIt2EM7wP66bJ0CMz
 xs8ROW6QBlj6dAaMJFwEDCZU2XrqeEA1aGaVQCbUJ59V/n5tf79+bWzw1qUzL+JRo39k
 lXslskxdTix+ZfCZRiAOF2lt4MXVr84WI7kJGXBP07fnDguh/jehv92xews/xfKMpxyS
 Kg8w==
X-Gm-Message-State: AOAM530E8URjMGITyyiz4NK/b95XH+z+G0Rzi/5h5o6WmiZjiaIFcxEG
 7F/b3YX6I3O3ZkiqY0x7pHY=
X-Google-Smtp-Source: ABdhPJwvK29YiRXmRWUBqDWD4P+uxY6vfiqSKI6fNBN1Oisbb1TTAIl6Xk0ysRuB7CviCTIGY18aDw==
X-Received: by 2002:adf:a496:: with SMTP id g22mr108648wrb.13.1634142038182;
 Wed, 13 Oct 2021 09:20:38 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com.
 [2001:67c:2178:4000::1111])
 by smtp.gmail.com with ESMTPSA id r9sm20051wrn.95.2021.10.13.09.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 09:20:37 -0700 (PDT)
Message-ID: <d6e47a80-9d35-3236-f631-0e3bf8f9db17@gmail.com>
Date: Wed, 13 Oct 2021 18:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, linux-mediatek@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Arnd Bergmann <arnd@arndb.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, soc@kernel.org
References: <20211005202833.96526-1-luca@z3ntu.xyz>
 <20211005202833.96526-2-luca@z3ntu.xyz>
 <686404ce-2e0b-5470-b095-1c1fd7c18250@gmail.com> <5755444.lOV4Wx5bFT@g550jk>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/2] arm: dts: mt6589: Add device tree for Fairphone 1
In-Reply-To: <5755444.lOV4Wx5bFT@g550jk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_092040_081896_ED8963FA 
X-CRM114-Status: GOOD (  34.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/10/2021 19:54, Luca Weiss wrote:
> Hi Matthias,
> 
> On Freitag, 8. Oktober 2021 13:49:25 CEST Matthias Brugger wrote:
>> On 05/10/2021 22:28, Luca Weiss wrote:
>>> Add rudimentary support for the Fairphone 1, based on MT6589 to boot to
>>> UART console.
>>>
>>> The recently added SMP support needs to be disabled for this board as
>>> the kernel panics executing /init with it, even though the CPUs seem to
>>> start up fine - maybe a stability issue.
>>>
>>> [    0.072010] smp: Bringing up secondary CPUs ...
>>> [    0.131888] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
>>> [    0.191889] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
>>> [    0.251890] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
>>> [    0.251982] smp: Brought up 1 node, 4 CPUs
>>> [    0.254745] SMP: Total of 4 processors activated (7982.28 BogoMIPS).
>>> [    0.255582] CPU: All CPU(s) started in SVC mode.
>>>
>>> [    0.472039] Run /init as init process
>>> [    0.473317] Kernel panic - not syncing: Attempted to kill init!
>>> exitcode=0x00000004
>> Would be nice to find out why. Did you tried to boot the system with
>> enable-method set but with bringing up just one or two cpus?
> 
> Answered further down.
> 
>>
>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>> ---
>>>
>>>    arch/arm/boot/dts/Makefile                 |  1 +
>>>    arch/arm/boot/dts/mt6589-fairphone-fp1.dts | 30 ++++++++++++++++++++++
>>>    2 files changed, 31 insertions(+)
>>>    create mode 100644 arch/arm/boot/dts/mt6589-fairphone-fp1.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 7e0934180724..24f402db2613 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1437,6 +1437,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
>>>
>>>    	mt2701-evb.dtb \
>>>    	mt6580-evbp1.dtb \
>>>    	mt6589-aquaris5.dtb \
>>>
>>> +	mt6589-fairphone-fp1.dtb \
>>>
>>>    	mt6592-evb.dtb \
>>>    	mt7623a-rfb-emmc.dtb \
>>>    	mt7623a-rfb-nand.dtb \
>>>
>>> diff --git a/arch/arm/boot/dts/mt6589-fairphone-fp1.dts
>>> b/arch/arm/boot/dts/mt6589-fairphone-fp1.dts new file mode 100644
>>> index 000000000000..32c14ecf2244
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/mt6589-fairphone-fp1.dts
>>> @@ -0,0 +1,30 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +#include "mt6589.dtsi"
>>> +
>>> +/ {
>>> +	model = "Fairphone 1";
>>> +	compatible = "fairphone,fp1", "mediatek,mt6589";
>>> +
>>> +	chosen {
>>> +		stdout-path = &uart3;
>>> +	};
>>> +
>>> +	cpus {
>>
>> I'd expected "&cpus" why can we overwrite delete the node property like this
>> here?
> 
> Both results in the same, dtc just merges everything together, so as long as
> the node name is identical, it works.
> Also I cannot use &cpus because cpus in mt6589.dtsi doesn't have a label set.
> 

Then I think we should add a label and use &cpus, as this is the standard way to go.

> Regarding SMP:
> I have tried setting maxcpus=2 in cmdline and that still makes the kernel
> panic. With maxcpus=1 and leaving the deleting out of the dts the kernel is
> stable and works properly.
> 
> So I think it's better to leave this out of the dts and keep maxcpus=1 in
> cmdline (until this gets fixed).
> 

I'd prefer to disable the enable-method in DTS. You can see the four cores up 
and running without that, so it seems that is already done in the FW, right?

> I've also heard from the person adding enable-method to mt6589.dtsi that it
> still works on their board, so something's different, maybe a different SoC
> revision, different bootloader behavior or whatever.
> 

Sounds like a different bootloader behaviour.

> If that's fine with you, I'll send a v2 with that fixed.
> 
>>> +		/* SMP is not stable on this board, makes the kernel
> panic */
>>> +		/delete-property/ enable-method;
>>> +	};
>>> +
>>> +	memory {
> 
> Also I was told off-list that this should be called memory@80000000 because of
> the reg, will fix in v2.
> 

Correct :)

Thanks,
Matthias

> Regards
> Luca
> 
>>> +		device_type = "memory";
>>> +		reg = <0x80000000 0x40000000>;
>>> +	};
>>> +};
>>> +
>>> +&uart3 {
>>> +	status = "okay";
>>> +};
> 
> 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
