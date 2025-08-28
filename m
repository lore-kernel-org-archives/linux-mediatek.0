Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8779CCA0EED
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 19:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/D1R1ws5ojuN4WG3pCUGyU24UMqyGj6lojr+YSYQ0c=; b=dz9eHgV7fxiGetQRd05XEVEkh+
	EHxB/FUXFIVfOoBAdRDWl9e6kLuMky/N0WDuKARZT5z2FJdWQ+aWDw9BfK4IcqFoLAaspfq7FGzHw
	PdA7haursLAyfkkZSa/h1d3haJbBHbXazRnW5sO114MjZ8d/43p8qk9dDyTAoNyhUaodXEQMVn0Wo
	GgzSQ/ejEmWgHzRqvS4uRU17t12jtfRd1XkvPFXmu8aoiBi467MLiPLycxl4B9J7hchaaWIJI9OjF
	vaJHlFR8dLhHUStMhO7Ce1Nxx2LfurnsnJLW7zK27rV7DB1dnI6875BbTV+ZJE8D+cshqln6Lt8Dj
	2LdoyzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriPo-0000000330p-0GBd;
	Thu, 28 Aug 2025 19:36:08 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgDY-00000002Nr6-0Z5h
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 17:15:21 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-325e31cecd6so1072059a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 10:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756401319; x=1757006119; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/D1R1ws5ojuN4WG3pCUGyU24UMqyGj6lojr+YSYQ0c=;
        b=tMTYCaEwhC+4eL4IIdZkiPZy/1rarlQLGcS9xQBY8ekWCuGajYzYhJhgtVMtiCqdzR
         oZqSFgkNxIXdUcchoUqKAiqoT2XvudmDkKByrbNXY2/ZM2fSOqhXF7RRcYs9dkFbTCRh
         tF71a0GXR2IFUc/1UZZ/LFrb6Ri9kv1zzCOb3i2EPyoIGQ9UitACbpLMjsrww8Y5KN94
         cIS4pCMRz0Y5QBvAB5ULtJtf7jAzOtXCX6fa1PnCwNOY41ggQ0t6vQYXbFRBU+V9/YBD
         bhwxvEE9dLVorWvL+WzaC3NY4iQFMrVAEM81B8ywAn5Xg/RFwzafEi+LQdFEZS2qt/Be
         0aXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756401319; x=1757006119;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g/D1R1ws5ojuN4WG3pCUGyU24UMqyGj6lojr+YSYQ0c=;
        b=aMyQNvn0wBqMDEmZM/YNZWULteUXUBYeNYIbmwOWHUYIjnpwCxRX0621QvL7aibH4x
         T7opIFXiq488m5Bs+l39/NagslmiqS+X/E3RVncHlRWlRc0SHHiBzgwCZA/GhjZrgZ9w
         Uw/B7QSeJOyUWiC3nifotmLJFeJf7xVec7X6Xf/4TqsevI6ugX7J3r2Ixn5YOKDuPRoa
         kBuklPssvmK8u3/9QVWbXCI3xVMnSNk67AAvQdMAfmZsJH9pJMTjCnvXpleGx4W1D8vf
         IuUJq+l4PzpaLulc4ac5yByZHnJyqFCbjr/+OLKwkYz5EZps4K+aYQ7D/lvBrOxqFcm3
         vnsA==
X-Forwarded-Encrypted: i=1; AJvYcCUgr1us/VqTSK8OvcDLoVlqh7g/d/pgNIAeHJeWgqIdFA/VRyWrg3Yih0qr1Vx2AtP2ZjM2feoqJnhZCIsP9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRdnYrunSUam8ChLFnrKFf09wBEcT6BvF3gRoGKSlUSlc6wda2
	fTKcYlOhUPLeiGuskmAi4KuhELmw9eZcDyayeNHvKmr6//OeDrkAjifhbeTIzjlAvxoHggTTOl3
	89eoLXw==
X-Google-Smtp-Source: AGHT+IEgfCMAj/kPGbx0Dj2C82B+XByTzBEnlSaJgGQHGzaozLp7T19v0PG28aEIfyLg5E6WkydfWYNcBOM=
X-Received: from pjhk31.prod.google.com ([2002:a17:90a:4ca2:b0:327:9b90:7a79])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dc3:b0:327:cec7:b8c6
 with SMTP id 98e67ed59e1d1-327cec7cb53mr1738031a91.32.1756401318775; Thu, 28
 Aug 2025 10:15:18 -0700 (PDT)
Date: Thu, 28 Aug 2025 10:15:17 -0700
In-Reply-To: <874d821e-8ea3-40ac-921b-c19bb380a456@kylinos.cn>
Mime-Version: 1.0
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-3-zhangzihuan@kylinos.cn> <aK8Sd30K64mbN1Nt@google.com> <874d821e-8ea3-40ac-921b-c19bb380a456@kylinos.cn>
Message-ID: <aLCOpfNkcQN9P-Wa@google.com>
Subject: Re: [PATCH v2 02/18] KVM: x86: Use __free(put_cpufreq_policy) for
 policy reference
From: Sean Christopherson <seanjc@google.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Markus Mayer <mmayer@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Lukasz Luba <lukasz.luba@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_101520_177068_BAA52310 
X-CRM114-Status: GOOD (  23.63  )
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

On Thu, Aug 28, 2025, Zihuan Zhang wrote:
> > Hmm, this is technically buggy.  __free() won't invoke put_cpufreq_poli=
cy() until
> > policy goes out of scope, and so using __free() means the code is effec=
tively:
> >=20
> > 		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
> > 			struct cpufreq_policy *policy;
> > 			int cpu;
> >=20
> > 			cpu =3D get_cpu();
> > 			policy =3D cpufreq_cpu_get(cpu);
> > 			if (policy && policy->cpuinfo.max_freq)
> > 				max_tsc_khz =3D policy->cpuinfo.max_freq;
> > 			put_cpu();
> >=20
> > 			if (policy)
> > 				cpufreq_cpu_put(policy);
> > 		}

...

> Yes, this will indeed change the execution order.
> Can you accept that?=20

No, because it's buggy.

> Personally, I don=E2=80=99t think it=E2=80=99s ideal either.
>=20
> 		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
>  			int cpu;
> 			cpu =3D get_cpu();
> 			{
> 				struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_=
cpu_get(cpu);
> 				if (policy && policy->cpuinfo.max_freq)
> 					max_tsc_khz =3D policy->cpuinfo.max_freq;
> 			}
> 			put_cpu();
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }
>=20
> Other places may also have the same issue,
>=20
> maybe we should consider introducing a macro to handle this properly,
> so that initialization and cleanup are well defined without changing
> the existing order unexpected.
>=20
> like this:
>=20
> #define WITH_CPUFREQ_POLICY(cpu) {\
>=20
> for(struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D  \
> 			cpufreq_cpu_get(cpu);			\
> 			policy;)
>=20
> Then Use it:
>=20
> 		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
>  			int cpu;
> 			cpu =3D get_cpu();
> 			WITH_CPUFREQ_POLICY(cpu){
> 				if (policy->cpuinfo.max_freq)
> 					max_tsc_khz =3D policy->cpuinfo.max_freq;
> 			}
> 			put_cpu();

This all feels very forced, in the sense that we have a shiny new tool and =
are
trying to use it everywhere without thinking critically about whether or no=
t
doing so is actually an improvement.

At a glance, this is literally the only instance in the entire kernel where=
 the
CPU to use is grabbed immediately before the policy.
=20
  $ git grep -B 20 cpufreq_cpu_get | grep -e get_cpu -e smp_processor_id
  arch/x86/kvm/x86.c-			cpu =3D get_cpu();
  drivers/cpufreq/cppc_cpufreq.c-static int cppc_get_cpu_power(struct devic=
e *cpu_dev,
  drivers/cpufreq/cppc_cpufreq.c-static int cppc_get_cpu_cost(struct device=
 *cpu_dev, unsigned long KHz,
  drivers/cpufreq/mediatek-cpufreq-hw.c-mtk_cpufreq_get_cpu_power(struct de=
vice *cpu_dev, unsigned long *uW,

Probably because KVM's usage is rather bizarre and honestly kind of dumb.  =
But
KVM has had this behavior for 15+ years, so as weird as it is, I'm not incl=
ined
to change it without a really, really strong reason to do so, e.g. to itera=
te
over all CPUs or something.

So given that this is the only intance of the problem patter, I think it ma=
kes
sense to leave KVM as-is, and not spend a bunch of time trying to figure ou=
t how
to make KVM's usage play nice with __free().

