Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5687C001DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ki23GdIHYJcf3k2LcP4Bc+Wyb4PsXkdfLlP+kaPWlsY=; b=i17OHqP/QTXSqek0OV0PMJFobq
	vCjjgH0/J70k8s4LtAMcbFgoFPgqX7wINEcHDIPECcr0OjZgc6Qoa4E4CphXI4jjdmE+Xu9M5OMmK
	sw5KljF6rDkFeB9PtXNWUj6e3HA0Bj8UWFVz558emaGrL7A3YsyngyP7D08oJWFO12xrNgFOMOCuz
	naNn7gAYNp/y8YHC8xiHANIIYq+wUBb1kYlM3VwM23PL9aRVDC25vclpAvyJ1WkrrabdLZvB1wuLd
	C0QJlggSYWw4EUKA/2Sm+198Gutspvcn3vzlCcEZv0ipErzFvpyhbzJMQzP7znylbkafzPzuvdDuR
	K7c3hyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuGR-0032sT-0C;
	Thu, 13 Jul 2023 11:13:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuGN-0032r9-0a;
	Thu, 13 Jul 2023 11:13:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A5CD96607048;
	Thu, 13 Jul 2023 12:13:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689246813;
	bh=Km3zinC5aU6POQuC6Ok3uEJbGy3j4WpICpPik1AklyI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G0zbayyLnyvN9v0jhGQjJRNbQD4LPKfLRKp1ZzhPFNamgbcftpyJaGqiqewcKwiux
	 ew4ueWCbmcRQQKDvrDLsTKh8iB6EL/A/HCzHi3xo4nefACTMynB0zJbdydvp/ayL7M
	 h+PwfNWJEb6qAJSdh3Ygyf2OwhPH/m+1TpYHZgr9MslNJPTLbWpBZ9IwbHmNX91jv3
	 jMT8yCZvKVdKwCALuoiHpWz1sGrjIewa/oYV82FsH6h11d4AFBtpaZwGUijvFWjlOh
	 FyqgG6m3fGA0/GCV2za1GTYKrdNcICz2F1p0oCMKuRDen5eadwFAQZhKdCm46CLWXU
	 c2JodVlqMeuuA==
Message-ID: <0b45eae2-4081-febe-d062-6475d67a59cf@collabora.com>
Date: Thu, 13 Jul 2023 13:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] drm/mediatek: mtk_dpi: Switch to
 devm_drm_of_get_bridge()
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com>
 <20230412115250.164899-4-angelogioacchino.delregno@collabora.com>
 <CAC=S1nhePNeKY=q3XofzPcbwvyonz-bSuSLDNgsKx088qB3ZJA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAC=S1nhePNeKY=q3XofzPcbwvyonz-bSuSLDNgsKx088qB3ZJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_041335_361678_77EAD953 
X-CRM114-Status: GOOD (  21.03  )
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

Il 13/07/23 10:24, Fei Shao ha scritto:
> Hi Angelo,
> 
> On Wed, Apr 12, 2023 at 7:53 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Function drm_of_find_panel_or_bridge() is marked as deprecated: since
>> the usage of that in this driver exactly corresponds to the new function
>> devm_drm_of_get_bridge(), switch to it.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dpi.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 6be65ea21f8f..9025111013d3 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -1063,10 +1063,9 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>>          if (dpi->irq <= 0)
>>                  return -EINVAL;
>>
>> -       ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
>> -                                         NULL, &dpi->next_bridge);
>> -       if (ret)
>> -               return ret;
>> +       dpi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
>> +       if (IS_ERR(dpi->next_bridge))
>> +               return PTR_ERR(dpi->next_bridge);
> 
> The original code doesn't print any log so it's probably fine, but
> given you're already at it, perhaps you want to also make use of
> dev_err_probe() here?
> devm_drm_of_get_bridge() can also pass -EPROBE_DEFER from its wrapped
> drm_of_find_panel_or_bridge(). Furthermore, that will make the code
> visually align with your previous patch.
> 
> But that's just optional, and since this patch works anyway,
> 
> Reviewed-by: Fei Shao <fshao@chromium.org>
> 

Thanks. Yeah it's a good idea to add an error print... since I will have
to anyway send a v2, I'll add it.

Cheers,
Angelo

>>
>>          dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_node);
>>
>> --
>> 2.40.0
>>
>>
> 


