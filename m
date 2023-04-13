Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1CDC77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 13:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNFLBm9P5zjQNegZlohtpQtHq2lLlOO2MMnDqkjQZGA=; b=ppL4e9YgHdE/JA4iyfvyHB3Xaz
	NaXY9Vvu3TEPWm1BsMzfuXoKOLvNeaoQrxFh3/HCblHh38iOt/yWcEgYgTic4jEhyWTzVWxEgBtlv
	+kDRU2k7+i8WPWSkL7Qtd1RUevCBgxhijH/AW8AwFC6iTUmRp9hrphtiUyi9UZ2wF8heYwo5y8n4t
	ZYOot5uPigrr4tJi4u3xXjlFiuHIoZDIDQtNP17minOhpVxY9Ce2guSQ5iTj8BnQXU9FG9P2lbJLn
	PlycET1LP3LlUgGifH10lJ6PKtsZVT32p6hS5YGUEX42U1Jeug9DSEw+10L2XC/sXfHVnxfVKiv3E
	sqZLWjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwrw-006FUS-10;
	Thu, 13 Apr 2023 13:20:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwrq-006FQl-0L;
	Thu, 13 Apr 2023 13:20:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBD726603218;
	Thu, 13 Apr 2023 14:19:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681392000;
	bh=zyLNmnfNyceNKY5LBE9mhScILY9Dbz+FbeLmTMBp8cI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cIUmClu7FHs9xjiZexEXmR0VU1d1P+tGwjVpRX4TWVwOZElm4SUn04vjhvZtr3nB2
	 RKOAO9gIeSpqAciIquSuCiAZvOIOQ5i6jBFabD15GZzyxsNO/ln1NrWMYBj5ibtT8i
	 A5zp7xgt/QP21zGOovUYf24THw2egu5cLb6sEE8+p08GGgG/ilL0PaY6in2022QgPr
	 BgENQvB70mbOOkS4n8eaW+DpvpqAxkNcZnkYOJYgVvWnhKJng0Uh49Yrn194vnEBgc
	 UFfkNGDGELPO2TI5fNikL3WgDAGJIzpcbhIRHt6UAtXYtOHITGyFHVvy0cqXhEj4mh
	 PzRyRSAaBpHdA==
Message-ID: <23dea66b-27cd-dbeb-37f5-ad9566e50962@collabora.com>
Date: Thu, 13 Apr 2023 15:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 6/7] ASoC: mediatek: mt8188: add bus protection
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-7-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230413104713.7174-7-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_062002_321812_56E47715 
X-CRM114-Status: UNSURE (   7.65  )
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

Il 13/04/23 12:47, Trevor Wu ha scritto:
> Add bus protection for reset controller.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Is MT8188 the only SoC that will ever use bus protection for reset, now and
in the future?

...otherwise, I think that the best solution here would be to implement that
into the reset controller itself.

Regards,
Angelo

