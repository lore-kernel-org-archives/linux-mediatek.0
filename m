Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F91C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fngJa4LjlCQHavAD8ca542pNMcacjt6TRnu+6DChds=; b=Rsr6CTCZQBEqJNtVv/r2zlqGfE
	X9PUWgO+cKwqsXrp0hy5WVVlhVj8yW+n4hvpZ1Kb/6ttUnpLoJ8VxWd6ihSvAYt0u1IWdCrdirOIX
	rHbpz3Hkdh/Iqgf+Tu1ZT7Qy4myn3uX3G1sasDEVlZKoePx9JXDfbNZ5nPlNodFER0r64jZUkerTd
	p8ZCgPqffyMnjNsohEeCUGUoWzxFAPJeJujZk9tnpKT+S29PLxdkmU0UfjqdnC4YNHssPLlNkjE/L
	+u96JquqeWEOhWycYemVeYoqsRlON/p2I5nqXBMCO/IlR4Yr4NvkH9A0TTB6axrDPcuL2rtMoxqV0
	4SbHFWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8O2s-00DpKw-3U; Thu, 22 Dec 2022 16:03:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Nu3-00DkUl-KA; Thu, 22 Dec 2022 15:54:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5E98D6602CD4;
	Thu, 22 Dec 2022 15:54:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671724478;
	bh=qAhG/99ma0oz2fsDZKxatykFyuHEp485BVRnZklODwo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WBvNMLrJs1Tepv7wPgNfxOpPQHWNuLF5o77g3MDtDLkmjglKgBrnf+zXwUxaGUyls
	 6zWLBUY0IK0CHLi8muG6wytWp+gy1QtiR3WZgWCfsIenc2GG44a7yVoNH5EPsFxp9O
	 jmQAXq9FVX4/t/Wd9mRIB3LG8A7FIeTE4nu6lNXZJXzz83KKohxJpLzPw+FsI4OoMi
	 dhr+z6qlnjInxUUzIzPj8pXSuXo6Qr+tbwWdwulbaTJZIJrN+fuVSFTj78Dr5wDhvv
	 l/GUuSyDJdHzKUquLXP8W5ne2w51qobXAOpdq5aiflgMpC1F2qZXgb2ipEZy/o58x+
	 m5zAtEwM7s4gw==
Message-ID: <372e5ab4-bc2c-1ccd-1f22-7bab635c36d1@collabora.com>
Date: Thu, 22 Dec 2022 16:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 0/6] MediaTek Frequency Hopping: MT6795/8173/92/95
Content-Language: en-US
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, edward-jw.yang@mediatek.com,
 johnson.wang@mediatek.com, wenst@chromium.org, miles.chen@mediatek.com,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 jose.exposito89@gmail.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_075440_110966_39C6E353 
X-CRM114-Status: GOOD (  14.21  )
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

Il 22/12/22 16:51, AngeloGioacchino Del Regno ha scritto:
> This series adds support for Frequency Hopping (FHCTL) on more MediaTek
> SoCs, specifically, MT6795, MT8173, MT8192 and MT8195.
> 
> In order to support older platforms like MT6795 and MT8173 it was
> necessary to add a new register layout that is ever-so-slightly
> different from the one that was previously introduced for MT8186.
> 
> Since the new layout refers to older SoCs, the one valid for MT8186
> and newer SoCs was renamed to be a "v2" layout, while the new one
> for older chips gets the "v1" name.
> 
> Note: These commits won't change any behavior unless FHCTL gets
>        explicitly enabled and configured in devicetrees.
> 

Forgot to write in the cover letter that this series can be applied on top
of [1], but that's a dependency only because that big cleanup moves things
around (hence these commits won't apply if not on top of [1]).


[1]: 
https://lore.kernel.org/lkml/20221222114857.120060-1-angelogioacchino.delregno@collabora.com

Cheers,
Angelo

> AngeloGioacchino Del Regno (6):
>    clk: mediatek: fhctl: Add support for older fhctl register layout
>    dt-bindings: clock: mediatek,mt8186-fhctl: Support MT6795,
>      MT8173/92/95
>    clk: mediatek: mt6795: Add support for frequency hopping through FHCTL
>    clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
>    clk: mediatek: mt8192: Add support for frequency hopping through FHCTL
>    clk: mediatek: mt8195: Add support for frequency hopping through FHCTL
> 
>   .../bindings/clock/mediatek,mt8186-fhctl.yaml |  7 +-
>   drivers/clk/mediatek/clk-fhctl.c              | 26 ++++++-
>   drivers/clk/mediatek/clk-fhctl.h              |  9 ++-
>   drivers/clk/mediatek/clk-mt6795-apmixedsys.c  | 63 ++++++++++++++++-
>   drivers/clk/mediatek/clk-mt8173-apmixedsys.c  | 65 ++++++++++++++++-
>   drivers/clk/mediatek/clk-mt8186-apmixedsys.c  |  2 +
>   drivers/clk/mediatek/clk-mt8192.c             | 67 +++++++++++++++++-
>   drivers/clk/mediatek/clk-mt8195-apmixedsys.c  | 69 ++++++++++++++++++-
>   drivers/clk/mediatek/clk-pllfh.c              | 23 +++++--
>   drivers/clk/mediatek/clk-pllfh.h              |  1 +
>   10 files changed, 311 insertions(+), 21 deletions(-)
> 


