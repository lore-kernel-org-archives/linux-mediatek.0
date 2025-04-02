Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE03C28B20
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8p+PAfxUITJsQDmkyVkEoCrM+PcZZekbBldYOaMAW0=; b=xJm8m/gqSRXjKZpyiXp7TFCRg1
	XiZU0AwF0lPkQsbF/Lg2nbuTg/ZAEv9ID8Lvlnvtfguy7lHvA5LIi1DpxWD9fZyawXeJBwblXsXNr
	zFsioJp3gwjp8NJVwsXI76Y7k4rki/G2JHfAb1HWqDaQSBBbCy3Lk4fcxcnas1OzyyGBvDERpT6ur
	TtS/iNVmZadJR0QUmDeuOyDcT+gf5a3Ws/3KUm1ROTRvU4J3sj9U/rY91VCtG6aYMI0XHt+rMRkvM
	ojlH7RdP5KV9KgZyZ7Xq7AEuw2RoqFS5A66G6ENX16aE/iNJ1hi+4fhf396Vooo38ZIjBKk8uVR8J
	nDguxSOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzv3g-00000005l6T-118Q;
	Wed, 02 Apr 2025 10:10:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzv1h-00000005krX-1fPk;
	Wed, 02 Apr 2025 10:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743588532;
	bh=xA/faLEB0MkdAsz9QcJVzhzblw7gBnHvn4QbsV73wCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R2TTor1lnu8BsZvlTYnHg1NXM+t7l+8q5xKDq8ujeaUyOQxiOJPQHoSfF6Ip0AJEh
	 6kJie715j+uoTCnirJs9ssTrPtEwaF20B0EeVm76TgV31oOYsEGSZHrwGNTh6oYukt
	 AdWFSYI/AwvwGpWzKloINpz0kk27tkvPte7eVlAn+eyBEYniAYGePJ+DlSHChlTwmg
	 44grpWD2LoZRw6uCHVezgVsmi6h/AdyRPZl+YQ56DZEbwd69/egpnWifrmHnpC/oND
	 uEVdX/IMJMqseTxjRIgBD6SlWuv9pc7ThdvOUhW0bxla5wfH7zaWB1pPmL/qn7Nw6h
	 n5SnKausYkHqg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0CD3117E091E;
	Wed,  2 Apr 2025 12:08:51 +0200 (CEST)
Message-ID: <608f25af-69dc-455d-b382-aaa3cb2d9578@collabora.com>
Date: Wed, 2 Apr 2025 12:08:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] drm/mediatek: mtk_disp_ovl: Enable/disable
 interrupt on bind/unbind
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com,
 ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org,
 bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
 <20250402083628.20111-5-angelogioacchino.delregno@collabora.com>
 <CAGXv+5E1qShE1LqgFL6rrgRzjwFUPoBqYdhO-sgNzmMqQsMS0Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5E1qShE1LqgFL6rrgRzjwFUPoBqYdhO-sgNzmMqQsMS0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_030853_578485_283D9EA0 
X-CRM114-Status: GOOD (  22.33  )
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

Il 02/04/25 11:38, Chen-Yu Tsai ha scritto:
> On Wed, Apr 2, 2025 at 4:36 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The OVL driver is installing an ISR in the probe function but, if
>> the component is not bound yet, the interrupt handler may call the
>> vblank_cb ahead of time (while probing other drivers) or too late
>> (while removing other drivers), possibly accessing memory that it
>> should not try to access by reusing stale pointers.
>>
>> In order to fix this, add a new `irq` member to struct mtk_disp_ovl
>> and then set the NOAUTOEN flag to the irq before installing the ISR
>> to manually call enable_irq() and disable_irq() in the bind and
>> unbind callbacks respectively.
>>
>> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 19 +++++++++++++------
>>   1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> index df82cea4bb79..1bff3a1273f6 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> @@ -161,6 +161,7 @@ struct mtk_disp_ovl {
>>          struct drm_crtc                 *crtc;
>>          struct clk                      *clk;
>>          void __iomem                    *regs;
>> +       int                             irq;
>>          struct cmdq_client_reg          cmdq_reg;
>>          const struct mtk_disp_ovl_data  *data;
>>          void                            (*vblank_cb)(void *data);
>> @@ -587,12 +588,18 @@ void mtk_ovl_bgclr_in_off(struct device *dev)
>>   static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
>>                               void *data)
>>   {
>> +       struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
>> +
>> +       enable_irq(priv->irq);
>>          return 0;
>>   }
>>
>>   static void mtk_disp_ovl_unbind(struct device *dev, struct device *master,
>>                                  void *data)
>>   {
>> +       struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
>> +
>> +       disable_irq(priv->irq);
>>   }
>>
>>   static const struct component_ops mtk_disp_ovl_component_ops = {
>> @@ -605,16 +612,15 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>>          struct device *dev = &pdev->dev;
>>          struct mtk_disp_ovl *priv;
>>          struct resource *res;
>> -       int irq;
>>          int ret;
>>
>>          priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>          if (!priv)
>>                  return -ENOMEM;
>>
>> -       irq = platform_get_irq(pdev, 0);
>> -       if (irq < 0)
>> -               return irq;
>> +       priv->irq = platform_get_irq(pdev, 0);
>> +       if (priv->irq < 0)
>> +               return priv->irq;
>>
>>          priv->clk = devm_clk_get(dev, NULL);
>>          if (IS_ERR(priv->clk))
>> @@ -635,10 +641,11 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>>          priv->data = of_device_get_match_data(dev);
>>          platform_set_drvdata(pdev, priv);
>>
>> -       ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
>> +       irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
>> +       ret = devm_request_irq(dev, priv->irq, mtk_disp_ovl_irq_handler,
>>                                 IRQF_TRIGGER_NONE, dev_name(dev), priv);
> 
> Use IRQF_NO_AUTOEN here? Also, IRQF_TRIGGER_NONE can be dropped.
> 

Yeah, nice one. Thanks!

Cheers,
Angelo

> Make sense otherwise.
> 
> ChenYu
> 
>>          if (ret < 0)
>> -               return dev_err_probe(dev, ret, "Failed to request irq %d\n", irq);
>> +               return dev_err_probe(dev, ret, "Failed to request irq %d\n", priv->irq);
>>
>>          pm_runtime_enable(dev);
>>
>> --
>> 2.48.1
>>



