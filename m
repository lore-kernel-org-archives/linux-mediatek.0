Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D3AEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 11:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1vvhadilfB+0y7DBv9/TNHuJvKxA7o7T0l20Gct/jo=; b=hY5PAdgTk26Ha7yf4HSd1nM/ga
	72DrVBY9goCUbQSXAJGHLLe3XlPalh2nC0CIK8TziXWTPMweX67aDPhus5XPdfF/3XxF12CmtfsWl
	Ube0Lpu04p9Kf8gFTEZ1R9dVIyCjledFd8tskUpcJMIVHGiICVizhECW0Ef76ym79GmDLGSh/tk1O
	kuV7VRGa8oKW+UVYztVCnU20wY/BRNMu5VAmGbMFYnc4wRolF5gN1tmRWmhntVTgxZxsMMYxwij3k
	hX2R6aKjD4tOpng+x+Hh/Lf04Fg94yhuWK5LiRGhcCGWNjthUDDMGg7zC9yDTgbGTcUo+5+lBo8wZ
	x3uAOFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuHc-0033Bj-0v;
	Thu, 13 Jul 2023 11:14:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuHY-00339c-3B;
	Thu, 13 Jul 2023 11:14:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 914386607037;
	Thu, 13 Jul 2023 12:14:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689246886;
	bh=F1i+SwhIPLo5pHuaYsaZeydF8C9QVQZ9zzDTvGn7X90=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kjLEPN/aPb5ZfsiDrbSiwZpvOKvHUWBkHroyv20TZEhqr06zyhmTJAwHoq6fr7nr+
	 lWtrct015bxNmNF/yEAJ3/dgDks39FZzOIN7cxLMXeSGMFPWH19cWck/LbR19JrLCE
	 e1yCJqMo6IbKVuuQY0060ago8UgSZty1BuIxCq5/Sht0X9T2AEEAlVCe9uo8T4Dura
	 AbW1206f2qd5J/uvsbURYWKcejVhu6Eims5FuXkUeYflAkQ2RUh2jlyiwlOUeehCKB
	 IV6ndMTUzNFPvrzmW1LnwyKGmuXJXGoI0dYVu9Yrjb8qmQRfQD++vXXYv+MA9m+vE4
	 SihyFwwd0Cl7w==
Message-ID: <d93e0a7b-7ee8-62ad-cf96-985ee5a8d432@collabora.com>
Date: Thu, 13 Jul 2023 13:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/4] drm/mediatek: mtk_dpi: Simplify with
 devm_drm_bridge_add()
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
 <20230412115250.164899-2-angelogioacchino.delregno@collabora.com>
 <CAC=S1nivzyX9+3EBtAG5dPmy-c6je74zmY68AXjyFvV2Pigqgg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAC=S1nivzyX9+3EBtAG5dPmy-c6je74zmY68AXjyFvV2Pigqgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_041449_153513_AE926988 
X-CRM114-Status: GOOD (  15.87  )
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

Il 13/07/23 09:55, Fei Shao ha scritto:
> Hi Angelo,
> 
> On Wed, Apr 12, 2023 at 7:53 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Change drm_bridge_add() to its devm variant to slightly simplify the
>> probe function.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dpi.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 948a53f1f4b3..2d5f3fc34f61 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -1090,11 +1090,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>>          dpi->bridge.of_node = dev->of_node;
>>          dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
>>
>> -       drm_bridge_add(&dpi->bridge);
>> +       ret = devm_drm_bridge_add(dev, &dpi->bridge);
>> +       if (ret)
>> +               return ret;
> 
> And also drop the drm_bridge_remove() call in mtk_dpi_remove()?
> 

Yes. V2 will drop that.

Cheers,
Angelo

> Regards,
> Fei
> 
>>
>>          ret = component_add(dev, &mtk_dpi_component_ops);
>>          if (ret) {
>> -               drm_bridge_remove(&dpi->bridge);
>>                  dev_err(dev, "Failed to add component: %d\n", ret);
>>                  return ret;
>>          }
>> --
>> 2.40.0
>>
>>
> 


