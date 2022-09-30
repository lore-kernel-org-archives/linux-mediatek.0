Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7E8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNw++YHNL4HIzlT1O+RPWMPL+GyspfYTD0yiEHmftYU=; b=QaQSU6xPPYfxpB8I9LvZ9zKrxX
	nDf1L/muOtWkmmOAqaVcUhf7nP/RYt8TCpx+VaruQulnG5jbAScaTVA18ZNk9wQSKMPItqkbYUUdv
	UKEB+pLwNwYFIZCxY59pSvU/XxTYwIyOsYgwMKtLuf8ULbnNW+84p4nLdDqqCc5yOK7QJN80sySqS
	AbzMYNygLKiDr968PfF70u1a91NSusyV5SzyS4KFmCmunzp7bSyY9ooY5GuaMPpZvuWtrtacLmnhV
	ZIoJsc+wD8S1o8utL7y8y8kekz666tUzYw2/KbXdiLMYqGeYpdYlU7kVEp6JORkr2IjI9vsR6DPD9
	nqxbi/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBYd-0087rN-Fo; Fri, 30 Sep 2022 08:39:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBYY-0087pb-Sc
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 08:39:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A03266022C7;
	Fri, 30 Sep 2022 09:39:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664527177;
	bh=E+BdStv7jSermFK3Q5InwQ6aKkfEO1DTevs1KsaSxag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lNeI6R1EXXnZ45AMl3XkvLawGjH/VJQOtxkkFpLQe4SCdssJu3/m5B0GDOXVotcMZ
	 hKcUjbhdQomv+eInmQyK+AFRV8dB5wc3VbNcjc4w4/JucBt45ERANOwpdpViZMjXax
	 sTw8H1sjGzeOhxk4SZB4YY/oUBJyo4XGl+TcbvXSvbWzgClyokOs6URnn3elSYStCT
	 L6iG9TbuhlpgoVpxXi9bDUTlg7lIbnx4OnlyVdrJRpBj1nk9FmiYHpyuWM048d7a3K
	 ZM4wIzR9+a1Ek9/kFJVcJ4j/F2IDU29GOAwq57ojVymvNo1xZnR/V0xVudHLnyHSm5
	 +02hVKys4vdmg==
Message-ID: <533c4451-a172-df81-c34a-a3ec906a961e@collabora.com>
Date: Fri, 30 Sep 2022 10:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 -next 4/4] ASoC: mt6660: Fix PM disable depth imbalance
 in mt6660_i2c_probe
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
 ckeepax@opensource.wolfsonmicro.com, jeff_chang@richtek.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 patches@opensource.cirrus.com
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
 <20220929150653.63845-5-zhangqilong3@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220929150653.63845-5-zhangqilong3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_013939_080144_239D841A 
X-CRM114-Status: UNSURE (   7.60  )
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

Il 29/09/22 17:06, Zhang Qilong ha scritto:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.
> 
> Fixes:f289e55c6eeb4 ("ASoC: Add MediaTek MT6660 Speaker Amp Driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



