Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3778C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3hJqTfRtMIs2mAoBNaJeYxaKhhiRGMpJQ3KqPvIPH4=; b=fESXMIZIP/HlbG
	XdEx7CJMU0L7jN+niVPN0xE0bJcMQ9xDQt6zQAgBcYkGLyflsWtpnghrj4s2jJiSfmZdnDX7hB6Q+
	mNq7PjrK+crWtAnQVUEM1TXRzDZwrgd1wYOV0q4g86vlv4LrdCak9n6uT4+ih3O/DR4JywktdsDSu
	MGXiz0oaK3lSyGd5HbCR1DqB25rcpKmX0Tun/M9F8F4rBdRbpwp1WiGlDSwMMAGkn0uWq+O7EozRK
	palAZRA7S7/M9vclybMUcLJmHBR9RBapfsqnNnkr1P3LPqcY7wlHyxzbEulCmOtUIEz7xPqkO+ukr
	HqX3IZauQSTTfefoZpJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZC4t-00COZZ-9M; Tue, 29 Mar 2022 13:40:07 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZC4g-00COUj-8c; Tue, 29 Mar 2022 13:39:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7055D23A;
 Tue, 29 Mar 2022 06:39:53 -0700 (PDT)
Received: from [10.57.7.161] (unknown [10.57.7.161])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AC333F73B;
 Tue, 29 Mar 2022 06:39:50 -0700 (PDT)
Message-ID: <85f6a95e-24c3-0119-d43f-e57a3996280d@arm.com>
Date: Tue, 29 Mar 2022 14:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [0/8] Introduce support for artificial Energy Model
Content-Language: en-US
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 Pierre.Gondois@arm.com, ionela.voinescu@arm.com, viresh.kumar@linaro.org,
 rafael@kernel.org, daniel.lezcano@linaro.org, linux-pm@vger.kernel.org,
 mka@chromium.org, nm@ti.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
References: <20220316235211.29370-1-lukasz.luba@arm.com>
 <YkMJyRblpNMnv8ub@e120937-lin>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <YkMJyRblpNMnv8ub@e120937-lin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_063954_435538_152864C7 
X-CRM114-Status: GOOD (  30.83  )
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

Hi Cristian,

On 3/29/22 14:29, Cristian Marussi wrote:
> On Wed, Mar 16, 2022 at 11:52:03PM +0000, Lukasz Luba wrote:
>> Hi all,
>>
> 
> Hi Lukasz,
> 
>> This patch set adds new callback and support for artificial Energy Model (EM).
>> The new EMs have artificially generated performance states.
>> Such EMs can be created from lean information sources, such
>> as the relative energy efficiency between CPUs. The ACPI based
>> platforms provide this information
>> (ACPI 6.4, s5.2.12.14 'GIC CPU Interface (GICC) Structure'
>> 'Processor Power efficiency Class' field).
>>
>> Artificial EMs might require to directly provide the 'cost' of
>> the generated performance state. This patch set adds a new callback
>> .get_cost() for this. The EM framework does not force any model
>> or formula, it's up to the platform code.
>>
>> Artificial EMs aim to leverage the Energy Aware Scheduler
>> (EAS). Other frameworks relying on performance states
>> information (i.e. IPA/DTPM) must be informed of the
>> EM type and might be prevented from using it. This patch
>> sets also does this by introducing a new flag:
>> EM_PERF_DOMAIN_ARTIFICIAL.
>>
>> The patch set is based on current linux-next, where some
>> changes to OPP & EM are queuing.
>>
>> The patch set also contains (patch 7/8 and patch 8/8) logic which prevents
>> two EM's client frameworks from using this new EM type. Some other approach,
>> using 'milli-watts', has been proposed and discussed, but refused [1].
>> This new flag is more precised and should not leave space for
>> wrong interpretation.
>>
>> Shortly after this patch set you will see a patch set implementing the
>> platform code and registering this new EM.
>>
> 
> Just to let you know that in the few days I'm going to post the first
> chunk of some SCMIv3.1 additions that includes also (as you probably
> know) the SCMI Perf protocol support for reporting perf_domain costs in
> micro-watts and not only in milli-watts.
> 
> Given that it does not seem that as of now the em_ API used by the SCMI
> cpufreq driver can make use of this new scale (and being not at all
> familiar with EM/EAS for sure :P), the SCMIv3.1 'Perf micro-watts' patch
> which I will post (I'll CC you) does NOT expose any new interface but only
> takes care to store the new micro-watts capability internally in a flag
> (if advertised by an SCMIv3.1 backend server), so that, basically, you'll
> keep seeing from the SCMI cpufreq driver that the scale is milli-watt
> (when milli-watts are used of course) or non-milli-watt (for abstract and
> micro-watts scales).

Sounds good!

> 
> This is intended to be of course a first step, laying out just the bare
> minimum commmon internal SCMI support, until we figure out how to properly
> expose this from the SCMI Perf in order to make it usable for EM.
> (if neeeded at all).
> 

I had such a patch for the EM, to keep the power in micro-Watts.
We can glue these two layers (high level EM and low layer SCMI
perf). Let's sort it out.

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
