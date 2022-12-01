Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D79FC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 22:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpWRHTmVhm2s7NkcuBRmMhNUH73cqPk0NBvzmuTS558=; b=nFbPLlz+xYybUCbwk4OeOtttxT
	DKvZJCU5J7Jukk8ZKg1Ph6YBHue5Dobc9WdBUd1W1d5FZGCfrLZOXY2bKbXUuR5xZ85oV8/kSnSxF
	4l/OwXA6l/AA0XvINsrYM5qQJC2Zvb5HFa5g5a2CTnD7klvO15a2qRp0Vzhjj/mdZXor2cOUWxSNt
	OlJw97+4BTz1y4h5wx2yvBBS6icm8YNqG5TDruRhs7WZ5aQ4Y56+japchmgw+qfBVMnegaJextmSm
	n+Ck52K4Jd++kpQtp4ozrqOnoxkbBDxBSng785ioe+9xNx0IAkWcdX8rA+sHxhHatzcDfjuDkewu+
	44V5i7rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0s6h-00BOXU-8d; Thu, 01 Dec 2022 22:32:39 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0rz6-00BNOk-Hs; Thu, 01 Dec 2022 22:24:49 +0000
Received: by mail-ot1-f42.google.com with SMTP id w26-20020a056830061a00b0066c320f5b49so1882129oti.5;
        Thu, 01 Dec 2022 14:24:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpWRHTmVhm2s7NkcuBRmMhNUH73cqPk0NBvzmuTS558=;
        b=s65AypOaQZyhAk7+gFH5TIpeyQL+dfvP+lRVSDsAewEFMQRuDjU/45rwiC/Nx8HNbb
         Cr1VElT7A4oovrmlzL/G/9i7EzwHrwTOlynBX97cgh56vtIf9wjMbUDZ+ZlXLw0DPTuN
         dfNh7vY1jr4GrPFI9OIQKpBQXHvDcW2YlPxxT/HC/m9tajabuu1yXLK+nA0O/ki1EWOX
         x/2d3miLZ0O+lzsCiekL0K5MMfyMhNbePjFmVZbzCgciFyGKmROJ7v68oO2o5anksog7
         L/40e96om27oUfUohOy9ttyF6yZbHCutR8j4TWA13zWiS0pAN8XMIkp1UHqsQBg/41af
         ESzw==
X-Gm-Message-State: ANoB5pm79BIgoJgeNAKoN3R+20WcnYR0Spe4aB0CUooISaMOOtT6iRMw
	kgSmHKdQO/Kdl1g4McM9xQ==
X-Google-Smtp-Source: AA0mqf412a4wYEQetqAAzqAyOQt/Mf3sAGn6eCUrPWEixr5txkptgCbRV+bxMQOTawyQj+8LmqUuWQ==
X-Received: by 2002:a9d:6a05:0:b0:66c:703f:d5a4 with SMTP id g5-20020a9d6a05000000b0066c703fd5a4mr26685522otn.290.1669933486469;
        Thu, 01 Dec 2022 14:24:46 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c6-20020a9d4806000000b0066c15490a55sm2645528otf.19.2022.12.01.14.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 14:24:46 -0800 (PST)
Received: (nullmailer pid 1554712 invoked by uid 1000);
	Thu, 01 Dec 2022 22:24:44 -0000
Date: Thu, 1 Dec 2022 16:24:44 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	George McCollister <george.mccollister@gmail.com>, devicetree@vger.kernel.org, 
	Woojung Huh <woojung.huh@microchip.com>, Vivien Didelot <vivien.didelot@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	", Eric Dumazet" <edumazet@google.com>, DENG Qingfang <dqfext@gmail.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>, 
	UNGLinuxDriver@microchip.com, Marek Vasut <marex@denx.de>, 
	Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	=?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	John Crispin <john@phrozen.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 net-next 02/10] dt-bindings: net: dsa: qca8k: remove
 address-cells and size-cells from switch node
Message-ID: <166993348424.1554653.6511937074374406374.robh@kernel.org>
References: <20221127224734.885526-1-colin.foster@in-advantage.com>
 <20221127224734.885526-3-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127224734.885526-3-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_142448_628149_16DEDF06 
X-CRM114-Status: GOOD (  11.95  )
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


On Sun, 27 Nov 2022 14:47:26 -0800, Colin Foster wrote:
> The children of the switch node don't have a unit address, and therefore
> should not need the #address-cells or #size-cells entries. Fix the example
> schemas accordingly.
> 
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
> 
> v3
>   * New patch
> 
> ---
>  Documentation/devicetree/bindings/net/dsa/qca8k.yaml | 4 ----
>  1 file changed, 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

