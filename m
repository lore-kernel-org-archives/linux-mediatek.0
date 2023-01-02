Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18D4C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 14:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zYe/2an1WPxsKGWttksHCVKsB3iOYTUfWLh5qh5/qQ=; b=FnBumQrMXij6s4sNA9S/FG2igz
	+XfSWS68TlQft1k6BM1go9lt9lIG6ptokEdc95coVoqcgZpi1sOeHuc89NRH+XYCkDcSZyVVIvB/j
	+Wv3l/Do6aCb6yPjJNCVBUl3S9oW6TPwaSmUWXlZD+yti7IWFQOS81Cnunq+WWWHP7iO+Cx4aDKCC
	NCZDY1KlaMVf5/v3Nil0oiVZeQ/nDTdDzVqW2cUN79Yxln57Yn4L2KUYkwMDZKuoIOHqSM7nC+Ic8
	dJ5GJSAMA5456qjNgNe1lP6aI34/Ce4V6pCiGayS2KdeBVUlEK+5fgA7/zk784KaZEThXLH/Sr0Sr
	4MlZjrzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCLRE-00BfYr-7X; Mon, 02 Jan 2023 14:05:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCLQU-00BfKi-BJ; Mon, 02 Jan 2023 14:04:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 43124660036F;
	Mon,  2 Jan 2023 14:04:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672668268;
	bh=N63SXdlL9trrHT7Xb21JxrmzN98pQgZ+pngOJfLwRW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EO8Wyb5EuGeVId76NRTrQ9g9Nlan1KM2Ai39EmIxSU6LKNlOf7MyspUj74K/lCiKv
	 lYywjFAX3bHRQci9rb6iwlrPFBZa+CdM6lIt3V5T7+p8MtZqaaHjK60rkkPDGQNeWl
	 usbZ2hVsCKGGGUnuZyER/m1DJUbY7CyVrQCNbem8Jgs9mohg4vnVCNG0kfQC/JbuzZ
	 FMCjIEX34EqKh8GHBUlHwUN9Xk+bLe6IAfaf90kiOEougdc8KpruVxyLFyC2VZEeMQ
	 0OTpx4iqfTNHOjxczg3Oh9c2PdNvpJp4C3tuQMLi3hy1WMdvgql0L7DOb+vox5zEW+
	 TAHvHrC60eoNQ==
Message-ID: <6e1a405d-b20e-1093-a236-f3713aedbb1d@collabora.com>
Date: Mon, 2 Jan 2023 15:04:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 04/13] ASoC: mediatek: mt8188: support adda in platform
 driver
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221230055443.16024-1-trevor.wu@mediatek.com>
 <20221230055443.16024-5-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221230055443.16024-5-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_060430_709963_D12B60EC 
X-CRM114-Status: UNSURE (   7.33  )
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

Il 30/12/22 06:54, Trevor Wu ha scritto:
> Add mt8188 adda dai driver support.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



