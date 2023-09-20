Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E546DCE79BF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 10:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRr7cjD67Eef10h2OS2BQT1UewWmivkzDQFyVSJNilU=; b=X1G92pnw2CkTanLMYMBYQyrlSA
	d3UiQYOVMHAJxjwHrsztPjX7WiV/JnTuc9vbdLreodBFZqVlEGwjLfOEYQX5zy6i2kRb56/ob/4QV
	FXIBCJAvqyP1dCVJ8gc1/pa6fv5Oam9W2hMhoAPceE9Id57/CMLzQuXLXCMB4EIavtLbCl6xTbqIT
	gze6VcUQLhcUDbenFOH1U36Rhpfyx4tyX/1CJULwSeMKDljxi1IpL+0PCWFNOeMcLmoXnUg+iXlwy
	XZpQ5QqGEhO0EgpS50JeSJgs9lcyxBECBMnZaUS6X7GAc9lBOdSMzwDYqbE3N+Gqtg1XegBcYxryZ
	U4Jg0v1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiuRH-002bar-2S;
	Wed, 20 Sep 2023 10:28:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiuRD-002bZ0-2Y;
	Wed, 20 Sep 2023 10:28:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DD2806607084;
	Wed, 20 Sep 2023 11:28:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695205685;
	bh=/Wl9oF5OBPQIjlHo6jdFXz5jq044BfPBrLxmHu73RDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fXD6vdSB6klZZA2par8cbO1h1upB4+ZKVAjdvwUDwn4czOoScM/Jl/eGSdl1lusSV
	 cBIrdu2XyZRIiz6AtkjbpvQqWrxbsLBjvHxxs+9X/dxOx6qn84jT3Hi//A41Uo3k7k
	 iLjF4rpzgnytIj/Ap7E/C1+MJi3if332Dl7ky1pfbmaTZDpjcrLhEbaMuPuu0BBmgz
	 cqzcF0AEf8i6ti4OXEuzd56dqfqS4z0c5wAg42fW/SjAY/kyQJSuiIT4SsL9bxIXEM
	 So/QRGvzh29/DjdlhNn5BEIlGGx7+Ot0KUudG6JVOlyIS3woemw4SRpARDioUe5LFR
	 CSwmC9Sau++9g==
Message-ID: <3f78fbed-257d-7a51-f6ef-813d665d91a5@collabora.com>
Date: Wed, 20 Sep 2023 12:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 23/59] dma: mediatek: mtk-hsdma: Convert to platform
 remove callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de
References: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
 <20230919133207.1400430-24-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919133207.1400430-24-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_032807_961832_EC424FE2 
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

Il 19/09/23 15:31, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


