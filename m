Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DBBC30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 12:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTigXYFeY2NP/b63foLCDFuNciH9946ncIu95tA/M4A=; b=p/r363NmWcVIGYwtXybRCfi1OS
	TdSE5SH9+T7/1bGPWhTV+mRy1YPjUtGwwuSDXKEv+qANO2x8lW4lXwl12I11eqVIX8qKCfSdJ+Mf2
	dSUJWBCWo63e03S8aMjv2FS+N9qbHNBlhF94NEaAIRfKd38vCs05xIEvsG0JFBfUbWE6Pkw8yzOek
	Ndk/QPUIfxtsG9mXKDY4PqTUQRr7EmFFugSgYd5G3+qXV6UspQdLg0gT2d40/yZVypJY+dmaCOn9g
	2ebGpqBLf6l5n0IxNWbO42FJZFjfqy6eslHAWTCFF5M67BL4o9iBo84uFUol0HtsA21cvlxK8FSBD
	55AacD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPLAa-0000000D5Xn-2mSi;
	Thu, 04 Jul 2024 12:02:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPLAM-0000000D5Vx-0nzg;
	Thu, 04 Jul 2024 12:02:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3805626B0;
	Thu,  4 Jul 2024 12:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A194C4AF11;
	Thu,  4 Jul 2024 12:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720094540;
	bh=Sy6IDYHgPf8XKe3WtHb2MUaaZ8EMExF1AN4pG9iz1S8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iNCv11qt9ePmqAuMW8uUfuzNzF6tsSDb6lAXurGr9AJmo8z8m90621twv6pX8WwUH
	 Ve+1dTdxgRe79dgI2nUWm+esEeb+bXoNgN7s2je7hDrTuMuwhQZ3N+CzuLTcJGoz9J
	 Rnws+IMhP7Sb0PXo/W1nwmwqr6k9L5mb0frp0FfYRfie2uuB1zmITD6g2wMk4gE46e
	 L7W3Y8faWoENSgK3lRPBS+GJNE7NpnJ017UioXGVkgjebrpXm+h92NGOWAAWDIystH
	 Du7G8n0R+6mgfoM6vpHVeWjCzgzrDNr6bZwR+2uH6eHNoPt/RcNi53Yr6dOgHRKD2l
	 DdKIJOC2JLS7w==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5c4101f2388so13192eaf.0;
        Thu, 04 Jul 2024 05:02:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/vsjq1MPt02pYigsvNy9gYzDfrRFwbSIzXPDw4cDEz0I6glHUdyu9O8k6Ach7y+CGzfOdKO4PTWAWxkXFnPmWUpgPYbmiLaDqWAM+NK61aFophsENmcAlzUKqc5NmG7xZ4uM9HVnLfwimInqwI+Ee215YvbVqBOQ=
X-Gm-Message-State: AOJu0YzjILXeZNtc6ZZTyv3wVAtovGZTlHnchJLxTyjKzDZ1r1OpqfpM
	vQFi7nSoeRYNum8gsK7ZMxze3WaOKjR8hxkxV9jhF+Huk3nqITxvaey3MnbCTLlCgAilTSaQWxL
	W1wkPRp5sRTBgqLOZkF3kw91Oku8=
X-Google-Smtp-Source: AGHT+IEfXE0YhC0CadkHrUUKROvpyKyoONSuJxCmj7JBStJTkzTzhM7c6J8p1w9Caa82QdMwYxDdg2XwqcNfaJBeOS0=
X-Received: by 2002:a05:6820:2c07:b0:5c4:5cbf:a255 with SMTP id
 006d021491bc7-5c646a9379emr1242627eaf.0.1720094539244; Thu, 04 Jul 2024
 05:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1720075640.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1720075640.git.viresh.kumar@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 4 Jul 2024 14:02:07 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hvA3WvhXgKB0qAL_vXy1sJxeRJid=yfTcgePYGqX8uyg@mail.gmail.com>
Message-ID: <CAJZ5v0hvA3WvhXgKB0qAL_vXy1sJxeRJid=yfTcgePYGqX8uyg@mail.gmail.com>
Subject: Re: [PATCH 0/4] cpufreq: Make cpufreq_driver->exit() return void
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Cristian Marussi <cristian.marussi@arm.com>, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Hector Martin <marcan@marcan.st>, Huang Rui <ray.huang@amd.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kevin Hilman <khilman@kernel.org>, Len Brown <lenb@kernel.org>, 
	Mario Limonciello <mario.limonciello@amd.com>, Markus Mayer <mmayer@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Perry Yuan <perry.yuan@amd.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
	Lizhe <sensor1010@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_050222_353939_3D6D15ED 
X-CRM114-Status: GOOD (  10.02  )
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

On Thu, Jul 4, 2024 at 8:54=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:
>
> Make exit() return void, since it isn't used by the core.
>
> Based on initial patches sent by Lizhe [1].
>
> Rafael, I will take this through my tree for 6.11.

Sure.

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

for the series.

Thanks!

> --
> Viresh
>
> [1] https://lore.kernel.org/all/20240410132132.3526-1-sensor1010@163.com/
>
> Lizhe (1):
>   cpufreq: Make cpufreq_driver->exit() return void
>
> Viresh Kumar (3):
>   cpufreq: nforce2: Remove empty exit() callback
>   cpufreq: loongson2: Remove empty exit() callback
>   cpufreq: pcc: Remove empty exit() callback
>
>  drivers/cpufreq/acpi-cpufreq.c         |  4 +---
>  drivers/cpufreq/amd-pstate.c           |  7 ++-----
>  drivers/cpufreq/apple-soc-cpufreq.c    |  4 +---
>  drivers/cpufreq/bmips-cpufreq.c        |  4 +---
>  drivers/cpufreq/cppc_cpufreq.c         |  3 +--
>  drivers/cpufreq/cpufreq-dt.c           |  3 +--
>  drivers/cpufreq/cpufreq-nforce2.c      |  6 ------
>  drivers/cpufreq/e_powersaver.c         |  3 +--
>  drivers/cpufreq/intel_pstate.c         |  8 +++-----
>  drivers/cpufreq/loongson2_cpufreq.c    |  6 ------
>  drivers/cpufreq/mediatek-cpufreq-hw.c  |  4 +---
>  drivers/cpufreq/mediatek-cpufreq.c     |  4 +---
>  drivers/cpufreq/omap-cpufreq.c         |  3 +--
>  drivers/cpufreq/pasemi-cpufreq.c       |  6 ++----
>  drivers/cpufreq/pcc-cpufreq.c          |  6 ------
>  drivers/cpufreq/powernow-k6.c          |  5 ++---
>  drivers/cpufreq/powernow-k7.c          |  3 +--
>  drivers/cpufreq/powernow-k8.c          |  6 ++----
>  drivers/cpufreq/powernv-cpufreq.c      |  4 +---
>  drivers/cpufreq/ppc_cbe_cpufreq.c      |  3 +--
>  drivers/cpufreq/qcom-cpufreq-hw.c      |  4 +---
>  drivers/cpufreq/qoriq-cpufreq.c        |  4 +---
>  drivers/cpufreq/scmi-cpufreq.c         |  4 +---
>  drivers/cpufreq/scpi-cpufreq.c         |  4 +---
>  drivers/cpufreq/sh-cpufreq.c           |  4 +---
>  drivers/cpufreq/sparc-us2e-cpufreq.c   |  3 +--
>  drivers/cpufreq/sparc-us3-cpufreq.c    |  3 +--
>  drivers/cpufreq/speedstep-centrino.c   | 10 +++-------
>  drivers/cpufreq/tegra194-cpufreq.c     |  4 +---
>  drivers/cpufreq/vexpress-spc-cpufreq.c |  5 ++---
>  include/linux/cpufreq.h                |  2 +-
>  31 files changed, 37 insertions(+), 102 deletions(-)
>
> --
> 2.31.1.272.g89b43f80a514
>
>

