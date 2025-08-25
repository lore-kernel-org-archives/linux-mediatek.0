Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103BFCA0EFA
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+Wj4lspzxilYHnL2n/XBAI4pOdiOAnsXLwAw+4PFe4=; b=u3yU7TPJC1T+yQI4ol9MSvABSs
	0b3eolDlkSbnSLE007GMRGieJ7tu7C7sKYC84vD5/Cm7ontD9LNHke5NiYXjBgxFoknRy8DNdS1EB
	rzzGHvN/VC2aNW4Vaj5c6FLCRzpESskk7m4w2a51meiWCHKWfI8179+L98hWAmzspPPG7cmjOzNQx
	4FyUEQjoB8DExbtyKRLJ9m2fGdSqp4LuVcQxAhrUZ6PN0GC+bCKfhiRFeZA6upwnqEe74exeIgokS
	jDi0ZCILigW/Rkrz1dAhhHl89Sof/+YpUDU9donBPBr/pqACdjVwEkMH7LV1vbZKSd5MG/h9nfREf
	TptxSqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYny-00000008SM7-13BF;
	Mon, 25 Aug 2025 15:08:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXx7-00000008DHI-1hS1;
	Mon, 25 Aug 2025 14:13:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E75844DB9;
	Mon, 25 Aug 2025 14:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EED3C113D0;
	Mon, 25 Aug 2025 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131220;
	bh=3RLeKCKpDIk2eBgGx5sPwZfoBKyVmeEo49RWhYh8Kh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e4fvRADWc2SiGyvairwMKdDw1zm1wGOXThGQeER0f4MYqsGYBRhD4UrfH+q2kimaE
	 978Vxb2gnRrcxwK29zKxBr5sDuyaM7DyuM68nemBfDcJoWAJvdefCrMf4ky3tm3mTR
	 ZEf5XaC0Deu8RHdTatQRuIX1UHKAPHYmvItTm0G3jHrBoDa0LYl7qMs/ZPY2JpgApc
	 lQtDHIn1yKhsLsiU+tvHyxR+ZutYlrHGoRZcd4IzOHtkeInzrDGgR65atrSWLdNsYt
	 TaeLwZDvBl70cfWDcKc3Px3Inhk2GTRE0IlvBDIzWF32uT29HeibPtjI2oz6UM54HE
	 cW6lqbzTmXm7Q==
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-74526ca79c2so206301a34.3;
        Mon, 25 Aug 2025 07:13:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUQG/9/Ge5CHWbTTZH2g+DLp1lqRiNnE4+4H38yBR3mqcqK7V4KG3LTgv0M8wVFg+WMMVK52q1trWVtrDVqx9o@lists.infradead.org, AJvYcCXadzhzBHlULOMddENdhIIa7JgulEbfMrjjAEr8K/G4+PXiUkmVDFXRttrx1Wrh9sMg3mbQH/lthlr15dN0J4g=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBflFzdfW2d8NZeGbwSX+nHoqT3TtlDGZqj3wRuY5MnhtHkB3F
	uHoFlbV5iJpXkcaaGwO1RotLl54sqC2aqmlxMkC/nSmE99PrmBuzY3q8vMWCr3Y9A1hKcOmyJWY
	T/V6hB2kHrTJTb+aVDA84gAyO0HDS/bc=
X-Google-Smtp-Source: AGHT+IGEnV+1YshDCmjAscdFjkSNQru4o/XG/DWYuObgbMiwP57k9JdqOZlPe3YdSW0fnLXsvsMiCF3QToEZVDUm+Q8=
X-Received: by 2002:a05:6830:d18:b0:742:fd7f:e105 with SMTP id
 46e09a7af769-74500aafdb9mr6734918a34.19.1756131219164; Mon, 25 Aug 2025
 07:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250825092833.42441-1-zhangzihuan@kylinos.cn>
In-Reply-To: <20250825092833.42441-1-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 25 Aug 2025 16:13:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g7rJn=z5p4DuJJoPpZrR5ismYftpDWp5X=z74DqaGYBQ@mail.gmail.com>
X-Gm-Features: Ac12FXwCyvYKc8Ipwt4NeaLRZNsWY9t1kMBiUFhDRbkfLg-XPnoGM5Pxq1PIQzg
Message-ID: <CAJZ5v0g7rJn=z5p4DuJJoPpZrR5ismYftpDWp5X=z74DqaGYBQ@mail.gmail.com>
Subject: Re: [PATCH v1] cpufreq: use __free() for all cpufreq_cpu_get() references
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
X-CRM114-CacheID: sfid-20250825_071341_482562_E8107008 
X-CRM114-Status: GOOD (  19.63  )
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

On Mon, Aug 25, 2025 at 11:29=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.=
cn> wrote:
>
> This patch replaces all remaining uses of cpufreq_cpu_get() with
> the __free(cpufreq_cpu_put) annotation.
>
> Motivation:
> - Ensures automatic cleanup of policy references when they go out of scop=
e,
>   reducing the risk of forgetting to call cpufreq_cpu_put() on early retu=
rn
>   or error paths.
> - Brings the code in line with the latest kernel coding style and best
>   practices for managing reference-counted objects.
> - No functional changes are introduced; behavior remains the same,
>   but reference counting is now safer and easier to maintain.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  arch/arm64/kernel/topology.c                  |  9 +++----
>  arch/x86/kvm/x86.c                            | 10 ++++----
>  drivers/acpi/processor_thermal.c              | 13 ++++------
>  drivers/cpufreq/brcmstb-avs-cpufreq.c         |  4 +---
>  drivers/cpufreq/cppc_cpufreq.c                |  4 +---
>  drivers/cpufreq/intel_pstate.c                |  3 +--
>  drivers/cpufreq/longhaul.c                    |  3 +--
>  drivers/cpufreq/mediatek-cpufreq.c            |  6 ++---
>  drivers/cpufreq/powernv-cpufreq.c             |  6 ++---
>  drivers/cpufreq/s5pv210-cpufreq.c             |  3 +--
>  drivers/cpufreq/tegra186-cpufreq.c            |  3 +--
>  drivers/devfreq/governor_passive.c            | 19 ++++-----------
>  drivers/gpu/drm/i915/gt/intel_llc.c           |  3 +--
>  drivers/macintosh/windfarm_cpufreq_clamp.c    |  4 +---
>  drivers/powercap/dtpm_cpu.c                   | 24 ++++++-------------
>  drivers/thermal/imx_thermal.c                 |  7 ++----
>  .../ti-soc-thermal/ti-thermal-common.c        |  5 +---
>  kernel/power/energy_model.c                   |  7 ++----
>  18 files changed, 40 insertions(+), 93 deletions(-)

This changes different pieces of code maintained by different people
and the changes are not interdependent AFAICS, so better send it as a
series of separate patches.

Thanks!

