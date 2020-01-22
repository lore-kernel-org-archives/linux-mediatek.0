Return-Path: <SRS0=t7yo=3L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1BBC2D0DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 09:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD142467E
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 09:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T2f9nKou"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CD142467E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V6Zw6FOH2hZ9sPoki+L7Y9ldw7joLT5/044Az7b8xjU=; b=T2f9nKouH3T18o/lHN9EYQwNo
	ny/vtOQObGc/vADzF6bH/vyic5v4YIDvjvNZSto1A6se5w/gPEr7m04VGUtsiorRZWJsHVDkqKWzO
	F1f2BegK0UwkEqRaPskI8gdDd5BAtVsfnK/S3at1DFssTHy1qOPuoNoffoTB0xPbyuxFXsJOn6fBx
	jbmoF6yLC6FHY/eajI1qNy711ofqI/LRKFvF68TpoFsNoOE/jnDFggXuRNpDgHSIOTyQBIehWxLYe
	AvTYRQXb6LmwIQPD2tQW+rAqhn+cYOdwPPscgspXyLuar4/Lg5mljzTcYwkB+it/ZOljmyUknZLHc
	wUoURKstA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuCQe-0001jV-0v; Wed, 22 Jan 2020 09:36:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuCQT-0001aB-Op; Wed, 22 Jan 2020 09:35:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ADEE1FB;
 Wed, 22 Jan 2020 01:35:51 -0800 (PST)
Received: from [10.37.12.190] (unknown [10.37.12.190])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19A903F68E;
 Wed, 22 Jan 2020 01:35:38 -0800 (PST)
Subject: Re: [PATCH 3/4] thermal: devfreq_cooling: Refactor code and switch to
 use Energy Model
To: Steven Rostedt <rostedt@goodmis.org>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-4-lukasz.luba@arm.com>
 <20200121121124.1a1f3175@gandalf.local.home>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <6c4c5ac6-2d80-694e-866b-21fe5ef1853f@arm.com>
Date: Wed, 22 Jan 2020 09:35:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200121121124.1a1f3175@gandalf.local.home>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_013553_895701_847874EA 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, daniel.lezcano@linaro.org,
 peterz@infradead.org, viresh.kumar@linaro.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, Morten.Rasmussen@arm.com,
 robh@kernel.org, amit.kucheria@verdurent.com, vincent.guittot@linaro.org,
 khilman@kernel.org, agross@kernel.org, b.zolnierkie@samsung.com,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com,
 linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de, daniel@ffwll.ch,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, Chris.Redpath@arm.com, linux-omap@vger.kernel.org,
 Dietmar.Eggemann@arm.com, linux-arm-kernel@lists.infradead.org,
 airlied@linux.ie, javi.merino@arm.com, tomeu.vizoso@collabora.com,
 qperret@google.com, sboyd@kernel.org, shawnguo@kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, ionela.voinescu@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 1/21/20 5:11 PM, Steven Rostedt wrote:
> On Thu, 16 Jan 2020 15:20:31 +0000
> lukasz.luba@arm.com wrote:
> 
>> diff --git a/include/trace/events/thermal.h b/include/trace/events/thermal.h
>> index 135e5421f003..8a5f04888abd 100644
>> --- a/include/trace/events/thermal.h
>> +++ b/include/trace/events/thermal.h
>> @@ -153,31 +153,30 @@ TRACE_EVENT(thermal_power_cpu_limit,
>>   TRACE_EVENT(thermal_power_devfreq_get_power,
>>   	TP_PROTO(struct thermal_cooling_device *cdev,
>>   		 struct devfreq_dev_status *status, unsigned long freq,
>> -		u32 dynamic_power, u32 static_power, u32 power),
>> +		u32 power),
>>   
>> -	TP_ARGS(cdev, status,  freq, dynamic_power, static_power, power),
>> +	TP_ARGS(cdev, status,  freq, power),
>>   
>>   	TP_STRUCT__entry(
>>   		__string(type,         cdev->type    )
>>   		__field(unsigned long, freq          )
>> -		__field(u32,           load          )
>> -		__field(u32,           dynamic_power )
>> -		__field(u32,           static_power  )
>> +		__field(u32,           busy_time)
>> +		__field(u32,           total_time)
>>   		__field(u32,           power)
>>   	),
>>   
>>   	TP_fast_assign(
>>   		__assign_str(type, cdev->type);
>>   		__entry->freq = freq;
>> -		__entry->load = (100 * status->busy_time) / status->total_time;
>> -		__entry->dynamic_power = dynamic_power;
>> -		__entry->static_power = static_power;
>> +		__entry->busy_time = status->busy_time;
>> +		__entry->total_time = status->total_time;
>>   		__entry->power = power;
>>   	),
>>   
>> -	TP_printk("type=%s freq=%lu load=%u dynamic_power=%u static_power=%u power=%u",
>> +	TP_printk("type=%s freq=%lu load=%u power=%u",
>>   		__get_str(type), __entry->freq,
>> -		__entry->load, __entry->dynamic_power, __entry->static_power,
>> +		__entry->total_time == 0 ? 0 :
>> +			(100 * __entry->busy_time) / __entry->total_time,
>>   		__entry->power)
>>   );
>>   
> 
> Tracing updates look fine to me. Having the division on the output
> makes more sense.
> 
> Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org> # for tracing code
> 
> -- Steve
> 

Thank you Steven, I will include it in the next version with a proper
label.

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
