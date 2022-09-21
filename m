Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB608ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrVVWJUvo5L+WrPdS4JJpK9GMYyaBzTIrbyryEcBGP8=; b=DGVqHSEneXjYLiQ1p5aYOY5JVD
	+JGqieDYccubHRhsik2dyDIJYrwvpxmvGNZ0tJTCo9692OvriWl7L7PAEIVNSQFx7ATnMpZa/w+yu
	0DH0Baba+w5h9w3oW6+qex74m1CyJ8IBR+gevKdF2p+peIqgLu4e+sn88KJKoImjoQSWPQaSCn/2u
	j8/YPcHKvsT+ZIXU0gUg1nS0E8qt1LGV/2xGHSRKzFPnk7M5GlNK7pkT2KY6Xh/Yv+ExN+YJEzHGb
	cOVSJ2IOVrk0dIQJsEYqmIZdzLM+Exm2DSzYvrb9k96JxiSVtFkxuU5KVAqHonYZ6Iafk95eQSQ1D
	L1f9x6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawLq-00AbNo-C4; Wed, 21 Sep 2022 09:49:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawIc-00AYLS-Jc; Wed, 21 Sep 2022 09:45:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C7FAC660202C;
	Wed, 21 Sep 2022 10:45:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663753544;
	bh=9ji1SJvfdXYebHWHKsGj8bj+sMSEq74pzAp6Nbn4WWM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CQ13WHYIS9frO3QW4TLXbP+zllrNOekCNYslUt32DxeL8LgiWbziNNxXOHW40TnBO
	 XQ8sMohQ/jRnrtvh234ZD1fLlLA+2pQ/3LI+46OCU4017X0ZpySHtGur4hjvy8+8Vk
	 SUJbnwzxy4+xYsuMbFm6Z2nktJsxF3/RM2/0Qhzee7rGywwOeTlLDdPapCez7P0K8s
	 cik6AH29MKZTU8r/gXBYI1/a+14po/EwWVQDGdIWR1Mh3EBODL19MxJz9YNZlF9Hvb
	 PyTpUr4CaziU6zYnWI4ErS5dsPYzyWhwRMQ6gMmaGH7dW5Vra8kpWAoIJPlZGhd4xG
	 JIz+KykszkSsw==
Message-ID: <0c2ef56e-5dab-fb79-fead-adb4acef4cc6@collabora.com>
Date: Wed, 21 Sep 2022 11:45:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: Combine MediaTek MT67xx pinctrl
 binding docs
To: yassine.oudjana@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220919170115.94873-1-y.oudjana@protonmail.com>
 <20220919170115.94873-2-y.oudjana@protonmail.com>
 <4c425cf8-f9ca-969c-f8ed-688410bfb922@collabora.com>
 <1860b0ff-5544-5e74-ccfc-beda18824927@linaro.org>
 <YQZJIR.QQOJU0071T1J1@gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YQZJIR.QQOJU0071T1J1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_024546_813615_FF1C08CB 
X-CRM114-Status: GOOD (  21.69  )
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

Il 21/09/22 11:30, yassine.oudjana@gmail.com ha scritto:
> 
> 
> On Wed, Sep 21 2022 at 09:11:12 AM +0200, Krzysztof Kozlowski 
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 20/09/2022 10:06, AngeloGioacchino Del Regno wrote:
>>>  Il 19/09/22 19:01, Yassine Oudjana ha scritto:
>>>>  From: Yassine Oudjana <y.oudjana@protonmail.com>
>>>>
>>>>  Documents for MT6779, MT6795 and MT6797 that currently exist share
>>>>  most properties, and each one has slightly differently worded
>>>>  descriptions for those properties. Combine all three documents into
>>>>  one common document for all MT67xx SoC pin controllers, picking a few
>>>>  parts from each and accounting for differences such as items in reg
>>>>  and reg-names properties. Also document the MT6765 pin controller
>>>>  which currently has a driver but no DT binding documentation. It should
>>>>  be possible to also include bindings for MT8183 and MT8188, but these
>>>>  have some additional properties that might complicate things a bit,
>>>>  so they are left alone for now.
>>>>
>>>>  Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>>  ---
>>>>    .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 207 ------------------
>>>>    .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 176 ---------------
>>>>    ...6795.yaml => mediatek,mt67xx-pinctrl.yaml} | 181 +++++++++++----
>>>
>>>  Hello Yassine,
>>>  nice cleanup over here!
>>>
>>>  There's a catch though: as far as I know, wildcards are not permitted... so you
>>>  should, at this point, merge all of these in mediatek,mt6779-pinctrl.yaml instead.
>>>
>>>  Before jumping to that, though... Krzysztof, can you please confirm (or deny)?
>>
>> Wildcards are not allowed in compatibles. In filename wildcards or
>> family name could work if they are really going to match the devices. I
>> have doubts here. 67xx is quite a lot of different devices, so I am not
>> sure this will cover them all.
>>
>> I would prefer one name (oldest SoC or lowest number).
> 
> Lowest number (and probably oldest too but not sure since mediatek naming 
> conventions are a bit weird) currently documented is mt6779, but mt6765 gets 
> documented in this patch and mt6735 (this one I know for sure is older than the 
> rest) in a following patch, so do I just stick with mt6779 or do I change it in the 
> following patches documenting mt6765 and mt6735?
> 

I see the sequence as:

1. You merge mediatek,mt6797-pinctrl.yaml into mediatek,mt6779-pinctrl.yaml; then
2. Adding MT6765 documentation to mediatek,mt6779-pinctrl.yaml; then
3. Adding support for MT6735, documentation goes again to 6779-pinctrl.

This means that you're working with mediatek,mt6779-pinctrl.yaml :-)

P.S.: That was also a suggestion about how to split things per-commit!

Cheers,
Angelo

> Thanks,
> Yassine
> 
>>
>> Best regards,
>> Krzysztof
> 
> 


