Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B04CEE4998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18QCLPWI7G/wnPU/G2wYt8yZk3phWce1ix2lPig01EU=; b=JaRSllsHI0z3r9mr0O74mdK1iG
	gnV2jL2twyPvuoh7Hn1FhIPtIv4qH4Re2G8/J+aPrzSauHipWYruLQerTUMOp/q3Nceaw4jGxwSlM
	veMElNAEeUMyZlWxhQGxfrkdcrhUCvfKsB8+LruWOw4qwEpCu47AX4QDIZ+gHWI2gy749YJ/o775i
	i10A3Khwx359FFlUQFuteGN093RkfYhiHE/9/BhmKetSsJGJWjQBWOzSq351sXbrYw3cKOjh0ilT8
	nCghNM2I7LbdHpDDXbGTLzfSlkW3qyPUHSVKF1KTItr32jwxxVPodJHAFcKiNKgk51G76IYDZhidt
	N0RD4fdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLYU-00000009IiF-3Ith;
	Wed, 11 Sep 2024 11:30:38 +0000
Received: from a7-47.smtp-out.eu-west-1.amazonses.com ([54.240.7.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLW0-00000009I6G-2hHZ;
	Wed, 11 Sep 2024 11:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726054081;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=PJUg0yAblESI6yzCqdB6thUEmYVWoz0i/ywFnkD3qEU=;
	b=O/5MQImSbnQm5ykvI0kZX28YhgmTUuBRK3h+0fslxOtdaCOtmRFD3RmyIMMUav8E
	DUIXz+Dtv5RgCHuxb9+pL0w5bqUFBTU5x7xXUemWsdNv6h1ca+o3d37cALlkR9lDdgZ
	sLkO/CgcPgVxW4JhO/ssw1WpUaNKye3Pud/gTDgybw6ReI5tgdApgPdzZtnEg7/HO+H
	Aa+tE6MraB69T9YBeBmH5VQDkMXh5MVujpMHQ8JJdqa9wDNz0+J4yreF8Dwzq5krd/Y
	k4tbCzCBjmLK+cO+1SCObfasxutY8F/h68Edrb9FYxkfVTi8cB04LRY1N+tRxpPr2iq
	MlPoQiOb7g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726054081;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=PJUg0yAblESI6yzCqdB6thUEmYVWoz0i/ywFnkD3qEU=;
	b=YBUKxoYhmvtj7KNU2moum/kL5o/yErrcNd7pxfXfp2X823aqyBZdrE6MrhI6b1Em
	pDY024TrWdg8WCRb9lf9TwMQu66XOob773u2bbwrX/7+7FxzY5Q3YqimWz+t56+Th3X
	27JAVh7nhIvlfsPv/sjQ9D0U4NZhjukB1M5ufm6I=
Message-ID: <01020191e0d72122-0c833bde-7096-4a90-b81d-84945a57b9aa-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 11:28:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8365: check validity before usage of
 i2s_data
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240911111317.4072349-1-usama.anjum@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240911111317.4072349-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.47
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_042804_858450_854A8E9E 
X-CRM114-Status: UNSURE (   7.88  )
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

Il 11/09/24 13:13, Muhammad Usama Anjum ha scritto:
> There may be a case where i2s_data may not get initialized by the for
> loop which will cause the kernel crash. Initialize the i2s_data to NULL
> and abort execute if it isn't found.
> 
> Fixes: 402bbb13a195 ("ASoC: mediatek: mt8365: Add I2S DAI support")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



