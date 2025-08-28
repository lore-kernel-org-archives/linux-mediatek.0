Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C052CA0EED
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 02:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqLsXv2XpWWEpQrxrT6S6Kl2zparFOPKVK8ZyEs6XGE=; b=YbGl1kYB/4hSqPXigQFbOz+SN6
	G/ZLXjUClOmmhV8GvvOaacEVy1uvbeY+ftBhDLmUZfHA9V4Jz5JIucirHwIy9oSU5Hvg9gCtG4M1k
	wjsiVK8S5d0cRhTXowcxAE6tW+T86AFUR180DzM94Ri6nkQyMYBigPCwpcM0UGzkmmASKbKnM01Fn
	fT47RXlKZ7OK9gk0V59Osq8mG3u7YSSoFX3JleikpX5n6BTND8BaDvtZgL8/hePEZpkuyWE9G3ik0
	IcIafDUbByJRKZiGGHu9mo9B5swGnTMZrbuWl9ttNpz1PyrHSQEGkwa9YruQpk6B/oBvVBOhn7WUA
	xvWzzT2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSSb-000000001VW-2SpZ;
	Thu, 28 Aug 2025 02:33:57 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSRr-000000001P6-2qH4;
	Thu, 28 Aug 2025 02:33:13 +0000
X-UUID: 5053b84483b711f0b29709d653e92f7d-20250828
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:9e7721f3-4def-4494-ae6b-e8e5dd0438e3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:ab9379ea25ec926fdd1c492817d92794,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 5053b84483b711f0b29709d653e92f7d-20250828
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1305374640; Thu, 28 Aug 2025 10:32:59 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 5ABE6E008FAE;
	Thu, 28 Aug 2025 10:32:59 +0800 (CST)
X-ns-mid: postfix-68AFBFDB-172902359
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id ADF7BE008FAB;
	Thu, 28 Aug 2025 10:32:47 +0800 (CST)
Message-ID: <6f6c1e35-101d-4ef1-ac6e-5db337ccdd84@kylinos.cn>
Date: Thu, 28 Aug 2025 10:32:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/18] arm64: topology: Use __free(put_cpufreq_policy)
 for policy reference
To: Sudeep Holla <sudeep.holla@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
 x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-2-zhangzihuan@kylinos.cn>
 <70f4c2ce-1dbd-4596-af78-bca1cdbbb581@arm.com>
 <1756341899099493.57.seg@mailgw.kylinos.cn>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <1756341899099493.57.seg@mailgw.kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_193312_008978_D6438B49 
X-CRM114-Status: GOOD (  17.40  )
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


=E5=9C=A8 2025/8/27 17:17, Sudeep Holla =E5=86=99=E9=81=93:
> On Wed, Aug 27, 2025 at 09:30:13AM +0100, Ben Horgan wrote:
>> Hi Zihuan,
>>
>> On 8/27/25 03:31, Zihuan Zhang wrote:
>>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>>> annotation for policy references. This reduces the risk of reference
>>> counting mistakes and aligns the code with the latest kernel style.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>>> ---
>>>   arch/arm64/kernel/topology.c | 9 +++------
>>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topolog=
y.c
>>> index 5d07ee85bdae..e3cb6d54f35b 100644
>>> --- a/arch/arm64/kernel/topology.c
>>> +++ b/arch/arm64/kernel/topology.c
>>> @@ -307,17 +307,16 @@ int arch_freq_get_on_cpu(int cpu)
>>>   		 */
>>>   		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
>>>   		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAM=
PLE_EXP_MS))) {
>>> -			struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);
>>> +			struct cpufreq_policy *policy __free(put_cpufreq_policy);
>> Based on the guidance, in include/linux/cleanup.h, I would expect the
>> assignment to be done on this line.
>>
>> "...the recommendation is to always define and assign variables in one
>>   * statement and not group variable definitions at the top of the
>>   * function when __free() is used."
>>
> Agreed. I did something similar recently and there was a code path wher=
e
> variable wasn't initialised and ended up with freeing unassigned pointe=
r.
> So it is more than just a recommendation sometimes.
>
Thanks a lot for your suggestions.

We are also considering introducing a WITH_CPUFREQ_POLICY wrapper to=20
encapsulate the cpufreq_cpu_get/put usage, so that the release order=20
won=E2=80=99t be accidentally changed.

Link:=20
https://lore.kernel.org/all/874d821e-8ea3-40ac-921b-c19bb380a456@kylinos.=
cn/

Do you have any suggestions or preferences on this direction?



