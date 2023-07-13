Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60F4EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 11:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnDbRxifV//jZ4X21IMQr1nkwMP5o+FDnslZEZZnLfc=; b=BIZZsvnVh5WhrK+GIQnncLIcnb
	uO5mRjPPbkciPe9QYdSM+Kn+4YYFbn04OVrs6pfwlCFtdG4jy9NAh1ADm1lPipQhnDCfCqCagJp7r
	RGH5rA1H8p0PENw6GKqlKk5BLUwE5rAnWHgPgWx1OWrodD/2nGIK0y93B/WhM7W+XLQnbGha19S/0
	Sl1lAeZwnZkuCLa63SZTi8crpJp53owJnFdnCDGIrHhxPJDx6W8oTw8sDyozmGwHuHoeWv8KDc4P7
	Q4zo2MuBUo+ImWvSCm9SZi+E7OqGz/dqojVcJ6w8uq70650CF74VjlZ3AXhC7ZiXFnJ0eiI7p3RuX
	cO6uBLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuGt-0032zS-2S;
	Thu, 13 Jul 2023 11:14:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuGq-0032xt-26;
	Thu, 13 Jul 2023 11:14:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B357F6607037;
	Thu, 13 Jul 2023 12:14:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689246843;
	bh=Lu02uJv4pBvx54SeI6S7W2i3oUy20NvZIXgEARcd/7U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NBb/9/1ewn8GA0sfANVBB/1h/JRmJ+l3aug8SWVhz5uw8xmHUnZC+erZDrkpHCbhV
	 df8wBl5TqdFwqGORrVJVsY8Iq0gBz+HOakhL2nRgWHR9KdFLBrFxjsMGJ17iKI/ItL
	 gEzh2pGH6yK7/wjyg2rs4jncviUFhs8IUD1uNlJ4Jny1rtEkYK/krE8jbCcHPjFUP/
	 R4OPsA1kRVd7MUT3DEOOGVEzZLVtG8z6jYHOc8JBdaXu1DHrH/78SdUJezdZT40eUp
	 eRG3I9zv+xCeMC0YLJaRp0wSpaEX4w0h7D7bv5DuoAcKGszTQ3Gb9ZqGHMJHHhNmoc
	 3ah5qYZnXp0yw==
Message-ID: <8c3412a0-b837-6ee4-eb9c-a958e1d74841@collabora.com>
Date: Thu, 13 Jul 2023 13:14:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/4] drm/mediatek: mtk_dpi: Use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
 <20230412115250.164899-5-angelogioacchino.delregno@collabora.com>
 <CAC=S1ngkoQJKi6AozAOQY1WKvMhMrgKfA8S7MdbqmzSD5rRmdw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAC=S1ngkoQJKi6AozAOQY1WKvMhMrgKfA8S7MdbqmzSD5rRmdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_041404_819389_5316211D 
X-CRM114-Status: GOOD (  16.65  )
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

Il 13/07/23 10:34, Fei Shao ha scritto:
> Hi Angelo,
> 
> On Wed, Apr 12, 2023 at 7:53 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Instead of the open-coded platform_get_resource, devm_ioremap_resource
>> switch to devm_platform_get_and_ioremap_resource(), doing exactly the
>> same.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dpi.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 9025111013d3..45535dc7970f 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -1038,8 +1038,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>>                          dev_dbg(&pdev->dev, "Cannot find pinctrl active!\n");
>>                  }
>>          }
>> -       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -       dpi->regs = devm_ioremap_resource(dev, mem);
>> +       dpi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
> 
> "mem" appears to be unused elsewhere, so I assume
> devm_platform_ioremap_resource() would be a better fit.
> 

That's right. I'll switch to devm_platform_ioremap_resource() in v2.

Cheers,
Angelo

> Regards,
> Fei
> 
>>          if (IS_ERR(dpi->regs))
>>                  return dev_err_probe(dev, PTR_ERR(dpi->regs),
>>                                       "Failed to ioremap mem resource\n");
>> --
>> 2.40.0
>>
>>
> 


