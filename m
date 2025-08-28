Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B31CA0EED
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2ciFegHeRS5n9y4dPr0MbH+YHshSMSzSLg7dsYhGNQ=; b=rRn0jtfYywQ6XUVweQ7Z75waBn
	8BMF6/eUeGKsrQ+09p1+SETyb9dpBjoQv2fovs2dG73lyDedistDg+5Rh2ZSivE5b3I6OjYz093bc
	s9znP4RGxNwgL9oT9/2/Z0hEpsANgLbDaLRIGeLrewpUWVEDUEiuxBWQvfzNz0nOE8ZJVdrbvCrfN
	oz1C+aHsIWlUYJer0vgYO8hp1o+dElIEfuUWLONNJ6C7sw23uQQx0Cx150ucBLdfNo4eqrrl9eX1Z
	UiVOBnYHTcGcqr2DyvlHQrtTZIBLAMOvKjV/XAAK2dzFmQ7dlVGIxU8k624t52Y/AZQxTPe5cribn
	W5u728Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ura1q-00000001C1X-3TcZ;
	Thu, 28 Aug 2025 10:38:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ7B-000000010Do-0J1a;
	Thu, 28 Aug 2025 09:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E2FC44F23;
	Thu, 28 Aug 2025 09:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CE4C4CEF6;
	Thu, 28 Aug 2025 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756374015;
	bh=Cl0m1kDKpWeagimjoCyJC2nNVcFJOKHXK8N9AWWvIRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PeB3KckJWzuoF1tZ8tTiVp8npbP2q+yNr/EHkOOaeU7xc9lzd2ByA9SF/XlL86p84
	 Q204jbf0wqqR/rdATVAYnf9KZQ7oxD7tM+xSEgzpAwadzvk1MQMdY6+QTtivALX9Tq
	 jFtDlCkKcBKFNSTqMRp2M51BjnNBjj6cDiReGYduYaEfHcUbPDnrI6tWVtQt8DwXg8
	 N80qhGFLA5QZlDLF+BB8wt7Qd/1RV+dBEWZDGH/6tRo4Yaa9tWL8JXrEPJSWSztFna
	 eF1nQfq1cHjirFd4nhIbANXiz4xhwfgopXwH6/PpVvwEMEs+1/DVJ2ltgy3NagTLaY
	 e6Xc6anmZqmyg==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-30cce5cb708so553505fac.0;
        Thu, 28 Aug 2025 02:40:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAAK/MIBT3milwEoJWQAUO8CiCnRebkxeUTofO+ICUffLLKmclV0K68EIsx3xQuwF8h+eddf+64gcvRFnVjec=@lists.infradead.org, AJvYcCWfuqLsGocr8mVNoBeN3AOOWqxaOxIlT1fMHZLSCk+/jtpeMHlpXjqPTU2/pSD+gynd3hUg0goLfv5TKmiLeBPD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4edohZIzAf+uwaWliuZ4/IcuSfSrib0euzq/j5xT2SbOzRtcA
	F9XBD0F9bB0y6t3HGZ8D+UXVYsA4JLB3pvaDiLadboWJ5L6vReVq7TRxqiEJEHCxVxHjzk8/UFO
	stp41xmNsZ0gSD8fBnom+sM4OXtD78lA=
X-Google-Smtp-Source: AGHT+IGV4ScW5OAU3iglUFz6GOl/SaxSbnlEKhbCLP2wFA8xAwCena16hSLRSa/lAp17g1juuguW4VQdAzFwj9/LUxc=
X-Received: by 2002:a05:6870:9710:b0:310:b613:5fdb with SMTP id
 586e51a60fabf-314dcb575e6mr9287838fac.7.1756374014938; Thu, 28 Aug 2025
 02:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn> <20250827023202.10310-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250827023202.10310-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Aug 2025 11:40:03 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jA7HjNc6VQWdjuwLnmd751kV01NXC4v8Pyn8h-r70BzQ@mail.gmail.com>
X-Gm-Features: Ac12FXyk8AzMIpXHgrT8Z1UHGDrWUNjtTLP9mZxojpyASBCiNu69qRn54WdH-2Y
Message-ID: <CAJZ5v0jA7HjNc6VQWdjuwLnmd751kV01NXC4v8Pyn8h-r70BzQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] ACPI: processor: thermal: Use
 __free(put_cpufreq_policy) for policy reference
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Markus Mayer <mmayer@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_024017_214321_C79085D2 
X-CRM114-Status: GOOD (  26.86  )
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

On Wed, Aug 27, 2025 at 4:33=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/acpi/processor_thermal.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
> index 1219adb11ab9..f99ed0812934 100644
> --- a/drivers/acpi/processor_thermal.c
> +++ b/drivers/acpi/processor_thermal.c
> @@ -64,17 +64,13 @@ static int phys_package_first_cpu(int cpu)
>
>  static int cpu_has_cpufreq(unsigned int cpu)
>  {
> -       struct cpufreq_policy *policy;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy);
>
>         if (!acpi_processor_cpufreq_init)
>                 return 0;
>
>         policy =3D cpufreq_cpu_get(cpu);
> -       if (policy) {
> -               cpufreq_cpu_put(policy);
> -               return 1;
> -       }
> -       return 0;
> +       return !!policy;

If you want to make this change, please also change the return type of
the function to bool.

>  }
>
>  static int cpufreq_get_max_state(unsigned int cpu)
> @@ -95,7 +91,7 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>
>  static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  {
> -       struct cpufreq_policy *policy;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy);

This isn't correct AFAICS at least formally because the scope of the
variable is the whole function, so it won't get out of scope at the
point where you want cpufreq_cpu_put() to be called.

The policy variable should be defined in the block following the "for"
loop (and actually all of the local variables except for "i" can be
defined there).

Or better still, please move that block to a separate function
containing all of the requisite local variable definitions and call
that function for each online CPU.

>         struct acpi_processor *pr;
>         unsigned long max_freq;
>         int i, ret;
> @@ -127,8 +123,6 @@ static int cpufreq_set_cur_state(unsigned int cpu, in=
t state)
>                 max_freq =3D (policy->cpuinfo.max_freq *
>                             (100 - reduction_step(i) * cpufreq_thermal_re=
duction_pctg)) / 100;
>
> -               cpufreq_cpu_put(policy);
> -
>                 ret =3D freq_qos_update_request(&pr->thermal_req, max_fre=
q);
>                 if (ret < 0) {
>                         pr_warn("Failed to update thermal freq constraint=
: CPU%d (%d)\n",
> --

