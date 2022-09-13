Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B932DECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gp+xU4sE8xgnQ6QfOuz2cTyIgHVRPnIYNOZIMtkoz24=; b=rIDhNA0Juow3r/FA0RA2SRffxJ
	sZyGdX7gKSO7QomWQe4zf93WUhqsKRdp9MrnWfE6R6I8MML5Flg7EPzoogWG9QEyfRLGWMmih0WvH
	BinlNDiD22BiJXzaMBIsOYmVRXRuvAim2m0ewLO1I4vFU7lkwf8NzCE66mvKODqOghyFd5F+0fmKF
	ZPz2255yP8mowKmyFFfJYto18uFGXFEb33755ZC6x7InIsBwc6qBG58H0kL9onXwFLjUV1nabv6cN
	eOT2kgIM5Jsbd+agBn/ZN+w3vkrUoetZ+Hig35Ugmeqbj0xE8UrQrYpbq60i0Hf1Mu6zHy5XxY1e+
	HbD42a4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8Fr-00Cs64-J5; Tue, 13 Sep 2022 15:55:19 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8FQ-00Crj0-IE; Tue, 13 Sep 2022 15:55:01 +0000
Received: by mail-ot1-f54.google.com with SMTP id 92-20020a9d0be5000000b0063946111607so8372745oth.10;
        Tue, 13 Sep 2022 08:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gp+xU4sE8xgnQ6QfOuz2cTyIgHVRPnIYNOZIMtkoz24=;
        b=suFNAz3IIpkwHuXa8jhYIbwmWlK9jZlXLNl2hBvn2FNFwmtfYM3GDvJpducQhMIqBn
         icpToBFHlLtESFwfRjgLpONCEstjLe9+0w/D5iBRcOvcjCrUeF1I5A3rrJaCPy3/GMI5
         1Xe59TMtWfTaTwGTERFumtsrThuCYkzL2bqvG9rqxRiQZeCXtACMPGkOGTUewCLll6kh
         RAi4qE9o3DhPzm+EJumbxhAeQEAZBj9Fb2LhqiqJ8IfGVfhdOT0ICyGvTyKDJG5ANZnm
         dt5r6NJEDkX/8nH7KpsRADa+Ef4txSXE0D8kdzoirtm37biYgBFAHo7yZOBDBBGVv2e8
         sFyA==
X-Gm-Message-State: ACgBeo3zxIA44X6FyUUg2Hl9USE20i+g55BxiV9E93lHh8VdLiJ1BxSN
	/2C5BeT52C8kstc65Cn5Mw==
X-Google-Smtp-Source: AA6agR4MQlnAHtl45e8P0paPvA3OMjCOfUqMmnYSQk6J/fNxNbf1aZVEL/1TNMQ265oczn67305usw==
X-Received: by 2002:a9d:1e2:0:b0:656:c789:2b52 with SMTP id e89-20020a9d01e2000000b00656c7892b52mr814035ote.112.1663084490183;
        Tue, 13 Sep 2022 08:54:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 30-20020a9d0321000000b00655ca9a109bsm5224267otv.36.2022.09.13.08.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 08:54:49 -0700 (PDT)
Received: (nullmailer pid 3806977 invoked by uid 1000);
	Tue, 13 Sep 2022 15:54:48 -0000
Date: Tue, 13 Sep 2022 10:54:48 -0500
From: Rob Herring <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Woojung Huh <woojung.huh@microchip.com>, 
	Eric Dumazet <edumazet@google.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	linux-arm-kernel@lists.infradead.org, Kurt Kanzenbach <kurt@linutronix.de>, 
	John Crispin <john@phrozen.org>, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Vivien Didelot <vivien.didelot@gmail.com>, 
	Marek Vasut <marex@denx.de>, linux-mediatek@lists.infradead.org, 
	Vladimir Oltean <olteanv@gmail.com>, linux-kernel@vger.kernel.org, 
	DENG Qingfang <dqfext@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
	UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Landen Chao <Landen.Chao@mediatek.com>, 
	George McCollister <george.mccollister@gmail.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH net-next 3/3] dt-bindings: net: dsa: remove label = "cpu"
 from examples
Message-ID: <20220913155448.GA3806944-robh@kernel.org>
References: <20220912175058.280386-1-vladimir.oltean@nxp.com>
 <20220912175058.280386-4-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912175058.280386-4-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_085457_918503_BE42BD4F 
X-CRM114-Status: GOOD (  11.66  )
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

On Mon, 12 Sep 2022 20:50:58 +0300, Vladimir Oltean wrote:
> This is not used by the DSA dt-binding, so remove it from all examples.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  Documentation/devicetree/bindings/net/dsa/ar9331.txt       | 1 -
>  .../devicetree/bindings/net/dsa/arrow,xrs700x.yaml         | 1 -
>  Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml    | 2 --
>  .../devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml  | 1 -
>  Documentation/devicetree/bindings/net/dsa/lan9303.txt      | 2 --
>  Documentation/devicetree/bindings/net/dsa/lantiq-gswip.txt | 1 -
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml       | 7 -------
>  .../devicetree/bindings/net/dsa/microchip,ksz.yaml         | 2 --
>  Documentation/devicetree/bindings/net/dsa/qca8k.yaml       | 3 ---
>  Documentation/devicetree/bindings/net/dsa/realtek.yaml     | 2 --
>  .../devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml    | 1 -
>  .../devicetree/bindings/net/dsa/vitesse,vsc73xx.txt        | 2 --
>  12 files changed, 25 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

