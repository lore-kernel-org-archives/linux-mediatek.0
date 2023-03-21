Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63455C7618D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 09:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGRr+RAjxHuq+zP2FtTdyIPAKJi1x6IF019fXusyJ5k=; b=w5kaug/nw2BgtOe3mFu/tBiCvS
	LAGtjIodxM5+Q99GDqvyKnt6YhlAuy3HNy0cbk89f15NC0xaUu1yYWN5GiLhxy0ljXwF8Eu+GJFlp
	haaaxk19s9oD5P6Ce+CipQBM0xw6Gyf5g/uEsC9T/fwSRqXMDe2glCi0cMCx3CVqUh8sc9M07qrBq
	Eb5ERk4/xy0Ptz3biBbMAqFF9mn1dES7JJvf8pdZgzQCCr4K2HCLmw3gmzdw64q3fbxE6XiGqDPUX
	gjeFPMQn4iU+2bysMOGjxpyi7M75a5LsEJrFzK7Er6MaiM1lCdGOik/9+neffJpzhOYOAOJ1hEGKW
	bMR0hyWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peYYR-00Bv6I-27;
	Tue, 21 Mar 2023 09:45:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peYYH-00Bv2f-09;
	Tue, 21 Mar 2023 09:45:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 104DE660304E;
	Tue, 21 Mar 2023 09:45:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679391904;
	bh=MfgH9kI/J8HvDNSUKB+LMmh8WlnXibnNiOcRHaqZMCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bFRiUS4NtMdANNGbzDib30N42GMhZFWGQyGSrZRz6YjOf0HZlMk983Fo8ObQfVhwZ
	 ddvKPID7xVIG/7KNJY15q5tY79vO0OxcAtIQ1uEpQsEUyUtqIv1hcfVfWqAQDOXCTs
	 XfFkRdL5m6s8Yo0yTnsBaSOS81n9bz3vcVkvwqy11RSeU6/BRb2FhYSanoJvJqpaJ0
	 YdY0u7Kt5wJZO9KVISy4r4e4LoQAGDLfHtb+QH6/AsY8Px407pmpT0TYokl/XscoaR
	 zJ6Z+Gu8F6EfGNGp+anhWbTkPqIpAym/Qwx7SwWzc4V1Dmt8s6U3+cHYKhJ4snd0p6
	 1vrPC/PlTedTQ==
Message-ID: <67cf8e99-609c-fb03-73a3-3801b73f88e5@collabora.com>
Date: Tue, 21 Mar 2023 10:45:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/10] iommu/mtk: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
References: <20230321084125.337021-1-u.kleine-koenig@pengutronix.de>
 <20230321084125.337021-8-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230321084125.337021-8-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_024509_230870_6566AEE7 
X-CRM114-Status: GOOD (  12.38  )
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

Il 21/03/23 09:41, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



