Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD914C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IA358SeN/y+mfD4lLvu9/rEFQ+mhmry5G+ee0f7GCQk=; b=328YfDh+8oxMOO3OWhJFS7AqSU
	8VEekGSvnwg34MaH2cQHV9gD80HEfT3/mPAORHjA0AqSN3pKPS5lw6MeA8MXW9ELIHv9Y3V8+53M1
	5s4YyARNouANTu9Qrg+i5qpTmX/PPoJpqA9TH5LZ5WFttKTUYvKa9dKwXMpW3O/EPtWRa7EE7iRfm
	cD+oUrSv9KrdcvCxq83ThOTnwS0eKhuSjea4GSqiVd1BGilWih95Lrv+5Lp6dnY7iImgv8AIuJK15
	REieXlaczskPi6AyvcgiMVPoIzQ+lE1S+tAwaU4CixpNxxGZ742tPcMUe2ipCcY9qJqSsITZyxwLa
	HixbIvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zjj-00D4n5-1y;
	Fri, 01 Dec 2023 09:23:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zjf-00D4mN-3D;
	Fri, 01 Dec 2023 09:23:01 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 03C28660739D;
	Fri,  1 Dec 2023 09:22:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701422578;
	bh=QgTeaIFG5TKHQs9edtTeIIGI6iDgYZhlD3cjaCISnnI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LMct2acAVotYmUk4lB0+USCWpBs96wpATpyINXpvYuk+8xFxydBNdA651Kp4FNd3i
	 RIPMz4/heGSBMa0I3t/LjN4j1Q8B7Eo5LZSfZ615sdFRwRrhzDHMv4JUMokQTe5PTt
	 UGvLkbOLW+NCU0AMZLPHISGSVC/52VRWl/YMZ+jA2DXrwHXXGVwWOzsggzba2MwNRk
	 6Akt3oQGJoVIfam61b/7fW2cRfylS0fuaSRNhyQKB2+mU7ODo31OgAA+VPCk7IUtBw
	 DfTTfEZ67fCkYMQvOHq/qj2EkvIPoeJpdTgpWxpcBWG9Gx14kcOgGZbIIks7LN+NOc
	 RWamvAwk80NuA==
Message-ID: <8250291c-13ef-4072-92d6-f3d7953d6521@collabora.com>
Date: Fri, 1 Dec 2023 10:22:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/mediatek: support the DSI0 output on the MT8195
 VDOSYS0
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20231123133749.2030661-1-mwalle@kernel.org>
 <20231123133749.2030661-5-mwalle@kernel.org>
 <2d1bae2239626cb51977bf0803cec602@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2d1bae2239626cb51977bf0803cec602@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_012300_166621_1D87E384 
X-CRM114-Status: GOOD (  18.86  )
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

Il 30/11/23 13:47, Michael Walle ha scritto:
>> With the latest dynamic selection of the output component, we can now
>> support different outputs. Move current output component into the
>> dynamic routes array and add the new DSI0 output.
>>
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> ---
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c 
>> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index 2b0c35cacbc6..6fa88976376e 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -222,7 +222,11 @@ static const unsigned int mt8195_mtk_ddp_main[] = {
>>      DDP_COMPONENT_DITHER0,
>>      DDP_COMPONENT_DSC0,
>>      DDP_COMPONENT_MERGE0,
>> -    DDP_COMPONENT_DP_INTF0,
> 
> Please disregard this patch (the others are ok). There must gone something
> wrong during my testing. DDP_COMPONENT_MERGE0 won't work with
> DDP_COMPONENT_DSI0. If anyone has more insights, I'm all ears.
> 

I was *convinced* that the MERGE0 SOUT was connected to DSI0!!!

...but you're right, here, and thanks for catching that: there's no way to
get MERGE0 connected to DSI0; if you check in the datasheet for VDO_SEL_IN,
you can get data from MERGE0 only for DSI*1*, not 0.

The only way is to connect DSC_WRAP0 (DDP_COMPONENT_DSC0 in mtk_drm_drv btw)
directly to DSI0 (or dither to dsi0)... unless there is a way to change the
pinmux to invert the pins for DSI0/1?

You could assign the DSI1 controller to the one that is currently DSI0 for you.

That would solve the issue here.

Cheers!
Angelo

> -michael
> 
>> +};
>> +
>> +static const struct mtk_drm_route mt8195_mtk_ddp_main_routes[] = {
>> +    { 0, DDP_COMPONENT_DP_INTF0 },
>> +    { 0, DDP_COMPONENT_DSI0 },
>>  };
>>
>>  static const unsigned int mt8195_mtk_ddp_ext[] = {
>> @@ -308,6 +312,8 @@ static const struct mtk_mmsys_driver_data 
>> mt8192_mmsys_driver_data = {
>>  static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
>>      .main_path = mt8195_mtk_ddp_main,
>>      .main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
>> +    .conn_routes = mt8195_mtk_ddp_main_routes,
>> +    .num_conn_routes = ARRAY_SIZE(mt8195_mtk_ddp_main_routes),
>>      .mmsys_dev_num = 2,
>>  };



