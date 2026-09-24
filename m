Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A99C98310
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 08:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOUtcT8Q4eTri6qdv3OSDlm4evmWQaxgCXIcuTn8yMA=; b=4rrtuNdEMidvy9OeDUfJe+OxrT
	7T1erLCaVgjT1rzu+X/gxjGci8KUr3bU8QPPu+1RSuBqU+k28Q8/BNVCHs4ZU5YtqKqyK9mUqDnm9
	UOWXTRaOjqYnZlaqGP7rFO51wkLz94vxZPgj9Fb0qlg0W2iKu3ynAoSQxqIFZxQ9VlBQ3f7B1tQmk
	nr7VJSjIYgsL0jK96On3Z035+1FQ+WgreOTKEi+vTB9QaYdj30DNhtZ8tLrsUXZ6hPjPCYAu8/KBx
	yWjpdlQd3K/lDmHW11uKOH4tRhrIVyX0dqpj3FPILuoQcbKqfJJk5eHVSoq4MKsBgZqudllkdVJqZ
	i/c62Aqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eQe-0000000ANoS-2kqT;
	Thu, 24 Sep 2026 08:03:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eQd-0000000ANnc-2jj5
	for linux-mediatek@bombadil.infradead.org;
	Thu, 24 Sep 2026 08:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QOUtcT8Q4eTri6qdv3OSDlm4evmWQaxgCXIcuTn8yMA=; b=einfCQyj0Lk6dUGWE5tccfhzUx
	Mam+4HXcmSpkBX4B97dZrGOYA0dSkfj/QIoxxCO7bjs2sKyR+431b19kE+X2qDbyNxSHXswjmxonv
	RyfKv+o/PCqvo2bM7/hEmJ/OalavnCpPGQ5CeQ7e2n99lLFnjfOZc+Icek/esibLktQKqOLMCBE/P
	1BCBIysJMJuIWsOaS/Oe4oWOPvKxUq6eG7PzqFBh4q+ZADCDAk4AyhzsCjudQMqLKeLOp6J/advOJ
	SDnXd/bIXhLIO42MrbcgNB+IMzJfqUNKUL0Ak8AhcRqzcLWetAwXM4X4UHarKFhERUcV8l0UWfhsr
	rx/yskNg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9eQZ-0000000FhEN-3mrv
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Sep 2026 08:03:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1CF00C211D6;
	Thu, 24 Sep 2026 08:04:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 201175FB45;
	Thu, 24 Sep 2026 08:03:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0B15103294B3;
	Thu, 24 Sep 2026 10:03:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790237006; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QOUtcT8Q4eTri6qdv3OSDlm4evmWQaxgCXIcuTn8yMA=;
	b=nnmlteqO1wYSHSaN+gcwEtmzcjW62gS3diRemNWhNQ/Xn1ndq6P4TeTNgbY4o2CIuut3eg
	/KZTomI0oNnSHY3aboBikRLDopRrIuWuGOchdhTP30Vu3H/22HoGvrXomEN6R+VwY0YpS2
	TVgxn6IFuGZFp5W2nKAapvyHdhn9f68KDNeRNNIINaVSnvMa5oD2I0kxRBn4f37PtaHCWP
	Ec+zXldDL77Wlee6bg0QA+KHp6loQLb5uBsssBvaUMidxQ5SdvWJF8hGGlYI/crojBKI1f
	iNXZxA0fidr1Thpw7F5xxz6HqSL69Q+6bbFwAdxs5fCPnra9P7TtE0CRtOeR0g==
Message-ID: <56a9c5f0-55af-4547-89cb-c966423ee12c@bootlin.com>
Date: Thu, 24 Sep 2026 10:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode
 PCS
To: Jakub Kicinski <kuba@kernel.org>,
 "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
 <20260921135933.7e8857ba@kernel.org>
 <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com>
 <20260922172514.7feb6e7c@kernel.org>
 <CA+_ehUyFKZzd0uP4akgZxaLLJTwcvGGKz5ppCYsB++fn92Dn9w@mail.gmail.com>
 <20260923201158.3552915a@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260923201158.3552915a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_090336_881577_0217A769 
X-CRM114-Status: GOOD (  14.72  )
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

Hi,

On 9/24/26 05:11, Jakub Kicinski wrote:
> On Wed, 23 Sep 2026 10:31:49 +0200 Christian Marangi (Ansuel) wrote:
>> Il giorno mer 23 set 2026 alle ore 02:25 Jakub Kicinski
>>> On Tue, 22 Sep 2026 12:12:56 +0200 Christian Marangi (Ansuel) wrote:  
>>>> The remark on the fwnode patch are invalid. The driver is expected
>>>> to return those error as probe defer is not supported.
>>>> (a notifier and late attach/detach is used to align to phylink logic)
>>>>
>>>> For the specific Airoha PCS driver it's really speculation from the AI
>>>> but HW doesn't work as described by AI.
>>>>
>>>> The only real comment that is valid is about the alternative way
>>>> to give supported interface with the .get_capabilites OP.
>>>>
>>>> This is currently not supported as there isn't any user and it will
>>>> be implemented as soon as there will be one. It's really to limit
>>>> the patch delta of this change and to progress further.
>>>>
>>>> Maybe FIXME might be suitable?  
>>>
>>> FWIW no preference here, I defer to the human reviewer.
>>> We can treat the AI review as a hint if human reviewer thinks the code
>>> is fine as is.  
>>
>> Soo should I send v17 to fix AI that failed review?
>> I think I didn't got this detail.
> 
> Sounded like Maxime was planning to take v16 for a spin.

I gave it a quick run this morning, it still works fine with the mvpp2 porting
I made last time, as well as on dwmac-socfpga :)

My tests doesn't cover the entirety of the patches though, I haven't stressed
at all the fwnode path.

But this is starting to look good to me, I think you can send V17 with the sashiko
fixes :)

Maxime

