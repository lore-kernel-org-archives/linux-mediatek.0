Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16572C3065C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azDBjHhKUye4cN0crYH5QFIFk02261yjwRDufuvps3w=; b=RXt7Jeho6onr2cDF5Q3W3QF2mI
	0OWoojlRdebPWgKbpZtA9URm1gt2RvSa2BwfDKoyzkHUb6ch0v+d/uqmKQi/3UF2Ex0fq6ACYtLxP
	8aMeEcwa+8WYubjGErQGhGLlHEP64pQdHCG6DS9L9NPKS/7w6Pu6xwPy9PIr9tDOtGgqHMBk/4k+8
	FLJSpTRrOcCEDhATuLz5yCYVkaiGUp5Wm2zrgCfmZufIIYQdw2dotgAwbngjcR6hvtvovldcp70Pi
	zNo7ptQAXp1/zpy0/I0vGq5jakwR4SJShRNIVp70T60TbqualLgbgIDAvaEgX5+rge5T3aXRKYaMg
	YXtLPVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPHpB-0000000CaUu-3KaE;
	Thu, 04 Jul 2024 08:28:17 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPHox-0000000CaTB-2D7T;
	Thu, 04 Jul 2024 08:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720081682;
	bh=wVc3mDrD8ZHGcxEpI3RL80GBUfv7tqc7amf82VOOdic=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I9wSr5qndJJgZNK1GxM3ELWQWxcNRB0+T2ztlEssHpreWLW1x0yx/AW8C8CjFao7q
	 6tunopOnUy9YaYgE6BhE8LLp/MMeFR9xq5+hu8qRwq2dq2N8b0o1AgcmIv6XOPXExI
	 SOB6RiEioW7sWw7YaHcV26LEQmTVgkOOV4rxnUhjZgaURn/sxkqmInVgzBi8Nf9xg1
	 zzQ9MyIkkaBIfpaMD9nANIAFKME2+NH9lhW1iXLwdr6zGpV3HpHBtRCVS2ghQJvc20
	 P/hQHND/IWN5dEj8pOdBPWdb3hp7Ua4Cb94yo8VbN2Y5tV+kQX5JNm5YDoFQ3+qQZy
	 DQ1/PpgNHDFeA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E651C37821A0;
	Thu,  4 Jul 2024 08:27:59 +0000 (UTC)
Message-ID: <2a1e25ad-c9d2-44f1-b52e-74f12b437381@collabora.com>
Date: Thu, 4 Jul 2024 10:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] cpufreq: Make cpufreq_driver->exit() return void
To: Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Huang Rui <ray.huang@amd.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Len Brown <lenb@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Lizhe <sensor1010@163.com>, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <cover.1720075640.git.viresh.kumar@linaro.org>
 <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_012803_729853_A94A8EEC 
X-CRM114-Status: UNSURE (   7.88  )
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

Il 04/07/24 08:53, Viresh Kumar ha scritto:
> From: Lizhe <sensor1010@163.com>
> 
> The cpufreq core doesn't check the return type of the exit() callback
> and there is not much the core can do on failures at that point. Just
> drop the returned value and make it return void.
> 
> Signed-off-by: Lizhe <sensor1010@163.com>
> [ Viresh: Reworked the patches to fix all missing changes together. ]
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


