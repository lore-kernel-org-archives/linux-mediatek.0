Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50987C43217
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 00:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tkm1rZJjYKH+0e9XPZ9u8/k0fPDDDPFuGFSeOnuxztc=; b=V6r/Cmgw7uMTmFYZkv49hFyE1l
	7LY2YeSlwYWmpIAdA4/hfvKR9kY41OIMNx8s8EOrV1TEC+a/H1Uppz6Qb6TfwVQQYY3CFzbBn5Vbl
	WUf4tBUdBkxweLnl5sDhjzRtoocjSyrU5cgFWkcsn0lx2j2xxq6ThBO878sYdS3ccNOfsYJDdJBcn
	PiMTnM+NsIN+G08YJnElbyf4o78iMLPNo69yMIHcQE1eCMVPHuG1Mgij+iR321seh4Xtex0w+Uc1S
	L0l/Xe70oV68sQ7GnRVfxT01/5ve19Gdfb5k5Hk5kl5cHXK/HqgfXTW+BoCpfwMS5/nsvYlFKlkOb
	VKueH/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozoW2-004tns-UJ; Tue, 29 Nov 2022 00:30:26 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oznXf-004m9p-6C; Mon, 28 Nov 2022 23:28:04 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1322d768ba7so15043688fac.5;
        Mon, 28 Nov 2022 15:28:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tkm1rZJjYKH+0e9XPZ9u8/k0fPDDDPFuGFSeOnuxztc=;
        b=1MBXuytYtEcok4JJ90dJvXQKlZIS+lTDS4KUxLjjjhEAvYBBOWaJTrfpumGKCC4mq8
         yiccjqigXJcT0QfHzd/bQ6qm+w9MEav9na9yxAC3cke32tqmoCq/nVH98NGMlLParncR
         4EP5KaYdXflziORQzlG/Y6VoUQMhPwr3sWvuKoJ3oXp8SI+6qA4q63vjjw5yo9cmzZLJ
         gz3rOa9bb0I4qUTdYEhKcfgicOXr0k8hrguErvaYoAj01SFcn3mVGZ6QsCyA/pnP0gN+
         K85zfx9vnsd2xDgXVKDNa1afkM8n/ztXXyNO5ZU/XeIgzJHkKiKk2QNLGWsRxZgsaWiC
         jCMA==
X-Gm-Message-State: ANoB5pnJw32H6WxnPNJUiaFztCVOUadjLywG1pdeq64FqofcmkhmxQF3
	Qbc+2WqDF8IQ9OUG82/8jw==
X-Google-Smtp-Source: AA0mqf6qF068jOcZq5Clqc6PLJt0qCSUkbx+Op8bIK1f/R2Musri8+9p2qalTkmaXTGmtt/SSb+sHw==
X-Received: by 2002:a05:6871:438a:b0:13b:a9ac:ad64 with SMTP id lv10-20020a056871438a00b0013ba9acad64mr21826598oab.290.1669678081277;
        Mon, 28 Nov 2022 15:28:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b5-20020a056870d1c500b00143776f70d3sm5043217oac.29.2022.11.28.15.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 15:28:00 -0800 (PST)
Received: (nullmailer pid 1691394 invoked by uid 1000);
	Mon, 28 Nov 2022 23:27:59 -0000
Date: Mon, 28 Nov 2022 17:27:59 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	John Crispin <john@phrozen.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Marek Vasut <marex@denx.de>, 
	Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	Vivien Didelot <vivien.didelot@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Linus Walleij <linus.walleij@linaro.org>, UNGLinuxDriver@microchip.com, 
	Woojung Huh <woojung.huh@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	George McCollister <george.mccollister@gmail.com>
Subject: Re: [PATCH v3 net-next 04/10] dt-bindings: net: dsa: allow
 additional ethernet-port properties
Message-ID: <20221128232759.GB1513198-robh@kernel.org>
References: <20221127224734.885526-1-colin.foster@in-advantage.com>
 <20221127224734.885526-5-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127224734.885526-5-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_152803_250285_1931A5C6 
X-CRM114-Status: GOOD (  18.05  )
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

On Sun, Nov 27, 2022 at 02:47:28PM -0800, Colin Foster wrote:
> Explicitly allow additional properties for both the ethernet-port and
> ethernet-ports properties. This specifically will allow the qca8k.yaml
> binding to use shared properties.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
> 
> v2 -> v3
>   * No change
> 
> v1 -> v2
>   * New patch
> 
> ---
>  Documentation/devicetree/bindings/net/dsa/dsa.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> index bd1f0f7c14a8..87475c2ab092 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> @@ -38,6 +38,8 @@ patternProperties:
>        '#size-cells':
>          const: 0
>  
> +    additionalProperties: true
> +

Where then do we restrict adding properties to ethernet-ports nodes?

>      patternProperties:
>        "^(ethernet-)?port@[0-9]+$":
>          type: object
> @@ -45,7 +47,7 @@ patternProperties:
>  
>          $ref: dsa-port.yaml#
>  
> -        unevaluatedProperties: false
> +        unevaluatedProperties: true

Same question for ethernet-port nodes.

>  
>  oneOf:
>    - required:
> -- 
> 2.25.1
> 
> 

