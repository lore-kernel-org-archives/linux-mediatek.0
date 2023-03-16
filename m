Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D03C6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 08:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qg4N+F7DDHN7pHXd2lJGx+0u3sSktkrrm+ZZ8ggGpE=; b=sDcs1ZyYzbEsKB5smyu9HvNhS6
	BoAgUhOCu10KYvkYVBl1CaChnqVnwZmqglgEN2w664TLvWJiTUZooBtcMtLrz9toB96P7XNp2wHUk
	WT4Of72sZybvbfZu8h/O9If41c88py3qzf4mXIN2Fu+pMJPvtxyirQA5ad2JYIq7m03cP/uslXGNv
	X9BWpf5vbwrOS3jWB34oDtFqA2fJcw1uW0xiAwJ+1oDgQH6HbjMoaXEevatIq4QXSXz4EJBgVuaoE
	1zUZyucQdVbh3FfRo+U+UhNhUZBpth5f3Ltx+JmkPH71ohBK6ireuUismS2nUhAXoFwvtoB/SHK4s
	zUUuafRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjCI-00FiAD-03;
	Thu, 16 Mar 2023 08:42:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjBh-00Fhjw-13;
	Thu, 16 Mar 2023 08:42:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 86CC0660309C;
	Thu, 16 Mar 2023 08:42:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678956136;
	bh=XLInc/099kegEeHJBvEWm+V7OtC3ilgAefZCTWpDWzA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UQ5X/P79RmovlxPBWVZFxNXBYmRUUro+plvERLX34L92vvmBQOkd5b0yeLlhiKSA8
	 +hPyF1tEn5TRW+xtoK6fkQ7QrLJ6f2nFXnXB9Zvh63geLbEKxGaPx+lVhOKGswndch
	 yWclBl667VYd5gzBxJYa8jszkiyf6gYEE6dljbkyXL9YBZMzrUMkAexLZ/qXiw7AI6
	 3VHcddu7hXHjddPY1vjW+VVVU/Z2sAb+7uRp0C8rYmv9372NqBRe2olHTc+CZBndw1
	 Bxf5ZYUFpFdnLiGbZSF2g7hWeYi4DNO5g+0pWjO5g/eVvZGcXa3ogm0vq6yLSFtYta
	 MyEZqRaR0wvAw==
Message-ID: <5dd627e1-67c4-9052-c3bb-890580521c50@collabora.com>
Date: Thu, 16 Mar 2023 09:42:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 112/173] ASoC: mediatek: mt8192-afe-pcm: Convert to
 platform remove callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-113-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230315150745.67084-113-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_014217_514695_EF0E5612 
X-CRM114-Status: GOOD (  13.49  )
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
>  > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



