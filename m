Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5386C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 11:56:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D66CA2083E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 11:56:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2tDcbMDa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mXrqfsej"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D66CA2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PjbvmBKwpH2hD0fgtKhwgfmOVl0b/TQhOSo5MsHQfSI=; b=2tDcbMDaMl9KdGAhci3ftqFd8
	7V+nUnr9p6L9XWGwwIhYbnZQBtE7YTp5k77JzL92h+jdiHCipRlLuuSpGyWpPm1wg3/EvPXi7dH7G
	bZbXPI053Z92BrGdrnIKAONrKcMDKkNwbO7nMpDEbH/NyqP9rEG1xtiGD1nGnilaAZnKMkM+8WIB7
	zWLB/ND3opfNxj490K5bxrFnag5UY3dm7wd333ojvx5SnVKI9dynO+1Ork+TYsQYTkqnM2oc7ehfj
	UO6HzBX6twIvk/SKGQSUF3ifi0OTA86T1WTMfJNF43yZ/DKIUSRctUsxrgw6xmJVeVRngnmKNY290
	Lz9SFUnqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khtOp-0005rP-LZ; Wed, 25 Nov 2020 11:55:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khtOn-0005qf-G1; Wed, 25 Nov 2020 11:55:50 +0000
X-UUID: bc470b51f3fd4cddb3a99ff046c82d5d-20201125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QVCe+Q2tfMm/K2LDvufZ3yRpNHq9ZrnxVWmLvTzVGDU=; 
 b=mXrqfsej3EmDA95l//QBtQUTVcIrDekItwYH9PrnZ8y4DY2evhdOu/9CQWF8MWOj1Alg64W8IbHCbkGQGk1zRNhV84E2xHfiru83Ee3yug9hkLTgI+7TPx8Hmeb9I/ooOkaMnSVvlx69YYLsDvQtk76bdmjohcD/edqFw0cZEKQ=;
X-UUID: bc470b51f3fd4cddb3a99ff046c82d5d-20201125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 282420847; Wed, 25 Nov 2020 03:51:26 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Nov 2020 03:41:29 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Nov 2020 19:41:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Nov 2020 19:41:27 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: Kconfig: Add SYS_SUPPORTS_APM_EMULATION
Date: Wed, 25 Nov 2020 19:41:30 +0800
Message-ID: <20201125114130.507-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201125103637.GC70906@C02TD0UTHF1T.local>
References: <20201125103637.GC70906@C02TD0UTHF1T.local>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_065549_733437_68D9CEC3 
X-CRM114-Status: GOOD (  18.12  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: lecopzer.chen@mediatek.com, catalin.marinas@arm.com, yj.chiang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

>> From: "Lecopzer Chen" <lecopzer.chen@mediatek.com>
>> 
>> Although most of modern devices use ACPI, there still has combination
>> of APM + ARM64.
>> 
>> In order to select CONFIG_APM_EMULATION, make SYS_SUPPORTS_APM_EMULATION
>> default is y if ACPI isn't configured.
>
>I'm a bit confused why this should be enabled for !ACPI. Which DT
>platforms need this, and how do they use it? Why should this only be
>enabled for kernels without ACPI support, and not for kernels that
>support both ACPI and DT?
>
>Thanks,
>Mark.

Hi Mark,

In our internal patch has no !ACPI here,
the reason I add here is that in kernel document[1] it mention:
> No, sorry, you cannot have both ACPI and APM enabled and running at once.
Thus, I try to limit the scope for who don't use the ACPI because I'm not sure
they could exist at the same time or not.

But I think it should be fine without !ACPI if APM and APCI
config won't conflict with each other.

So if it's better to remove !ACPI I'll send v2 for this.


BTW, The platform is for our internal kernel drivers, they utilize APM interface,
/dev/apm_bios to do their works in arm64.





[1] APM or ACPI?:
https://www.kernel.org/doc/html/latest/power/apm-acpi.html


Thanks,
Lecopzer


>> 
>> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
>> Suggested-by: YJ Chiang <yj.chiang@mediatek.com>
>> ---
>>  arch/arm64/Kconfig | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 1515f6f153a0..5e9e3694015a 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -260,6 +260,9 @@ config NO_IOPORT_MAP
>>  config STACKTRACE_SUPPORT
>>  	def_bool y
>>  
>> +config SYS_SUPPORTS_APM_EMULATION
>> +	def_bool y if !ACPI
>> +
>>  config ILLEGAL_POINTER_VALUE
>>  	hex
>>  	default 0xdead000000000000
>> -- 
>> 2.18.0
>> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
