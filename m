Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643ACE95A96
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeu3+6BwvCdX65Hv/9kapjKnYBDiUYSoLUSd89cYlJQ=; b=OlRJA0jpBJQdQryspxiQPxASn6
	QMskW2rlnedGCEH1sLAfNpuLQz41txf18bHkLYglwI/QoVmc84O0ER7NuGoTeareBiRr8hc0n6Jp2
	Uegk4pdNxcrsAiQO9FfvMpkVtCD+HvMDOjuEUXLQGRv4GGyFEiBWDIUxNsKKdwTSvNO8rcSd3yc8B
	bGme+198Ww6x7YWRF8KFc2sM61A/JPGHF6gFab1PMOCkShuibK3NKs8/Lo1buCf0J8448nAMR63Lp
	CDzkCkKBPUCFhBzzk3hDNTuTshP9bb+aL2IocDLKXNt/XKCzQ0j8ssWTfmTwu4zq4T/FhIe8twVzr
	1onCNikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qplzI-00A197-3D;
	Mon, 09 Oct 2023 08:51:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qplz6-00A10J-2Y;
	Mon, 09 Oct 2023 08:51:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 072526607215;
	Mon,  9 Oct 2023 09:51:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696841487;
	bh=jVa5JJsIbd+rahqR791/qfoLZyjPB6foWAxVg7HpF4Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nsNl+DCI7wRFOKHmEZ+mCjUGMQ/bBWmFDv/0SAwmrlg8B16IoEBjXf+qB8r/AfGuJ
	 RNTAHIOJHuFn2XkakuonOvLjumuO8drxFVyiDmJyRsN275TK0pHbXsG+VeniIj3CK3
	 LKNouTSLHTNEbIytS7ose6WljahOJEqyK2NuBGSroD7UIlOTWidiAHBJ7rmekUm8l+
	 ruO9eyVxqLU1+h85Qmm42FeCqdD/owlh/wAj2mbatZ+3nGjxp//0fmmmCxWvloI24r
	 R2I0G7YGMOUIUFiMtzsrZr0WCThLJ+tcmoEFPSv0SXqXvHR9twjE3RKvqsxRv358LE
	 EkVv18hDRuD7g==
Message-ID: <d8bb3cbd-08a6-5028-1cbe-8f4d3278d929@collabora.com>
Date: Mon, 9 Oct 2023 10:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 5/8] ASoC: mt8173-rt5650-rt5676: Drop unused includes
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
 <20231006-descriptors-asoc-mediatek-v1-5-07fe79f337f5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-5-07fe79f337f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_015128_957772_DE35E244 
X-CRM114-Status: UNSURE (   9.84  )
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

Il 06/10/23 15:46, Linus Walleij ha scritto:
> This driver includes the legacy GPIO header <linux/gpio.h> and
> <linux/of_gpio.h> but does not use any symbols from either of
> them so drop the includes.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


