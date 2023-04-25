Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D1DC77B71
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWaGioc4MIgwHWd3s1no2KSWQJTbSw/AVi+GwLkMuJY=; b=rQax/nnllUfVX9LPv60UnEhx79
	m4VJdDJIKOl2xDmo0Cwa8AnQIAesaQMIXMuzpP7V9oFYhy68f29wucudXJeT84IDirfvKfV2OW29O
	rOd9/WiAx1yWXNZif2jawBZj3Q+FNoJKi8yPVHr9cLgMbwd4Q6yGzfytmMOlQHSOlBzzWTZIMj7m0
	poTZE51taF7oLj8G2QT+m9YUp2I9cvcb7G0nsbcamM1Y7Wdi/U9/jCvAL/MnK8p6DLpwsSrJBw95/
	pUCvOH1fjoe1aGPGnLlbK7gy3K4D/zoc8LSkm6Vn+pG45X5Whzxkpn04N/AXSjpSnW9Ho1iGUioKK
	JyUncOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prDbN-000RD8-1J;
	Tue, 25 Apr 2023 08:00:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prDbI-000RBi-1X;
	Tue, 25 Apr 2023 08:00:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A3CF061E7F;
	Tue, 25 Apr 2023 08:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B19AC4339B;
	Tue, 25 Apr 2023 08:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682409635;
	bh=cDv3M/1s+tjOQjJbPUGblM4x/VHbLIoWAfEO3RoBZLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t8tVDcisi1Ua1xsK0eh4wXd6TRl8zqRR065VHttovC11XtMZF6D/4bba5k+B9QVcD
	 wosEZN7on9/BZBObgZeW4zV919V5Z45lRsX9k7Fm3mqp0kUE89nHF/t0zlqhvF9+dB
	 2h6Dz3k0IgtGd470zSwjfCJivMhODaPf9YsDcjkg014i+ABYaNR22jfQS6VgIFy5WX
	 vVhV9/8kPwppHz662OIcc0AhHtcKwYVCwvnfRzqmvB8PESp/To9CcsNdaTVKSHAQ9+
	 fTB2q5Cbai6xwkIifbnmNyaVCEpLHdO8kzBQU4MtjB0kPYGm2MS/weEHAZC22lIJik
	 7OelZpaQThsmg==
Message-ID: <7fe274df-6bcd-5993-d6cc-8fbcef435866@kernel.org>
Date: Tue, 25 Apr 2023 10:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org,
 linux-unisoc@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_010036_594243_33DF702A 
X-CRM114-Status: GOOD (  22.99  )
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

On 25/04/2023 00:10, Rob Herring wrote:
>> I had some problem with gmail and sending mail too much users. I put Rob
>> and You and all the various list to try to workaround the "gmail spam
>> protection"
>>
>>> I am pretty sure we were discussing such split idea in the past and it
>>> did not get traction, but I cannot recall the exact discussion.
>>>
>>
>> I think the main issue here is how to handle bot and how problematic is
>> to merge this. As written in the cover letter the final version of this
>> should be a big series of 50+ patch with every commit specific to each
>> oem. In theory we should be able to merge the different oem separately
>> and try to at least start the categorization.
>> Another idea I got to at least have a "migration path" is to convert
>> every dts in the dts/ directory to a symbolic link that target the dts
>> in the correct oem. But I assume that would fix only part of the problem
>> and git am will still be problematic.
> 
> I have a script[1] that does the conversion written the last time this
> came up. Just have to agree on directory names. I think the easiest
> would be for Arnd/Olof to run it at the end of a merge window before
> rc1.
> 
> I'm very much in favor of this happening especially before *any*
> overlays are added to add to the mess (it's probably already
> happened).
> 
> Rob
> 
> [1] https://lore.kernel.org/all/20181204183649.GA5716@bogus/

This is the thread I was thinking about. Looks good for me (the original
script with exynos->samsung).

Best regards,
Krzysztof


