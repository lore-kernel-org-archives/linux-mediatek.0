Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C259CCE79BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 10:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRr7cjD67Eef10h2OS2BQT1UewWmivkzDQFyVSJNilU=; b=Fvhd2syBdUmi0djrrcqSCZAir1
	aGE1b0/HXY5pk485tYrYRogh4KxOKCvLw3dUWX8SCNXt5SQJRtIbEI/uXqBRnUi+SleYKqWCybneV
	KKvxe9KSPPc23GZlLTQq1gqjAN61hf8/lUCCaB2z1OGX9g9yXoBHKZClWDOaJLizYEsETdBBqu+Cj
	LwaE3rG8SO1m1N/YJUS+WcaVk0qYbgsgyYYACqHBk7iu8HCrP7LDcjDqX997yaoAoy5XEjBOzvjmE
	L68l0dqnV/PCvPgnpBQylHdN0FBB+61uaFJZAp/hD5fugyn4MvM6cKN1TaAorxXCrD3FYZfIxoWvd
	HS6aizOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiuRM-002bcL-2R;
	Wed, 20 Sep 2023 10:28:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiuRF-002bZY-0k;
	Wed, 20 Sep 2023 10:28:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9FA2166071A9;
	Wed, 20 Sep 2023 11:28:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695205688;
	bh=/Wl9oF5OBPQIjlHo6jdFXz5jq044BfPBrLxmHu73RDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VF9f0cKNzSxFgO/ev8A10VXr3APvc0Qywvk6cVXNE2chbbhFCpg1k1CDw7+3MeWLO
	 T2mMMuzEPjltC6JLXRXwS4Xp27VsAXCiFsoF5SKrdn9bV5Ih2Uk9aOESAZoOW6CVn+
	 XeDu2OYEFh6ESFe857Rz8QojT8FI2tWygetprA6TOAqhEgWF1aX/Soi9jFHVRhMqj0
	 J72Wqqgtq7Dt1ZBHya+TaKnC9IT9i6Xz38Mrijepc5sjvhJrY6pemdjl5DxM25lVhE
	 2QwQnbF3brMMCuL2Iwt0Zs53FydOfPBdUX2/ewBIRSnrrg+XzuVoC6IsdCxnGugx3J
	 JySA/ve9O3unw==
Message-ID: <e0b99ed0-f4b7-0dcc-7481-ecedfa7dc574@collabora.com>
Date: Wed, 20 Sep 2023 12:28:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 22/59] dma: mediatek: mtk-cqdma: Convert to platform
 remove callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de
References: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
 <20230919133207.1400430-23-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919133207.1400430-23-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_032809_399969_B0207CAF 
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



