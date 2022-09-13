Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C99BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zitqPC3jMtJbaLdwQVMwLjdGwbT3nTG1S1emU8nL1U=; b=zOeiSdhb4Kak7tkNVTjpWHNEZv
	LvuLmgeTFLUYAvpx968bf/7xa1Hj74CuNl82pH5Ij5K53ucAnTUShPX+W5HVcA/MXWurAddpeMHGN
	mBxzD9XKHf+/WU5yVHprOyOq4Z3c78Wm4dE8A+Sbt6q3ZoCP3/z+QlZknHcmru+KuG6OS+0lTyfDR
	TLRsPmGbLVXGsVnV3T9aYuhpx+6JbSJcrwwWLMnsS4+ybPOG7DhmUhrU5DfW4s8fjtXiyvc9IrpOI
	ZICNogDgFtQ1/4fn2NCn0sLlrFYwnmSB7qaFCQ3ki9sYZGksFwdq5zZ3DshDh3qogmG8COvkhkA9O
	wLvT9slQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8Cm-00CpU5-RB; Tue, 13 Sep 2022 15:52:08 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8Ck-00CpMe-43; Tue, 13 Sep 2022 15:52:07 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1278a61bd57so33233710fac.7;
        Tue, 13 Sep 2022 08:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=5zitqPC3jMtJbaLdwQVMwLjdGwbT3nTG1S1emU8nL1U=;
        b=u06lsIbZDmNKhizIBC8t8USMXocyolUYRJT4uhJ7rJkvcQStWt5r2ChTIVj0Mm3Mel
         aViyA6/g0u/fzK/Da8l3yIcOcdyZXx9tpubSipAJJdneO49g/Lsb+6h0+wG8yvQxIJp8
         uBo85GqDOlH6SOc27tBiLjANcUEf/1aOrVFclckmWYKnvpsVtxREEwtIeSGfJKEh62c5
         rnl9iXQytn50kmk6Mgv4kfHUKZ7MpI5s2kH3eOCENmrePwuQ21cOcwGmpuMPQMQe3OrL
         zfQGl7mjiDdxNQPtLfuVjMAWAeNW6KfH7Yo7kp/1+dfAnSr9mxjuAK39olp6tdBQzyOX
         r4iA==
X-Gm-Message-State: ACgBeo3gs4tMn+wZYnm6Kjp9ri86jKArEXFJrDPHCC7pFegUdnDeOCiu
	+wDB7SQt/7Ln8frxkWgOiQ==
X-Google-Smtp-Source: AA6agR7MSb86Jh0ODTdi1vPWAkVgAwcB/GFNDkT4A6alMUaihbsgFK1AzksLP6OGUPFazQIqjFTFcQ==
X-Received: by 2002:a05:6808:2119:b0:34f:ca73:ee72 with SMTP id r25-20020a056808211900b0034fca73ee72mr1922974oiw.247.1663084320424;
        Tue, 13 Sep 2022 08:52:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r196-20020acaa8cd000000b0034fd36e95bfsm1740582oie.31.2022.09.13.08.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 08:52:00 -0700 (PDT)
Received: (nullmailer pid 3802793 invoked by uid 1000);
	Tue, 13 Sep 2022 15:51:58 -0000
Date: Tue, 13 Sep 2022 10:51:58 -0500
From: Rob Herring <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Eric Dumazet <edumazet@google.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Paolo Abeni <pabeni@redhat.com>, John Crispin <john@phrozen.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	George McCollister <george.mccollister@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-mediatek@lists.infradead.org, 
	Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, UNGLinuxDriver@microchip.com, 
	Rob Herring <robh+dt@kernel.org>, Marek Vasut <marex@denx.de>, netdev@vger.kernel.org, 
	Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Woojung Huh <woojung.huh@microchip.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, DENG Qingfang <dqfext@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH net-next 2/3] dt-bindings: net: dsa: mt7530: stop
 requiring phy-mode on CPU ports
Message-ID: <20220913155158.GA3802757-robh@kernel.org>
References: <20220912175058.280386-1-vladimir.oltean@nxp.com>
 <20220912175058.280386-3-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912175058.280386-3-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_085206_215532_1109E78D 
X-CRM114-Status: GOOD (  10.25  )
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

On Mon, 12 Sep 2022 20:50:57 +0300, Vladimir Oltean wrote:
> The common dsa-port.yaml does this (and more) since commit 2ec2fb8331af
> ("dt-bindings: net: dsa: make phylink bindings required for CPU/DSA
> ports").
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

