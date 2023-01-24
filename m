Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74305C25B4E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 11:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIaUwpBnTv5dIUfbjZr7Rwxz/AZWLATLZsuDyVy5koY=; b=QoEp9XRtlGwNfHsxJ3a3v/BL8V
	9tm8r9tGN3dXrUSuNdt2X5JXa/E9Xb1vA9YHNAeRv8YyGePguISikkYGqHPsv7kb3JmPczHJIaZV5
	eWXIfjPM3w6Y96Zus+Rq9DYRQ8OPXEFA0Mg563P5c8aEz+ZFqRnlsqDLNr3JUag4DQYHxr9mi5fKE
	2QzJlcEsmS26lCMfB6o42aI/qZ3e+KL56TlixoonrcmiaY6uHbBnCCYx5zeg4EuAciL106l64Kep7
	0HEpFGQ9A4NFNjL+SdBLLO/ghgApKuaFgYQt9ZsEa37gzOFuxnjWHnnQogo7nZUyeOw3xvi4BKbEC
	c+N1CNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKH62-003JmN-96; Tue, 24 Jan 2023 11:04:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKH5p-003JfJ-0b; Tue, 24 Jan 2023 11:03:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B49196602E2A;
	Tue, 24 Jan 2023 11:03:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674558235;
	bh=c7rwFTilVrOZNcOXpqSZCuIj1ZlwXY7Pn4yaXa6ma2s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DCwEBBqaLYMAAnzeL323Dd4c1qrmPLoi2Wi93tqWWlK8Wobk+NevjcO6FlN+HLuof
	 3u5yEO2Ae/UkdfbDvcIgoJOYnfOj91MTYvp9c9wEnByV98jgf+7+hkGpuikfWhfz7c
	 TYkIP2DhR6SPEO9Cjgtk1jmhqwO8XKPKoCOyv6hqF2pWZ9Vpjx4/89Mv7pJmPpAIfG
	 xWY3s698u0GjScCLWRxcfrq8WxAhbX4dnrkYFz+Vz4zX/v1mI68JrK90V7DuguFOaw
	 zpSc3z1COxQJbZh29DrCO+b+GyzTm+aoY3zCb5+vE3WvfYbfwPRdqblEiXZ9Nl3GX5
	 qGlpGh7PCzc7g==
Message-ID: <2ae768dc-ac83-eda2-c425-014251c40a74@collabora.com>
Date: Tue, 24 Jan 2023 12:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 14/25] ASoC: mediatek: use helper function
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Chunxu Li <chunxu.li@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Linux-ALSA <alsa-devel@alsa-project.org>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
 <87edrku1cy.wl-kuninori.morimoto.gx@renesas.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <87edrku1cy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_030357_224098_FE977CA5 
X-CRM114-Status: UNSURE (   8.27  )
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

Il 24/01/23 03:12, Kuninori Morimoto ha scritto:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current ASoC has many helper function.
> This patch use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


