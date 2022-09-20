Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AE9C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTSXrM/us9SCaSDhSmecbQS9MVGMkphg8NFBLKgrsxA=; b=szTpSMtyYK54Et21GCQZTGa/PK
	uHKtGECpN454fYMbSy8EJV6Qrhq5QjQNQe+M/ErgbRo7AF6Lcg353iQJGvZ+EzaUl1Mg1MK5hk7b8
	kzo6H6HMGjHkH1GD07ukwC48XuUp+ZAO7YWOW1qiLgDSvFUNh9bIFfbGbYKj9PsKyRl/sF2FdQV1m
	EhxYQIAADek4yumerjyccpGS/NDgtbIkEvO4hTmXFhIuadalmMJBnUfB24cVEyI2VWbFMfGhM0LES
	/R9AkyOxTYs98cAIu/z69Bwv0qXSWXYa6IepQeAq4PAWsZDyH1zRg6HfcA3AhbxEUu75twh+fnWaH
	c4qhPqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaMO-002toL-Ek; Tue, 20 Sep 2022 10:20:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaMB-002tgx-Ko; Tue, 20 Sep 2022 10:20:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B68D56600368;
	Tue, 20 Sep 2022 11:19:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663669195;
	bh=iUq+6SOQiYHg6R9Dqd5eD1XyHyTrpOd2jfDvPJ7B3OE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oXSviiEBnEb3mN3mSMGpsPl5quu0E8RjJ8pK+7UR4nmiguSAC3BKIxhr4B0r7G7m/
	 gxrjVyyCLhyOVvWAYc7mxNppd2ejo3UTlHSYgyX3q35Lz1AqTkSFhkYgOppJBUp6TD
	 sd/fccKGgLgRZ+4/BDTBH+UlMHnJmlUd24csAq+M2FOWrbUh1NMgpybwVHNvFe0vy+
	 BkGSpxH1eutjiyi9sFAPUN8ede0nPu5WZY/hQVw5wQIb7ohatSElbpcyA8xXL/vlOU
	 4tbm9gxUcce6pYYgCpKeGLnqqotChSWHRn5jwuXQUhpa+5b/o95AeWBVHQLW4C7v6H
	 iWaZykJzDms6w==
Message-ID: <5071cc60-313e-bd01-228f-f0a0f2ce99a8@collabora.com>
Date: Tue, 20 Sep 2022 12:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 06/17] dt-bindings: mediatek: set the hdmi to be
 compatible with syscon
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-6-4844816c9808@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v1-6-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_031959_851083_746156F7 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
> In order to share register with a dedicated ddc driver, set the hdmi
> compatible to syscon.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> index abb231a0694b..86297b7eb7f7 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> @@ -16,12 +16,14 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - mediatek,mt2701-hdmi
> -      - mediatek,mt7623-hdmi
> -      - mediatek,mt8167-hdmi
> -      - mediatek,mt8173-hdmi
> -      - mediatek,mt8195-hdmi
> +    items:
> +      - enum:
> +          - mediatek,mt2701-hdmi
> +          - mediatek,mt7623-hdmi
> +          - mediatek,mt8167-hdmi
> +          - mediatek,mt8173-hdmi
> +      - const: syscon
> +

This is an ABI breakage, you can't do that.

Regards,
Angelo

