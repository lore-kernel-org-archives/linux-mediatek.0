Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38613CA101F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v//ZO7Fl0VrsoZ+fuIdX0v+wUwZ+SZn6ZSwxJ5M8XCo=; b=QXLwK15K3haPzx
	+WW0+1msZaoNz57KQNgjGn+IQzLPqCKRL1RJsZ6GLM4RMk3E0QGwdDOmdsPlCDZYFvYFystfYrCSm
	oi2sM0DeRFTRoarxkmRzCG1UTeQACqJzVgLgGeEqfOPCpKRyU112+fRSFB/6zK4oLbpLwZi7DJ5uK
	72EM29mhHRQv1SW9mhy+SEf9V/Eu/p3HMNadpLbe1ux1rFWiNwfxW5o7OGH8Ti0ARsNT7wwZgNbWk
	xn2dD0bS/CltTmtdv7J7xeF0cmZMkq5kQjJR8T0NEHQi8r9nLS+qpDSPQwerHxhPZDp76U2eeQm98
	6krn9FbG9KDtXkmTAQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzeD-000000086gt-1qpi;
	Fri, 12 Sep 2025 09:00:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzeA-000000086ei-3s7d;
	Fri, 12 Sep 2025 09:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757667644;
	bh=I8lnMndXG8pdCIl26nEFltqvWn8FNn3OcwqWnXiwNbY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=e3NUhl7PV7etZf6rkduBXP9LFytOiLRWRVHpQQi34pLQH2vmBc4DiFZqBhkEoahk+
	 5lqCt82nU8wxCLKpQoITHdJ8Z0JsAUN8gOiCPGkt/3l4KRabrWgd5GMXOYQR7MNjEN
	 w8GljBH0yMYh7X4ylpEAJ7M3LR9VBwXXRQIkre1CLWp79yxx662xYoLeF+NA97Tx9n
	 BwwzxDPf26QjC+A4fKFR3wlu0CKWesFtQY6iOeUPiM6YJbLuMgtk36+zTtoNy9JK3J
	 z2oi2V/9DNedgWdar2swblhT1SWvuu35nFikjvuz8hxt/bUi712fqQesF/nE5n4J3I
	 4es+30UGJcTSA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43F6A17E07EE;
	Fri, 12 Sep 2025 11:00:42 +0200 (CEST)
Message-ID: <56380fe5-8358-4341-9478-ba4ce52daeed@collabora.com>
Date: Fri, 12 Sep 2025 11:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/38] dt-bindings: media: mediatek,mt8195-jpeg: Allow
 range number in node address
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-15-angelogioacchino.delregno@collabora.com>
 <70ae6787-ee0b-43a0-851e-1fb6c82f6c31@kernel.org>
 <72934f23-08eb-4214-a946-7aa7a432352e@collabora.com>
Content-Language: en-US
In-Reply-To: <72934f23-08eb-4214-a946-7aa7a432352e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_020047_150913_F825148A 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 04/08/25 11:02, AngeloGioacchino Del Regno ha scritto:
> Il 24/07/25 11:14, Krzysztof Kozlowski ha scritto:
>> On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
>>> The dual and triple core jpeg encoder and decoder (respectively)
>>> on MT8195 are far apart: the only way to have this to make sense
>>> is to split those in multiple address ranges in device trees as
>>> one big range would overlap with other IP in at least the MT8195
>>> SoC.
>>>
>>> Change both the jpegdec and jpegenc bindings to allow specifying
>>> children nodes such as "jpegdec@0,10000", "jpegdec@1,0" or for
>>> encoder "jpegenc@0,0", "jpegenc@1,0" to resolve dtbs_check issues.
>>
>>
>> This should not be needed for standard MMIO/simple-bus nodes. I think
>> DTS is wrong here.
>>
>> Which cases really need the ','?
>>
> 
> All of the multi-core JPEG enc/decoders on MT8195 (and newer).
> 
> The DT changes are included in the same series as this commit; check:
> 
> 20250724083914.61351-35-angelogioacchino.delregno@collabora.com
> 
> Cheers,
> Angelo
> 

Any further comments on this?

Regards,
Angelo

