Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9A7C0018A
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 08:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LI8CGo3926NZIhieieFBoG1S7KoXVFNa+hJGi6RMI1c=; b=DTZ6vqHcMxwqbCYARB79AH64IX
	vJFzQ92tyFvGwRsMV8ZteHbB3qZnrg62fmHHGhKTIcMNxAlXnkWXwaDpHI87MwG9p4Gjew2+RpipF
	gDnyjcDMb6LvLWZI/mLUJYUotYgy4DnSVsmdxy1k7ds8SuBfVimZsix3+KWDeFeMjyw6BIEDfhSGL
	fMVmR+5vmxtyg6ao+wiiHIy51WTqbdR+WyE+0XHwisDD6mhVdl37+uuF702DpM9LeskX+HL8nAekn
	EOmrKaLmIYhuayRUMZDULa/mg+TlurLQW2bJjDOZtqO52XTRWNCHxiQnhCLCHpCeQjubGyiuq+Yea
	SafeJB0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzurF-00G48G-23;
	Mon, 06 Nov 2023 08:21:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzurC-00G473-0p;
	Mon, 06 Nov 2023 08:21:15 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6AF896607469;
	Mon,  6 Nov 2023 08:21:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699258870;
	bh=pH0YqoYXSZbJwEO/FU3bp+HIJXl6iyffWk+F6C0as+8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AYpqNG2eeNJsLSMOaL6f8lBWsSgDAbaNwT+nwBAEnTuP1kwB+J4GalxPoaZTgdQHs
	 +5ImCCjYc+mymB2IcvBU2o+7lzVqunk3shwQ1/WvBvVunVGJQKM0QzzMS+SHYAoMKu
	 47zKLcjxwzoqB5I8VbGZtqCApMaHMsiT+kXraoBo8GBI1+ZC1r07rlWB36s5rB37GZ
	 Ej8Rlw3MjzdGgQWp3F3Bu1Sp3lxV5dobdy5vsMciMVoA2N2Gg0cK7kubErfoXlf0aL
	 cETtjb/JZ/6NHOeWKSmAp3g+PNyfdK56gCOUkw7zhLOJJ/S9pBY8Vmd4ag36akeyd7
	 CDEE2jTJlAYcQ==
Message-ID: <a8bc5404-1b49-429f-b695-5b63c25a1157@collabora.com>
Date: Mon, 6 Nov 2023 09:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] power: reset: mt6323-poweroff: Convert to platform
 remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231104211501.3676352-16-u.kleine-koenig@pengutronix.de>
 <20231104211501.3676352-24-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231104211501.3676352-24-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_002114_490868_22428BBD 
X-CRM114-Status: GOOD (  10.98  )
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

Il 04/11/23 22:15, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


