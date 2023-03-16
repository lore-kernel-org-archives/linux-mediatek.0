Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89017C6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 08:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzOxYM14Wnsij37Eyxr9rhW4DC/pA+5OHN33WD5/4fw=; b=sySXYYoDus1OWcTH8rpGFqTKkk
	sDACv5DWQ90HTAz0iyoOcWa8cAkhek/0Z3w3sAcSCeUmRe6/rAQ6F2FbE3l4IaSdgtAkx0rHC+XAN
	fNBrAC9WdwZAmPK14DBNzb93etxadH/Vp4pZSWhw4mO+RbdT0iAv03wCIUECKlPzkXZk1oLu9eq9M
	hlIYOrQCRjNGMKgHx6Y9ijeuVt72rMk+T41NmCWpTYRJx80wGqNtfou+qsJ4WTiuW3JkZenrN0DSw
	6HqgDOgRfY1qymw3JX34YwTaqGsSw9XeP1aAvo2TbTl9b7/BtTU1P5gtbSCgUqbHno+W19EKh8Xnm
	KcPpzJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjBp-00FhpS-2C;
	Thu, 16 Mar 2023 08:42:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjBZ-00FhdJ-20;
	Thu, 16 Mar 2023 08:42:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9518C660309D;
	Thu, 16 Mar 2023 08:42:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678956125;
	bh=cG6H7BTbIv6IpK2irAivbNXa/2Qr4JqONKmvATOLV8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=arbgnJCQuk0MZ8EbKiHgSQqR8nWZOm7IB/q15w4JZ29iAIgToULXgUzPAc3AD64va
	 /hnY7OhZtPjCrsOSr2j+WGkwUgD/UVJ4hbgPOKGVClxB4Wwam4ayU3ji/Ehk2BFozY
	 1//xg/FMy/EAHmXfkPj8iwufrP7BvP39TfUVTt7Zfxm+YK45H9Q9tM6r2AX7/QmItW
	 z979moaXTkRJv6JExArw1sHUCY7WuG5ryLfFVYVSKxVQ3wa0l8jVhAQHYYdB39yEO8
	 p6rPr1BfbJ2CEKebsS9LYqfHe0gBvj7W9alf/6+1oNd5dZ6rFchCNGyyxKDslM/Kr9
	 L6l9E8oaGFYJA==
Message-ID: <6c581b2e-3175-f4b1-c357-d89dab038355@collabora.com>
Date: Thu, 16 Mar 2023 09:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 108/173] ASoC: mediatek: mt6797-afe-pcm: Convert to
 platform remove callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-109-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230315150745.67084-109-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_014209_786238_EEC0F104 
X-CRM114-Status: GOOD (  13.57  )
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

Il 15/03/23 16:06, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



