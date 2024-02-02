Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0A7C4828E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vX5pK42z/aqE6DXjCqNO3Rh9dRIj2CnXkXYCoafVHxw=; b=iltKXbelLEyCqiv0fqm1Xop5iw
	aoq6+H9SZVbWjlJ8vzzSRqyzwQuiQpYVGn4i6EPxKG/zCcftksz3sHwbbME88fyPDuxXL+Ff7krfT
	UR1fkgX/1RNmRem1UrSxOmfuw/E0BdXdsXZXzGW5ZwSb5ZVDJp1ktnKxtIz9UwXeicEI6NB+TkEqv
	CRnxQCppAxstV+UWknflLhv6T26YdgstBuoqK63Li7+M51QFQih8PdZfIZh2KEwxys1zfDkOPzUgO
	Jx4ZmOPbhpn5Jv7m39eBHV8Ndd36H4/zNQ3hRFbzMOphD3f40jJlZDp87LH/bV8RBr50xy/mbwLDL
	LIS+uP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVonz-0000000AkK8-3i2V;
	Fri, 02 Feb 2024 08:21:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVonv-0000000AkHt-3tOF
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Feb 2024 08:21:45 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33b0e5d1e89so1301266f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Feb 2024 00:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706862102; x=1707466902; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vX5pK42z/aqE6DXjCqNO3Rh9dRIj2CnXkXYCoafVHxw=;
        b=IbbmwaGRrHvME7zgBKDvWn1KP+wecGmmu4VhcsuEslAaRc774nUtbtuYvrPjyV3mql
         1t+wH+MBPjxoS81rdU1JeZWCEnmzV/SgtnE0nWPiWG0cEe4XITyhwuIuFfi1P82Mhi1i
         Hoid6brApoKRsG35ZclDFfuMikUKRra/Y6OS3wOLi1SlDxT0itvDQnjKv0Ji9h6O+PEO
         3MVpIdGWtdWyYUeGHYibpu+hnv3YOKSUZIRSNX0twh2t4FlH2MEetE8s2ntdxBF7hdpN
         1u4zIl29Q3Nhyz2sDL58bWBMZdYTT4N/GZiw+YPIODSSxys15ecWLQNhPSh+lvkb2BWi
         dxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706862102; x=1707466902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vX5pK42z/aqE6DXjCqNO3Rh9dRIj2CnXkXYCoafVHxw=;
        b=aafAdWP02dXH4W6ccK31PfzbChhrgcw/Ail6YQwLbOQhRg/KJolCeLvn/vi0v0odiw
         e9uhokYR26lF93X21Uh+WzYWHUhttZtOKKfJX9JNf5cqEM3GU8XZliF0FIvJzO7LwO1G
         rNYqR1rsv2ULtcctKpEP285u9sFEEO41/s/z+7tBUvfMSPADKODYPd+VhHTteclyUzL/
         khakb5AFB7WukUlo6K5IqdtHwW0iVzxYAlzL0XR4rwmfle4tKUsywtp7exDHJaWq8VhQ
         F2CbTVcKlInEr5zRWgAuR8q0ghE2EndTaltNUReHELBU59nMrWsYrNuUpIOWCFGETLR5
         VUDA==
X-Gm-Message-State: AOJu0YxRB07ytnL92gxgkJ5mWRkgcwfhM8YH1KkmNx6kJuzAPBIOYEN8
	rTCFoQF0XCHF3ZM7VkRV2uT7knslylNYevH1BDEUTZBPOQLuQ/sLc3tihYRlq5g=
X-Google-Smtp-Source: AGHT+IFHpmKaTfIaU7hxAjZaxJrl8urFm4mSJmDqUJIVZFVPCayD7HPdw5kKzsoxaT005jX2TQkPnA==
X-Received: by 2002:adf:a45d:0:b0:33a:e6f0:ee05 with SMTP id e29-20020adfa45d000000b0033ae6f0ee05mr2743494wra.45.1706862101672;
        Fri, 02 Feb 2024 00:21:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVmbVyJeEEren4Lwmo3gre/jH5x6+HaLtaLv+s+LWjJ9Noyq0L60yvHmqm5GnOa1PJs0b9b+qAH+eujbCNxX3g32UJP0RfIG20ifL0B+vyThyQoMchFau9Z9jcBec0Z/DlvGoFkWx78ZOVTlO3Rg4lsoGlkQ2LFbvFOiu0PD4UJeeGF2Hma6PX4zQqQXpvNDX89Fx/i+Vvx8RZgO78qUCsOtOupoXQpMdhLPFDPxbV5Sm7QuFGCUxqvq6TDK6ZHaX39wxY8cxbaH33QxL8wCE7g9Ce3Q5/Y+KB0y233Gt9aZyDjnyubPGeG3cUqYWw3D1L7V27VrJoV8hRoXm+7OxE+EVDKuyFCBXxDDJQ3bUMV44MnIMdJ7QIQ/3iZY5Zd9RxqhIuW2HexzZb23JdpcAgRqQEnwB0PmWAyHt9k3xIka8rYLb29pLldAbHhdpHr8h9yBB2IjQyRwPm/Osfm24L8LJV6WH9Au8Tl0ZF66CiQknxWvATZqSzhfmAaBII5Nh5rH7CFVt4/Nuo5wNz7xkM5T9kBy/3i4KTuP2zzrZn+tnZuccBBD9GV2lzHDPgiP7DpCuS7ML8vNEMoNQJ9v98esHylO0Jf+dAKYb8G7xxSDL5nw+owcWXT+wzVIYnpsRLmL3BmEHnGo0eaMZKwHK+R/MqzryTztMg7hTNQ2ZAn7EnWMMKH7VS6RED22l7Y4hO7L5+8UAK3XLI+1CACcr02UWkRbabWOOd/qpRHY7bb55iI/GOGTorN+VOz6x7RubE=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id r18-20020a056000015200b0033aedfc5581sm1378023wrx.32.2024.02.02.00.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 00:21:41 -0800 (PST)
Message-ID: <adf20671-2f1d-43ea-8584-df0c0b095865@linaro.org>
Date: Fri, 2 Feb 2024 09:21:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek,xfi-tphy: add new bindings
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Bc-bocun Chen <bc-bocun.chen@mediatek.com>,
 Steven Liu <steven.liu@mediatek.com>, John Crispin <john@phrozen.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <702afb0c1246d95c90b22e57105304028bdd3083.1706823233.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <702afb0c1246d95c90b22e57105304028bdd3083.1706823233.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_002144_026304_95F6F1FD 
X-CRM114-Status: GOOD (  18.49  )
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

On 01/02/2024 22:52, Daniel Golle wrote:
> Add bindings for the MediaTek XFI T-PHY Ethernet SerDes PHY found in the
> MediaTek MT7988 SoC which can operate at various interfaces modes:
> 
> via USXGMII PCS:
>  * USXGMII
>  * 10GBase-R
>  * 5GBase-R
> 
> via LynxI SGMII PCS:
>  * 2500Base-X
>  * 1000Base-X
>  * Cisco SGMII (MAC side)
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/phy/mediatek,xfi-tphy.yaml       | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xfi-tphy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xfi-tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xfi-tphy.yaml
> new file mode 100644
> index 0000000000000..e897118dcf7e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xfi-tphy.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,xfi-tphy.yaml#

Please use compatible as filename. Your binding says only one is
possible (const, not enum), so there is no reasoning for different filename.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek XFI T-PHY
> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +description:
> +  The MediaTek XFI SerDes T-PHY provides the physical SerDes lanes
> +  used by the (10G/5G) USXGMII PCS and (1G/2.5G) LynxI PCS found in
> +  MediaTek's 10G-capabale SoCs.
> +
> +properties:
> +  $nodename:
> +    pattern: "^phy@[0-9a-f]+$"

No need for nodename in individual bindings file.

> +
> +  compatible:
> +    const: mediatek,mt7988-xfi-tphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XFI PHY clock
> +      - description: XFI register clock
> +
> +  clock-names:
> +    items:
> +      - const: xfipll
> +      - const: topxtal
> +
> +  resets:
> +    items:
> +      - description: PEXTP reset
> +
> +  mediatek,usxgmii-performance-errata:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      One instance of the T-PHY on MT7988 suffers from a performance
> +      problem in 10GBase-R mode which needs a work-around in the driver.

Can you explain what is this issue and errata about (except performance)?

> +      The work-around is enabled using this flag.
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - "#phy-cells"
> +
> +additionalProperties: false


Best regards,
Krzysztof


