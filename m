Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A859C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 09:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Podv9BZux744acwLFddeatDCPDH99mASLsudraJrNCY=; b=nJtHtm5QJIonzbM8UswQr8yggo
	FDkIohVcfyLmGFU3qxZwdQeY1UIvEKM7zG6xm5a1h/SsMOf1ckROuYfZ4MxhZd4Elppg0INwhNGal
	xqmSL/fyo8NIHdJDDugf4V5wLMEFOzcLHFoXnwOwZF3rKP/h/wQVIVZpLGef7Jb4n1hdiqTb52Wu5
	Rh+q74AbkxdayL4sWi/JCf5wbiVgtK3pBgVln9ClZPJBREo36/oi0oyrThyE92+m2i/07aKcoSCuR
	zT3N0v7DO6pD9yJkWDltdvsVwUwGVlGdL5iB5AoRRNCs5ZbMweXBsHmnugA0Lw0EJlGVcIa0A2PAq
	m7mGH0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJvR-002eQ6-1y;
	Fri, 28 Jul 2023 09:38:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJvO-002eOG-1C;
	Fri, 28 Jul 2023 09:38:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7EFE26605835;
	Fri, 28 Jul 2023 10:38:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690537092;
	bh=x/NC9kRms1NVzTGvKisnxeIx9pk+AWAePM5eU3NJJEE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=cFsn/MCB70uY4rbKGJ8wTrwILnk7lT3fOOncZ8C8E4B95hFd23zxEUYEobQOWvDRG
	 MCOI6OpNFHN5h1baDmQO2d5zHnzLbxyPAbiApr7rQrHFkZANZCNJZrcqLNsrMg7kH0
	 XuO2p5lJslgF1X6KyAfwHBeHVZIxp+dp3ljoWERIm4qEjRESjn0jbfPOmM+KCn8b2V
	 kErrCb7mhiICxvUNLPQIXq6pZwsJ7QHphPn2oCw/oRTJGxqjQfu3s8WuuEoXI0yFgh
	 od5aNQkQEA3/0N53GWxqHm4GWQLWAvLSlDnNWUkrPf6iZrRz9n4u1FoGx+JMuR5G0R
	 y8OWTa3enGTcA==
Message-ID: <4eb32bcc-9a1b-c477-71b1-823bd96c0450@collabora.com>
Date: Fri, 28 Jul 2023 11:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/6] ASoC: mediatek: mt7986: add platform driver
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-4-maso.huang@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230728090819.18038-4-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_023818_574581_0EBA2740 
X-CRM114-Status: GOOD (  14.22  )
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

Il 28/07/23 11:08, Maso Huang ha scritto:
> Add mt7986 platform driver.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>   sound/soc/mediatek/Kconfig                 |  10 +
>   sound/soc/mediatek/Makefile                |   1 +
>   sound/soc/mediatek/mt7986/Makefile         |   8 +
>   sound/soc/mediatek/mt7986/mt7986-afe-pcm.c | 622 +++++++++++++++++++++
>   4 files changed, 641 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt7986/Makefile
>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
> 

..snip..

> +	/* register component */
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      &mt7986_afe_component,
> +					      NULL, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "err_platform\n");

I know I only said about using dev_err_probe(), but "err_platform" doesn't
mean anything!

Please write a human readable error message, like "Cannot register AFE component\n"

> +
> +	ret = devm_snd_soc_register_component(afe->dev,
> +					      &mt7986_afe_pcm_dai_component,
> +					      afe->dai_drivers,
> +					      afe->num_dai_drivers);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "err_dai_component\n");

And the same here, "Cannot register PCM DAI component\n"

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

