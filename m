Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCBDC27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 12:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYNwlZp8KeRjAI5sFp2HD2XupEWMWhtYOP2hUxKNsL4=; b=JLvqkgaHhX56Q/vhxAV3YuxNv2
	ufQF6XV/Wn9J9SwnJwFx7Hf3+Gbl9fjTqQVlaM28fKsc2kn8IfAWXhmh8/a79+BuC+wGuyyGY4Ulm
	4owwfoGkY2ac/hiwGf2YUfURpLOelrnch0W4XGNzcWTFJFYRGeUqmNUlKP6t2l++25hP3T18qHzpV
	9vPJhbwOEotiPZjBIzuv3ZUwFm8/Pzmet6b1H0pjHJ0a1pL6XxpfwRRkQPQiNwzznmp4QptFMu1IM
	1oFWbj2MiF6ZqiQv4aw8pVN86zefwP7HmM6FmxCXMhJK5Jz7gdYwhPavLmCGrIOLBfU2WCL7qAagc
	6HV2BOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHjj8-0000000GXfM-221V;
	Thu, 13 Jun 2024 12:38:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHjj4-0000000GXdv-46bp;
	Thu, 13 Jun 2024 12:38:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B5B061B14;
	Thu, 13 Jun 2024 12:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C4CC32786;
	Thu, 13 Jun 2024 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718282326;
	bh=bVrAo3lut/CIVb44EOV8RxgsTq/ZgAXk3P1KnkNPkkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q37b+m3ceQJYNsCBts8Dvz7UEkDRhKkWNQYjcD1nD+65btWlVfreATdZq/zeGmL5y
	 RV/M/bL6mO1pH3NqGekvInRDVioIyXJcb95e4flYZ/08SG6IKHNO+HjscfhF0Nn1JP
	 bxs3dqhBzLvNrlgg+R2Wx6MCa5Q00ZE+zZuTOd9+fpkcBAI9sJxKa7kgsSCVlhyHKV
	 wBFj8BKSIZSF8hG4kagJi8Pw2COxgf9vGAG50VyLkPn2J72B66BUQGAzqtabAR7VxG
	 86zBRzVYmqL0Q8nnP9jI+Kg4LVWrl92UEW6JJHzNPmUojHFf/3yF54oBrq35/K643f
	 rqRYCNgQA8KFQ==
Message-ID: <d5b593f6-1764-43f0-9697-78d586239c23@kernel.org>
Date: Thu, 13 Jun 2024 15:38:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] MediaTek DVFSRC Bus Bandwidth and Regulator knobs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 keescook@chromium.org, gustavoars@kernel.org, henryc.chen@mediatek.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, amergnat@baylibre.com
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_053847_279292_5AC20564 
X-CRM114-Status: GOOD (  10.93  )
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

On 10.06.24 11:57, AngeloGioacchino Del Regno wrote:
> Changes in v6:
>   - Fixed build with clang (thanks Nathan!)
>   - Removed unused mtk_rmw() macro in mtk-dvfsrc.c
>   - Added MODULE_DESCRIPTION() to mtk-dvfsrc-regulator.c
> 
[..]
> 
> AngeloGioacchino Del Regno (7):
>    dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators
>    dt-bindings: interconnect: Add MediaTek EMI Interconnect bindings
>    dt-bindings: soc: mediatek: Add DVFSRC bindings for MT8183 and MT8195
>    soc: mediatek: Add MediaTek DVFS Resource Collector (DVFSRC) driver
>    regulator: Remove mtk-dvfsrc-regulator.c
>    regulator: Add refactored mtk-dvfsrc-regulator driver
>    interconnect: mediatek: Add MediaTek MT8183/8195 EMI Interconnect
>      driver

Thanks Angelo! I have picked patches 2 and 7. Patch 2 is also available
in my icc-mtk stable branch. Feel free to pull it to resolve the schema
dependency for patch 3.

BR,
Georgi

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


