Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D07AE95A91
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 08:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dw9EJ/yZ1nzb5BRPKUMoucc3EFhQ095Vcx+fMixVghY=; b=2Uma4i4SFigTcrfbbN32nTBvfa
	IEF3Xw9PLKCMRXhSvzbJS6o//1XVs1MAaTC3+uZZVMal+DgVu6nBbNHWUFNG0FYlcAAufj5VDOu1a
	enTMWBpiFqOVh5mJGE/pXlMwLmOHV2or3BLSekY86UJDNg2xMYImZcNfLQ/gkc0kmEnvjWO7wINxV
	ppJNQsS8S/5B6/IzOfYvA2b2MseskwZCKjLFoKGqU/xnTxjO3VikitWFZUijqBj7vOqNrEdIHxnWJ
	3X29oWcE0bYew+OW7z3Qi1TuNq6wejWUVTFAF1OzxfYS7LeA3U0iLJ9A13JFVkrjU3oWHXuqAOMZr
	FS+e+2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qplzA-00A12T-2U;
	Mon, 09 Oct 2023 08:51:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qplz5-00A0yy-0X;
	Mon, 09 Oct 2023 08:51:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A803660708F;
	Mon,  9 Oct 2023 09:51:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696841481;
	bh=k9DxY2pZj9VNMIEbtEzEch2H2eOqQpTLPwo754uwNQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bRARrHT/3htPKK0RbfsYILUajqJ8xnE4AfA8k4NWozgsApd7HnLzwhD4a1qVaSxv6
	 nj76yiKGeYsvyn/M/OeYmgUKOh/hMl+uppMl6d3FPSGx2LKAvEL3c9sTrEl7ZsIqN2
	 PgsNGQDhd7i1CE1YJZnE2Qet9yJUwIMwR2pOmRrh950giBGlAGhmd8xoSx0znxR9ml
	 kP1jnzscbYxXk9zZd6SMaQbl1pWczeBfK1oKYtC+8J8A537eekbp3ek2JDqrZhc4kz
	 zQr8OP+IiByFOcM0VcElQI9NdHe9YFMpV0XqXsCziRlR8nAtPdddxcQNs45IAkcy2w
	 QOszP5mjsRvsg==
Message-ID: <85c73436-988e-2493-1b47-967481b279bd@collabora.com>
Date: Mon, 9 Oct 2023 10:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/8] ASoC: mediatek: mt2701-cs42448: Convert to GPIO
 descriptors
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
 <20231006-descriptors-asoc-mediatek-v1-2-07fe79f337f5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-2-07fe79f337f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_015127_358504_7CE09B29 
X-CRM114-Status: GOOD (  11.43  )
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

Il 06/10/23 15:46, Linus Walleij ha scritto:
> The driver is pretty straight-forward to convert to use GPIO
> descriptors, however a separate patch is needed to accept
> the DT GPIO resources ending with "-gpio1" and "-gpio2"
> instead of the standard "-gpio" or "-gpios" name convention.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


