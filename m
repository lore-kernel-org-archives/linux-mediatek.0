Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFA4C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 14:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CT97YM7VCSOduNBoS16nt0pEUZQAqqe9T5n0hJfuXdk=; b=QL0G48wC7Dbm6xfqJRVLz1+v7m
	vUUhlxxcPQHJWpWkSPwJkv761ikL0tsxVsHWMihwzIp82hjOynHHVDsqg83EXfBBnT8VWEgalAbiN
	auornYG43Up/A2XE8lFTVMbl7tlU/a7trgFHEcpthGILsxvyWqp3XPAoS2dLDLrFGbtE2hC0+oifV
	2MS1szcM5Yn95G5+qSMUVBlmzgwjpUkLKA8WjeuUjIMwMWck56Q2veqCa3tp5KI5yv8fLtA8RqbRH
	zBjt3W8bAPYCllmr6GdEkyCLZgrBBucoveiMPZ/eTEKAYEY6uztAiZGbz3G3jA5JS60EeAwph8siK
	FOUoXZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TRb-00AYrE-1A;
	Tue, 23 May 2023 14:56:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TRY-00AYpJ-06;
	Tue, 23 May 2023 14:56:57 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6630F6601EB5;
	Tue, 23 May 2023 15:56:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684853811;
	bh=SJZt9atAoQRj3rcAzTtRqoL9FHE3CxbtatuFUkIZ7/A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A1iFbFydVp3BqMWN95Xd90xFzcZubgebSvcSsSVMayqpt/U15l42yyOzA9edNLnOd
	 8F1xjWVOzbbJAbIqkHPwO54nb1qh44lgbs+e0wGGVXYGxVeYJpprP+Ub4fhOspKV9r
	 NGzJksq5HLKiF2OF1oZYmxIYnrBwJ7xE1/UIVNN7zPIToepFjTRFGi1Tq+DllnF/lJ
	 7f0tptQujdNHi+8ZqceJgdUi25YN8R+rsQ97X54L4TjG5KLtDuLKpcQlFeCaNFXZAG
	 uKCjNfGO0gfFESyFTgnhuKQrlch1e7cU/r1s3mo6KfkE9I/Y531ni+UGp0iWtKI/2D
	 XeTaPWT7f3eiw==
Message-ID: <a1793745-eae3-cae5-49fc-2e75fe0847f0@collabora.com>
Date: Tue, 23 May 2023 16:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 4/4] cpufreq: mediatek: Raise proc and sram max voltage
 for MT7622/7623
To: Daniel Golle <daniel@makrotopia.org>,
 "jia-wei.chang" <jia-wei.chang@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Nick Hainke <vincent@systemli.org>, Dan Carpenter <error27@gmail.com>
References: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
 <20230324101130.14053-5-jia-wei.chang@mediatek.com>
 <ZGuuVPCqgpUO6p0Q@makrotopia.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ZGuuVPCqgpUO6p0Q@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_075656_367609_6177C4D4 
X-CRM114-Status: GOOD (  33.94  )
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

Il 22/05/23 20:03, Daniel Golle ha scritto:
> Hi Jia-Wei,
> Hi AngeloGioacchino,
> 
> On Fri, Mar 24, 2023 at 06:11:30PM +0800, jia-wei.chang wrote:
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> During the addition of SRAM voltage tracking for CCI scaling, this
>> driver got some voltage limits set for the vtrack algorithm: these
>> were moved to platform data first, then enforced in a later commit
>> 6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
>> using these as max values for the regulator_set_voltage() calls.
>>
>> In this case, the vsram/vproc constraints for MT7622 and MT7623
>> were supposed to be the same as MT2701 (and a number of other SoCs),
>> but that turned out to be a mistake because the aforementioned two
>> SoCs' maximum voltage for both VPROC and VPROC_SRAM is 1.36V.
>>
>> Fix that by adding new platform data for MT7622/7623 declaring the
>> right {proc,sram}_max_volt parameter.
>>
>> Fixes: ead858bd128d ("cpufreq: mediatek: Move voltage limits to platform data")
>> Fixes: 6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
>> ---
>>   drivers/cpufreq/mediatek-cpufreq.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
>> index 764e4fbdd536..9a39a7ccfae9 100644
>> --- a/drivers/cpufreq/mediatek-cpufreq.c
>> +++ b/drivers/cpufreq/mediatek-cpufreq.c
>> @@ -693,6 +693,15 @@ static const struct mtk_cpufreq_platform_data mt2701_platform_data = {
>>   	.ccifreq_supported = false,
>>   };
>>   
>> +static const struct mtk_cpufreq_platform_data mt7622_platform_data = {
>> +	.min_volt_shift = 100000,
>> +	.max_volt_shift = 200000,
>> +	.proc_max_volt = 1360000,
>> +	.sram_min_volt = 0,
>> +	.sram_max_volt = 1360000,
> 
> This change breaks cpufreq (with ondemand scheduler) on my BPi R64
> board (having MT7622AV SoC with MT6380N PMIC).
> ...
> [    2.540091] cpufreq: __target_index: Failed to change cpu frequency: -22
> [    2.556985] cpu cpu0: cpu0: failed to scale up voltage!
> ...
> (repeating a lot, every time the highest operating point is selected
> by the cpufreq governor)
> 
> The reason is that the MT6380N doesn't support 1360000uV on the supply
> outputs used for SRAM and processor.
> 
> As for some reason cpufreq-mediatek tries to rise the SRAM supply
> voltage to the maximum for a short moment (probably a side-effect of
> the voltage tracking algorithm), this fails because the PMIC only
> supports up to 1350000uV. As the highest operating point is anyway
> using only 1310000uV the simple fix is setting 1350000uV as the maximum
> instead for both proc_max_volt and sram_max_volt.
> 
> A similar situation applies also for BPi R2 (MT7623NI with MT6323L
> PMIC), here the maximum supported voltage of the PMIC which also only
> supports up to 1350000uV, and the SoC having its highest operating
> voltage defined at 1300000uV.
> 
> If all agree with the simple fix I will post a patch for that.
> 
> However, to me it feels fishy to begin with that the tracking algorithm
> tries to rise the voltage above the highest operating point defined in
> device tree, see here:
> 
> 6a17b3876bc830 drivers/cpufreq/mediatek-cpufreq.c (Jia-Wei Chang              2022-05-05 19:52:20 +0800 100)    new_vsram = clamp(new_vproc + soc_data->min_volt_shift,
> 6a17b3876bc830 drivers/cpufreq/mediatek-cpufreq.c (Jia-Wei Chang              2022-05-05 19:52:20 +0800 101)                      soc_data->sram_min_volt, soc_data->sram_max_volt);
> 
> However, I did not investigate in depth the purpose of this
> initial rise and can impossibly test my modifications to the
> tracking algorithm on all supported SoCs.
> 

Thanks for actually reporting that, I don't think that there's any
valid reason why the algorithm should set a voltage higher than the
maximum votage specified in the fastest OPP.

Anyway - the logic for the platform data of this driver is to declare
the maximum voltage that SoC model X supports, regardless of the actual
board-specific OPPs, so that part is right; to solve this issue, I guess
that the only way is for this driver to parse the OPPs during .probe()
and then always use in the algorithm

	vproc_max = max(proc_max_volt, opp_vproc_max);
	vsram_max = max(sram_max_volt, vsram_vreg_max);

Jia-Wei, can you please handle this?

Thanks,
Angelo


