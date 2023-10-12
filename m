Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C8BCDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=riFeA1UJlvh7nPt0XePBpGQloefzi6HperRK4J0GDUw=; b=HzzVHAPkw5zqXhXDtQJPZKW1/5
	PULFkQe33QzKZukBFq0MaA8nt+OnQuFqS4dwp1mwhT0FJwUJ9glH17OngBRlUPR7m6vB6jq7CpvJD
	wlI/VwqTsKUb5vmtu9s5K7Ch7de7WukpyesPnKNAvG76tn1fogzp23JtcjCYgBhrd7RsMbu00gJ0N
	A9zxXtK9AfT5tmV+c6v22I25KSRNF4bZLP05Y5ExGL2X15OOdMZFb3x5Vga2WBCoTYZlHHYT61uk0
	yFnf/7ZcCFQ2SFriknY0XXn6UJBWu1xM3PLD2nVIl5dIpzhyZwHtJR63ytjJLiXaUQPsm2Fj8BI+3
	FPf9DfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsqM-000eSP-1S;
	Thu, 12 Oct 2023 10:23:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsqI-000eRP-22;
	Thu, 12 Oct 2023 10:23:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4BF1B660730F;
	Thu, 12 Oct 2023 11:22:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697106177;
	bh=Ey91TshJ+ylbMillrbtBCs1yUKCBOsFzy68XsgWB48s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BGcdSAqm64lZdoMvJ3EyBtd6aENKWnnicrCfWdcs4vVbhd+mt3drqvYDnpNtdTzWF
	 JcdGKPanzA5MhfJpFNl6bOk1dEZ8hQ7pXTnVRYxZNJtV3G0xr6A8B1UosK64QrPMDx
	 oMpz5tSAWJJZwZhoHtU+m/tcEBHtDo4W1HaDob6GrQXrnoieZevmoj4nTGwPaKeenb
	 tRu0UnM47coN/ZKV790iEt9YO5DncC6qfPioqa+LSkAcZqy13O+7+0y0BJ9Y43igMJ
	 AgZDFWKqY+n26ECvvhg1qZQCXEG+8MfwB2KCJJggt1cfNb+nVTeXA/hhuDHBig343d
	 EGl7xnoIeUZ8g==
Message-ID: <2b735350-406f-e9e4-0e0d-8a12cbbfedd7@collabora.com>
Date: Thu, 12 Oct 2023 12:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 06/16] dt-bindings: media: mediatek: mdp3: add
 component FG for MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-7-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-7-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_032258_804590_F5883B25 
X-CRM114-Status: GOOD (  14.71  )
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

Il 12/10/23 10:40, Moudy Ho ha scritto:
> Add the fundamental hardware configuration of component FG,
> which is controlled by MDP3 on MT8195.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   .../bindings/media/mediatek,mdp3-fg.yaml      | 61 +++++++++++++++++++
>   1 file changed, 61 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> new file mode 100644
> index 000000000000..82f4c182c77a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 FG

MediaTek Media Data Path 3 Film Grain

> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:

Film Grain (FG) is a Media Data Path 3 (MDP3) component used to add
the film grain according to the AOMedia Video 1 (AV1) standard

after which

Reviewed-by: AngeloGioacchino Del Regno <zangelogioacchino.delregno@collabora.com>

