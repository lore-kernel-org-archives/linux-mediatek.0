Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE897C5478C
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4oxX/YMeDT0oWp0Rv13Tt5Zcd3hfFy8RdbmwS03Pec=; b=R3V+iIFJ37YGbCXf7h//tuDjoL
	DxumSyeJuDs1hdB1TRX8rje+7LcpZWm9d+6Kgp1WPcCySS6/QFUF/sNp5zYMGWU6dldq1iOfU3Pd7
	5QR8DrHEwCUl7ITmQneJIV4qji5aG8XEHiV8gaZLwsD9OOZ0y2ooCCpMdFjgYzIsvtEeteGY2/RL4
	vPWyNUHjvh/Dq2xD7/c26qLsLfYA+QbA5QahPIgZyz6Z1U19jcYqOZkCUlN/Egx3YRFyCu7oP3omW
	PJvcRWGzTBL/kwwhJWd/+mVgX33xIaA2RZ4ZzMAENEKf2Lhntcqgn7orxPdxl7tbGo2D+ZJMDIKOK
	4OWNYOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfLEe-00000009lSZ-2NlA;
	Wed, 28 Feb 2024 14:48:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfLEa-00000009lRA-3VYh;
	Wed, 28 Feb 2024 14:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709131713;
	bh=VntlTqk4dAW5pNGdEhOBOEA7DgQanApR+ugvNClxd6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dd23GAgTS9BawtCzIkD8Us/K1vt2Q+o8hjpHdQE48l5W4J6EN6Q2rywaVRKKan1SX
	 LWhtFvmUj+oMXY3ffkVILG4GCCJC9/K1cpohOaftPTIUeuV8RF9e4JrZV/2cS/IVHL
	 Nussf8p8iDmBV47phMrGJZSDlajVnFmy/3XjKrYTIObh3BAtxDXl0fWJO03Ac74u+2
	 OAVWsXnXNO8eUoBvaSWSNcbnOyZrec+2aaejSxLyzV7EyDdXh3MYQquowEu1AN5qY7
	 mOcjRa+EghFwYjWrl4mczI6uht1I5Wbsno3E/5EhWGM4mnTU1LFiaTpOIpO8KDxjbh
	 vLHSkbKKue8bQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F198B378204B;
	Wed, 28 Feb 2024 14:48:32 +0000 (UTC)
Message-ID: <7860ea98-da64-4722-8521-ad75c9123f42@collabora.com>
Date: Wed, 28 Feb 2024 15:48:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: cmdq: Don't log an error when
 gce-client-reg is not found
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240226-gce-client-reg-log-dbg-v1-1-f0fff97c30c7@collabora.com>
 <6389f1e3-57b2-453a-af6f-6bc7f725ad31@collabora.com>
 <957b44d3-ef48-4682-8db5-3261e582ac8f@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <957b44d3-ef48-4682-8db5-3261e582ac8f@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_064837_031159_8E3E3C09 
X-CRM114-Status: GOOD (  28.33  )
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

Il 28/02/24 15:44, Nícolas F. R. A. Prado ha scritto:
> On Wed, Feb 28, 2024 at 10:41:15AM +0100, AngeloGioacchino Del Regno wrote:
>> Il 26/02/24 22:31, Nícolas F. R. A. Prado ha scritto:
>>> Most of the callers to this function do not require CMDQ support, it is
>>> optional, so the missing property shouldn't cause an error message.
>>> Furthermore, the callers that do require CMDQ support already log at the
>>> error level when an error is returned.
>>>
>>> Change the log message in this helper to be printed at the debug level
>>> instead.
>>
>> CMDQ is optional, yes. At least, for some devices it is.
>>
>> Full story, though, wants that if you use the CPU for register manipulation
>> instead of programming the GCE (even with threading, fantastic!) you will
>> trigger various performance issues.
>>
>> In the end, you *don't want* to use the CPU if GCE is available!
>>
>> The reasons why the CMDQ/GCE is optional are:
>>   - You can check register-by-register r/w for debugging scenarios by using
>>     the CPU to manipulate them instead of having something magically doing
>>     that for you at a certain (pre-set, yes, but still!) point;
>>   - Not all SoCs have the same amount of GCE threads and channels, some may
>>     support writing to IP block X through the GCE, some may not, but both
>>     may support writing for IP block Y through this mailbox;
>>   - MediaTek chose to support both ways, enabling means to debug stuff upstream,
>>     the other choice would've been to never support CPU register R/W on some IPs
>>
>>     ... and btw - about the last part: Kudos, MediaTek.
> 
> Thank you for all the insight! :)
> 
>>
>> Now, I also get why you're raising this, but we have to find an agreement here
>> on a different way to proceed that satisfies all of us.
>>
>> First of all..
>>
>> Which device on which SoC is missing the GCE client register DT property?
>> Do said SoC really not have a GCE client register for that device?
> 
> This is what I see:
> 
> On mt8192-asurada-spherion:
> mediatek-mutex 14001000.mutex: error -2 can't parse gce-client-reg property (0)
> 
> On mt8195-cherry-tomato:
> mtk-mmsys 14000000.syscon: error -2 can't parse gce-client-reg property (0)
> mtk-mmsys 14f00000.syscon: error -2 can't parse gce-client-reg property (0)
> mediatek-mutex 1c016000.mutex: error -2 can't parse gce-client-reg property (0)
> mtk-mmsys 1c01a000.syscon: error -2 can't parse gce-client-reg property (0)
> mediatek-mutex 1c101000.mutex: error -2 can't parse gce-client-reg property (0)
> 
> So yes, there are a few missing. I will send patches adding them so we can get
> the best performance possible upstream.
> 
>>
>> Is any upstream supported SoC really lacking a GCE register for the upstream
>> supported IPs?
>>
>> I'm not sure.... :-)
>>
>> P.S.: I guess that the alternative (that I somewhat dislike, and you can probably
>>        understand why after reading the reasons above) would be to turn that into a
>>        dev_info() instead...
>>
>> P.P.S.: Having no GCE usually means that there's a performance issue! In that case,
>>          it's ... a mistake, so, an error, kind-of.... :-)
> 
> Given the performance impact, I agree that debug, and even info level is not a
> good option. At the same time, the hardware still works correctly without the
> GCE (as we have been running it so far without even realizing!), so I think
> calling it an error is too much, and a warning would be the most suitable level,
> as we just want to warn userspace: "Hey user, be advised that you're missing
> GCE, so you'll get worse performance! It will still work though". What do you
> think?
> 

Agreed.

Cheers,
Angelo


