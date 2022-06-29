Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDB6C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 10:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G15U1BqgMcF5OUMYwK2dhbdB6z7gzh2SLh4EmPd791g=; b=sR4Y4LphSq7hYlvgrkl7zCiujg
	sVvFAD6R3ljk1WNgWzsCmFHCSwc5EQdX+vr+jU0QvZXVESA9uYo4cHTLc2bzQzGpgfEA7522QM7fT
	tTJB2p5sE+8pHzwHR8HG0Dj/pTjCxYhaL45tf+p64qUh0FnropsiCAPflfcuIt9j9a+ouCu2uIShu
	W1PBH0PKVJ3Hf7Vqmsks5VYYeqE+UQE/HV/4EAxyfP3h1DOiU5hIcFkz0Qz52DsbzFZgI4E73ZrHr
	QB/q0rs6SELybg4X3QQb1J7DlP6eyoIyi6fI2VfmmHtx1AalSasp1JXzjw/UdefzkbK//8wcydg5b
	5m5+qmxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Urr-00B084-E6; Wed, 29 Jun 2022 10:24:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Urf-00B04D-2Y; Wed, 29 Jun 2022 10:24:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11C8A152B;
	Wed, 29 Jun 2022 03:24:05 -0700 (PDT)
Received: from [10.57.9.39] (unknown [10.57.9.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6441E3F792;
	Wed, 29 Jun 2022 03:24:02 -0700 (PDT)
Message-ID: <a5455086-a62c-d00a-95b4-d441c0d4d2e9@arm.com>
Date: Wed, 29 Jun 2022 11:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/4] Energy Model power in micro-Watts and SCMI v3.1
 alignment
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 rafael@kernel.org, dietmar.eggemann@arm.com, nm@ti.com, sboyd@kernel.org,
 sudeep.holla@arm.com, cristian.marussi@arm.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
References: <20220622145802.13032-1-lukasz.luba@arm.com>
 <be793e51-0d89-7afd-e122-ec929a1130e9@arm.com>
 <20220629095302.bi3xx6yicsnjeff7@vireshk-i7>
 <1072cb84-4097-0cbd-f980-a864ea851b0c@arm.com>
 <20220629100148.67kevfelqq7d23n5@vireshk-i7>
 <7d3fdfb5-ed03-671b-59d8-918cc0d60612@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <7d3fdfb5-ed03-671b-59d8-918cc0d60612@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_032407_209007_5DBEEC51 
X-CRM114-Status: GOOD (  14.25  )
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

Hi Daniel,

On 6/29/22 11:21, Daniel Lezcano wrote:
> 
> Hi Lukasz,
> 
> On 29/06/2022 12:01, Viresh Kumar wrote:
>> On 29-06-22, 11:00, Lukasz Luba wrote:
>>> Thanks for fast response. It would be great.
>>>
>>> I have 2 ACKs from Sudeep for the SCMI part,
>>> but I don't know the status e.g. of DTPM
>>> current work which is using the EM milli-Watts
>>> and does conversion to uW internally.
>>> I hope, I won't make issues to Daniel's work with this
>>> change.
>>
>> Daniel, do you have any objections to this ?
> 
> Sorry I had no time to review the series yet, give me a couple of days, 
> may be a bit more if possible
> 
> 

OK, take your time. I hope this could land as a material
for v5.20, we still have some time.

Regards,
Lukasz

