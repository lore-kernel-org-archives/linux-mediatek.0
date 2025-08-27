Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734DFCA0FFD
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Aug 2025 05:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDlRUXFSzOD8o9dRxqhPtKP8cvwp8unMAQ8DWdMPjx8=; b=FBOu928KMLDxZVFwIGKbtB38gA
	h5DqTFlfV9rt90XQeZ0Dq3lMR0WrJGsBuP1VBlTrGmllvJepjSWbvDOK7YFUnHD26SNmQ+wQbBYaN
	WQTLlZ6XpACqdceb5afar75QeV7xm4/Kp4BkUD97te/LCuyygLMqHM53bcep/+ybEiEm5MpYZSPBK
	GjbH7ql0h9yUyNjH94/TUZ+Np6ywi0KJJqQqH6V7stgTLAMSvwwbecwV501SAXqs9YnQbqRHxLj1Z
	M5VUuRCoZcY9U/jrgxz0vULk1ajqmyzxh5Xdj5JZ17GwMjOqnaeQWF6ZoKN37hp8pi33/izwCA+Ey
	xLU7ewvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur8j1-0000000E7yT-2GWT;
	Wed, 27 Aug 2025 05:29:35 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur8bS-0000000E6gX-1fyO;
	Wed, 27 Aug 2025 05:21:48 +0000
X-UUID: b6af3eae830511f0b29709d653e92f7d-20250827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:6ea4852e-198b-4763-9082-b5b6a3a6dde7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:ff25b090511d28585eced737a980893b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b6af3eae830511f0b29709d653e92f7d-20250827
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1580791657; Wed, 27 Aug 2025 13:21:41 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id ADDAFE008FAB;
	Wed, 27 Aug 2025 13:21:40 +0800 (CST)
X-ns-mid: postfix-68AE95E4-5407809
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 0D64DE008FA3;
	Wed, 27 Aug 2025 13:21:25 +0800 (CST)
Message-ID: <773da273-4ab7-4672-b4d7-f9c560f3fccc@kylinos.cn>
Date: Wed, 27 Aug 2025 13:21:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/18] powercap: dtpm_cpu: Use
 __free(put_cpufreq_policy) for policy reference
To: "Rafael J . wysocki" <rafael@kernel.org>,
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
 <20250827035056.353772-1-zhangzihuan@kylinos.cn>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <20250827035056.353772-1-zhangzihuan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_222147_119591_C8B660DF 
X-CRM114-Status: GOOD (  19.42  )
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

=E5=9C=A8 2025/8/27 11:50, Zihuan Zhang =E5=86=99=E9=81=93:

> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>   drivers/powercap/dtpm_cpu.c | 24 +++++++-----------------
>   1 file changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
> index 99390ec1481f..65117569d0f3 100644
> --- a/drivers/powercap/dtpm_cpu.c
> +++ b/drivers/powercap/dtpm_cpu.c
> @@ -144,19 +144,16 @@ static int update_pd_power_uw(struct dtpm *dtpm)
>   static void pd_release(struct dtpm *dtpm)
>   {
>   	struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  =20
>   	if (freq_qos_request_active(&dtpm_cpu->qos_req))
>   		freq_qos_remove_request(&dtpm_cpu->qos_req);
>  =20
>   	policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);
> -	if (policy) {
> +	if (policy)
>   		for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
>   			per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D NULL;
>  =20
> -		cpufreq_cpu_put(policy);
> -	}
> -
>   	kfree(dtpm_cpu);
>   }
>  =20
> @@ -192,7 +189,7 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
>   static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
>   {
>   	struct dtpm_cpu *dtpm_cpu;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>   	struct em_perf_state *table;
>   	struct em_perf_domain *pd;
>   	char name[CPUFREQ_NAME_LEN];
> @@ -207,16 +204,12 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm =
*parent)
>   		return 0;
>  =20
>   	pd =3D em_cpu_get(cpu);
> -	if (!pd || em_is_artificial(pd)) {
> -		ret =3D -EINVAL;
> -		goto release_policy;
> -	}
> +	if (!pd || em_is_artificial(pd))
> +		return -EINVAL;
>  =20
>   	dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
> -	if (!dtpm_cpu) {
> -		ret =3D -ENOMEM;
> -		goto release_policy;
> -	}
> +	if (!dtpm_cpu)
> +		return -ENOMEM;
>  =20
>   	dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
>   	dtpm_cpu->cpu =3D cpu;
> @@ -239,7 +232,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *p=
arent)
>   	if (ret < 0)
>   		goto out_dtpm_unregister;
>  =20
> -	cpufreq_cpu_put(policy);
>   	return 0;
>  =20
>   out_dtpm_unregister:
> @@ -251,8 +243,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *p=
arent)
>   		per_cpu(dtpm_per_cpu, cpu) =3D NULL;
>   	kfree(dtpm_cpu);
>  =20
> -release_policy:
> -	cpufreq_cpu_put(policy);
>   	return ret;
>   }
>  =20
I accidentally sent a duplicate patch in the series.
Please ignore the extra one, sorry for the noise.

