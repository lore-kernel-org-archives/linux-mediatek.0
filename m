Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22712C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 03:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zn4EhYIzHeb0yem3EwWmCV1K1Qb+QYsYlkYpKNNVG4I=; b=pZQpSoEZ13BqpY
	ka+a90jgLnaeQvO6JeNmThn5r6g2gzwMQFFyaavKmRkcFiFnl71wpRWNyMwjCZSy3jEjSJrMUqYFo
	vyAfxvf7nv+BqQdGQgJhBbiO+OXJf0kFin0WrggTtQlrTUz32dpMmAYVFBc7KJ0lTWh+1b7Jtm3Et
	5MsvCHuTntqXWs931VEWqVmDSoKoctvKSdSTkVivgC1w2H2q/UC70NO77bSEuAB01jrzufGJ5ozXu
	OVy7nGNFelFOnd4QGxx2ynITimqeYHUSM79PW+uQgBHbfNCcVbfxZ51ewY26gGbJcNRsxrMJoqFM3
	7rIs2KziYqOyU4acm+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbBK-001CmK-Ar; Thu, 02 Jun 2022 03:07:30 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbB9-001CkZ-7M; Thu, 02 Jun 2022 03:07:20 +0000
Received: by mail-il1-x12d.google.com with SMTP id u2so1671403iln.2;
        Wed, 01 Jun 2022 20:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UHKfOpo21i5MoDcQk+7qlf8n2C1uh2g5W/XKZOO7xm4=;
        b=XqzZbjV/Hai6OuvPT51RZ5MBwaa4GjrqL4asM6ShURsMufo/2R1ExscNVQqvu5DBtw
         9Y+i20d8C5dFfgnd1jzRReVbkwhp4RbWZS1l9JXgLofMR8G9V5AAS6gFWtLXtQtsPhGx
         1OQBjTpmQ//8AyQzrwP3+JCGnVnNnIi/l06Baooqun/kLub8dkoTG8yNFBG6nUOqMDY+
         trMWnOWVLdIC3jUyb1KMLhLwhyg+N5P3IAcHoHkf1i8mtgh40icijw2HLmWXO5Ugyg4A
         OvQX6IgsCsoGI8YblKc99qRYEVpFsfpolaftzk9HqOjOt9PrxrpYJK59h1oGYo96Cve1
         jYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UHKfOpo21i5MoDcQk+7qlf8n2C1uh2g5W/XKZOO7xm4=;
        b=MXCFdK1pzjcgCrLfl5wuVGsM10JTyQ7Zo7GZKM+HDuvB0t1Qa6HhYB7tnPZfAcy/Kw
         A3susfBmWhyNMlEWFuuj3bGatKGia+Tb9ZP3ybZuBWBIbAMpE25H6xUFdktzrcV9mTXS
         pszPKAtv3ixmUgrQqjVrNLvhNf2GVXGjbYjqe6FaRXQQ/P5N+LSOQ3gQKaAxTqh7kvN+
         j0KaWNJHLYStDTFpGbNtdf24TFqk9w1qZKRTs2V96GmrRhpwKdfakcwaN0UiU57qJ2+A
         /1yiyop1G/Hz0E3vFia3G3XrZ8B1VqH5ejTLBtnb2aeJPMVPdTxjbpHoCJE8xSBlYkzZ
         vXJg==
X-Gm-Message-State: AOAM533fVsIIXvOUt+Gy6S+0wAiL7xu2j9eDpUV0gmd+JrOcROt1Vm+F
	kJBJP+fOicC8NBODAWK5SOw=
X-Google-Smtp-Source: ABdhPJx+fqog1Uk+ibtsTSfCYj8/q1T78oJkFBEJpVW0wb27VYQ2ApRYJ31SJjEzEP9rUa3YWg/UOw==
X-Received: by 2002:a05:6e02:170f:b0:2d3:dc72:7172 with SMTP id u15-20020a056e02170f00b002d3dc727172mr2083947ill.218.1654139236758;
        Wed, 01 Jun 2022 20:07:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:2442:6db0:edec:ab49:ad93:c595? ([2600:1700:2442:6db0:edec:ab49:ad93:c595])
        by smtp.gmail.com with ESMTPSA id d35-20020a026063000000b0032b3a78175fsm902283jaf.35.2022.06.01.20.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 20:07:16 -0700 (PDT)
Message-ID: <e0055a5c-cca9-db63-80bd-a39ff1585389@gmail.com>
Date: Wed, 1 Jun 2022 22:07:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] scripts: dtc: fix a false alarm for
 node_name_chars_strict
Content-Language: en-US
To: "qun-wei.lin" <qun-wei.lin@mediatek.com>, Rob Herring <robh@kernel.org>
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, casper.li@mediatek.com,
 chinwen.chang@mediatek.com, kuan-ying.lee@mediatek.com
References: <20220531053358.19003-1-qun-wei.lin@mediatek.com>
 <8d4b8cc3-8433-24f9-1fc5-12d71e640952@gmail.com>
 <20220531214914.GA2388344-robh@kernel.org>
 <7c6f0015-cf50-4c8b-060d-f6641d0aeb16@gmail.com>
 <b054866a5c043d3b6d5553057b5f5bf7b06681f0.camel@mediatek.com>
From: Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <b054866a5c043d3b6d5553057b5f5bf7b06681f0.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_200719_335055_FD3DF388 
X-CRM114-Status: GOOD (  26.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6/1/22 09:59, qun-wei.lin wrote:
> On Tue, 2022-05-31 at 20:45 -0500, Frank Rowand wrote:
>> On 5/31/22 17:49, Rob Herring wrote:
>>> On Tue, May 31, 2022 at 04:43:18PM -0400, Frank Rowand wrote:
>>>> On 5/31/22 01:33, Qun-Wei Lin wrote:
>>>>> The function check_node_name_chars_strict issues a false alarm
>>>>> when
>>>>> compiling an overlay dts.
>>>>>
>>>>> /fragment@0/__overlay__: Character '_' not recommended in node
>>>>> name
>>>>>
>>>>> This workaround will fix it by skip checking for node named
>>>>> __overlay__.
>>>>
>>>> This is not a false alarm.
>>>>
>>>> Do not special case node name "__overlay__".  This node name
>>>> should never
>>>> occur in a modern overlay source file.
>>>
>>> A dtbo -> dts pass will give warnings, so handling these nodes is 
>>> worthwhile. Though thinking a bit more about it, I think this one
>>> is off 
>>> by default, but W=2 turns it on.
>>
> 
> When DTC detects an overlay target, it will generate a node name
> "__overlay__" in function add_orphan_node [1]
> 
> Use the example on page 34 of the slide [2]. When the parser reads this
> line in overlay source file:
> 
> &{/soc/base_fpga_region} {
> 
> It will build two nodes, one with no name and the other one is a
> subnode __overlay__ [2].
> 
> So if we set W=2, the following warning will be issued:
> 
> Warning (node_name_chars_strict): /fragment@0/__overlay__: Character
> '_' not recommended in node name

Thanks for digging into the internals of dtc to determine how a properly
formatted overlay source file is processed in a way that the check for
a leading "_" in a node name is after dtc creating the __overlay__ node
name.

I have looked at dtc several times and have never educated myself enough
to be anything other than dangerous.  It seems that you might be more
educated about how it works.  If so, is there a reasonable way to tell
check_node_name_chars_strict() when the node name is one of the special
ones that dtc creates for overlays instead of a node name that appears
in a source file?

-Frank

> 
> I think this is a false alarm because this __overlay__ is automatically
> generated by DTC.
> 
>> Yes, at least as of 5.18-rc1 the warning is only if
>> '-W node_name_chars_strict', so a dtbo -> dts pass will not give the
>> warning for node __overlay__ by default.
>>
>> -Frank
>>
>>>
>>> Rob
>>
>>
> 
> We want to enable all warnings in DTC to ensure that all of our DTS are
> compliant with the conventions.
> 
> [1] 
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/dtc-parser.y#n169
> [2] https://elinux.org/images/0/03/Elce_2018_dt_bof.pdf
> [3] 
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/livetree.c#n228
> 
> 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
