Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00D1C19F32
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlO+h5s1Zy7GWUa9wjsUqRXyREiZA4sRNDEoMB9ruZQ=; b=l+er/AS8A6UnamRonhLIZJSSV2
	xS1hLHyj1d0t7m7eyrT3xZfFatpyFoG/EvR4VCv7sI7jAR7uSBwRwk0kGMpEaG9rGGLEph1Hm8C5B
	BvDYHHSXj6ehMCs7R5+sKq4vN8G3AVCQB9hVePnl+ZzD3pgO0/0WGdJ2p6GRotj8AdOUqOi5MuBFf
	Y/94A1JO+ErBJRNQ9BNnJF58lfoLYa1o1/ceuc5n5ZODBCB/2Co2DvHcguqtr2E/yPWdSzI/tLK4K
	u1nZa+DwusluKalwZ0dNWOt/lv67zCy/QKPJOgk3ZNqSzkJXa8MMHaMP9RCYbffgPnghrJ7ItkpCs
	4ZKHr04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhB-00000008TpW-2uDt;
	Thu, 27 Feb 2025 19:37:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf5l-00000007n9V-1YmV;
	Thu, 27 Feb 2025 14:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740667342;
	bh=gw3yhjaD34XHxfwtco/3BRJayc9o3DLXMMEhaJRahdk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=izF4xcrCafDcNBAziKL40z+O24j05bpv7QQCpr1mlk78Prem1x3LczV3gTWAL7eN7
	 HhP+R9Z2pl3w8KIkEqQjhZc2NkU9pZM9O76ENRFuTqmF0FkP/q4Q2Ed2ohSufJT7VP
	 PP1KxeY6rZpxCogyjKSJs8EU4iGzu2ZQWSXOWESz9XpGgDaeX+8AioxzOXWDfhed/g
	 CNeURodYDSoaf82rHOFTcjrORQlR8dpPr0gYJMeu+geM67KX9OnE2ME29goZeTqDnp
	 vitS9KvVdBuFz/u9xsSVZMx0oowaCuEI3Xpj2Rm34u1aXbKMJTwrb4kCQW40+G2dsn
	 lCXKMK+0OcoYw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA0B517E05A6;
	Thu, 27 Feb 2025 15:42:21 +0100 (CET)
Message-ID: <06563381-faea-48de-86f1-4db174de394b@collabora.com>
Date: Thu, 27 Feb 2025 15:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8188: avoid uninitialized variable use
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 parkeryang <Parker.Yang@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250227131939.1040168-1-arnd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250227131939.1040168-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_064225_591216_A22F2B76 
X-CRM114-Status: UNSURE (   7.49  )
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

Il 27/02/25 14:19, Arnd Bergmann ha scritto:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The 'msk' variable has no initialization:
> 
> sound/soc/mediatek/mt8188/mt8188-dai-dmic.c:311:4: error: variable 'msk' is uninitialized when used here [-Werror,-Wuninitialized]
>    311 |                         msk |= PWR2_TOP_CON1_DMIC_FIFO_SOFT_RST_EN(i);
>        |                         ^~~
> 
> Set it to zero before the loop.
> 
> Fixes: c1e42ec04197 ("ASoC: mediatek: mt8188: Add support for DMIC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



