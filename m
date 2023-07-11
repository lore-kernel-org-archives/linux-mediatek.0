Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5520CEB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRxXPMEveEHTkAb0N2iCeFGnhpomX4aM1k4O8nxv9QQ=; b=vicJb0Dz9pKzP7EADrjSQ74GSa
	v280EYq3MGxRoEAgVWbsale4texfOk4Wfm2Xgmpy6z02HghmHvqeAoPVCTXor3EaNoh/xmM8KpG2z
	/FVcCryGG/LU6Mne5SU2X9SoT2qofu2/haGej/wI2EfVEyjsEzFBUcCaQmyG5TjFuKSCr8VFoEsUg
	zgQ6nqrQSv7FRu6I22ujXac/mR8b8hFj9Psu7nD7cw8Ho9nS/4Uo22pqfX4Aq/a01n96Q1VVPxRyd
	kip4rCEGa16maO/GKNmEibRYEtSUF1jp07sEoQRQiPpG90ONwPu/C1PKpDKBeHQJkvYQDXnqvkzjQ
	6dP3IYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8My-00E3uf-2h;
	Tue, 11 Jul 2023 08:05:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8Mv-00E3su-0u;
	Tue, 11 Jul 2023 08:05:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E9BB2660700B;
	Tue, 11 Jul 2023 09:04:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689062698;
	bh=/V0I7v/mPKMX5r0sk/NMla2fyPgsaDd1OqBwVtFEoZk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pkmw4Hc/+NkfN79HurY+KiRwaqNw3dKK7n3YLe5y160Aj3rw+tSbq6R2k3hKKZgYs
	 aP1mzJXB2R/rK95018uNp57dc9UfNal5nM3VPnZrkd0dpJyAPDG3SlrDjfW/Q7ur+w
	 1Ov3kCIuvfjkqkITTUUfV3Rq5fywVV/u1YSfEvx7HlrOUn7mX1qXWL+5wBkoe28d8C
	 uswFPnlhWKIRNRD7uY1ygbNCSdCH0JBKZsoxkm2I1LyRuwqNU1havi5OOxn91j03zv
	 6SwJLA0eo0mAN8zM69V8TYyQelOhr0m2YddzkLfJGmW6idOhZiadnetmbTY/mK8yHD
	 tJMGSfz8X+NuQ==
Message-ID: <44d70b15-2929-1a2d-4ea0-f61b2294d72b@collabora.com>
Date: Tue, 11 Jul 2023 10:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 14/21] thermal/drivers/mediatek/lvts_thermal: convert
 to use devm_request*_irq_probe()
To: Yangtao Li <frank.li@vivo.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230710095926.15614-1-frank.li@vivo.com>
 <20230710095926.15614-14-frank.li@vivo.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230710095926.15614-14-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_010509_474452_92995CB7 
X-CRM114-Status: GOOD (  21.86  )
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

Il 10/07/23 11:59, Yangtao Li ha scritto:
> There are more than 700 calls to devm_request_threaded_irq method and
> more than 1000 calls to devm_request_irq method. Most drivers only
> request one interrupt resource, and these error messages are basically
> the same. If error messages are printed everywhere, more than 2000 lines
> of code can be saved by removing the msg in the driver.
> 
> And tglx point out that:
> 
>    If we actually look at the call sites of
>    devm_request_threaded_irq() then the vast majority of them print more or
>    less lousy error messages. A quick grep/sed/awk/sort/uniq revealed
> 
>       519 messages total (there are probably more)
> 
>       352 unique messages
> 
>       323 unique messages after lower casing
> 
>           Those 323 are mostly just variants of the same patterns with
>           slight modifications in formatting and information provided.
> 
>       186 of these messages do not deliver any useful information,
>           e.g. "no irq", "
> 
>       The most useful one of all is: "could request wakeup irq: %d"
> 
>    So there is certainly an argument to be made that this particular
>    function should print a well formatted and informative error message.
> 
>    It's not a general allocator like kmalloc(). It's specialized and in the
>    vast majority of cases failing to request the interrupt causes the
>    device probe to fail. So having proper and consistent information why
>    the device cannot be used _is_ useful.
> 
> So convert to use devm_request*_irq_probe() API, which ensure that all
> error handling branches print error information.
> 
> In this way, when this function fails, the upper-layer functions can
> directly return an error code without missing debugging information.
> Otherwise, the error message will be printed redundantly or missing.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
> Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Cc: AngeloGioacchino Del Regno  <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



