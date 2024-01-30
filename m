Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EECC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 08:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVO6bI9ILyJP3a4/f0L9BMiCYK6/WvSgkl3qu7Z4gMY=; b=SvPOK6nMtay4n1eR97RURP8HdZ
	RXD0YQFgszIFwt7jLn0PYL+dKlCeWpWr4SD47sYxaCGfOg7ZL3eqJhCw3rct3tdsD+hqMVWhBfsPo
	5MvuV4rJKuN6PE8XBLMuN0J2uW0avXebjC3s2dAxcHuN9i+zcl6mjRJklq5H0EVTU1le6Su+g5yn3
	oK/4uckbO6xeg21vtwA2XLktmkIAXxWmgrplPbkpYGKWxbMQi+UTHTstmbve8gg0IHuXKWLkFfoFZ
	zKNEq7QjpWM7RS4rI07hLEOWtKpIxTsGaEyoaHoMWulalf+CNr6EiB/Pz56d4y+Zzt0zyJYO4XUd+
	CqqWEXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjbR-0000000FjLJ-11os;
	Tue, 30 Jan 2024 08:36:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjbO-0000000FjIN-0Pba;
	Tue, 30 Jan 2024 08:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706603775;
	bh=DPzX8bKF/2fviPf/M2liuaua/0lWQdiOsoNEF2zZ3Kw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QQ1m6SLdXWukRY/jHpuZaif7HrnumJY0OTOjXsU4HwmzLA3WaO7HtRytzJIcqztxu
	 koxbBQ0E6kh7aVFy7PPw1ge3SKfXXR8VDKWego9QPPuQ2fKSDrCtjgPUUp1UcFG32C
	 oA2Tockeh2++BG9SmsF/1MwNOPDLObfrl/qx9/CNaYnWDA49kvFxSU60zEqI9syhcy
	 gGR2kQL0NT620VvFoARvoUNH0gZW87uTu1No8VUCAz5xcLq3uCFhAEMZpGZTxxqs5C
	 kAIm8VFh1p+boVdOMCuLXq0SPgXsToceRwMLTKSLFhtfBkJhq68lGKf4d8ViFpqvuT
	 JYnJaef/wSMug==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 885273782076;
	Tue, 30 Jan 2024 08:36:14 +0000 (UTC)
Message-ID: <46c05b42-dfc5-439e-9dd2-9c115199ff5f@collabora.com>
Date: Tue, 30 Jan 2024 09:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Fix a memory leak
 in an error handling path
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Balsam CHIHI <bchihi@baylibre.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <481d345233862d58c3c305855a93d0dbc2bbae7e.1706431063.git.christophe.jaillet@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <481d345233862d58c3c305855a93d0dbc2bbae7e.1706431063.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_003618_369265_DBADD4E2 
X-CRM114-Status: UNSURE (   6.83  )
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

Il 28/01/24 09:38, Christophe JAILLET ha scritto:
> If devm_krealloc() fails, then 'efuse' is leaking.
> So free it to avoid a leak.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



