Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7944BC352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCg69PxcTEnZD9ypvvoVMTCVaXFiqLTaSNGD0+eCQPE=; b=ZDEBLOhUIKvbKQ2VwIw+yA67DW
	q9VM5wEsvrOHYX8j5gji+QyFa4fopUByiooCBwVt0R1ifGSmNIgp+ESDwbwYNyofsVpwlq91ad/tR
	QGwpq7K7ZXsIBkFsYkQRNhKs4W4Qd4cspkxgmiLRym7L2j484Kpy+5e3b25POMWVtnYttYFY6dSt3
	tZbiCGIbgPDoi/4Y9BbUzdkJroKTetVG8qXj4KBMUzqVRbbAvWcjdBLU0u9IgCvN9f5GoDv4oiFCr
	e1vZURxpLhmEuuv6fImc3dJ0jUOj+aqzeUdT+2TBcv4cKX7T/yygBYZ8lfjAORetSoZS8WkMuYynY
	gNI9tPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Zog-00CLAd-8W; Tue, 06 Dec 2022 15:25:06 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Zik-00CDAu-Jz; Tue, 06 Dec 2022 15:19:00 +0000
Received: by mail-ed1-x52f.google.com with SMTP id c17so12181328edj.13;
        Tue, 06 Dec 2022 07:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zCg69PxcTEnZD9ypvvoVMTCVaXFiqLTaSNGD0+eCQPE=;
        b=cH5ll8ITXoCLPrvYcU1hy30FRvcJzbtDilmyuFA6iarvx9PvVME70Mb/e2dcCU0vFN
         Qvbb3fpzDmXNlb+7bjUPqHm1L4S9+5vNm1BzHSSDxZ6HSZ4HpolWlpFVQmpAOpsNqHkv
         JVLmoqPlYykuIrqq0oMO+mVtXn0yjv5+6p9NnRcgcVRjIbiuUhkLDt8TLejMjp59ZHzv
         jj8gwBOKBmYMABtQO4eiUUe2JSVHNCn6xHgtppUtp2ZzVQtB5zB/S5XOCQqRZZARrrq9
         7OGGHMkR1K3VU22icPM7ItTsUgnrueylfv6bK3/l12rldmt2qlWmU4dhyJQjIXg2DK+J
         QkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCg69PxcTEnZD9ypvvoVMTCVaXFiqLTaSNGD0+eCQPE=;
        b=fMHRzX9dSlIT8tLi05pnRFVlr+9XJWyDVudCH+xC10p7fWmK0f81ItlpFj5lOtQUHf
         +abyw4kjz0ogOiL2b3ql8Vt0U9npn0jhyB5pKquMtz/f/e5RZmUE5wTW1/cgvBCBmt7r
         Rrfy+LVxb8U+DCuftI6QIyMlYY2O+xLis0dF7a2fBI6Mg4DfemoPFeUyqUI1yLyg+GGR
         AyVTTq1zxjVRU1R9UXklfE6yLCQahN/V+5qYcd4mUpHr1aP/m08/AkaDaNxz4kGhM5Em
         FfoaOYM5Ich8tpidjFIemAqHOXCLU+s7h4LhouXoIR4m+LmcyKAw2pKDv1/J1nEpI2kX
         U+Bg==
X-Gm-Message-State: ANoB5plQIXL6c8mZ9ShiTBsa4l+wy8cDpAAbMaBh/6lIRoG1CF13ptzG
	JkGJUon7L88/KpIVzqzZ2pg=
X-Google-Smtp-Source: AA0mqf6hLPrOoTjF/q/L3ZonW9Mz8loX3zBymzOB2FMOlPKwkXVRfSgfD4cTMN8HkW/ASavaZ6Uqog==
X-Received: by 2002:a05:6402:5517:b0:461:c563:defa with SMTP id fi23-20020a056402551700b00461c563defamr76864192edb.72.1670339935459;
        Tue, 06 Dec 2022 07:18:55 -0800 (PST)
Received: from skbuf ([188.26.184.215])
        by smtp.gmail.com with ESMTPSA id v6-20020a170906180600b007c0c679ca2fsm5080046eje.26.2022.12.06.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 07:18:54 -0800 (PST)
Date: Tue, 6 Dec 2022 17:18:51 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	George McCollister <george.mccollister@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 net-next 3/9] dt-bindings: net: dsa: utilize base
 definitions for standard dsa switches
Message-ID: <20221206151851.hnqqwf6zgaa2c7tb@skbuf>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-4-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202204559.162619-4-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_071858_697147_26C5F368 
X-CRM114-Status: GOOD (  15.27  )
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

On Fri, Dec 02, 2022 at 12:45:53PM -0800, Colin Foster wrote:
> DSA switches can fall into one of two categories: switches where all ports
> follow standard '(ethernet-)?port' properties, and switches that have
> additional properties for the ports.
> 
> The scenario where DSA ports are all standardized can be handled by
> swtiches with a reference to the new 'dsa.yaml#/$defs/ethernet-ports'.
> 
> The scenario where DSA ports require additional properties can reference
> '$dsa.yaml#' directly. This will allow switches to reference these standard
> defitions of the DSA switch, but add additional properties under the port
> nodes.
> ---
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> index b9d48e357e77..b9e366e46aed 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> @@ -19,9 +19,6 @@ description:
>  select: false
>  
>  properties:
> -  $nodename:
> -    pattern: "^(ethernet-)?switch(@.*)?$"
> -

Does this deletion belong to this patch or to "dt-bindings: net: add
generic ethernet-switch"?

>    dsa,member:
>      minItems: 2
>      maxItems: 2
> @@ -58,4 +55,26 @@ oneOf:
>  
>  additionalProperties: true

