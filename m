Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDDDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mB4ZKosQSQnZ3Oe69MyP6vM6GThtVb2uPmFa9i/284=; b=Uka3M7SgJnTOV8
	GKIi9iDQaisg8shAxCFDSTwjZiSYhXdtdIstUOPdAWXgJUxa4AyDKH8oDXkvnpHRKHmTUrHBz7ixs
	N6vBHdw7USHNLPKAG83cqnhXYQwDIFHB7Jbuu+LRh7A+c3zWcfh/DLbWtXfBMWZYXZAKlZnbNQ2vS
	vO3e2EIIAO4/o1HhLt+7cPK76ydmNilIhGFqw0V1d68TAZ2nWzhNTdAqIMMCzBX++7UwHInkceyKa
	nhYoDmdDd53QyAOgNgkjRJeLY+JxQG9KWPsr3DlrprfFLjc1dQkM56nlfXgLlrYm55MPF7FSZFJxM
	mGZuRW/jDJcuXHv7+zzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrFv3-000zLb-CY; Wed, 18 May 2022 09:24:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrFus-000zGa-57; Wed, 18 May 2022 09:24:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C7FA11F422B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652865864;
 bh=1M8epVbbhrfB5k/OezZImU9QLYUkLMpwpTMw3zQrCrU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O5+PqTxz/Us7pmb2QEwNAgTmsE8DICn3Cyx1r3kVPknydLuln1vHIiuFVlriMchZv
 SgA3HnMXkFxPXQGgR2P8D+Z9cyw7nGGVw7GdHxbBQapAjqJTyeDQN0fJE90yDOTnQc
 Bx9G08IYG2xlxYAUIbc2/skaG1SpFCP97KOOdoncXf58acKHglWFqjIvB38efhklGA
 Ha4qjHCXtKuxjiHMb/IsLr5rYJ17kPlUz024EcKXzTNw4qN/z3uVa261OZwBZ7bZah
 9x7xGeR3od5os0By7OZc8jn9KyuzW5d1uJxp3HcNjF+c+hchYg6NqI9Ncg6nkeB3Tl
 ATsAtZ8T+t80Q==
Message-ID: <5100b851-6787-fed8-a40f-7e6e64a123d8@collabora.com>
Date: Wed, 18 May 2022 11:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/6] dt-bindings: arm: mt8186: Set #clock-cells as
 required property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sboyd@kernel.org, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
 <20220517101514.21639-3-angelogioacchino.delregno@collabora.com>
 <1cec6a09-9d80-99e7-ccc4-c918c6be7dbb@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1cec6a09-9d80-99e7-ccc4-c918c6be7dbb@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_022426_373292_1507EFF1 
X-CRM114-Status: GOOD (  12.00  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/05/22 16:34, Krzysztof Kozlowski ha scritto:
> On 17/05/2022 12:15, AngeloGioacchino Del Regno wrote:
>> This is a clock-controller binding, so it needs #clock-cells, or
>> it would be of no use: add that to the list of required properties.
>>
>> Fixes: f113a51aa2cf ("dt-bindings: ARM: MediaTek: Add new document bindings of MT8186 clock")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml  | 1 +
> 
> If these are clock controllers and new bindings, why they were added to
> "arm" directory? arm is only for top-level stuff, not for devices.
> 
> In the future please put your bindings in respective subsystem matching
> the hardware. Fallback is soc directory, not arm.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Hello Krzysztof,

I agree with you about these bindings belonging to the clock directory.
Should I add a patch to this series that moves all of the mtxxxx-clock
and mtxxxx-sys-clock yaml files to the clock directory?

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
