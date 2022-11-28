Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4695C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n20aAkd3QzGfUc+ikNsZHPJK+Vv6Rr4dIzRVWWi5nfU=; b=iyYZ0Qu86Q8eyYyigIxvbI/MIM
	gFnkhK1VaNOKZdwX7dqQKPdtVRxcCoUq8SLSLfd9RO68lngbCHbxGEDjruhIz7X+2avBzN/Mmr5U0
	xJSAb4lAF+XvPSV9xfYUMhJ0vk3RazKo6orsv/ndwFfYQ5seO1HAtTA1G5nF+IRaiSknhkcEKDFAi
	cRBPnQr2+QmcwmHQ9yqggHIavZC43kxpjkPjlBMSO3TWfX2zBJRTI14WV7iI6X24wT4oExBxTc5tp
	jJpnZm7J0TQddUOACNHVKutJ6fmq+xKqL5kVlAYCLm2SYm3p4n7AjJ5UoHowm/484YGI012pY5TAW
	FrPGpOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeFd-001pMO-TT; Mon, 28 Nov 2022 13:32:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeFQ-001pDX-IX; Mon, 28 Nov 2022 13:32:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 81351660239A;
	Mon, 28 Nov 2022 13:32:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669642353;
	bh=XJTvBmQ2k1bHpiozbV7N2H6jFS+y6PUBq1kYOY6o0lM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uyz1aEMSnOaVfIlvQMJfkoc/TJsEMrB3D2iKl3BTPPvHl7dO0qF102SUQu+cjS8D5
	 rvpveTlJnmbjAfTDjO+p041sP6FuHGiUOVPhVxd83SpSeAFlGRrLW2RyhS79IGJ9eG
	 d0uvwyOc67fXuJrHDVxJ0jXsIViPW6p02Z99U9vK9VvykmdqKtIcpSM4mzYxsy0ORJ
	 FM1R0N8k2juWY0qUVLfPo8ge37fWffTkU0M79rwFOn2wEcKWYyZ53cEOuJDBGMaySb
	 RIE0i09Xn0Y6PdCUEu4KyoUtqcUzt4YWRE02fvHsd6gEsrO+rmA6eqVVpsQN6PZHKy
	 fwk6dnwJOdo7g==
Message-ID: <14cba472-87b1-001e-30fa-674e4102130d@collabora.com>
Date: Mon, 28 Nov 2022 14:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] spi: mediatek: Enable irq when pdata is ready
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221128-spi-mt65xx-v1-0-509266830665@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221128-spi-mt65xx-v1-0-509266830665@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_053236_812057_9EDE63ED 
X-CRM114-Status: UNSURE (   9.36  )
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

Il 28/11/22 12:00, Ricardo Ribalda ha scritto:
> If the device does not come straight from reset, we might receive an IRQ
> before we are ready to handle it.
> 
> Fixes:
> 
> [    0.832328] Unable to handle kernel read from unreadable memory at virtual address 0000000000000010
> [    1.040343] Call trace:
> [    1.040347]  mtk_spi_can_dma+0xc/0x40
> ...
> [    1.262265]  start_kernel+0x338/0x42c
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



