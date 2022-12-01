Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2C8C4708C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzUOrzMLQOT8rSNVmnkq8oc2QYM2cJQtas7lPbYgfjA=; b=ach24AJdZSMQ1yArBuTQRd9HIx
	K+r5guu+Ph4QkqTtDf6QqBIpdAv0RyPtbfntfS6TF3wSBqqoySe8LlMA7BWEifaDjQBtuYlpk/NHM
	PB4IgQyd7LkTQnUAYheihbXqlv0xYYeU/5yMI6N3cK3P3z4v4lgBGoqyy/OES0HKQ0cn3zBnx89dQ
	Wh8gKkMKRntp30/S/lwdkweTeTWVb82f1sisVKZh5wz5GtrszgtVG6lXwc4BTupyYoH3Imr11OgUn
	D5Z1humMtrMLa8YVm5cf+rbIc1dk5X5cwa1+YOwn/E7sZ11TBbNH6zXLstGmUEXNLaHMh9eHDzU4R
	8Ajua6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0g8l-006RuE-LY; Thu, 01 Dec 2022 09:45:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0g8Y-006RqE-GA; Thu, 01 Dec 2022 09:45:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E06E66025DF;
	Thu,  1 Dec 2022 09:45:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669887944;
	bh=ixKFlrVfNS4fpOwIDLlWnkerVHrbNdjy7rjzgp4awDY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SudtHIjjYXPGbOHedokplY8hoZRNXCcgfBFG5mLc/pwBNA90G1y9VIzmYeGd7JKvw
	 o6KAq5ICx7zvv8/huZDOH3L0QtACqkd2YPb7sUAUqY1LSjklbSZuBoezDKFqNT6tDK
	 9K4X4s8vZb6yb3BePKBtc6iVFklqAysbjHbM3K5FrHGo+72h3xVIGN3g55de6rki8q
	 II+sZvfE1TPWdd5sdW0cw1HbbezbE2JbAd+kHn4uVkqaQsWJ4ZOeEIvyBsSi49Vg4L
	 d8Gi+d+4dcEfZ5L/ZydMSpTsbdr/hmaGGNkaFuZcEx5Z3ULuH4Rq5aoi+daDclIL9k
	 Lh4om4F0tsp1g==
Message-ID: <3e8aa2d9-6cd9-b155-c7b3-551fb574ac90@collabora.com>
Date: Thu, 1 Dec 2022 10:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] media: platform: mtk-mdp3: Fix return value check in
 mdp_probe()
Content-Language: en-US
To: Qiheng Lin <linqiheng@huawei.com>, mchehab@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221201023505.48015-1-linqiheng@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221201023505.48015-1-linqiheng@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_014546_714214_DC4222D8 
X-CRM114-Status: UNSURE (   8.11  )
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

Il 01/12/22 03:35, Qiheng Lin ha scritto:
> In case of error, the function mtk_mutex_get()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().
> And also fix the err_return case.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>

Thanks!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



