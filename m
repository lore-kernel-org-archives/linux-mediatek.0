Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED1EC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 13:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymkyVKjeFrFLK93XbG22dBtel6MzQwHHXyV4I9yUy9I=; b=R6N2/lkAPdx14w
	F4xrXqWR868LdwVcpkZoXhfn6DtWru75f16+2Lsmkj3nOT/+iXqjInKtq0qSUVypbglVs9c8L+r4o
	mWtJj/moNuoM1Z5VsoR5I6XMxNibFM0/08UC0n99hHeHwXKjfYW1SwyqeF3NqpA5l7Nrnxjw6k+uE
	4Grb+E+QapHOcY7+QJYP8YlPLpqJbkhIuZODgF9bs68If9at1S9Zl5k1FHsTGfDK1vvsqmkyvnSPg
	WQ7yU2JuvaTCHWslHlsAaAdQJzNBqVyMjPZMtnJEnEYSHtpsjmsUvN76T8o9d6EBBehCo85q+yj5r
	ducUWh2OgYzdc7YZaMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozdtE-001jSn-0k; Mon, 28 Nov 2022 13:09:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozdt1-001jOC-FQ; Mon, 28 Nov 2022 13:09:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E05356602ACE;
	Mon, 28 Nov 2022 13:09:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669640963;
	bh=FPyZV6RIJ+6XhwGHAlNI0+xn9UwsKBELcdRphFPnF0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=krvXfWFIVV/qMkl1uJRhGRSj9gIziOsXwnVQIxomNj4b4hZRCw2/HtJ33e5tNTtid
	 yS/MpBXJeF/b0BGFy7ZtBh+gFHTkpPzWO97Vy6MIugB/EI1aMQMSt9LZfsY64iSfe2
	 IlLquBVaaTPaSjquRWMAPAexahUkZnCA38FlPjWQd421ib8UI3PXEWXJ4NCPOUa3LX
	 sid92kofo4ymKMS5wJw+Kllh8EU5Gi6Ma9lvc5OlVpF2lybZIyIRL3ORXUUgvEO5z9
	 qPxvJSE1bKXkVrjNeb5jsgUxkyqezAUyGUcTVVw1dfR5TKLdqNJWvn9Z6IIIzsaoUp
	 7a5jCo6f4E7IQ==
Message-ID: <01315373-4c02-539b-9586-d764053bd8ba@collabora.com>
Date: Mon, 28 Nov 2022 14:09:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] drm/mediatek: Clean dangling pointer on bind error
 path
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20221122143949.3493104-1-nfraprado@collabora.com>
 <a67594cf-eb7f-873f-1c11-ccb4317b6bdf@collabora.com>
 <20221125163413.jwutjr5uxey6b32o@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221125163413.jwutjr5uxey6b32o@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_050927_751213_09D7DAC5 
X-CRM114-Status: GOOD (  22.85  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, kernel@collabora.com, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 25/11/22 17:34, Nícolas F. R. A. Prado ha scritto:
> On Wed, Nov 23, 2022 at 10:15:25AM +0100, AngeloGioacchino Del Regno wrote:
>> Il 22/11/22 15:39, Nícolas F. R. A. Prado ha scritto:
>>> mtk_drm_bind() can fail, in which case drm_dev_put() is called,
>>> destroying the drm_device object. However a pointer to it was still
>>> being held in the private object, and that pointer would be passed along
>>> to DRM in mtk_drm_sys_prepare() if a suspend were triggered at that
>>> point, resulting in a panic. Clean the pointer when destroying the
>>> object in the error path to prevent this from happening.
>>>
>>> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>
>>> ---
>>>
>>> Changes in v2:
>>> - Added Fixes tag
>>>
>>>    drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> index 39a42dc8fb85..a21ff1b3258c 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> @@ -514,6 +514,7 @@ static int mtk_drm_bind(struct device *dev)
>>>    err_deinit:
>>>    	mtk_drm_kms_deinit(drm);
>>>    err_free:
>>> +	private->drm = NULL;
>>
>> Sorry for not noticing that in v1, but I've rechecked this function and, while this
>> commit does indeed actually solve the described issue, I think it's incomplete.
>>
>> A few lines before, we have a loop that sets
>>
>> 		private->all_drm_private[i]->drm = drm;
> 
> Actually that line only exists with [1] applied, but that commit hasn't been
> merged as of yet. I debated whether it would be better to send this fix as is,
> or ask Nancy Lin to add the tweaked fix you mention below to that series, but
> sending this fix as is seemed better since it can be backported to older kernel
> versions.
> 
> So assuming this commit gets merged first, Nancy should make that tweak you
> mentioned below to ensure all the pointers are zeroed out, which is why I've
> added Nancy to CC. (As a side note, given that only the mmsys with drm_master =
> true would ever call the drm suspend helper, even this patch as is is enough to
> avoid the panic even with that series applied, still we should zero out all
> pointers for good measure)
> 
> [1] https://lore.kernel.org/linux-mediatek/20221107072413.16178-6-nancy.lin@mediatek.com/
> 

Sorry about that, you're right - the proposed fix is for the commit you
linked, I got confused somehow.

This means that you get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!

