Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B3AC369DC
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 May 2025 00:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSd/d4oY5sG6sC71AfIyUCv5ZFIzJDqINK1IEBxHgyM=; b=dfiTxH2ZCcIeeVkOYON9qdO2v8
	drE90540BlRgoU6bdfsh+5CV8YyjnCvQGMtPDn39wkxg9x2H02ILMhrBXtcMZ2w6w4un6WJn4uAhB
	YoGIHV9JJ94dDGhnrP8gBlVRG8xO5XQUMm+uVTfdezf/RUrtISk5B5I2SRuPZLs+s8yhgJKW9yBYU
	oH7Uffb6SMy3I+YUsh8+bOS0a8vM8/5Fko5/iOzBS/ggZaPKm7VJV3ynmhTuGWY5amyfVxc9AqR5i
	wOvtS0O3BNcpFN9Gy91XuLsqR/vpT1q53LNzOHyvf8hsoqSe/ZMT5+GZJQj2eVrXXvdmp29Sww38h
	y80xrKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAe93-00000000NwT-0MkE;
	Fri, 02 May 2025 00:20:49 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdKp-00000000Gzg-2npC
	for linux-mediatek@lists.infradead.org;
	Thu, 01 May 2025 23:28:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BFCFA11FA;
	Fri,  2 May 2025 01:28:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746142126; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SSd/d4oY5sG6sC71AfIyUCv5ZFIzJDqINK1IEBxHgyM=;
	b=KQHA7qqrzWIoGBrgdbwVBkhPFK6dFDJdgj9AlXCRn4K4Ipu1O7Le9kptGyv4IeoPOsCzo7
	vmfzOwn6zpV+kBRJ/f7JiZUEmAHOW5FRTovCRrFlNKaN+iNlUulFLKWVrEO+EUEbb56a45
	fSvxcwe49iPADNHPLQtOyULMaxYy/DeTwvAwMQ+Rb/RIxLogV1x6bJUEK0T11MPZWUxZWf
	7rYKVsxt/cOmvGrQ7EhP1qpSHeWf2Wbq5V8bqt0Q2SCtS9mhlZfynaezAdDvJAxVnRni4C
	/JSdfTsN+hl8rzDHIRe27bQu0nSXudRgnV6Dluuu5s0qHWbjUev7NhZji9YAYA==
Message-ID: <47aae905-1a89-44aa-a31f-6cbfc0eb6726@cjdns.fr>
Date: Fri, 2 May 2025 01:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 1/7] dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU
 Timer
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu,
 linux-mediatek@lists.infradead.org
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-2-cjd@cjdns.fr>
 <20250501-ludicrous-idealistic-camel-7bf8aa@kuoka>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20250501-ludicrous-idealistic-camel-7bf8aa@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_162855_902557_68E2C261 
X-CRM114-Status: GOOD (  17.90  )
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


On 01/05/2025 12:58, Krzysztof Kozlowski wrote:
> On Wed, Apr 30, 2025 at 01:34:27PM GMT, Caleb James DeLisle wrote:
>> Add device tree bindings for the so-called high-precision timer (HPT)
>> in the EcoNet EN751221 SoC.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   .../bindings/timer/econet,en751221-timer.yaml | 80 +++++++++++++++++++
>>   1 file changed, 80 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
>>
> What changed? Nothing explains dropping the tag.


Sorry I lost track of it, I will re-send with it attached again.

Thanks,

Caleb


>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
>
> Best regards,
> Krzysztof
>
>

