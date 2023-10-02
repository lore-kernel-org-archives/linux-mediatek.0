Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7FFE7849A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 10:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3vjgz+EC4TkbjKyKTHnWv3fYxvU3yllZVD3D1V22+c=; b=jq2FMn3CPDktE72AhSHbTwQTDy
	j790NQsgXDxR+8I3dLZi+8M5T3/vmn219ELXaBE32kRMXyrmdNSYksiBoA7ZSQxAid79G6WzLPRPg
	ce0n6z6Kham1UvmozV4Op2q4liwQ1GCUoJajhqf+0n75cs+w0mpyPd6ym84O/IQd9w9RPRHvZLWTz
	mjl60ERJ1x0CUssRwVuMXklGcwDKFrggRkteiYD8AAPq6jvB8RcWDRrEmGgPQyzvfLhVTfk+lT03X
	eFlBVS6R8o/MQMmVgI9L3X/tvhm1P9jdyOCGvxlrvYvg0OXBJvSa5DGnuW6ju3yYe5iDu1nfrZBwO
	2WWBiRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGPm-00CU5T-2I;
	Mon, 02 Oct 2023 10:44:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGPi-00CU4R-3C;
	Mon, 02 Oct 2023 10:44:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 427EE6607105;
	Mon,  2 Oct 2023 11:44:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696243473;
	bh=yxGzisYm0+u3w64/RJUBU54VA1ZgDrJZO8umXla9JyM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h5SNnpgnCACwNxXJCh1TMm74yxzI/58CoKQuGmDMpO2rAyhASDZmYE4SJVPDni8ds
	 vl0JTJfVUZWl/26DpKXzzj1DAbimSWxyhjGtHYV8BQe9GIAzQ9VqJC5cxo7tSj2MSZ
	 0XhHLxQwzAPy21o3QhzwQuANERUYXhqZ53C8bpGBUm5Kt9UdwiGVNQ5mlRSxqw0wiV
	 r34eHzyYBGdrlgjq1Q+VasOX1P8OKc+5ti/wDh/RxAvtNJzILpvS9XcZxAoC6MhSRv
	 Q9ZclYyzsarmzjPoG3way7O1IvrCdcINND/K0yzvLVNgE8pVvsodeUMlylt3DRTJZ2
	 LEpKhW/MLzvpQ==
Message-ID: <029d49b8-8cc1-2332-5e1b-041030692b71@collabora.com>
Date: Mon, 2 Oct 2023 12:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 05/11] pwm: mtk-disp: Simplify using devm_pwmchip_add()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-pwm@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230929161918.2410424-1-u.kleine-koenig@pengutronix.de>
 <20230929161918.2410424-6-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230929161918.2410424-6-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_034435_181343_B57D78B8 
X-CRM114-Status: GOOD (  10.38  )
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

Il 29/09/23 18:19, Uwe Kleine-König ha scritto:
> With devm_pwmchip_add() pwmchip_remove() can be dropped from the remove
> callback. Then the remove callback is empty and can go away, too. With
> mtk_disp_pwm_remove() the last user of platform_get_drvdata() is gone and
> so platform_set_drvdata() can be dropped, too.
> 
> Also use dev_err_probe() for simplified (and improved) error reporting.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I actually wanted to do that myself, but I see you came in first. :-)

Looks good to me!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



