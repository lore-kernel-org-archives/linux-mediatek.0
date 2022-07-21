Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B5BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 08:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NR3bD85W6pAO+mBzLnOvvc+8DsngW7/ZXnlDyc2DPXc=; b=WV8Sa7rmuqfkjVtQNCVs6QAeG3
	pUF3YxFubdnMzYkQFJik3IzVPSLwr587tfkIEu6KSvzwj2Bkuam8kZ8LGWPV8wau+PpK1vLIqmiXi
	cJP13eP/3fW6qqQzY4gCbkAeu8G4WE6HjjOc7q1s1sBjDfv2zHrmbbzv4R7qDstd2AOn4eH/bMslD
	QDrGRsglUsLI4w3G9f+7W/xh/PpSAxiIjzCRIcgC7HMiY+xO7lr2MU02/BRokJtVrrfV+e3T49Txx
	aFeI2i8tcI8whE+rvyUUpkYRiN4/HpFxFIrh9R6IUETQpKraSQ6nvbdfzjdexghcfJos0o1vbKohS
	Uk4oAe/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERk0-002ey3-17; Thu, 21 Jul 2022 08:41:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERjX-002ek5-Q2; Thu, 21 Jul 2022 08:40:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B895E66019C1;
	Thu, 21 Jul 2022 09:40:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658392834;
	bh=UkS0m/M5DvbbQ/GObPG5/kXK7jhZdM3ZkXjeCEHoCvo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wnmud/HyoKxCMwupH5qw3uy/zD/ZJAYNNJeOIQLkvpFaLe3dFhwrg+J9cpDkqFtrc
	 9/OGMoi7tmIR3zySfl6CrGRHaPeYRYi+3cKgTtKYy9/PBQM2IgagXmSrAG6gIejYth
	 nmZMNyE4wSKs++BntTw0XBni+hZdexLJNKMK/M/ImDkWod+EpOqOsy5lS3q98HMGv9
	 sqbJphzqjZ2tB5yZX7X85InhUyXxg6OrUsyPKk57h95EB62sXwpGLHx9bSfmKYZH1c
	 IFXDk7zmNRC6odyxyZVp3M6O/jgbuofnF/3rDPK499SCRcmBnFDjrl5gq5eVIu87RF
	 1QEJrnzzjgH2w==
Message-ID: <c5e94d12-4f52-2e75-3b45-735afa0e987b@collabora.com>
Date: Thu, 21 Jul 2022 10:40:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 3/6] dt-bindings: mediatek,mt6779-keypad: add
 mediatek,double-keys
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-3-ef9fc29dbff4@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220720-mt8183-keypad-v1-3-ef9fc29dbff4@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_014036_030963_B5366415 
X-CRM114-Status: GOOD (  15.76  )
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

Il 20/07/22 16:48, Mattijs Korpershoek ha scritto:
> MediaTek keypad has 2 modes of detecting key events:
> - single key: each (row, column) can detect one key
> - double key: each (row, column) is a group of 2 keys
> 
> Currently, only single key detection is supported (by default)
> Add an optional property, mediatek,double-keys to support double
> key detection.
> 
> Double key support exists to minimize cost, since it reduces the number
> of pins required for physical keys.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 
> diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> index ca8ae40a73f7..03c9555849e5 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> @@ -49,6 +49,12 @@ properties:
>       maximum: 256
>       default: 16
>   
> +  mediatek,double-keys:
> +    description: |
> +      use double key matrix instead of single key
> +      when set, each (row,column) is a group that can detect 2 keys

We can make it shorter and (imo) easier to understand, like:

   mediatek,double-keys:

     description: Each (row, column) group has two keys

...also because, if we say that the group "can detect" two keys, it may be
creating a misunderstandment such as "if I press one key, it gives me two
different input events for two different keys.", which is something that
wouldn't make a lot of sense, would it? :-)

> +    type: boolean
> +
>   required:
>     - compatible
>     - reg


