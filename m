Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17962D65C76
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2024 11:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mW9kakVxPRJrzn+MWaVsnk4KfttRdsY63WrudNOSCU=; b=mdr2U7wgx2G+miR2lN0pvrVh4r
	N16TmyQwJMRbxt/fePun7yhaV/F/gRdC30DYkJ/1DCTRd4tyudys6Jz0/8WfIk4pUpYxm77kRbG2H
	PJiecA5GV0M27q2HpomQBR0ji3t+giGEu9ohJuNk9j7XaGTxCzqg2rbKMIn5Y+bxKLaH7d1h+KtBl
	c/W9vv81ygH0wO/gRZrCWOJh0AhD0h9/w7K+1Mvf02lsFu8zGkxnhCLtxgTsCGAvIvDzQq3Gs+ps0
	w1mw0kYmxtK1MPAM9VUkeswq+oNoHurEkgqFq467U2+niti5aXkJp+8NH1kpp1+tzrTcxblPcwmV3
	+Y1iSyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXsi-00000009hif-3BgC;
	Thu, 14 Nov 2024 11:19:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWzw-00000009W6l-1iEy;
	Thu, 14 Nov 2024 10:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731579766;
	bh=N0Zs06FQ5Xtv3SHbCA4mOGMqJ8tnWHRBdA2cSQ+32Nk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BS56wmC8dD7ZOfnypazCktbot14vilOAIeneaG4ZyzWr8JY5UbLY16X5RL4jskCm5
	 I0dOZNQfcpaWMdiaft42eej+JtjZhga4BY+ss563+AkGfe081OWzH8vHnpanKdEc1E
	 uU0UbM1jokCZf8z8uWVIjpNQlvOIIv/OHLaXg6WSobK04nOrAeZIQQVRhQQ26YdWWy
	 TL/YD2iHuEzY/bEMbN6MMTdGGBsu47DUSHaZHgrF1uv58IFgK5j4DYge2cgP46Qnfv
	 HsSOmcjyrzOuImoVNZ4CU3SV6oU+MBQVfjL6iLLm6NP7Lz/xqs8X9awWH/WWgh6tgG
	 +qdRy0lMeLfRA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34DE117E14EF;
	Thu, 14 Nov 2024 11:22:46 +0100 (CET)
Message-ID: <9f9a969f-6ce5-4e6c-89bd-51fe121db693@collabora.com>
Date: Thu, 14 Nov 2024 11:22:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] cpufreq: mediatek: CCI support SoC , the
 transition_delay set to 10 ms
To: Mark Tseng <chun-jen.tseng@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241108063942.19744-1-chun-jen.tseng@mediatek.com>
 <20241108063942.19744-2-chun-jen.tseng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241108063942.19744-2-chun-jen.tseng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_022248_775870_AA3ED141 
X-CRM114-Status: UNSURE (   7.81  )
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

Il 08/11/24 07:39, Mark Tseng ha scritto:
> SoC with CCI architecture should set transition_delay to 10 ms because
> cpufreq need to call devfreq notifier in async mode. if delay less than
> 10 ms, it may get wrong OPP-level in devfreq passive governor.
> 

This means that MediaTek SoCs can change their CPU frequency once every
10 milliseconds?!?!?!

I don't think that's really the case.

Besides, are you aware that this will have a *huge* impact on either power
consumption or performance?
We're going from a bunch of microseconds to *multiple* milliseconds here.

Regards,
Angelo


