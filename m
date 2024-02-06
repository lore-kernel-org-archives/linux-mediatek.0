Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC0DC4829A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4l9g+Txs+9A89d1Z95bTEC7DHvznGiAudo6486ONeMo=; b=jnDE4267G4OgFXBK037LuJGl5I
	wpZrhvdMkI7rJvoncz3ukF+yMkmoaZ1X1r6pAlpukrBbeaQ8OG1yfHjF7cM8zcZTE68oOdf/RER4d
	S6zq3qVuu+UTNiq04mZBQFIKchXS0HwIyQtGuZPJILxscKCZ7LZ6hgbtcaiyhGW9jfM4b90o5HsPs
	rGBnQxztkNlfQ4uo+mgQkX7AiFTM9QpYvU4I+wL9FboZwlPLR1L2VpBM5teI5l5cmJwd8gteMYqRM
	HlQMil+gXCqjZxJkXZW0B20RV1rUgaw1i68igDx9i//Jl2Nneu4oWEnx3wyhmwKh58jvzy+pBOckf
	UbLS+cbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJZS-00000007J9H-1D1S;
	Tue, 06 Feb 2024 11:24:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJZO-00000007J6w-0zCp;
	Tue, 06 Feb 2024 11:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707218691;
	bh=W9eVxM9U4SL9Oval+gIwwmjbVA2ob2C9cUlB+OFaVvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e5f64p7gND16GTg1YhhbvoMrXWlljuooWsiJ1nAVQstieLhpfDpYss7vxXOCcukp9
	 bqU3DHZiB5K9jtpWwUdjLDLQGvncm2gGYIW7qoWVJ3kczytkd/NusXDThTFNngZp2C
	 6gu6gCU1OTL1tRKVsuaEprn48G5HRMYgzKz4+Mp3pdAwRXXz7SSSAi0gA88P1SjDGT
	 f8MNgqJ4ZcxRnET/5TnaWwoGVWOBD9Dfk4Leilb9+nL314aoIJg1rqOraAU3+qX6a+
	 pJ4/SDii/b/xKagaKT1GzoTzdvUAM08ExKWQKtN6dKtQIzROnYqJGBROW5tfzIj5Kr
	 aKdW8EzqnJTtw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E37003781F8E;
	Tue,  6 Feb 2024 11:24:50 +0000 (UTC)
Message-ID: <1d6b4a7d-4107-4880-858a-ecd565eee124@collabora.com>
Date: Tue, 6 Feb 2024 12:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/mediatek: dsi: Cleanup functions
 mtk_dsi_ps_control{_vact}()
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
 <20240131113434.241929-3-angelogioacchino.delregno@collabora.com>
 <14e124f02d82ff151974f99d042c4197e4dd5dd7.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <14e124f02d82ff151974f99d042c4197e4dd5dd7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_032454_450193_40A84523 
X-CRM114-Status: GOOD (  18.05  )
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

Il 06/02/24 10:50, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Wed, 2024-01-31 at 12:34 +0100, AngeloGioacchino Del Regno wrote:
>> Function mtk_dsi_ps_control() is a subset of
>> mtk_dsi_ps_control_vact():
>> merge the two in one mtk_dsi_ps_control() function by adding one
>> function parameter `config_vact` which, when true, writes the VACT
>> related registers.
>>
>> Reviewed-by: Fei Shao <fshao@chromium.org>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 76 +++++++++-------------------
>> --
>>   1 file changed, 23 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index 3b7392c03b4d..8414ce73ce9f 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -351,40 +351,6 @@ static void mtk_dsi_set_vm_cmd(struct mtk_dsi
>> *dsi)
>>   	mtk_dsi_mask(dsi, DSI_VM_CMD_CON, TS_VFP_EN, TS_VFP_EN);
>>   }
>>   
>> -static void mtk_dsi_ps_control_vact(struct mtk_dsi *dsi)
>> -{
>> -	struct videomode *vm = &dsi->vm;
>> -	u32 dsi_buf_bpp, ps_wc;
>> -	u32 ps_bpp_mode;
>> -
>> -	if (dsi->format == MIPI_DSI_FMT_RGB565)
>> -		dsi_buf_bpp = 2;
>> -	else
>> -		dsi_buf_bpp = 3;
>> -
>> -	ps_wc = vm->hactive * dsi_buf_bpp;
>> -	ps_bpp_mode = ps_wc;
>> -
>> -	switch (dsi->format) {
>> -	case MIPI_DSI_FMT_RGB888:
>> -		ps_bpp_mode |= PACKED_PS_24BIT_RGB888;
>> -		break;
>> -	case MIPI_DSI_FMT_RGB666:
>> -		ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
>> -		break;
>> -	case MIPI_DSI_FMT_RGB666_PACKED:
>> -		ps_bpp_mode |= LOOSELY_PS_18BIT_RGB666;
>> -		break;
>> -	case MIPI_DSI_FMT_RGB565:
>> -		ps_bpp_mode |= PACKED_PS_16BIT_RGB565;
>> -		break;
>> -	}
>> -
>> -	writel(vm->vactive, dsi->regs + DSI_VACT_NL);
>> -	writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
>> -	writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
>> -}
>> -
>>   static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>>   {
>>   	u32 tmp_reg;
>> @@ -416,36 +382,40 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi
>> *dsi)
>>   	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
>>   }
>>   
>> -static void mtk_dsi_ps_control(struct mtk_dsi *dsi)
>> +static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool
>> config_vact)
>>   {
>> -	u32 dsi_tmp_buf_bpp;
>> -	u32 tmp_reg;
>> +	struct videomode *vm = &dsi->vm;
>> +	u32 dsi_buf_bpp, ps_wc;
>> +	u32 ps_bpp_mode;
>> +
>> +	if (dsi->format == MIPI_DSI_FMT_RGB565)
>> +		dsi_buf_bpp = 2;
>> +	else
>> +		dsi_buf_bpp = 3;
>> +
>> +	ps_wc = vm->hactive * dsi_buf_bpp;
>> +	ps_bpp_mode = ps_wc;
>>   
>>   	switch (dsi->format) {
>>   	case MIPI_DSI_FMT_RGB888:
>> -		tmp_reg = PACKED_PS_24BIT_RGB888;
>> -		dsi_tmp_buf_bpp = 3;
>> +		ps_bpp_mode |= PACKED_PS_24BIT_RGB888;
>>   		break;
>>   	case MIPI_DSI_FMT_RGB666:
>> -		tmp_reg = LOOSELY_PS_18BIT_RGB666;
>> -		dsi_tmp_buf_bpp = 3;
>> +		ps_bpp_mode |= PACKED_PS_18BIT_RGB666;
>>   		break;
>>   	case MIPI_DSI_FMT_RGB666_PACKED:
>> -		tmp_reg = PACKED_PS_18BIT_RGB666;
>> -		dsi_tmp_buf_bpp = 3;
>> +		ps_bpp_mode |= LOOSELY_PS_18BIT_RGB666;
> 
> You change the original logic here. If it is a fixup, separate to a
> independent patch not hiding in a clean up patch. So we could backport
> the fixup patch.
> 

Thank you CK! Thanks to you noticing that, I've discovered that actually
besides the two functions not agreeing on the bit to set, the definitions
of those bits are actually wrong (as you can verify on datasheets for
multiple SoCs, including MT8195, MT8188, MT8186, MT8183).

v4 will fix that by adding a fixup commit to rectify the whole thing.

Cheers,
Angelo

> Regards,
> CK
> 
>>   		break;
>>   	case MIPI_DSI_FMT_RGB565:
>> -		tmp_reg = PACKED_PS_16BIT_RGB565;
>> -		dsi_tmp_buf_bpp = 2;
>> -		break;
>> -	default:
>> -		tmp_reg = PACKED_PS_24BIT_RGB888;
>> -		dsi_tmp_buf_bpp = 3;
>> +		ps_bpp_mode |= PACKED_PS_16BIT_RGB565;
>>   		break;
>>   	}
>>   
>> -	tmp_reg += dsi->vm.hactive * dsi_tmp_buf_bpp & DSI_PS_WC;
>> -	writel(tmp_reg, dsi->regs + DSI_PSCTRL);
>> +	if (config_vact) {
>> +		writel(vm->vactive, dsi->regs + DSI_VACT_NL);
>> +		writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
>> +	}
>> +	writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
>>   }
>>   
>>   static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>> @@ -521,7 +491,7 @@ static void mtk_dsi_config_vdo_timing(struct
>> mtk_dsi *dsi)
>>   	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
>>   	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
>>   
>> -	mtk_dsi_ps_control(dsi);
>> +	mtk_dsi_ps_control(dsi, false);
>>   }
>>   
>>   static void mtk_dsi_start(struct mtk_dsi *dsi)
>> @@ -666,7 +636,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>   	mtk_dsi_reset_engine(dsi);
>>   	mtk_dsi_phy_timconfig(dsi);
>>   
>> -	mtk_dsi_ps_control_vact(dsi);
>> +	mtk_dsi_ps_control(dsi, true);
>>   	mtk_dsi_set_vm_cmd(dsi);
>>   	mtk_dsi_config_vdo_timing(dsi);
>>   	mtk_dsi_set_interrupt_enable(dsi);



