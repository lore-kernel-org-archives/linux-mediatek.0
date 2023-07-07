Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCED8EB64D9
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 08:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxdQubIUeWfH6Nizi8N9SaSpFsy+/ceYV/So6je/wkM=; b=FYARAEKXmY+FjFnias3yPd9Vy6
	9QvYyuqr7S4tFtnlQHMnt+4i6UVcCnhB3GEuxrwvPghi1pqxFn09KfOqo8aYsogx9COlt7/Zi6jYW
	OSfN6FOJVu994YG1v1YmSsddX2BlvmlXceelbCL3sqAgPQu0wI+qfI/vt+y1N+q1Ybw1YYCQjcWxQ
	tu2XDHnd96ICE8VUmAKMZVxfQF5qPsqN8/1l2UdDfoYO72AdJG9ze2rMW7Tq03jW6LU/7aSKw6R2X
	SAZvmoSpcAQ5wtKNV7IVffF2Vb+FTMPRD6tjoehOZ5g6R31Ru5QTx33GZIAd3eT0wwbGSPj+GO5N4
	hS9iVddw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgix-003yef-1r;
	Fri, 07 Jul 2023 08:21:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgit-003ycx-2s;
	Fri, 07 Jul 2023 08:21:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BF36F6606FD3;
	Fri,  7 Jul 2023 09:21:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688718110;
	bh=E41kLsUu9KWKlC5LC4u8U6BQ7Fu/d8kPchT+f2mdTcg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FphWqH25Mc2WAJGfSzoYhws3XtSXrrcmI2pHqjVdOciw9Q1lrmq7BtzX/okmNbqV/
	 RRvvEkttjgWIosiuI8KMP3s+8SSqAJy0CcNJSCda9+3DfnZEnqf8cCnC4opRbTIqT4
	 14Nd0cvEJrL7nSRHk/xNSqQfSM3PupT5YI5Wb9iyX13fTWPZ29MYH5VCdHoB0GEzzT
	 33/rT1ctI83dpr9WNOaWhhOS+LwOSAEZx5X60GacxGRrkl9kWulWAgF0ctVkpQ0SMz
	 SFLdzQZd5pmsFxXsKQcd2odFmbQTZdwuw108WHskDzsHIhwIzjwFPi7ljALspfyGEb
	 TAmgsUiyR0DQQ==
Message-ID: <98580052-492e-5360-fcae-f5a5f8a3da73@collabora.com>
Date: Fri, 7 Jul 2023 10:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 4/6] thermal/drivers/mediatek/lvts_thermal: Disable
 undesired interrupts
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
 Balsam CHIHI <bchihi@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, kernel@collabora.com,
 Amit Kucheria <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230706153823.201943-1-nfraprado@collabora.com>
 <20230706153823.201943-5-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230706153823.201943-5-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_012152_062058_667C69A8 
X-CRM114-Status: GOOD (  12.23  )
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

Il 06/07/23 17:37, Nícolas F. R. A. Prado ha scritto:
> Out of the many interrupts supported by the hardware, the only ones of
> interest to the driver currently are:
> * The temperature went over the high offset threshold, for any of the
>    sensors
> * The temperature went below the low offset threshold, for any of the
>    sensors
> * The temperature went over the stage3 threshold
> 
> These are the only thresholds configured by the driver through the
> OFFSETH, OFFSETL, and PROTTC registers, respectively.
> 
> The current interrupt mask in LVTS_MONINT_CONF, enables many more
> interrupts, including data ready on sensors for both filtered and
> immediate mode. These are not only not handled by the driver, but they
> are also triggered too often, causing unneeded overhead. Disable these
> unnecessary interrupts.
> 
> The meaning of each bit can be seen in the comment describing
> LVTS_MONINTST in the IRQ handler.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



