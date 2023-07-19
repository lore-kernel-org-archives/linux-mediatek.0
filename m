Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F8DC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXkxy20uXERWJYdjD3wkJWCfT0WllVz17RrGfbMpGlw=; b=W5z7YBmc6Wn6Teh7YYsQNIV5Rz
	XaH9gfFGtJulerHnkpIMvyFRyhxCd1kzumBuI0kuTkwBLtoi4kegWu0b7iNxgR324VaxaX8OzE3Oi
	Mfesx/bobqrYwGv1aAhusUbsBh0ZZzCjp9s4wmioc2MXLn/IAyy21ihspRGRDTLgU+PHCDoesTQ60
	swakkrEBIRT9CjhgVm/7GdOevCrQawD+j5Cj0vJbCiXPd/upZLviobH0o6c1UC/IyFUe4DKC+cv8Z
	mpn1Tk/KStXfEka77f4rQmQyaILf1zIuq4G+0m0Ymlp2ghsh9EDUluUMLzutaq61bSSA1cbxjBwGJ
	uwZvTnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1oX-0067PS-0T;
	Wed, 19 Jul 2023 07:41:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1oT-0067OD-0H;
	Wed, 19 Jul 2023 07:41:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 192E8660704A;
	Wed, 19 Jul 2023 08:41:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689752491;
	bh=uZqnrEnBk5Se4RejQnYLycu1F8p+fOOtdn+tXfzQsxw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ub5kiqFAv2Hv41uw6NuoUWUVEErCHDCarMo4w2yE1D3ZM4QDY7CLpF71o90PzLbjB
	 XDEF2/WLdcem/xIIcmvXCYWBmc7mRArz3ZvkzY0ugbTqzy1srXzo7KJwIatAaJhWQ5
	 XUcBlkG6EejAai4BgT2Cd376Iheyi5H2Y3fUnJt6dcCqUnzFwYZmyTpo3ZIUM6hmw0
	 GCi2gtKAbRtkVJbGVxRmIuWpzze0pR7FskPTBQKyGQmqJNEMfLgCyM6PtalytgYBEe
	 +jfJzaQktIYhbyVMFFLNlkEXeQQ4N5EOQkYCvzL/YeTY8BLk1EDLfOk98wtIr/P63c
	 tGETluUrU+oCA==
Message-ID: <d5c9f1c8-6c05-7679-777a-aa6cec01a3f6@collabora.com>
Date: Wed, 19 Jul 2023 09:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] MediaTek DRM: Clean up CMDQ support and ifdefs
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, wenst@chromium.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230623094931.117918-1-angelogioacchino.delregno@collabora.com>
 <6c71deca-112e-2ef6-9098-902bc4b92324@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6c71deca-112e-2ef6-9098-902bc4b92324@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_004133_250188_70BB4210 
X-CRM114-Status: GOOD (  14.49  )
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

Il 23/06/23 14:49, Alexandre Mergnat ha scritto:
> 
> 
> On 23/06/2023 11:49, AngeloGioacchino Del Regno wrote:
>> This series changes MediaTek CMDQ support to use the mtk-cmdq-helper
>> functions, removing duplicated cmdq setup code in mtk-drm and also
>> removing all instances of `#if IS_REACHABLE(CONFIG_MTK_CMDQ)` while
>> keeping compatibility with both CONFIG_MTK_CMDQ=n and =m/=y.
>>
>> This applies on top of [1] and [2].
>>
>> [1]:https://lore.kernel.org/lkml/20230524093412.92211-1-angelogioacchino.delregno@collabora.com
>> [2]:https://lore.kernel.org/lkml/20230608084727.74403-1-angelogioacchino.delregno@collabora.com
> 
> Hi Angelo,
> 
> Can you provide a public branch to test it please ?
> I tried to apply the dependencies but still have an issue with the 3rd one:
> 
> https://lore.kernel.org/lkml/20230523104234.7849-1-angelogioacchino.delregno@collabora.com
> OK
> 
> https://lore.kernel.org/lkml/20230524093412.92211-1-angelogioacchino.delregno@collabora.com
> OK
> 
> https://lore.kernel.org/lkml/20230608084727.74403-1-angelogioacchino.delregno@collabora.com
> KO
> 
> Thanks
> 

Sorry for the very late reply; I've somehow lost this email in the haystack...

There you go:
https://gitlab.collabora.com/google/chromeos-kernel/-/commits/for-kernelci/

Cheers,
Angelo

