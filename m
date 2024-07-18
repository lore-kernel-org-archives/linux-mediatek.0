Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0877C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 11:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miJwAjA6Fpd9mGPGq03Hx/bfkwEONVwHGp+8+RWpmJM=; b=teoNxyuzZ/gu6R7p+xU3O3epkh
	oEVKwzgLWslIDNj0wk4KnU/NdbYybHkO89x7vXL40Y8tFHLnoQWijX8kjoGspG67dUmfhy57gxe4N
	0fI8Jz6FIxOb6cBnum1aa3Fpg/hoGTvP+Cx+PfAIozKzMoLOW72ZJvqkseiqy4Bhylov2vdo2u678
	QFmczb3mrfgejOGU8E/Q901fVKqk1889cprbr4/xBFDwQgP9hmQyOdI6be4a43k5Gsi1Jar0KnJHB
	IE5+GHRBQ7a5i3XHD54de4IUPPMrIEs65ukGW5+URSNuax1KxY8yZPQFBeujWUweDpcd3zV8IMNew
	LiUNsrjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUPAy-0000000GohL-0f7x;
	Thu, 18 Jul 2024 11:19:56 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUPAY-0000000GoXN-3rm4;
	Thu, 18 Jul 2024 11:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721301568;
	bh=OxM4UDPZ+xv+v3W6VDLH7BcPrLByvTYnPHEmdhBrqY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GGTbJ5z08cXirsinf/f56Fc3980CBrTiZ09zsAyEtdYjXxMON4akBrnrnOY6/XlGt
	 zgICRk+ItXVxSaP0AUX1S5/vYFV+1yrSE4JB5tKvjog3cRCPP0N6+CJVQjs0g5CAL0
	 ZcWhKe2DhXRkQBW/E9TYxPH0i+RaKjyjoscoHDbr3AbsiSblD7Kj9CF9pQBkXZTIkN
	 xx9DNyXFqZbaH+htn1glXXbyqYRJGXPw+icEQuIzwFEyVycVkOrUlOlTyUZHxV4hwv
	 kDPv1ftsAIqHYqwTVyqPf1x2UUZzAqnsKFLG6DjYJ8acaOB6RFGu9NL2zbRt6ZOdHZ
	 S9TFJh0CTEExA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 55328378202D;
	Thu, 18 Jul 2024 11:19:27 +0000 (UTC)
Message-ID: <f06ea90a-7f42-453d-8dfe-84dd4038b8af@collabora.com>
Date: Thu, 18 Jul 2024 13:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Declare Z Position for all planes
To: Daniel Stone <daniel@fooishbar.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, shawn.sung@mediatek.com,
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
 <CAPj87rM1dbawwtRnMzDRLLCt6FuOU+851hcJhKDsg1ioRM2Pqw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAPj87rM1dbawwtRnMzDRLLCt6FuOU+851hcJhKDsg1ioRM2Pqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_041931_126706_B79C1D43 
X-CRM114-Status: GOOD (  18.31  )
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

Il 18/07/24 13:15, Daniel Stone ha scritto:
> Hi,
> 
> On Thu, 18 Jul 2024 at 09:25, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> MediaTek SoCs support multiple planes, one of which is the primary
>> and all the others are overlays (and CURSOR is the last overlay).
>>
>> In all currently supported SoCs, the Z order of the overlays can't
>> be changed with any fast muxing action, and can only be changed by
>> swapping the contents of the entire register set of one overlay
>> with the other to internally reorder the layer properties, which
>> is indeed feasible, but probably more expensive than desired.
>>
>> Declare the Z position for all planes with an immutable property
>> at least for now, so that the userspace can take its decisions
>> accordingly.
> 
> Thanks a lot for this fix!
> 
> If I understand your middle paragraph correctly, please don't ever do
> that though. I think what you're suggesting by 'swapping the contents
> of the entire register set' is:
> * plane ID 40 (normally) controls OVL1
> * plane ID 41 controls OVL2
> * userspace configures planes 40 & 41 with a zpos suggesting that 41
> should be below 40
> * the DRM driver 'swaps the contents of the entire register set' by
> making plane 40 control OVL2 instead and plane 41 control OVL1 instead

Yeah, that's exactly what I mean.

> 
> If so - please no. Just declare an immutable zpos, because that
> actually matches the hardware, and then leave userspace to configure
> the planes in a way which makes sense. 

I had a hunch... and that's a perfect confirmation - thank you!

> Looking at the zpos property is
> already required in order to handle overlapping overlay planes, and
> any userspace which supports overlays (including Weston) already looks
> at zpos, handles immutable properties, and will dtrt.
> 
> Anyway, this is:
> Acked-by: Daniel Stone <daniels@collabora.com>

Thumbs up! :-)

Cheers!

> 
> Cheers,
> Daniel




