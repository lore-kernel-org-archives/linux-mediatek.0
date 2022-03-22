Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB87C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 10:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wq3MJmvOVj+qKFY+Zv5oA8+4SIQUd1/hkT5mS2F+foE=; b=3V1VXeUCXyzlgo
	ibbcwAq9rmEv8rKs4O5wiEtgHYwLJDj+5RPOHUZO/CIHsFnv1pwzfhHH0qU/UDLBQmzCFVCpfPd6w
	3Zz+OMBxqxMfjpxH/k9MsTK/S1QRfstn1SvIEC3h5ssBzHAc3Xj9sHj5qhU/eQq2+NRkZjZtytFx+
	HmFegJ7ZCG4IVqRU4/edvwgAP54ZyGOvlBkBZFpJS5AgKT9/D9HSfeqoB2AcVvs1GhWwv/gyYHXy1
	OvwcvMF1iPVQ6Z9tBPILp7GMqWHI4WP869N+a7Vnh3gfaccz7DtjMQVBoZQF/AiebTJiO8DnQDdQf
	hQgUYN+5/kh5h0rUz1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWbnO-00AifJ-SQ; Tue, 22 Mar 2022 10:31:22 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWbnB-00Aicr-LK; Tue, 22 Mar 2022 10:31:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1033B1F43122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647945067;
 bh=wsuVdARlaeRl+D4+nBJjwWfODrGAZGldOBP9V39TNIU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mBWT5adqZ+p0KfBLO4NV3PK/6NkAUyxZl0PG1AM3d8aV5YDxPBm0AttaQlJudAKdK
 7FLb80e0w/hPFeD1ojdxJgvjZ5TMty8ta37TMXcKN4/SX/9n0WiYFFbnYcMHsduZG+
 O/oMiKpGZ0LQ59JRlWkEYSfaJG2pYNoocVuiMOm7MCAO7btxRFYRByilCYyQNjFnqz
 x3YCHm2NT8lzB1u0SLXzhYUply3LN4rQ/wxpHBplW4sfRp7ROYL33DOLFBT8LQh9/a
 aC8+ZnpiBnG4Vv4+46i8NmcFrCyFDF3ZA2mov9GVFeuhqnBkYLFVE5dCWTa8wk6pUq
 tufK8+7JiN97w==
Message-ID: <555f4a78-dd7a-59f3-e1db-f040c97c61b4@collabora.com>
Date: Tue, 22 Mar 2022 11:31:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v11 0/3] Add basic SoC support for mediatek mt8195
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Linus Walleij
 <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com
References: <20220216113131.13145-1-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220216113131.13145-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_033109_996707_24F35428 
X-CRM114-Status: GOOD (  12.18  )
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

Il 16/02/22 12:31, Tinghan Shen ha scritto:
> This series adds basic SoC support for Mediatek's SoC MT8195.
> ---
> Changes in v11:
>    - rebase on 5.17-rc4

..snip...

Hello Matthias,

this series introducing very basic support for this new SoC is definitely
ready to be merged and well tested.

Can you please pick it?

P.S.: Patch 2/3 (pinctrl binding) was already picked by Linux Walleij,
and it's already upstream.

Thank you,
Angelo

> 
> Tinghan Shen (3):
>    dt-bindings: arm: mediatek: Add mt8195 pericfg compatible
>    dt-bindings: pinctrl: mt8195: Add mediatek,drive-strength-adv property
>    arm64: dts: Add mediatek SoC mt8195 and evaluation board
> 
>   .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
>   .../bindings/pinctrl/pinctrl-mt8195.yaml      |   35 +
>   arch/arm64/boot/dts/mediatek/Makefile         |    1 +
>   arch/arm64/boot/dts/mediatek/mt8195-evb.dts   |  161 +++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 1049 +++++++++++++++++
>   5 files changed, 1247 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
