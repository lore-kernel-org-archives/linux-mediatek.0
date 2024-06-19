Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80168C2BA15
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 09:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8K6nw6b6FtlZCOkhxIENf05P94aU/l9zg45yqLtRoY=; b=NsmzuYpdr8TAMN7TmgjPHAi/+R
	h6qRokHrXksLlSz4pdDRkwc3Mhd/24Ri7LNqOtcsVCLVjJEXa1Hi7VzyLusnu8hc5aQYLOBUss3Ph
	QW7+XXvS08TVeLxP6ml/uvuQsNvhJtyhW6E66ZED4jTkSSdwwyVnlF8tpxj3yz8mieb2E/X6i1+8E
	ZmfkYHU7VSeqcmGJ+4qUk8BhCgQaZPH1uG3N74T2JUmX3FR9StAMUCnWU1VaVSRQzfeI/8lenZ329
	fiV7UK6y53e+VpuVymMilmLbQldFFOyLPEXPRRRBq9zQIRFO8vBmIeTVGE66YCCr4plwJjsJcL/nS
	AH9XawrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJrX5-00000000ZET-3xj6;
	Wed, 19 Jun 2024 09:23:11 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJrX2-00000000ZCR-25tD;
	Wed, 19 Jun 2024 09:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718788986;
	bh=u5hdWnd9lzdDV9BWthAA8txrbh1qaZGtYlyLfYODBbk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qmKoFaXh+BX23XZ7425uwnJ5P2KXjjA4P9OJBQXCzSWOfUYmWY+vJAjmkwnu8vXIQ
	 JoZro56VB8rMSmbMkB4CBCV9x+H6MCFPjPO+6mXyi2VFBcvPa5XLlgaDrC+BoioptF
	 ucCFQ7ScdVDSFK5r00KgndiwgLccjR6jdju+Pc5fb579QaUEpzGbgjfjEQA0i9Ir1X
	 1JuUHvxZ8R3WZaaqa+EhlL6m5aLXl9u8NincvKnYml5p+GDeJwueT3FfOQ70KiCPWL
	 rObUYkN38MwydiK2V5CKiNCtTCrVe+qf3ikxAAq8q4wRGO7paa4ULxrcHAhs0cll0+
	 az3YATr9qXWBg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D6C273782163;
	Wed, 19 Jun 2024 09:23:04 +0000 (UTC)
Message-ID: <4e1a8383-fdcb-45b9-b3d8-7019ed8c07bb@collabora.com>
Date: Wed, 19 Jun 2024 11:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Support MediaTek MT8188 Media Data Path 3 (MDP3)
To: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 sebastian.fricke@collabora.com
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, amergnat@baylibre.com,
 moudy.ho@mediatek.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_022308_710237_71907ED7 
X-CRM114-Status: GOOD (  12.40  )
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

Il 22/03/24 10:28, AngeloGioacchino Del Regno ha scritto:
> This series adds code to support for the MDP3 block found in the
> MediaTek MT8188 SoC, including the necessary bits for mtk-mutex
> and platform data for the MDP3 driver.
> 
> This is mostly compatible with MT8195, with a few differences
> "here and there", with the former having less instances of some
> of the MDP3 IPs compared to the latter.
> 

Gentle ping for this series getting stale.

The soc bindings and commits are already upstream (v6.10).

The commits that would go through the media tree [3/4], [4/4] still apply
cleanly as they are.

Should I resend this, or ... ?

Cheers,
Angelo

> 
> AngeloGioacchino Del Regno (4):
>    dt-bindings: soc: mediatek: Add support for MT8188 VPPSYS
>    soc: mediatek: mtk-mutex: Add support for MT8188 VPPSYS
>    dt-bindings: media: mediatek: mdp3: Add support for MT8188 RDMA
>    media: platform: mtk-mdp3: Add support for MT8188 MDP3 components
> 
>   .../bindings/media/mediatek,mdp3-rdma.yaml    |   1 +
>   .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
>   .../platform/mediatek/mdp3/mdp_cfg_data.c     | 280 ++++++++++++++++++
>   .../platform/mediatek/mdp3/mtk-img-ipi.h      |   1 +
>   .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   1 +
>   .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   3 +
>   drivers/soc/mediatek/mtk-mutex.c              |  41 +++
>   7 files changed, 328 insertions(+)


