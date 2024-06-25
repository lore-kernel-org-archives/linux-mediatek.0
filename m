Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCF4C30653
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 08:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIRpSov2Q1kaoI6XqJe5u3zvw0qymVfEnAcUPie2Enk=; b=4OpOcwu7ri7MtfClooMnCRs/8e
	yb/IK7uhcsF6ZxA7x98zrdkMmJ/CT898I5DyhWg04ufvdWL4IGqqahil+T2AHNs1AbnwC9ebp+YGO
	qlgNxDER9kOZm1/3U9yXsLubtGr8qwfir+lWs25xedLY/G7WuD8kJrk5/+jmaj/PmL9Vdd4F6gGFU
	KA/xwpiyvxJ4OXJ54PvJ43uF0E2yIuNv859ScvZJ7LzqqDZXuS+AR9fCUNzMS66xV+HifYrGtRZHd
	zvhpxSATyUTC3J2OhzBt0jn61yCkrteCQ0q+iLBrkSxNBpakW5cO0facDv0x0oHIShkyfErqTltBX
	4VuOV62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM1bV-000000027ow-1DvW;
	Tue, 25 Jun 2024 08:32:41 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM1bO-000000027mm-01Rr;
	Tue, 25 Jun 2024 08:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719304352;
	bh=hi3MSzsE8nwxCxFsphtLi2390SmR1eVJsA70Ej66c/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JQgg1H471/eyWzk12iOuyhV+nOj3YKnA13h9EuESkv8cHr1d88Xp6y3NI+CoBrnqB
	 zIGXMh+ADemAqOCuZeMjhc7hd22M87WllhIGQnITdrmUlf+X1p5e+BES1t4WUeSBNg
	 MuseE456LrBeSN/rrQJhymIAYXLOYdsZLnX8bKcmEBpoUkDYhAyFOJMr+WGNtXz6l3
	 gFCrHntDw317dKhswm9wnlsKQFYLOFpkRlGshtabuY/+Qs61o54itTx3D+r1PAmlf4
	 X3LhJfMYQqLXY3acCgVqPxBsXl3IkkMGHaAhJMpDLRMQ5NrKj87owcX7b3j2G9YOSc
	 ixID8iBYdOYDg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 31E95378045F;
	Tue, 25 Jun 2024 08:32:31 +0000 (UTC)
Message-ID: <f7b4cd98-1acf-4f6b-a7e0-57419abadba1@collabora.com>
Date: Tue, 25 Jun 2024 10:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] MediaTek DVFSRC Bus Bandwidth and Regulator knobs
To: broonie@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, keescook@chromium.org,
 gustavoars@kernel.org, henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org, amergnat@baylibre.com,
 djakov@kernel.org
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_013234_370487_4B03145F 
X-CRM114-Status: GOOD (  11.98  )
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

Il 10/06/24 10:57, AngeloGioacchino Del Regno ha scritto:
> Changes in v6:
>   - Fixed build with clang (thanks Nathan!)
>   - Removed unused mtk_rmw() macro in mtk-dvfsrc.c
>   - Added MODULE_DESCRIPTION() to mtk-dvfsrc-regulator.c
> 

...

> 
> AngeloGioacchino Del Regno (7):
>    dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators

Mark, I assume that this series is ok from your perspective, since this has got
your acks and r-b -- but in order to pick the soc/mediatek stuff I need all of
the dependent bindings to be in as well .. and this includes the regulator one!

The main issue here is that the main soc/mediatek dvfsrc binding
dt-bindings: soc: mediatek: Add DVFSRC bindings for MT8183 and MT8195
does use the others, so I can't pick this one without the others being present
or the validation obviously fails.

So... gentle ping :-)

Thanks,
Angelo

>    dt-bindings: interconnect: Add MediaTek EMI Interconnect bindings
>    dt-bindings: soc: mediatek: Add DVFSRC bindings for MT8183 and MT8195
>    soc: mediatek: Add MediaTek DVFS Resource Collector (DVFSRC) driver
>    regulator: Remove mtk-dvfsrc-regulator.c
>    regulator: Add refactored mtk-dvfsrc-regulator driver
>    interconnect: mediatek: Add MediaTek MT8183/8195 EMI Interconnect
>      driver
> 
>   .../interconnect/mediatek,mt8183-emi.yaml     |  51 ++
>   .../mediatek,mt6873-dvfsrc-regulator.yaml     |  43 ++
>   .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml  |  83 +++
>   drivers/interconnect/Kconfig                  |   1 +
>   drivers/interconnect/Makefile                 |   1 +
>   drivers/interconnect/mediatek/Kconfig         |  29 +
>   drivers/interconnect/mediatek/Makefile        |   5 +
>   drivers/interconnect/mediatek/icc-emi.c       | 153 +++++
>   drivers/interconnect/mediatek/icc-emi.h       |  40 ++
>   drivers/interconnect/mediatek/mt8183.c        | 143 +++++
>   drivers/interconnect/mediatek/mt8195.c        | 339 +++++++++++
>   drivers/regulator/mtk-dvfsrc-regulator.c      | 248 ++++----
>   drivers/soc/mediatek/Kconfig                  |  11 +
>   drivers/soc/mediatek/Makefile                 |   1 +
>   drivers/soc/mediatek/mtk-dvfsrc.c             | 545 ++++++++++++++++++
>   .../interconnect/mediatek,mt8183.h            |  23 +
>   .../interconnect/mediatek,mt8195.h            |  44 ++
>   include/linux/soc/mediatek/dvfsrc.h           |  36 ++
>   include/linux/soc/mediatek/mtk_sip_svc.h      |   3 +
>   19 files changed, 1666 insertions(+), 133 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
>   create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
>   create mode 100644 drivers/interconnect/mediatek/Kconfig
>   create mode 100644 drivers/interconnect/mediatek/Makefile
>   create mode 100644 drivers/interconnect/mediatek/icc-emi.c
>   create mode 100644 drivers/interconnect/mediatek/icc-emi.h
>   create mode 100644 drivers/interconnect/mediatek/mt8183.c
>   create mode 100644 drivers/interconnect/mediatek/mt8195.c
>   create mode 100644 drivers/soc/mediatek/mtk-dvfsrc.c
>   create mode 100644 include/dt-bindings/interconnect/mediatek,mt8183.h
>   create mode 100644 include/dt-bindings/interconnect/mediatek,mt8195.h
>   create mode 100644 include/linux/soc/mediatek/dvfsrc.h
> 




