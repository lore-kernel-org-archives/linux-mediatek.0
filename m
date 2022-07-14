Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C10C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 11:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFZ825AzNfEqssSFukPixv6cjz7N1ymDSoMw/rrQRyU=; b=dPi76ld7oGwIUkP3sZ+1rzV8eb
	QMzAvb5NLvVS3yjKinP741Wl5KrZcTZL3TyLrfTX2W/JO61gGcHi8A9DYTkACqXdGiyti5W9XDQSO
	EeUInOL/KrmEXn0jsIsVjnOeFAz+44k5rrDwH0/9ZTG79zUuSV26IeAAeCQ6UN53gn8hi/NwuDZvT
	gCFylX+0u8w1hG6daVrKYqVq0UMkb+IVK1qxTor18cZomBSjyLbyKkQh+kUQ7sNNceiwHb/XeVZ/W
	aOJmq8jxFfRTK2BfNEeQqrQCyb6rLXk91Zb9t/GjxriUlRfMf4XqdTWSZThLA7/qCJfY/Xe/qnPLp
	6Vhb7lwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBxTm-00DzLr-2C; Thu, 14 Jul 2022 11:58:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBxTP-00Dz7Q-Nd; Thu, 14 Jul 2022 11:57:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 433AD6601A3B;
	Thu, 14 Jul 2022 12:57:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657799858;
	bh=2viWGbCfExA/tWGEf8o0sIu0spzfJUPHwjKHCwMZ8QI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EEikQaXTSB2NOfx2y1x+0VfJ4xdH2VrKYXTbbP9EmMC5RLbPYSkxCbuuEuNwD9dgJ
	 Ie/0/NTP14exe0g2Gz8fH9vR906iG3QPToKxSVur+23Y+X15k9rPlfivjD48HuaU+s
	 qZwwBrRacfVi86iXglemjk2PJHGT1f6Q/USp/8E+qMRBPfSy03E0qp093ODbHzAnuv
	 xj6QHqmqUCUclM4F71BBEN78VrxjL2MH+vzpFSY9Dom5jUwdhJRzwtVYBNrTSYpwZS
	 oPNR4m3+L/ghQYhU32xE4ETANyIrZAPozqVN9EDuNIt8wRsu1szPpqYueYyTWfqLzm
	 Ox0VBllhp0q3Q==
Message-ID: <3b74cc48-2e18-3ad1-613c-fb90fced5d7d@collabora.com>
Date: Thu, 14 Jul 2022 13:57:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [V10,5/7] mtk-jpegenc: add jpeg encode worker interface
Content-Language: en-US
To: "kyrie.wu" <kyrie.wu@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, nicolas.dufresne@collabora.com,
 wenst@chromium.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>,
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com,
 srv_heupstream@mediatek.com
References: <20220627025625.8956-1-irui.wang@mediatek.com>
 <20220627025625.8956-6-irui.wang@mediatek.com>
 <46eaafc0-478e-8a74-cf8b-dd1f236df035@collabora.com>
 <f8091b62835e99bac2450076c02a39c057a23ad8.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <f8091b62835e99bac2450076c02a39c057a23ad8.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_045739_951101_E3B61EC6 
X-CRM114-Status: GOOD (  14.68  )
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

Il 14/07/22 10:51, kyrie.wu ha scritto:
> On Tue, 2022-07-05 at 15:27 +0200, AngeloGioacchino Del Regno wrote:
>> Il 27/06/22 04:56, Irui Wang ha scritto:
>>> From: kyrie wu <kyrie.wu@mediatek.com>
>>>
>>> Add jpeg encoding worker to ensure that two HWs
>>> run in parallel in MT8195.
>>>
>>> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
>>> ---
>>>    .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 208
>>> ++++++++++++++++--
>>>    .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  30 ++-
>>>    .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |  39 +++-
>>>    3 files changed, 240 insertions(+), 37 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>>> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>>> index 0c5c85a112ca..544673a527a0 100644
>>> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>>> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>>
>> ..snip..
>>

..snip..

>>> @@ -218,30 +222,37 @@ static irqreturn_t
>>> mtk_jpegenc_hw_irq_handler(int irq, void *priv)
>>>    
>>>    	cancel_delayed_work(&jpeg->job_timeout_work);
>>>    
>>> +	ctx = jpeg->hw_param.curr_ctx;
>>> +	src_buf = jpeg->hw_param.src_buffer;
>>> +	dst_buf = jpeg->hw_param.dst_buffer;
>>> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
>>> +
>>>    	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
>>>    		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
>>>    	if (irq_status)
>>>    		writel(0, jpeg->reg_base + JPEG_ENC_INT_STS);
>>> -	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
>>> -		return IRQ_NONE;
>>> -
>>> -	ctx = v4l2_m2m_get_curr_priv(master_jpeg->m2m_dev);
>>> -	if (!ctx) {
>>> -		v4l2_err(&master_jpeg->v4l2_dev, "Context is NULL\n");
>>> -		return IRQ_HANDLED;
>>> +	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE)) {
>>> +		dev_err(jpeg->dev, " Not JPEG_ENC_INT_STATUS_DONE\n");
>>
>> Please be more descriptive in error messages. Also, should this
>> really be
>> a dev_err?!?
> maybe dev_warn is right, I will fix it.
> 

I think that v4l2_err() would be more appropriate.

Regards,
Angelo

