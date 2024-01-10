Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9C1C4707B
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 14:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCgRgohghaIuzxU15lQv+DUCl1G/JFrp85MtXKRoklg=; b=m6dlJCdXwgggcHlhze36RHdkv9
	sROWVxp7P56LUinhgLxEToltH96B34Z5bg1I94IE5fzf3nuyAFa4W9odvPd/70ocHdHWUBBhwdgav
	x0NRDkMVlqhrZ3XNHsG8Ym2QSoR4rhddnoh/BJs/4Hu+aHct94U3ERrUjMYlp+SoffThgnEzSGgq/
	aeAWposYcRjsoPhCpEpBM4LkVIFSVfOshUFxcY6bmSFGh1mbp1g7sUsJgt22l2w7RsUAiOlNmxuYQ
	CsKpxRwcI56YeLRnAHsqVawIJG+zsllVrPgEimR2sDfCXzZn960azxpi0i1USaKSnTriXZn/HP7qq
	YWXcThAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZcE-00CKtU-0P;
	Wed, 10 Jan 2024 14:31:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZcA-00CKro-2p;
	Wed, 10 Jan 2024 14:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704897089;
	bh=6HC5IEm/hZtyU1ep9WTyrEat/6wqniqFyQTDH7oldac=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ypZPRcPBiCi4FSvhHWtelzW8Iqz7OsmAJXu7A0010JJ6IC4YdDDrk+fNTpFydaGFE
	 t7EA2TpIdOCMnxk3osEoWznAWmWcBV+Xi7sNtEHM8A4HMYJaEx7VXKITOhb2HbbCFm
	 /SwMxRVHlH5Nvh522RlG2QPrORYNanGU4a0JB6tKL6waTNC1LzLagthUKmWLKTvgLR
	 FNiNbH3NLNegRyTmigohyJidyWD8io6G4Wb30VopiBFdSyy5ePtoLkVWQPtMm7TKOM
	 EkdQcebT70VhD9Y3/0G/U6sMgTaNkqe6E5hN/Rov4hGt6WNQIMKPfkWhtrZOkvoCnK
	 X0pZ5H1nHU7FQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8C1ED378045F;
	Wed, 10 Jan 2024 14:31:28 +0000 (UTC)
Message-ID: <54f3facf-375d-4d23-9003-5ffbda2284dc@collabora.com>
Date: Wed, 10 Jan 2024 15:31:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] cpufreq: mediatek-hw: Wait for CPU supplies before
 probing
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, "Hector.Yuan" <hector.yuan@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20240110142305.755367-1-nfraprado@collabora.com>
 <20240110142305.755367-3-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240110142305.755367-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_063131_107722_DCEE7834 
X-CRM114-Status: GOOD (  10.56  )
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

Il 10/01/24 15:23, Nícolas F. R. A. Prado ha scritto:
> Before proceeding with the probe and enabling frequency scaling for the
> CPUs, make sure that all supplies feeding the CPUs have probed.
> 
> This fixes an issue observed on MT8195-Tomato where if the
> mediatek-cpufreq-hw driver enabled the hardware (by writing to
> REG_FREQ_ENABLE) before the SPMI controller driver (spmi-mtk-pmif),
> behind which lies the big CPU supply, probed the platform would hang
> shortly after with "rcu: INFO: rcu_preempt detected stalls on
> CPUs/tasks" being printed in the log.
> 
> Fixes: 4855e26bcf4d ("cpufreq: mediatek-hw: Add support for CPUFREQ HW")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



