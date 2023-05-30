Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB8BC77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 09:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGN4y82xf/v5nhPm32yLPk9F+1m/qZvpzkLWltkfr40=; b=yywDT8rsNsO1G7zM+l8rxWbSWG
	z+on/2YoDfMgFO05nbXfebElaoCZLc3i1x1yDSua77xqSGkyNOX4YZUWoKhoaaWpE/RqqdSNfG/bZ
	3aYsSF50HiU0d1MjGNHk3zoKnSh0+M5wyN7BJCbupiCflQL1ywix3+qoGMSamw9ZL9YiWLGowZW8x
	SptOBZZhW6XpVTMRjkNo0h2IwC2Ro9GRSOU42421qheyT2qSRwXBT7+llxz2hBGCUgdZC5B4m25xo
	x3wVBd69+Lj0TfMjJpAPL7qggIQ7guwQzAUIY576J851SCfMuCX+h0uM1wS8SSOreCQndDN6FPC8V
	eh8wXS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vcA-00D9dN-2v;
	Tue, 30 May 2023 09:26:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vc7-00D9bp-39;
	Tue, 30 May 2023 09:26:01 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A9F1066059A8;
	Tue, 30 May 2023 10:25:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685438758;
	bh=KG2FKmtvB1+MNxod1QWQZiu9EnjhpMcneY/1oVshCL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HVSgHlMbOPveawPIlUjfDLvRl/f6CnezYmLOWuppi/VfXQ2PGeF/vQu57v+UlxZmL
	 IhKvQKkv+tBT0sQzvA5M7QqDHjT8yPQPBr/muBNhavEEqnlxRrKqGlGQ0qTH3MHIMo
	 aw+6xVDefmIxvt2WN8N7mY99Y0NM0lJf5d4MVEMKgkTvY1PTILV0aYwrR0as5PSTdh
	 1qNuQ3AREzKEInAbkoKVb/kDvyoxdd3js5sqXVKReq9x6VL8QTyhRST8dMGWaLPV4I
	 mC1h9nivHS0g8FGP98id3CFHTVwNQDpMNjsTXW9ROV2PZg55GFHhC7HIRf5B7sz0Ad
	 jHWQehUIOrp2Q==
Message-ID: <68f7d44b-1c89-c452-1585-03b1d209597f@collabora.com>
Date: Tue, 30 May 2023 11:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/3] spi: mt65xx: Properly handle failures in .remove()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230530081648.2199419-1-u.kleine-koenig@pengutronix.de>
 <20230530081648.2199419-2-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230530081648.2199419-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_022600_138604_3957025E 
X-CRM114-Status: GOOD (  10.97  )
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

Il 30/05/23 10:16, Uwe Kleine-König ha scritto:
> Returning an error code in a platform driver's remove function is wrong
> most of the time and there is an effort to make the callback return
> void. To prepare this rework the function not to exit early.
> 
> There wasn't a real problem because if pm runtime resume failed the only
> step missing was pm_runtime_disable() which isn't an issue.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!

