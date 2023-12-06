Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1DEC10F07
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8lrG+jcUTi9EobmyHRVEo2x2vhn96kzwKXo4fjcrWc=; b=XQMz6xGjmSZcma5n+mbTVo/xSR
	3q8RxZIoPPK4RgvCuy7sYRklx1Fsq6/az0TmlZWjYWf0LyNny353gIRefzHfFexEi2K8/oRPHDr0Q
	SgrDKcyq334BShS1h0ToMD1tcCLmjKb8HYA2gmynvm49WgKPFFwdczvuSODs7X1XVTB/GRQ3a6YAn
	jnWKxXjQZasGXXgwWRxFmSJLZ8ngxknxWdO35eA5qE0DMnKjP6WPN0kmJ3ywxtItpUMzj5PhlVKUH
	9bKtAnmdB5iH1JlOPX52xCDTt6+gBcxmLFm2OSUxEtoQZjhRJpH3aZxkzRxz5QuALXh6wslRzFlud
	XeAeY+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAp0N-009iCP-27;
	Wed, 06 Dec 2023 10:19:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAp0G-009i7c-1S;
	Wed, 06 Dec 2023 10:19:42 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E879B6607326;
	Wed,  6 Dec 2023 10:19:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701857975;
	bh=IovYJ01Jivwam/qxWADM1HZ4UJMjvtHVmaPsaZqxoro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ge3ih24jaH9Ox/URbczBLz2DRMrZfkSWyobDWXa7+PBzEUH+zpDgasWrLMUcfbvEh
	 h8tLwHEsOaQwlpVUWSj1AhstZRO8M17dTwROBWz0kfnZ8AU+oxIC+NUDb5visZyE03
	 NTslxdBQkMfXjXEe7rbrY0EsI6BfKxdg6+/4wJSc7zOH5G41z4C5CW6FkbhM9JR7Wp
	 tAQVenJg98xI841kHPBZJW2YvYSzK8HZhMFcme/UIS2GFO7laGznCkZsl7OWECq7WM
	 Q1EyFeH1N7G15Ua6YS6oFaMkPzYUZcn1r3JJUdRlcrzqXnsk1WBGcyce5I875U32ka
	 0shhZLA2THLkg==
Message-ID: <449b9678-e3c2-4410-ac80-c50a1a25cc06@collabora.com>
Date: Wed, 6 Dec 2023 11:19:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: mediatek: vcodec: Drop VA check against
 mtk_vcodec_mem_free()
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Irui Wang
 <irui.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231113123049.4117280-1-fshao@chromium.org>
 <20231113123049.4117280-5-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231113123049.4117280-5-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_021940_617107_ED415C5E 
X-CRM114-Status: UNSURE (   8.33  )
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

Il 13/11/23 13:26, Fei Shao ha scritto:
> Now mtk_vcodec_mem_free() handles the VA-is-NULL case without generating
> excess error log, so we don't need to check that every time before using
> it in the driver.
> 
> Remove all the unnecessary if branches against mtk_vcodec_mem_free().
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

For the reasons explained in patch [3/4], I'd prefer to keep those checks.

Cheers,
Angelo

