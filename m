Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DCDC001DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDY0R15801CZPI17NMNBmAMLOktcuzSpsElidr+LmcU=; b=2I1UAGGdZAzPrph7b22MragpZv
	7xkqHx1WzUDN3ypi3VhQCUNShZaLjCejkFvqnVMZzers1cNOviG68JHrLrCUd+qEMVuTO12NmLJ1W
	rdvHesNkGv6xZtzJsc2GWrQCsRC+NpItP+IdkEgO+u5TOCKeiHiqAQp2A37Lhewz4kb7vn19y6C2j
	yPdq7uOPbc2l2Gk/YoOE3gFyqRFPyI+vFyCE7mVuozDwBfjYK/wVQcGa2erGi29rxMoHd8k7r72Dx
	Zm1x+mVBlsIEsFurjaNArKYRB7MkN3+v+XXy06Kg+27RTBhF+bOo2sdoeruXjfuBatVZ1lxYH10Qv
	vjjt65XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCL1-006Zg5-3A;
	Tue, 25 Jul 2023 07:20:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCKx-006ZeQ-34;
	Tue, 25 Jul 2023 07:20:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C83D6607106;
	Tue, 25 Jul 2023 08:20:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690269602;
	bh=vbQ80xzI0mEIKxkOSt1CxW5Uwoqn4TRg4kjpv8ZquGs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TRNrC1Y94J12i/tUhgVJm90x8AImCfDVvjbe0XcCZYvJt5s9x/OD44IQuvFCfBnwG
	 vUhdXESET/1ljhVxvQMaUQwnKJGwNiqR1HywHHJvqwYxIjziCS3DngUgvved42HEYT
	 DbpOs0Xjw9xhmE1xK+rirKMiVLRAOIhX7epYZGd2HT+Onz3nGn3BH3Z7KEHIlaQEfo
	 BBsHt9eIAkGPzH4SqjIXM9oBj7yNpSYNG1/tDEO51NtN1ZEk+sQjlT+hqU9MK3i8zx
	 x7C9b/N8ISjn6CZO02J0WRu0Qr7O36lmKnsivmQmlVd61mIBy2wDue9lGJ4od8R98J
	 R8Ad7JJE6d5Zw==
Message-ID: <eaeeb44b-b102-1865-9600-58de7f682ee8@collabora.com>
Date: Tue, 25 Jul 2023 09:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 11/11] drm/mediatek: dp: Don't register HPD interrupt
 handler for eDP case
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-12-angelogioacchino.delregno@collabora.com>
 <16123fef00babcc855c626ff65b5510fdeea6e15.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <16123fef00babcc855c626ff65b5510fdeea6e15.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_002004_248456_76A24C3D 
X-CRM114-Status: GOOD (  20.90  )
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

Il 25/07/23 08:37, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Mon, 2023-07-17 at 16:14 +0200, AngeloGioacchino Del Regno wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   The interrupt handler for HPD is useful only if a display is
>> actually
>> supposed to be hotpluggable, as that manages the machinery to perform
>> cable (un)plug detection, debouncing and setup for re-training.
>>
>> Since eDP panels are not supposed to be hotpluggable we can avoid
>> using the HPD interrupts altogether and rely on HPD polling only
>> for the suspend/resume case, saving us some spinlocking action and
>> the overhead of interrupts firing at every suspend/resume cycle,
>> achieving a faster (even if just slightly) display resume.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dp.c | 81 ++++++++++++++++++-----------
>> --
>>   1 file changed, 46 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
>> b/drivers/gpu/drm/mediatek/mtk_dp.c
>> index e74295ba9707..c06fcc7318e7 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>> @@ -2182,9 +2182,11 @@ static int mtk_dp_bridge_attach(struct
>> drm_bridge *bridge,
>>   
>>   	mtk_dp->drm_dev = bridge->dev;
>>   
>> -	irq_clear_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
>> -	enable_irq(mtk_dp->irq);
>> -	mtk_dp_hwirq_enable(mtk_dp, true);
>> +	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
>> +		irq_clear_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
>> +		enable_irq(mtk_dp->irq);
>> +		mtk_dp_hwirq_enable(mtk_dp, true);
>> +	}
>>   
>>   	return 0;
>>   
>> @@ -2199,8 +2201,10 @@ static void mtk_dp_bridge_detach(struct
>> drm_bridge *bridge)
>>   {
>>   	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
>>   
>> -	mtk_dp_hwirq_enable(mtk_dp, false);
>> -	disable_irq(mtk_dp->irq);
>> +	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
>> +		mtk_dp_hwirq_enable(mtk_dp, false);
>> +		disable_irq(mtk_dp->irq);
>> +	}
>>   	mtk_dp->drm_dev = NULL;
>>   	mtk_dp_poweroff(mtk_dp);
>>   	drm_dp_aux_unregister(&mtk_dp->aux);
>> @@ -2579,40 +2583,44 @@ static int mtk_dp_probe(struct
>> platform_device *pdev)
>>   	mtk_dp->dev = dev;
>>   	mtk_dp->data = (struct mtk_dp_data
>> *)of_device_get_match_data(dev);
>>   
>> -	mtk_dp->irq = platform_get_irq(pdev, 0);
>> -	if (mtk_dp->irq < 0)
>> -		return dev_err_probe(dev, mtk_dp->irq,
>> -				     "failed to request dp irq
>> resource\n");
>> -
>> -	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
>> 1, 0);
>> -	if (IS_ERR(mtk_dp->next_bridge) &&
>> -	    PTR_ERR(mtk_dp->next_bridge) == -ENODEV)
>> -		mtk_dp->next_bridge = NULL;
>> -	else if (IS_ERR(mtk_dp->next_bridge))
>> -		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
>> -				     "Failed to get bridge\n");
>> -
> 
> Why remove next_bridge setting?
> 

Hello CK,

Thanks for making me notice that! The removal of this code snippet belongs
to patch [9/11] `drm/mediatek: dp: Add support for embedded DisplayPort aux-bus`
because in that patch I am moving the call to devm_drm_of_get_bridge() to function
mtk_dp_edp_link_panel(), which is called as a .done_probing() callback if the eDP
panel is on aux-bus, or "manually" if not on aux-bus.

I'll send a v7 with the removal of this snippet in the right patch.

Thanks again,
Angelo


