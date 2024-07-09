Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBCEC3271E
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jul 2024 00:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlo3UWV9lkDtVHiC3tnceLIBeIIjDfMxY69ysONeH1A=; b=arlIttsUTyu3yCtdevjiIqGpqH
	0U2QKS7634LcGb0pi0X4SPln1tUtlr2ZjfEAOY+ojtABquhVnDxvK8Q2hpWeDNfIvRXDfntkjlChW
	A24N/bLXfAarC3qz1OffE9A857DJlgxfULbWIoc0yllUVB9yH9hJtJm40GSS6NMy07d8iU3cAwbsF
	TpUsEJsgDbG5QN6BMEGsA5nwqp0E0xwxqISg1VQna1oyLwjT3UfLvvbbxFhR7XHGhM2cMHnpyW0Yu
	R02On4XttmxVLDzeFr0tkfxILLfMJZo3lNs+uFaRceuuZuOOHaPXoXKTDxkEzbLnl7SO4cPrwA4gY
	M4zEu6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQyex-00000005QuL-2Df3;
	Tue, 09 Jul 2024 00:24:43 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQyeh-00000005Qqv-12e5
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jul 2024 00:24:29 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fb0d88fd25so29435985ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jul 2024 17:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720484666; x=1721089466;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlo3UWV9lkDtVHiC3tnceLIBeIIjDfMxY69ysONeH1A=;
        b=VjwGt8P5FiMo83g+YuydHe1hfBlxPov5E51hZrYiCn1KZNsJLjLkP2LmZOuaTOLgdI
         f/GnQPoqSWh3cmbXUcLbdCOvEE9apPQwFy8SXG6Zf4BS/htjY06NxxincAYfv9/V3LOM
         AA3VMoicV3Jgjcw1K5gKghoBl5PdP/OTlPxIyOyx3hEKJfI2tKa+g5x0YG+IujVx5wSi
         scOH0c2HcOHW8A0EqSvQVMqYp9A+CWUPn80tnv15Q5VxDUHsgnMQqnh3D1Awzh9XWtHs
         pV0j86MKoeLBsEdWiGQ80ZTB0ZCDLuTknmxRMD7QzxWjilMvWT9u+xikfHqab72S7hLX
         txVw==
X-Forwarded-Encrypted: i=1; AJvYcCXHeI1aSlZ7tdsVLEpqAiUkiZPEKTZfU8lZu5vzmQyWu6jTUsdjYchD8cGiXabErrCumW+zN15DGy9zD4tkFSEYT7/1+/cFN0J4VlHTSjgi81G8
X-Gm-Message-State: AOJu0YzgSA8KEC2PYtd4avUGHwgZm5xXlKq7RyaupCxv9TG5iH+zJ2hU
	EFh1G31D2JvW0r8JIIkKpu34RO+cQCtV7RX9h2DMgn9M52a3p1CLru/mAWC+LUI=
X-Google-Smtp-Source: AGHT+IFdw3EaveRM2ZTHoRq8dYxA8E7q05nixOcYOGorj2dRL4w7J12n220WAjIf2IctJiJkVfxTEw==
X-Received: by 2002:a17:902:db0e:b0:1f4:a04e:8713 with SMTP id d9443c01a7336-1fbb804725emr12528595ad.28.1720484666359;
        Mon, 08 Jul 2024 17:24:26 -0700 (PDT)
Received: from localhost (97-126-77-189.tukw.qwest.net. [97.126.77.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ab7d2dsm4321415ad.180.2024.07.08.17.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 17:24:25 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Huang Rui
 <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Perry Yuan <perry.yuan@amd.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Lizhe <sensor1010@163.com>, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 4/4] cpufreq: Make cpufreq_driver->exit() return void
In-Reply-To: <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
References: <cover.1720075640.git.viresh.kumar@linaro.org>
 <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
Date: Mon, 08 Jul 2024 17:24:25 -0700
Message-ID: <7hplrn76py.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_172427_309475_A5D787B1 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Viresh Kumar <viresh.kumar@linaro.org> writes:

> From: Lizhe <sensor1010@163.com>
>
> The cpufreq core doesn't check the return type of the exit() callback
> and there is not much the core can do on failures at that point. Just
> drop the returned value and make it return void.
>
> Signed-off-by: Lizhe <sensor1010@163.com>
> [ Viresh: Reworked the patches to fix all missing changes together. ]
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

[...]

>  drivers/cpufreq/omap-cpufreq.c         |  3 +--

For OMAP:

Acked-by: Kevin Hilman <khilman@baylibre.com>

