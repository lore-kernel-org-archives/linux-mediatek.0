Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D52DECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 08:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1bh95FWBlUgQRUPzEppUQ79+k/ltl3iQqtHBlB88wQ=; b=FNAzyMBtLX7NmcKfEnM77iAkjs
	d7BjXsxgxjbqZa27U137YXO5ZEjv2Txo9CkgppqYVTzHt+i9jGGbivRT9qNmjzP6efK/DAJ39l2+p
	8LlBb61VsWXmfzRB9d5G9mnm9i7e9kMyLPDfNMQI3dUgBkPCX3+kQXqT3nY0JHJw+FxABoRHiNRZ+
	BohTKuRx0Oa6LrETwVrWapMcQR3+dIOqrTc4MAvAyzWoLYL0VwpPucpRIC2btMpH1c4cSs+zs3mDv
	1uy1iY/nlJJyW//kRaX15nbIQzppPe+vUrm2+nAZsFd/AfdV+/LocMeMnPts1NAhm2sWqEItqEbnT
	SEjhNU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeW0-0036us-IC; Fri, 23 Sep 2022 08:58:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeVe-0036jJ-1A; Fri, 23 Sep 2022 08:58:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 13063660223C;
	Fri, 23 Sep 2022 09:58:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663923485;
	bh=wQmu1prepFsDvoMxrwrAtiqg7HEwyKsBpugOrawZEkQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K6wTIJ1bY5gfv5Kpet4pzsWBrE1rM/8GzteW+6esTf+m1sm8opaXfNjL+9lFAv0L3
	 RQdOXSqvhx3+Wt+7Vc59beI20KyZGhUwK08vhqspehoRm5V+WGqd/sdPn1/kdmTur4
	 jSwY0pTEA+UKqc0BqPGhqd7hersgBQNaKzNDfRG5HF9G/WVVo+yl2kgFyyFfXmCz2k
	 0OCkBIfYw3Zg4WD9MRiij1LMGJfbHXuRZw5p5nu3k4ovSQ4GIDLsQwRwEl0dxjLZ3f
	 xQod9S8J43hFfiV3CIn72IWRypxJxwRuya9DeQphAfc988UliaNSqMqos05ZNx7Boh
	 +cN7aPf9UoOeg==
Message-ID: <00ac0110-5369-87ec-36dd-d5f07f0b6d7c@collabora.com>
Date: Fri, 23 Sep 2022 10:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 5/6] ASoC: mediatek: mt8186-rt5682: Add headset widgets
 with switches
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, "chunxu.li" <chunxu.li@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220922235951.252532-1-nfraprado@collabora.com>
 <20220922235951.252532-6-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220922235951.252532-6-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_015810_221638_7F69B085 
X-CRM114-Status: UNSURE (   7.82  )
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

Il 23/09/22 01:59, Nícolas F. R. A. Prado ha scritto:
> Add DAPM widgets for headphones and headset microphone, with matching
> switches, to allow toggling these paths based on the jack connection
> status.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



