Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0ECE732C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 11:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e22YSfaJqujC9FsCfVLj/Xxe0fhzJSfS59X10ItJoHY=; b=zYR13BPLAJvQEYHsoa9zhj+P/6
	mEkXrHEddFoWRzDcvRsSIRMzZEOBgtWMBJ0ANBik7u/25jfzNiAZY+CDJORPHOrC6VA/fH6Zw+qOO
	3TxWO00/Hl6UcAEqbop71t9sxOiluGUCqR53EGUqAKJBZOpkVqDSyqG2C0IfF9h+h1VcigHEcfvs8
	Hl0KTKkvAelfev2a36Gpx84umL2LVAyTl/RNhQiL6ijfhyujVderrtBJd4KKzcMVB33Wgr514QQtT
	hjU12X7BNE22JZuTSsSyB6qbzqpLtXNnKeuvnBchc6zteHrJkjA8bkBu9q+YwJgxKEsPXNXJuvwVC
	6rWG/GjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloxz-0037e9-0S;
	Thu, 28 Sep 2023 11:13:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloxv-0037bo-0y;
	Thu, 28 Sep 2023 11:13:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C2DD76607336;
	Thu, 28 Sep 2023 12:13:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695899631;
	bh=vt+eEJt4ajZtDOlxkU9Rl6zW9Xq2pnaSuLgWUp/+gks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j374uUjBLK6D6A7uRZtkk/gqQbKmOpzs5AluTgfHWamDrSJ6RqIfEskZ0R6Qe9abZ
	 jW+Kok8c5w3pkWL2hQSVTkBIiUV4H9m4xAJ+g7audG6VSoXQfNSg7mqdeK/iNU6beS
	 xxo7SE7lFTi1Z9QMmN1IpuPOO9QOFpmqrDaksykEShVSbBqT1PYk5aTpupCdVsep8o
	 oe+dswcxhYhmu+wbXOpzlhvqhNGv41um7BwA/0E+WpexxxFaRwVc9c3GMakWKCTmAu
	 xKKG2z0nOLFL8Jlxk/RVf0n4uy5lv22nn/N58q31OEBhiTTtWwYmrbSr02jv1RXfSl
	 MO7xkkUGFwGzw==
Message-ID: <0a9b601a-dad5-358c-0555-1c10d3136826@collabora.com>
Date: Thu, 28 Sep 2023 13:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 18/31] thermal: lvts: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Balsam CHIHI
 <bchihi@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Chen Jiahao <chenjiahao16@huawei.com>, linux-pm@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
 <20230927193736.2236447-19-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927193736.2236447-19-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_041355_525831_1A714A45 
X-CRM114-Status: GOOD (  13.30  )
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

Il 27/09/23 21:37, Uwe Kleine-König ha scritto:
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



