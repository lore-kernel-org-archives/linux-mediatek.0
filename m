Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A6CE95A97
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8sZVP5gXS/yvWZb+bNlQqMfgaO0pa2stGFiBSOdvOE=; b=zBygTM2PkwkvBnifR38hgrLcuj
	GSRP4Xmi+ucyw4248kprhXbUn5GIqc5C/hZ2d82Gd+3ysF2NuGlGKX7swEktN1rxJt3Jv3q0+pydF
	/YFfnmz8QHOz8P1ipo/y3GIlmouJh/iPQeEMTfuFITM0lteGKgXswSh/c5X57BuwJwvtjKlbOGH9O
	rrIRYhFsxHK8iz2GC3tfbtgbBFpveCBDPFyBq0VuXyAlWMNQclCLeq13MkqZM+JaRHHSwIJEdrtKu
	arvSiQYnUQ4w/xHGX3ToEKhYsT/i14YDuO5PG1bd/NLa1mBwuTxxLw1//ynD5sy54wqnC9+MCaCaD
	BFxZJw2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qplzZ-00A1NX-0G;
	Mon, 09 Oct 2023 08:51:57 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qplzT-00A1Im-0j;
	Mon, 09 Oct 2023 08:51:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 58BBD660708F;
	Mon,  9 Oct 2023 09:51:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696841510;
	bh=ymMKN5nRndUiz0ysr6UzTQfFwsIXVNvidTpKrycq3Fk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XNr8kK3tcgTHncN9p+KVwp3N8vBCvwU0wNsBEOTXWB11kbAF5FrVXG4tWubXP1NuW
	 +SXf0/LFC61ijXREWV0CUOltL88u45HyR165SF4LimdugcLXMUYCWkJ27jsiJUpj1U
	 LgjNdJmcmOb/w/nF8ANlp9lv2SVDBGy1TLK53LWn5Zy35+jlPXmfHywlYuriEqpiwL
	 92+B3sMB+SEC6ENf+yx3Tz7p6jFX3iJqmSDdF59sJI6K/V+/ET9QrD24/CpfXBKONd
	 CFsqwyeKsa9orGlQDiAM8PofiP69pWhOH3NozDgKdlxbtJxtuUji/kHDLdlCM0tr2G
	 JfJO8bkUMI8bA==
Message-ID: <19faea76-403b-e041-af4f-e6fc57a076af@collabora.com>
Date: Mon, 9 Oct 2023 10:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 8/8] ASoC: mt8192-afe-gpio: Drop unused include
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
 <20231006-descriptors-asoc-mediatek-v1-8-07fe79f337f5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-8-07fe79f337f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_015151_391154_CBDCF819 
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

Il 06/10/23 15:46, Linus Walleij ha scritto:
> This driver includes the legacy GPIO header <linux/gpio.h> but
> is not using any symbols from it. AFE has a custom GPIO
> implementation that is not using the kernel GPIO framework.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


