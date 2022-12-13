Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF8CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 10:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKY5LwusEJq01B4kG/hiHH/JBdZIjqnR0m9kdGd5tV0=; b=tr2LOeARpvNXSf4dF/nACjxmyX
	UpeqObBdAKGH/CppiUXkHZuZ100oxYomxPiKrqnj02/CnIO1xhX172Lr37wJPNN/JTNo86/8Ao6hn
	rb/pMCclWfzH4M/tMe8ERKMEo1+FLw0X0QpWegLQdCGJrRhzTkVYoQ3L2RA1D5XkTpC3EtL+9xYYT
	So+ab93Y9fCzbtVDhn7Ky+zPJbW5Oxcffw8xYKtlv6VVsV04HjgKEdXEAOdylRX5JDRsF/ux1s8T0
	3RXuyRLPoQP3sF+xgdFmfRR22P/ym9ZmITvE8t9eSxxfKT0pC5uIWuelWde00rxe6G1USgnpmqQMB
	A3CZ32Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52oc-00FqYm-RX; Tue, 13 Dec 2022 10:47:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52mz-00FoH8-Uj; Tue, 13 Dec 2022 10:45:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C89A66602C36;
	Tue, 13 Dec 2022 10:45:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670928332;
	bh=/rl+V9fireMwj8qHsGjB1b0MfONrsBSzed9ZXGPlM+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d6X6NjbDCn6AAVp0FxhLHfmMSY3qwt8Hyjul3yIv7YbvdykLxjuHbGaX9doJxRLfr
	 3U74JAza/5lOCzhNl3Xy0S82zm1FC1ew9Giplpmu2uUU4dBOTTAZuEJWmMVfIVG2XO
	 fEfkGK/wyqpOOi7XbFPDDNS+moia44o1w8JNRlh6rBy7Cyh1ZYNkguYczWDABN+sAf
	 G9LbH0OiyGrt5ZQxDjbBaASq639Qn73tPfJL+pzgkTsYHRf/IonE7jM+rENfsI7jGS
	 X4bVSVdTNDUNl6iZTDkOzZhPinrz5Y5T+tarhnb5Ea/amjPRwYMM1vL93y97Bd0/JK
	 32c/eP6O5bKIQ==
Message-ID: <6ffe412f-2921-160e-068f-cf567e9a0738@collabora.com>
Date: Tue, 13 Dec 2022 11:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 01/12] ASoC: mediatek: common: add SMC ops and SMC CMD
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221208033148.21866-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_024534_168194_F0816DEA 
X-CRM114-Status: UNSURE (   6.59  )
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

Il 08/12/22 04:31, Trevor Wu ha scritto:
> SMC call is required to communicate with ATF for some secure operations,
> so we add SMC ops IDs and SMC CMD ID to common header.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



