Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE9EC6369E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 15:23:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E29D22227
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 15:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WQbecWZb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E29D22227
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wgBOLlBvpM1w5wN2ml2LT5rRXbWCc3UeUWN4GS81RFk=; b=WQbecWZbp+aW76pAda6YEJg1g
	6WLwJHk2YuecuHGJIQG/vj4LTQiYcVxHAOoeD3monhwZNi9WaE8YdQQmD0gfFW60rTtXuAVd3K3+b
	bAo8duUMe3d3uB+62wjcNSD3/ayMkxFd54Iu3in6y/YajXewAzYrGx2Yi/sUERgxUcpNhJTjxZXmU
	oViorecYKGxIGbo3eWo6w1xNBBh9rK7ORPggj08PDoqJ76yO8xuV0Tw5HdVbIgziwFVQfxLtK/8kk
	2GRXab83qPrbZlJ8xTaDsTq/wEaRci3f63jhNYRZw1uX/R+Jy3E79DeZ50S4cPVjhiX8l5YFLrPq7
	oY8U5fAAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kflmY-0003kL-2k; Thu, 19 Nov 2020 15:23:34 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kflmT-0003iw-G9; Thu, 19 Nov 2020 15:23:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 070C511D4;
 Thu, 19 Nov 2020 07:23:27 -0800 (PST)
Received: from [10.57.24.96] (unknown [10.57.24.96])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79ADE3F719;
 Thu, 19 Nov 2020 07:23:22 -0800 (PST)
Subject: Re: [PATCH v8 2/3] dt-bindings: arm: cpus: Document
 'mediatek,freq-domain' property
To: Rob Herring <robh@kernel.org>, Hector Yuan <hector.yuan@mediatek.com>
References: <1603700349-5922-1-git-send-email-hector.yuan@mediatek.com>
 <1603700349-5922-3-git-send-email-hector.yuan@mediatek.com>
 <20201028150858.GA4029348@bogus>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <65a4e167-9d2c-7fcb-5373-33af5e002333@arm.com>
Date: Thu, 19 Nov 2020 15:23:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20201028150858.GA4029348@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_102329_663982_FFF707E0 
X-CRM114-Status: GOOD (  18.67  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, wsd_upstream@mediatek.com,
 Dave Gerlach <d-gerlach@ti.com>, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-mediatek@lists.infradead.org, Amit Kucheria <amit.kucheria@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/28/20 3:08 PM, Rob Herring wrote:
> On Mon, Oct 26, 2020 at 04:19:08PM +0800, Hector Yuan wrote:
>> From: "Hector.Yuan" <hector.yuan@mediatek.com>
>>
>> Add devicetree documentation for 'mediatek,freq-domain' property specific
>> to Mediatek CPUs. This property is used to reference the CPUFREQ node
>> along with the domain id.
>>
>> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
>> ---
>>   Documentation/devicetree/bindings/arm/cpus.yaml |    6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
>> index 1222bf1..e995b26 100644
>> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
>> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
>> @@ -255,6 +255,12 @@ properties:
>>   
>>         where voltage is in V, frequency is in MHz.
>>   
>> +  mediatek,freq-domain:
>> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
>> +    description:
>> +      CPUs supporting freq-domain must set their "mediatek,freq-domain" property
>> +      with phandle to a cpufreq_hw node followed by the domain id.
> 
> This needs to be a common binding shared with SCMI domains.

Would it be accurate to create a new binding file:
Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.txt
?

There is already cpufreq-qcom-hw.txt with 'qcom,freq-domain'
and analogous purpose.

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
