Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFE6CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TavNOPJn5l9va/tHjiXdguhPaboZMjgsQKvjVKmTNJU=; b=b5W5HbKn5gfzS0Y009cbZs+yt4
	FmG+VzAfTYOyB8oxNT9sEO5mmBziYDm0tDty4g6zHFAFX/juHJhNt4RD55+wJIyWopLBw2w6sr2Un
	J8EfGc5VsToyC7hwHhx/NK6GMwVLXJbmm5ve4bMtzubWoRhEplDk7IqWA2+1bkFwqxuBmFNcoBk3k
	6P4u5fa9x+0PGPcSXybDStU+1Prg5jIyVOLIVy6Xd0eubVcoDGpIrOyVHMzkgWS1joFw8VJCD9bOz
	wGaeQy+HczVcZqraUwcb6bly8iwBte5P4f+1c68iZz/JDSGAFmzU+4ygshJd/D4HmsuB3BIXxtjUH
	shktdUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcfe-0000000Db8O-20ob;
	Wed, 05 Nov 2025 12:31:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcfb-0000000Db7m-15M2
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 12:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762345880;
	bh=3orZaa3BJfbbwuZiYUMX6DK1I31IvSAL999Rpt9kpxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pl+bDX0bsfW2Sp34vBeeVU0amQOnBSbALUJjzViisp14VXUgd+kJ2YRyADMAXSu2k
	 +tZQKNisJ1L5dnAApFHRQaYpIr0fRxzw8e7thjpllTZIxnYn6cMV7VBi3nhcUxriyM
	 xYtTANz739MqPnWXBEdScSR/YYxXG7tyOukQXzaXjHACdxikSaT29xW0B4aDPt8gQG
	 UGu/J/YKwraPp2LqhOqy320iKfH39MqvzGcPk1YFENq5a29Z7AFdcQK6ddODigVmSf
	 5Zd7um2SPDAhjP0Kw8QabG3x9Tiw3p7FyOQH8mXK31/RMoRVmJFobQrKgGAVKXG5HQ
	 D8LBxCHc0tM8A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF9E517E009B;
	Wed,  5 Nov 2025 13:31:19 +0100 (CET)
Message-ID: <8bbea465-c277-499c-937d-71790a3555da@collabora.com>
Date: Wed, 5 Nov 2025 13:31:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: mediatek: fix VPU device leaks on probe
To: Johan Hovold <johan@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251028100454.4086-1-johan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251028100454.4086-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_043123_459794_79D4D485 
X-CRM114-Status: GOOD (  12.92  )
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

Il 28/10/25 11:04, Johan Hovold ha scritto:
> This series fixes VPU device leaks during probe of the mdp driver.
> 
> Included is also a minor documentation update to make it clear that the
> VPU lookup helper returns the device with an incremented refcount.
> 
> Johan
> 
> 
> Changes in v2
>   - drop incorrect vcodec patch since that reference leak has already
>     been fixed by commit bf1d556ad4e0 ("media: mtk-vcodec: abstract
>     firmware interface") which added the codec release callback
> 
> 
> Johan Hovold (2):
>    media: mediatek: mdp: fix device leak on probe
>    media: mediatek: amend vpu_get_plat_device() documentation
> 
>   drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 7 +++++--
>   drivers/media/platform/mediatek/vpu/mtk_vpu.h      | 2 +-
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 


While series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



