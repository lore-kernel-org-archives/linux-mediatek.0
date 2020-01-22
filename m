Return-Path: <SRS0=t7yo=3L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81ED3C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 13:40:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AE0E20704
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 13:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fpVsPGw4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AE0E20704
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zFUyqbX8F/Ki7WTGuViE1iGpxhmFiR/3/ko052EXTME=; b=fpVsPGw4Mh0sFMaw5qqDtKMv0
	JhVMfy3rP+5wD6s2mauoUt90YtAWvzETeeARZNcQK6CcjEbFN6AWcy9VfWwjbE2YveGbUxYiJoO5y
	3XqwutQ8Ce0dMxjQv3jXRbRQbcd6cev0dFpv4n0LMJtfgczetPi8fDs1Bh4c3aZ2vSl+P5Xiuo/ta
	+R+GLKPrO3UqJFmzi8SpUL9WDuNcAXafDuaTVYuEvIWGEpBPSNWxfx0WJlfFAjALqBAJToy5VnVsH
	Gy7aGysNE32A0VED7KQSfPdisiN3wkR994FBP50WzHHonCgpnVk9iRuc/eUIWPflfMC7SARW4WLfW
	TLioq1RPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuGF1-0005oo-2T; Wed, 22 Jan 2020 13:40:19 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuGEo-0004mr-FY; Wed, 22 Jan 2020 13:40:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 991D3328;
 Wed, 22 Jan 2020 05:40:03 -0800 (PST)
Received: from [10.37.8.106] (unknown [10.37.8.106])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 740A23F52E;
 Wed, 22 Jan 2020 05:40:00 -0800 (PST)
Subject: Re: [PATCH v3 4/7] drm/panfrost: Add support for multiple regulators
To: Nicolas Boichat <drinkcat@chromium.org>, Mark Brown <broonie@kernel.org>
References: <20200114071602.47627-1-drinkcat@chromium.org>
 <20200114071602.47627-5-drinkcat@chromium.org>
 <20200114151643.GW3897@sirena.org.uk>
 <CANMq1KC_-g45wdGgGiBmEyVXAJMkKwsJBJXGBHOMJk_=NyfpYw@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <78d5d977-50d5-f28e-0c4c-fd1df9e868e9@arm.com>
Date: Wed, 22 Jan 2020 13:40:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CANMq1KC_-g45wdGgGiBmEyVXAJMkKwsJBJXGBHOMJk_=NyfpYw@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_054006_598569_7C35CCA8 
X-CRM114-Status: GOOD (  18.16  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 21/01/2020 04:37, Nicolas Boichat wrote:
> On Tue, Jan 14, 2020 at 10:16 PM Mark Brown <broonie@kernel.org> wrote:
>>
>> On Tue, Jan 14, 2020 at 03:15:59PM +0800, Nicolas Boichat wrote:
>>
>>>   - I couldn't find a way to detect the number of regulators in the
>>>     device tree, if we wanted to refuse to probe the device if there
>>>     are too many regulators, which might be required for safety, see
>>>     the thread on v2 [1].
>>
>> You'd need to enumerate all the properties of the device and look
>> for things matching *-supply.
> 
> I see ,-) I was hoping for something slightly cleaner, or maybe an
> existing function in the core.
> 
> Steven: How strongly do you feel about this? If so I can add that
> check in the next revision.

I'm not that strongly bothered about it - my only worry is that there 
may be hardware out there that might be broken by not activating a 
regulator. But I don't know how common this multi-regulator design is in 
practise.

Thanks,

Steve

> Also, just a heads-up, I'm out for the next 2 weeks, I'll send v4 after that.
> 
>>
>> Reviewed-by: Mark Brown <broonie@kernel.org>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
