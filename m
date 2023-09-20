Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAA0CE79C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 10:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRr7cjD67Eef10h2OS2BQT1UewWmivkzDQFyVSJNilU=; b=qL5CzuLbtW0TvjOYkqBfzQI3fr
	GYL8QuEjkJzu2qZKgy3RbYImqNTMBIAijxJvOIE7E2MATmReerrro5hCcckGJwh5fKZzqudJi9HTm
	2w94HJ4n4QsUSqFKhTAH7JAB2N9PPSyRa2fD+sXlw8x0sAT25n1ryKapdl1oQyDQmF0KKpsLoQ+7c
	ADVaerjAIb2dXYFpCvCMtH30zia8avXaufx7MXMi2EdBuEcMwYHfxVnmOB/+z++e6eoOUj1wSkVQH
	df6aIydFQfM3/CmSQc02cweQ+wEt7O+KQAP2CSYcLxs1fnJrjdou5yw1pd/PxQ5Fg3lYe18TaElvl
	c2AgZpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiuRG-002baE-2v;
	Wed, 20 Sep 2023 10:28:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiuRD-002bYu-0J;
	Wed, 20 Sep 2023 10:28:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 072E966020EE;
	Wed, 20 Sep 2023 11:28:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695205683;
	bh=/Wl9oF5OBPQIjlHo6jdFXz5jq044BfPBrLxmHu73RDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VB1IAeRHTSYoew3F35aZ7Gs/iBUPU75c7Z4IaMW6Fgx7jriV+pPLHk/+rpbH+ngml
	 pAMIZNS9yjH/REK48GRG+G5bFWSVp2szPjJkUHtz+v4Y2yQ9D57Eiv2+81GnG1GGQt
	 NCFcQO3PXFEh00Ux/nhXnE6Yntr0Vgmo/j7yb6EKn78KZtFFfphKVO0WBPLMlCEvB/
	 F8FTbeUurjlxYQXjGmX7AENXt88jPSdwVtc0WzXllj7w8oLPNvlc87EF7DBEI/f7os
	 k5EzrelZuu39doW4HRDflPpYDhJqthseCAb84nSwrYucsREUAeVCPwhVv0SifAH94s
	 kgJOyDlYZ2lSA==
Message-ID: <8b3747cb-56fa-b765-c5a5-455397846501@collabora.com>
Date: Wed, 20 Sep 2023 12:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 24/59] dma: mediatek: mtk-uart-apdma: Convert to platform
 remove callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de
References: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
 <20230919133207.1400430-25-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919133207.1400430-25-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_032807_318055_FDD23377 
X-CRM114-Status: GOOD (  13.32  )
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


