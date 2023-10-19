Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4B4CDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 13:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOMFQ4KhhgNN9uiVFnKX2Q/Idi24XPkIW6kBXq+OOHE=; b=Q1p5qongrMgQQwnL0v0434Bk9f
	0MVfg8K3pxg04mGyIKPGEkN3Gmk0G9TKXWM3vH8yVhedxX+V6Rhlv1EmJPw9uFM6i5TBw4TJLZZjT
	GVdiRqJc+D4eNZC9X58Bn9KZMUi95oZq4fK9BCEvPb1tNOdnWbj1EHItpcdF+ETK5sQotKuFdPv6o
	srHhNDTJFoLUhmHl7yOLkRkmxK4vyJQrnZ5Ao/yrFeTxMnnxt9Qx3lxgj1Ex9QxLRKvk1pMOoFZWU
	R1aL8XxSab79ytQxmbOF/zgzaJvX4GVikJfWaO+Q9gaQT2iVu7fEDE2RkWydGuE0/tg9+dnGRZbWl
	0f/SE7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSuo-00HVW4-10;
	Thu, 19 Oct 2023 13:18:18 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSuk-00HVUb-1U;
	Thu, 19 Oct 2023 13:18:15 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99c3c8adb27so1252040666b.1;
        Thu, 19 Oct 2023 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697721490; x=1698326290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dOMFQ4KhhgNN9uiVFnKX2Q/Idi24XPkIW6kBXq+OOHE=;
        b=GwkJk909yRy29d7/NiQgP8s/gSgiZhcBerU974b9pcqNXbuIUkN+bvq6mLxu85Um8N
         rsfKmJR5ypsHWWg1gYpUmvKXAygmMGqFoprZ5V92Y5/Zg+cxYYWTj9/VOcs0TDhvYfqf
         6j76JDCOzlxIAubNN4Shw8SLjU3b3SjkR0Q3GDKOVW6cjqEH0jMWJfQ+TZRR/KTus5fJ
         6zDLNF5Xift6TUov8cXfuMIvexePZhfOkTOioP63BW1JcvZrlKC5VA6+nhoKTaKeKwti
         Gvm6/AEwuHZgf/3bQzOjR1/WvxQCG/tJkrN4uUN8+q3dDccJ3NeSaKFhOA6Mpzow7iz3
         7Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721490; x=1698326290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOMFQ4KhhgNN9uiVFnKX2Q/Idi24XPkIW6kBXq+OOHE=;
        b=tRpl/5VFA+ZB53QJKhsRS30TPownun3QSrcwqmn7qdxCJVi+fahxAnxrDknuUfmKAt
         psd0gbv4KBp7a1D3tb45NIqaXNo4lBlrtxMn0g4PixhsB1k+xhxLjcAmddb/ZQzG7aSv
         BlITsJmopasieBPRs2GlldCjeMsifEILvVISyNvSGsJH7cavVl8JNoj85xMakekP2ey/
         HJu/pd4QFfC3rPkJKH60Vjcyxj19YtqpqpAY2D7cX8xQLuQmaSoBJouPSNjtSA2lONxu
         d3NzvDoBy7oWUtViQHEhoPoIMs4Xg7ZdxDcdv0R5eQ7o7WgpeekDZsiLOtVgXfEvbsBS
         iAbw==
X-Gm-Message-State: AOJu0YyBLM2crIUQ/ttiTC+O+VPvc9CNxS14zJQJq7a4Mdp1KFCeJscP
	toYBpj2BQlsiZPzg/SGoOQ4=
X-Google-Smtp-Source: AGHT+IGeV/PAyeS5ZcSZyKizUQ5u38iNo53UbAIyLr9nNzHgjNSBIjErmYPUXpk3hLMaNF1I+onEEQ==
X-Received: by 2002:a17:907:97d0:b0:9aa:63d:9ede with SMTP id js16-20020a17090797d000b009aa063d9edemr2084080ejc.9.1697721490291;
        Thu, 19 Oct 2023 06:18:10 -0700 (PDT)
Received: from skbuf ([188.26.57.160])
        by smtp.gmail.com with ESMTPSA id qt16-20020a170906ecf000b0099c53c44083sm3596979ejb.79.2023.10.19.06.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 06:18:09 -0700 (PDT)
Date: Thu, 19 Oct 2023 16:18:06 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	John Crispin <john@phrozen.org>,
	Gerhard Engleder <gerhard@engleder-embedded.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH net-next 1/8] dt-bindings: net: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-ID: <20231019131806.lbzydoplodybvb62@skbuf>
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_061814_504733_AAD1BFF4 
X-CRM114-Status: GOOD (  15.19  )
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

Hi Rob,

On Mon, Oct 16, 2023 at 04:44:20PM -0500, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Add unevaluatedProperties or additionalProperties as appropriate.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> index 833d2f68daa1..ea285ef3e64f 100644
> --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> @@ -61,17 +61,11 @@ properties:
>  
>    ethernet-ports:
>      type: object
> -    properties:
> -      '#address-cells':
> -        const: 1
> -      '#size-cells':
> -        const: 0
> -
> +    additionalProperties: true
>      patternProperties:
>        "^(ethernet-)?port@[0-4]$":
>          type: object
> -        description: Ethernet switch ports
> -
> +        additionalProperties: true
>          properties:
>            pcs-handle:
>              maxItems: 1

For my edification, this patch removes #address-cells and #size-cells
at the same time, because "additionalProperties: true" (which was also
implied before) doesn't care if they aren't defined in this sub-schema,
and they are defined through $ref: dsa.yaml#/$defs/ethernet-ports,
right?

