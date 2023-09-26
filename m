Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72546E7D26C
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 09:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeTyxYCQYChYnnbDlD75iM3dl+MlAjVASHMBn6Q9X5E=; b=Hzpa6pfu/QCFnMN4ujGtN79XQ4
	AT6hGmd0r8U89zWJx5j5yTGEKUhRdsVNXpv7hqV03PF6hgXLmPTBjarE8ll9N066vq6nmrXsE70a7
	JM6oy84lh1col6e+CCeEP39/+IRn/s7BxtSBpnvmtCat/F4zdJAi8E1lHAhYx5vuX/7znXksOQ6Gl
	gB2O1chflRcgJrCpQgRLFM5kCBFPlyvBapvNyVTOkcWf7uU6uBOnmqaUjGvDpEGrqWIyRcc2xleaL
	vUShAcOTi6zM+dOIjbgfQrvm6J7P7GZQBetLTvuOoV0fiPqkzyHWnJBSKjegb86esz1wQHVLzz5JF
	RQr8a7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4Ie-00FxgI-1Q;
	Tue, 26 Sep 2023 09:24:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4IR-00Fxbz-2H;
	Tue, 26 Sep 2023 09:24:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 31A8B6607313;
	Tue, 26 Sep 2023 10:23:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695720236;
	bh=ssfuBNR2PiLxi4TiFV2ZqSR5SVdNJLkRo9oKlebvEQw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e/E2QeiJuLaQLjK4mChhPpDb0IE9fdZgd1/doagBY164u0wL07kEwrMXr/aawC7IX
	 5Bn79I0rKXvm9Zhl+oYn/tGXJ+SMQHOzHyUwldACGahrjuwWLqnVYFpTGSk6ORlJ3N
	 vPGPBNal9ZguWK1bVzUsA7La1IAvzap6ZoYDARGLOBRElB7JtPNXS5VjiHSRiwv/8v
	 N0tSoEwLfyJsvUuGf37Jkht3vzVW/u4YiM4sq41VxNfUu7gIQjrpowpdNrvMfvqyPz
	 As+VA0bL+rwezpy4EQDPRvdHJF4kJWtK++hco0L/et1BLjY7AdQfc8B6Fq2Zc8ybKM
	 pkN24X157VT2w==
Message-ID: <e5e0703f-a96e-dafa-34d9-a6b6d8962556@collabora.com>
Date: Tue, 26 Sep 2023 11:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 15/40] soc/mediatek: mtk-mmsys: Convert to platform remove
 callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@pengutronix.de
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
 <20230925095532.1984344-16-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230925095532.1984344-16-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_022359_869681_943F5807 
X-CRM114-Status: GOOD (  13.00  )
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

Il 25/09/23 11:55, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



