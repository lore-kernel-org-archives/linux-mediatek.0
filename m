Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39213C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAkHvdDz3FSB4v7em3fag3FM3AqwwGf91sw4m5Zp+Eo=; b=KAi4yrm5ED0w2GPCt+VtW4uxjy
	iqorrRqjL2RTGVS3q/RXoe/OKQ1fqBiBDIr/R6tQ/2XFvy0qN5pEwBHaKlluSoKT3yLnwK9P+vCkB
	sari9XGrn1+ZviKiSHlreRt0nng4CAB6Wl3zhidvIlqrMaJ9aB5kjx/B1T0whmTKixyRuGkd3AhqH
	ZhDbhi4U0ie4Ye7Xd59HT2aI/wjMmovMaXXzsv4beW35x6Nw5Ddgf5qn26g15P2263ucXrFziOKtV
	oaDdICEFAVg0X7JNyquMGRKU1F88+QxCr4nHDftddxmDbGe/DdX45Lq4AKD6j17PcAUlYavz8Eq8s
	I3ugtlZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ33w-000jNN-Bi; Thu, 09 Feb 2023 09:17:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ33h-000jE1-1L; Thu, 09 Feb 2023 09:17:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EB13C66020BC;
	Thu,  9 Feb 2023 09:17:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675934255;
	bh=SmEEed0/w9t+DOmwxx6nn0/cBAy3WOhaxgIaTq2QUGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RjRMLHa9DQyYjgEJTdj9y2UKpNYXrDxiwe0Nsdyqun3ERbtc+aEJkgAQrPsm/oiuq
	 ff+COemd4QoHbUOzOdB2T4GWEkBs5at3KockNuCnyG7qYWjJXHtvSbmJeFarwfexau
	 RL1xhgtKz7si1kw1MXiX2sUkxsm8OgnDzSVvSFNwKWHUwmFhCvQWVU3rpLOqfu1rR2
	 3wiN5CNeKT5UmsRGM1akdWK6Cp3FzG1pb1wo2mlzZKPQFfmDnAJ+gxW2fKpV1kUZ9g
	 mktesPGKIGisx6N9AhLM6+Awhv++RLIDt66UoAi18X+mrj/tz7Olm10i1J7Pih4iMi
	 IxM4FBKVFXCKg==
Message-ID: <4ca94d3d-40e3-45c7-8f75-b8c09db8e20d@collabora.com>
Date: Thu, 9 Feb 2023 10:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/9] dt-bindings: gpu: mali-bifrost: Allow up to 5 power
 domains for MT8192
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: airlied@gmail.com, tomeu.vizoso@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FXqEJaADrhgu-tPfEPPkP1B=bo_KytBH55xCRea4CmTQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FXqEJaADrhgu-tPfEPPkP1B=bo_KytBH55xCRea4CmTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_011737_245366_82103873 
X-CRM114-Status: GOOD (  10.53  )
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

Il 09/02/23 09:33, Chen-Yu Tsai ha scritto:
> On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> MediaTek MT8192 (and similar) needs five power domains for the
>> Mali GPU and no sram-supply: change the binding to allow so.
>>
> 
> mt8192 compatible was already added, so this should have:
> 
> Fixes: 5d82e74a97c2 ("dt-bindings: Add compatible for Mali Valhall (JM)")
> 

Yeah, agreed.



