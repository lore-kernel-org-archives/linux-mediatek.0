Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2104BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwhtwAuilAKA6tRJX6qo3sSnFkFoAV4XT2ULQEDEWsQ=; b=e5itRBOXxIsh+c
	9Zr3A4iAqDC2yix8wXp07q6YfHE1cJPg2aURi3izccfqV80v8WHMXW7wJZ9BvVoNOk9Ax082etc+t
	bAim28YGJKAau1lkvjRx2Mqlw86Lipsltno/mP6IHC448iLP97ZsqED+WdlfPW1vZSDrOfGGTEYXq
	AOwBUuoLl7G/Hy0R5idVx08hzfP2LZjX3b/65K8UJxbRHuZzllq2PZJzmD+Safg9yUNdpVeQpkbzO
	pHyWJ0M+er71GBMTA07gHliVjTj01G6ZDs/2BwX6XdauCoxAb4EIBJ7uipHRv0wQNF2UgHLSwYsBb
	uD1p5QFu3SuS9dfNwTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfL0o-009wta-Bi; Fri, 15 Apr 2022 12:25:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfKzo-009wL2-EQ; Fri, 15 Apr 2022 12:24:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 503111F47DFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650025455;
 bh=+DG/SR1JZeY9TwBgdasuUGclUXboAsJu+KnxOPlJeQM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F56RCCZtK14fdbv8+VqhuyMC1l8IR5zkZ8hj1ud//5Ykt3U6LvU0Gk2cWyWXMZ462
 7UsUTfE4QDJpCjA9SHekhbdjbPX4Y64wTZzU2l1k3sEAAS6Ob+YW+wPSx9s5kH0zKt
 Gjsl3Q3iGwvlbOT1zuqxawrfW9MP0xvmNTxZ3k2h8SemrUJ8dRaUJ0RI2mr3j2KmZZ
 2huEg/J5dRhfH92O1HZyWctVXVvhDc73B0gS81+WzH1aI4lVpRXAw2yzvZ4rmSFwIR
 eI2fjWOMwoQsUQSy2+vKCxGbD3EdS3req9fSG1ZNdctU8uXmF7+Rw4Dul7bcqXsnmy
 RRGXS9hWnp7SQ==
Message-ID: <cfde61f1-5581-23b8-bd5b-f2a1875ec4ae@collabora.com>
Date: Fri, 15 Apr 2022 14:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 10/15] cpufreq: mediatek: Add counter to prevent
 infinite loop when tracking voltage
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@google.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tim Chang <jia-wei.chang@mediatek.com>, roger.lu@mediatek.com,
 Kevin Hilman <khilman@baylibre.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-11-rex-bc.chen@mediatek.com>
 <CACb=7PXykpUgZ+QG93Bd-vWstq2V-k6G0zTg+D1q2WchJHPbig@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CACb=7PXykpUgZ+QG93Bd-vWstq2V-k6G0zTg+D1q2WchJHPbig@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_052416_703965_52FCED51 
X-CRM114-Status: GOOD (  18.23  )
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

Il 15/04/22 08:14, Hsin-Yi Wang ha scritto:
> On Fri, Apr 15, 2022 at 1:59 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>>
>> To prevent infinite loop when tracking voltage, we calculate the maximum
>> value for each platform data.
>> We assume min voltage is 0 and tracking target voltage using
>> min_volt_shift for each iteration.
>> The retry_max is 3 times of expeted iteration count.
>>
>> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

I'm sorry Rex, but this commit has to be squashed with 09/15, as the logic is
that each commit has to be acceptable, and 09/15 is not, without this fix.

Besides, as Hsin-Yi suggested, calculating this every time may hit performance,
but at the same time I don't want to lose this explicit calculation...

>> ---
>>   drivers/cpufreq/mediatek-cpufreq.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
>> index cc44a7a9427a..d4c00237e862 100644
>> --- a/drivers/cpufreq/mediatek-cpufreq.c
>> +++ b/drivers/cpufreq/mediatek-cpufreq.c
>> @@ -86,6 +86,16 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
>>          struct regulator *proc_reg = info->proc_reg;
>>          struct regulator *sram_reg = info->sram_reg;
>>          int pre_vproc, pre_vsram, new_vsram, vsram, vproc, ret;
>> +       int retry_max;
>> +
>> +       /*
>> +        * We assume min voltage is 0 and tracking target voltage using
>> +        * min_volt_shift for each iteration.
>> +        * The retry_max is 3 times of expeted iteration count.
>> +        */
>> +       retry_max = 3 * DIV_ROUND_UP(max(info->soc_data->sram_max_volt,
>> +                                        info->soc_data->proc_max_volt),
>> +                                    info->soc_data->min_volt_shift);
> 
> mtk_cpufreq_voltage_tracking() will be called very frequently.
> retry_max is the same every time mtk_cpufreq_voltage_tracking() is
> called. Is it better to calculate before and store in
> mtk_cpu_dvfs_info?
> 

...so I agree with this solution: perhaps you can add a "vtrack_max" variable to
mtk_cpu_dvfs_info as suggested, and fill in that one in function
mtk_cpu_dvfs_info_init(), where we effectively initialize all-the-things.

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
