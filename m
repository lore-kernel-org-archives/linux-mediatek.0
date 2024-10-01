Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1979CCE837A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 06:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xv9rTxjenRIx6vrY5kSU88MqmEZVwiCWhRuFEtCYTcs=; b=31pKwanBb6LHDwMrpb4RjHdbxT
	Zi4VLEMfpcjRXY1cOCDFQMUiuJFYaj4NhuvvfVoHO//LOIyqLNmqxpMxdJJGnMlcyrTgFZOlHWyO9
	olToFsvk3hmy2PQegqSN0uFuS6nr8wC6nyF1KA8ujueQ1c4w0JOx/5EpKjaFdwAlWgq1BI16o8kgs
	mSyIhFkLjaoreaY1in6bo7z26rq9eKgWJwEA7EllgYjuz7kwV1QxZT4o2cwQS/1QBGQ6Ug9jiKLW9
	cWIJ4DNPqX7Km6ViC83M+QrN6xT+ihTN+N1gzsnEpVyShE7tQmrmLD1BL8aK9spQQ33vVwTds5nyp
	uisoFZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svWUb-00000001lvo-271n;
	Tue, 01 Oct 2024 06:36:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svWT2-00000001lbr-2VVe;
	Tue, 01 Oct 2024 06:34:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40F94A4294E;
	Tue,  1 Oct 2024 06:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3708FC4CECE;
	Tue,  1 Oct 2024 06:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727764479;
	bh=EDXsjtDekecqXOH4lKPY26hQ0HMsahBvIn48muRWd1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HZNZSTRxoYenHd2hovmWWTwlJRLs20vhDJLKuNerNPNtYlQp/Ep92+GSfopw0NOPU
	 iO/cxIx2sB/PkyR0DCrDIXE79RSdkm3OL2TAAFlLgbFNVLcTROjq3r4LKEI56NOizX
	 h3qgYazB00THLjDp8IqVosg1eRSNqKuQ0OdjqE8bEktC8x7wBhrbJDfV1GTQHlSj6I
	 WZPGEiyGchqGrtGiSo5McKjhKN5wCSwxEAe8A7UQSMAGmyOP75QhVrTJbls7DV/sVV
	 hde23wP8NKg0xToQD21c+mjDITLCYNaxhK7xk/GPq6Y+AK0QMcbrdIH4qOU5WugDbd
	 Kt+9NYEsVm0Sw==
Date: Tue, 1 Oct 2024 08:34:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sound@vger.kernel.org, 
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v7 2/3] ASoC: dt-bindings: mt6358: Convert to DT Schema
Message-ID: <6l6hb264yvhd6e6neurd5t4gmv5z5c5gpg27icijif3hq4cuu7@pbhfkdxb2eam>
References: <20240930073311.1486-1-macpaul.lin@mediatek.com>
 <20240930073311.1486-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240930073311.1486-2-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_233440_797101_02DDEFDD 
X-CRM114-Status: GOOD (  25.09  )
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

On Mon, Sep 30, 2024 at 03:33:10PM +0800, Macpaul Lin wrote:
> Convert the MediaTek MT6358 Audio CODEC bindings to DT schema.
> 
> This change implements the following updates:
> 1. Compatible property: Added the const 'mediatek,mt6358-sound'
>    to ensure alignment with the schema in the actual (DTS) file
>    "mt8186-corsola.dtsi" with 'mediatek,mt6366-sound'.
> 2. Example: Removed the example section, as it should be relocated to
>    the MT6397 PMIC file 'mfd/mediatek,mt6397.yaml'.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/sound/mt6358.txt      | 26 ------------
>  .../devicetree/bindings/sound/mt6358.yaml     | 41 +++++++++++++++++++
>  2 files changed, 41 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt6358.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/mt6358.yaml
> 
> Changess for v1~v6:
>  - It was not in the origin patch set.
> 
> Changes for v7:
>  - It is seperated from the origin patch set (2/2, v6).
>    It could simplifies the audio-codec node in next patch (3/3, v7)
>    of 'mfd/mediatek,mt6397.yaml'
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt6358.txt b/Documentation/devicetree/bindings/sound/mt6358.txt
> deleted file mode 100644
> index fbe9e55c68f5..000000000000
> --- a/Documentation/devicetree/bindings/sound/mt6358.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Mediatek MT6358 Audio Codec
> -
> -The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
> -For more detail, please visit Mediatek PMIC wrapper documentation.
> -
> -Must be a child node of PMIC wrapper.
> -
> -Required properties:
> -
> -- compatible - "string" - One of:
> -    "mediatek,mt6358-sound"
> -    "mediatek,mt6366-sound"
> -- Avdd-supply : power source of AVDD
> -
> -Optional properties:
> -- mediatek,dmic-mode : Indicates how many data pins are used to transmit two
> -	channels of PDM signal. 0 means two wires, 1 means one wire. Default
> -	value is 0.
> -
> -Example:
> -
> -mt6358_snd {
> -	compatible = "mediatek,mt6358-sound";
> -	Avdd-supply = <&mt6358_vaud28_reg>;
> -	mediatek,dmic-mode = <0>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/mt6358.yaml b/Documentation/devicetree/bindings/sound/mt6358.yaml
> new file mode 100644
> index 000000000000..5f7611e26a89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt6358.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt6358.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6358 Audio Codec
> +
> +maintainers:
> +  - Jiaxin Yu <jiaxin.yu@mediatek.com>
> +  - Macpaul Lin <macpaul.lin@mediatek.com>
> +
> +description: |
> +  The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
> +  For more detail, please visit Mediatek PMIC wrapper documentation.
> +  Must be a child node of PMIC wrapper.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6366-sound
> +      - mediatek,mt6358-sound
> +    const: mediatek,mt6358-sound

This wasn't ever tested.

Do not send untested code, it's a waste of reviewers' time.

Best regards,
Krzysztof


