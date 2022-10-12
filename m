Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519E2C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdmzbBlQTD2oHVxg3pZCibywtUisbVjpQLXyuN+hiBw=; b=p3OR03K/IIwWjTxd4jqGzn/x5r
	BWSZneDo1NqET9wAwUP0BUqeReKSKYz9jSFVAhSnqlWth0BkoVWC3j9vhx6H0YiDRQT6TWmsW6YgI
	pqJfl3dceuODoAMjk8tETErogBle+cnYV1TMh3UKnWYALhNgo9Tua7alP2lwTbJPRtQvNW6eftKbS
	Wgyo/DvzShtCL/q9wPTC+YCgm/ZUS3t9QIPTzNsyNrw1cCfWVqyF/KElEJjstt5JUGwaAuZQFBtdx
	vyISXHIzsmyAFCsnHT8X3eCAWrPqfOcuKXVmlGV6ZSZD0YSU1Tcw6+w6ROy/5v5AmxhPQKBKjRGA1
	SzbF5ceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidUb-008VXq-92; Wed, 12 Oct 2022 15:17:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidSy-008Ueu-LT
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 15:16:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 43225660037C;
	Wed, 12 Oct 2022 16:16:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665587771;
	bh=3+fGB/65ejU9q7GUMaC7sKOP/HgDUmBA+dw0IyewzE8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SoIIVHoaco8/OyxxveuNgb9Lhyv/OXfpquRyrU9psOC7prSoAY3gUmq9UzEAu55n1
	 j2HTt7VI3X+uxfm046LpPTIOxOzDVZBN+zhUD87pM0+uLwy6G6SKl/k5KHt6UcM+vP
	 VFJ3Qr63T39gi+onlgO6E2sY9KLAaiGpH09Y1UFeTelbiukOw7uIi1bHoF+xLTv7l5
	 T/NLbNYiPo9GitAyk2p7bA4GXu7QFQlDC9hJm7hwa+SyBjUob2kxmk4nVIfpLU9V+y
	 zS7G6VQ37QRY3jf+mQpi4lNXh7xY7K003R/IDN+gK6JIcwlxzObILR2BWdqT6e0tjz
	 MYXV/Tphx/FuQ==
Message-ID: <163306ba-09a1-3b27-0c0d-5bafc871f7dc@collabora.com>
Date: Wed, 12 Oct 2022 17:16:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RESEND PATCH v2] drm/mediatek: Add AFBC support to Mediatek DRM
 driver
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, matthias.bgg@gmail.com, wenst@chromium.org,
 justin.yeh@mediatek.com, daniel@ffwll.ch
References: <20221010150157.1864492-1-greenjustin@google.com>
 <664e32dc-3f91-48ae-64a1-6dcecc9dfb5b@collabora.com>
 <CAHC42Rf7o61NF3LNQkm4BFcBHMKEP2np3sZMvM7KYczCsurHKA@mail.gmail.com>
 <6548c0ea-d1c0-2de2-99b6-4cfc27e8b938@collabora.com>
 <CAHC42RfKROmaPTkf73eCuU7CV3YhhxyCVEp9UA94XNjMfSzLAQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAHC42RfKROmaPTkf73eCuU7CV3YhhxyCVEp9UA94XNjMfSzLAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_081617_211503_A6240FF7 
X-CRM114-Status: GOOD (  15.15  )
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

Il 12/10/22 16:12, Justin Green ha scritto:
>> These would be different from the macros that are available in bitfield.h, but
>> not *fundamentally* different, so these would look a little redundant...
>>
>> I think that you refer to that `pitch` variable that's coming from the DRM(/fb)
>> API... and bitfield macros are for register access... so I guess that one clean
>> way of avoiding the magic shifting (that is purely used to split the 32-bits
>> number in two 16-bits 'chunks') would be to perhaps use a union, so that you
>> will have something like u.pitch_lsb, u.pitch_msb (with lsb/msb being two u16).
> 
> Do you mean something like this?
> 
> union pitch_val {
>       struct split_pitch_val {
>            uint16_t lsb;
>            uint16_t msb;
>       } split;
>       uint32_t val;
> };
> 
> I think my concern with that approach would be it assumes the compiler
> packs structs tightly and it also assumes the endianness of the
> machine, whereas a bitshift is maybe more portable. Is this an issue
> worth considering since we know this driver will only run on specific
> MTK SoCs?

Yes I mean something like that (except, use u16, u32 short form)... and that
should be safe really. As for the endianness, a lot more would break already,
so I don't see that as a concern right now.

