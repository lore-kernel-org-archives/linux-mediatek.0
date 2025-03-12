Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF14C28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 03:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHfa1zc5Igb0InogBSav8gYVwACK6PddmeTIVV5s/4I=; b=WZvyf2yvee2mM/9/BwDTmINAh9
	yqEVi+TbvvnwNbBjAxWl7BBCPRqo7H2OtuC11xI/jxfGJJamFmy4Mf3ZNCmkkoDBvuYSGYizMTEbi
	zxkA4FDZJGdN7FhUuAaVbQJI8DbWYOuSE49ZIoxteJPF75DqcJPgEsTYwPUtS5h32ysk/OxoeZ8W7
	F7lZ/QzKZEiXNt3dTPH1d76HmK+Drt7k4hlVSYY2U9+tphgfr5R76GUFGmRw5kSLqfSw3ZOH8gggO
	xRdPKs8+Y7gL4iUzYWC7a0TQOjSMsSYiZfEi+pcodTu8qQN4D8iLAQ+KfX++WRPrjNFg4Yt8uPJKv
	Fg06J9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsCuP-00000007QEQ-3lhz;
	Wed, 12 Mar 2025 03:37:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsCuN-00000007QE5-00zk
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 03:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741750644;
	bh=1mGu0yDyCQ458Tka2SSzI5rlIO/cPFfmP81Z1D30n1k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YPP9L9ejtf7YDWgjKiS+/Bb5OnS3GFJWvU+Ibf7DoWH51u5Kl3EvGQ6FxWmPOF1RT
	 GMz2QShVAKk0mUn1om8LX+qSd9UPeR76mrhhKJscW65mnVOprDMrOY3cHxqfK745xg
	 748aoaz3qjcsnqW6HaPcLL9sD4QWXS3gELJGQe5J5c8HVUGoxTfQihmv6X5tPohi4e
	 r1D77J3XfxP6GNgBjv2Fe0o2esAbaRborc19jcPjWf1iwFdp02ixCZlQOsqLelUaUy
	 hN/reqa0L9TkaYDmLQC/SI/7t820emZqmHYKLulypLvM3EBAxWPr0v3AsP3a7NCZMz
	 rLa6UWBI688Aw==
Received: from [192.168.50.250] (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0912417E017D;
	Wed, 12 Mar 2025 04:37:22 +0100 (CET)
Message-ID: <e492a080-78e1-4694-9e84-a5373f3f23c7@collabora.com>
Date: Wed, 12 Mar 2025 09:07:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: defconfig: mediatek: enable PHY drivers
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 daniels@collabora.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250311061703.16850-1-vignesh.raman@collabora.com>
 <dc659e19-c1ae-42d8-84c9-0d2aafa81fe2@kernel.org>
 <daa0733c-14e3-44df-8374-33aba6662813@collabora.com>
 <717b84da-f307-41e9-9dc3-67ea653cac5f@notapiano>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <717b84da-f307-41e9-9dc3-67ea653cac5f@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_203727_197368_EAD01966 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

Hi Nícolas,

On 12/03/25 01:15, Nícolas F. R. A. Prado wrote:
> On Tue, Mar 11, 2025 at 05:26:37PM +0530, Vignesh Raman wrote:
>> Hi Krzysztof,
>>
>> On 11/03/25 12:54, Krzysztof Kozlowski wrote:
>>> On 11/03/2025 07:16, Vignesh Raman wrote:
>>>> The mediatek display driver fails to probe on mt8173 and mt8183 in
>>>> v6.14-rc4, with the following errors:
>>>
>>> Which boards?
>>
>> These are the boards,
>> https://lava.pages.collabora.com/docs/boards/chromebooks/boards/hana/
>> https://lava.pages.collabora.com/docs/boards/chromebooks/boards/jacuzzi/
> 
> You can use the Devicetree name to identify them in a way that's meaningful for
> the kernel:
> 
> mt8173-elm-hana
> mt8183-kukui-jacuzzi-juniper-sku16

Thanks. Will use the device tree name.

Regards,
Vignesh

> 
> Thanks,
> Nícolas


