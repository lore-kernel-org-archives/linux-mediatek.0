Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B6DC77B75
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8/QoWM7wYnMdW+YSXL8D33vo0cMgL6Xf9YtdcSjrZ4=; b=q66Zo/5ChIDD+JVxnjzWM3vO7q
	vWCm0NFvHyVnel+g8eBmODniIo9Ei6FSoIjb+8Nh6d3Lowte1oNrZm7CY+x9irv9G1InqaX9p+QSk
	qlke5Xrtr+12C8F3YNP+lbgvEz0G0/ephc/ZlG8yzsuYeHCVDyUp/M+Qw4l48nLKM5d7d23YohdE5
	MV3dHdY8BhS2pElMIs65IL8UzqRlpc9RZ6sWjMEZeK/VuUK99i9luYh/6aD63NAZDXVwaM6vajPps
	46m3Sp/mwjEczRB+zYeF8iuv+s07Ul/fVYKX8z+kpzSlbjjQ6RVEZQo4dLi532b0MggnHMVKTE1d/
	luEimSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puE9X-004vPy-16;
	Wed, 03 May 2023 15:12:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puE9S-004vNu-0r;
	Wed, 03 May 2023 15:12:19 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 10AF4660309E;
	Wed,  3 May 2023 16:12:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683126736;
	bh=Pi/CSe8nv/Bn/w1ZOAaw3WYXTtUFhF9Hq3jb//Y3+2U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FE71iUqcb1QFWFNA3otCiAMTpY/p5HvHJZrIf1+KOPqWzSPysuJcEN/+3wOP6ZXBQ
	 hvFf/rkkglQMiiyriKdGxXdMVay7nx/w/N9KfAIMNP0/dPqy8uLa3xULtj7FKNOK7l
	 cjkBSoUog29I+Xt6nN4OXr4I3rkww6T5sRJUd2TWLikIQmW/idr0ACHqHStKr6bIFT
	 8xatKmjYGMwaQKwNetILI36FgRXr79+8dLdTbuhk6exLPzrkQU+JrO2C99WCE09x7m
	 Hq0W8m8IvfqXd8NST9C1NXegeNQqxTCdcjkD3MaYi5B6HopXdX+dD0oJ53+yBgaAfH
	 ziUv1iE+pN5mA==
Message-ID: <43be865c-c870-f61a-9837-e189d6e4ae00@collabora.com>
Date: Wed, 3 May 2023 17:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] thermal/drivers/mediatek/lvts_thermal: Disable
 undesired interrupts
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>, kernel@collabora.com,
 Chen-Yu Tsai <wenst@chromium.org>, Balsam CHIHI <bchihi@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230428195347.3832687-1-nfraprado@collabora.com>
 <20230428195347.3832687-4-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230428195347.3832687-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_081218_432820_BA6B1CC3 
X-CRM114-Status: GOOD (  12.27  )
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

Il 28/04/23 21:53, Nícolas F. R. A. Prado ha scritto:
> Out of the many interrupts supported by the hardware, the only ones of
> interest to the driver currently are:
> * The temperature went over the hot threshold, for any of the sensors
> * The temperature went over the hot to normal threshold, for any of the
>    sensors
> * The temperature went over the stage3 threshold
> 
> These are the only thresholds configured by the driver through the
> HTHRE, H2NTHRE, and PROTTC registers, respectively.
> 
> The current interrupt mask in LVTS_MONINT_CONF, enables many more
> interrupts, including offset detection and data ready on sensors for
> both filtered and immediate mode. These are not only not handled by the
> driver, but they are also triggered too often, causing unneeded
> overhead. Disable these unnecessary interrupts.
> 
> The meaning of each bit can be seen in the comment describing
> LVTS_MONINTST in the IRQ handler.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



