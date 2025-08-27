Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EBDC8303F
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Aug 2025 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cm7jRPMBPf4sf2l068Yy96KaDTgweWGkolU8ivKz92s=; b=HmCAGEIox3QWSfSwT2646sx5Ra
	O1Tdf+7CBGIsBWGiQXzfA6HqGkmjQiNt0tPiucwltlkq0zzUe6piMYtCLDHm/rWACvfit1Q2A7I2l
	+1uutvuz51SkfJgQVMzuXRsmm3ThijN3KBE/QmMzyXZ2R8OvlAE3ksGr84oaeEA0xclO1QFR1XxDv
	SPsGqYZbc/IwabEDVq0e5nCWjlNCKBAzpbf6EYNJs51DoTj6uhdFscILDN02OVeSl8j22+ukyxVan
	2XvoSlTW41epQaSNnn8y8V2Lfy8OVlCVaf7zryHQcfOM1yg+Ez3QMBpHShydQ6rydU3dLeYB9p8Hr
	CxNYCNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urC0C-0000000ElJR-38hM;
	Wed, 27 Aug 2025 08:59:32 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBwZ-0000000Ekfi-1mBe;
	Wed, 27 Aug 2025 08:55:49 +0000
X-UUID: 9b4b7a88832311f0b29709d653e92f7d-20250827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2338019c-bb8d-48a6-93ba-58ea29929953,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:b5736a825b981a30f067edd239e3633a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9b4b7a88832311f0b29709d653e92f7d-20250827
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 175818411; Wed, 27 Aug 2025 16:55:40 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 97C48E008FAC;
	Wed, 27 Aug 2025 16:55:39 +0800 (CST)
X-ns-mid: postfix-68AEC80B-467347751
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 74564E008FA3;
	Wed, 27 Aug 2025 16:55:21 +0800 (CST)
Message-ID: <57016487-0fee-4821-9cd5-d6e5fe80a65d@kylinos.cn>
Date: Wed, 27 Aug 2025 16:55:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/18] arm64: topology: Use __free(put_cpufreq_policy)
 for policy reference
To: Ben Horgan <ben.horgan@arm.com>, "Rafael J . wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Markus Mayer
 <mmayer@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-pm@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-2-zhangzihuan@kylinos.cn>
 <70f4c2ce-1dbd-4596-af78-bca1cdbbb581@arm.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <70f4c2ce-1dbd-4596-af78-bca1cdbbb581@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_015547_767894_6DEE4CF0 
X-CRM114-Status: GOOD (  19.77  )
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

Hi,

=E5=9C=A8 2025/8/27 16:30, Ben Horgan =E5=86=99=E9=81=93:
> Hi Zihuan,
>
> On 8/27/25 03:31, Zihuan Zhang wrote:
>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>> annotation for policy references. This reduces the risk of reference
>> counting mistakes and aligns the code with the latest kernel style.
>>
>> No functional change intended.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   arch/arm64/kernel/topology.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology=
.c
>> index 5d07ee85bdae..e3cb6d54f35b 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -307,17 +307,16 @@ int arch_freq_get_on_cpu(int cpu)
>>   		 */
>>   		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
>>   		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMP=
LE_EXP_MS))) {
>> -			struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);
>> +			struct cpufreq_policy *policy __free(put_cpufreq_policy);
> Based on the guidance, in include/linux/cleanup.h, I would expect the
> assignment to be done on this line.
>
> "...the recommendation is to always define and assign variables in one
>   * statement and not group variable definitions at the top of the
>   * function when __free() is used."


The reason I split the assignment into multiple lines is because=20
scripts/checkpatch.pl gave a warning about the line being too long.

But if you think a single-line assignment is better, I will modify it=20
accordingly.

>>   			int ref_cpu;
>>  =20
>> +			policy =3D cpufreq_cpu_get(cpu);
>>   			if (!policy)
>>   				return -EINVAL;
>>  =20
>>   			if (!cpumask_intersects(policy->related_cpus,
>> -						housekeeping_cpumask(HK_TYPE_TICK))) {
>> -				cpufreq_cpu_put(policy);
>> +						housekeeping_cpumask(HK_TYPE_TICK)))
>>   				return -EOPNOTSUPP;
>> -			}
>>  =20
>>   			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
>>   				if (ref_cpu =3D=3D start_cpu) {
>> @@ -329,8 +328,6 @@ int arch_freq_get_on_cpu(int cpu)
>>   					break;
>>   			}
>>  =20
>> -			cpufreq_cpu_put(policy);
>> -
>>   			if (ref_cpu >=3D nr_cpu_ids)
>>   				/* No alternative to pull info from */
>>   				return -EAGAIN;
> Thanks,
>
> Ben
>

