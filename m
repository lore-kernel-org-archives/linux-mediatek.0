Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CBBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMQStzBV6VgdqsfvToThQYmXGF87lzLUYrjczbhlp4c=; b=S/I7JZMY3PnglG
	clqPAdINp1yhTrA4N7WZshxj+rcZIp+rIsewLUkgS3cnSqshcSazrfZNolA2lrdLbcHUlbCcmx6se
	OaNqqRqBywsVjVqxQ90kybH/qo5lcyqR3KVK3kgoxf6NNK5ec7HYXaZfdscgmzYfcD2mYU3vEzz2e
	G+9Pf8k6iyF9qbLb2JWqe57hI/SMUGXw/uRatUQPX9M6JpV/ISw0uchmYLq19ZtCd4O7Vwn1VqVmt
	EagC9ktovqMFmbs2bDeDs8KjClLaVMHUAFf+psLxt37J8jn2FgfJHiFyiruGZLlilMGjmYPqCZ0en
	bkgUh0TqBwnWA73lM+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPhiU-005t3u-5X; Thu, 03 Mar 2022 09:25:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPhiI-005t0v-8g; Thu, 03 Mar 2022 09:25:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1B2951F44E0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646299532;
 bh=+Mrp1q4a/4BNfYYhdIb5MbTqKcT8UTUqCYjArHMClZk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lk7d/REbiCi2XieKxcRzFkarxry/9DW1yqhe5M33Rr6+nzLX/Qc8R1oRAM7M99/9R
 uLJqhRSCtr/FqawbRf8MlFaWjqVTXnjEv7WNKAkQ0B0+Xg0uCiB2wqxxy0kmlk8wwY
 OboYNYpmxyCH4Qq3F627Pye7uLJR7NVnLi6pHdlm+ha6zINU3mO21dTGI5dbQU6J3p
 bOSkFqAUamKjRiCdvWOH86QGH0VZ8mftITwc3nN+vt68yJhmTopFBo1hIjJfq7LJs7
 l9yQL/d4EziDzS5VNlpqyvzV9PYibWYPJ8URGa0KmhVFicsZ5vD6qQ9iqguhs6f8ss
 vdS3eRnJaEsrA==
Message-ID: <22eccb9e-45fa-683e-640d-6f34fa63ca52@collabora.com>
Date: Thu, 3 Mar 2022 10:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Content-Language: en-US
To: qii.wang@mediatek.com
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com, wsa@kernel.org,
 Qii Wang <wii.wang@mediatek.com>
References: <20220303091547.17522-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220303091547.17522-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_012534_477844_6774A21F 
X-CRM114-Status: GOOD (  10.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/03/22 10:15, AngeloGioacchino Del Regno ha scritto:
> Since depending on the SoC or specific bus functionality some clocks
> may be optional, we cannot get the benefit of using devm_clk_bulk_get()
> but, by migrating to clk-bulk, we are able to remove the custom functions
> mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing common
> APIs usage, hence (lightly) decreasing kernel footprint.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Qii Wang <wii.wang@mediatek.com>
> ---
> 
> v2: Rebased on top of wsa/linux.git branch i2c/for-mergewindow
> 
>   drivers/i2c/busses/i2c-mt65xx.c | 124 +++++++++++++-------------------
>   1 file changed, 51 insertions(+), 73 deletions(-)
> 
Hello Wolfram,

I'm sorry but in this v2 I have typoed Qii Wang's email
(qii.wang <at> mediatek.com).

Please, can you fix that while applying, or should I send a v3?

Sorry again and thank you,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
