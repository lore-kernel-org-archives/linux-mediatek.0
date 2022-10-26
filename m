Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99C3C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 17:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HB//srE+jyi0FWpKiy+4h9s6yd6ZaGXhIBWWMCtKONM=; b=NvEy9BcB2AiSGeQIOgdEdPcEkS
	sCvRABaW4TZ4rbwIQfNZ3oSwqkQQ7pWEQRU1tRdNZx5P6mxkEdFeehlWgHb2jB7bvTgYgYKXdUzN7
	mdPAVECQewZZU8Gjcu/a60RDMac6i1nvpWp5uXQg9uwxYCh8FVVhA+s02PgqVXfjfEj9/dlW0+O82
	743sVKZ+hOkNfDOSK56//1GJFg2bI2Dqu4+OBldjC/oM6JHju7zykS6E+ovnvgXsQsHGGndIq1QLn
	lnn2XM/CNriV95ozx2yI5VQcYFw/vw2cNdfai8TgaCxiSWT/qi+MolsUwC5NONfybzedD1I0FKGga
	J3p50YTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onkUf-00AQhc-EB; Wed, 26 Oct 2022 17:47:09 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onkUd-00AQg9-7o; Wed, 26 Oct 2022 17:47:08 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13bd19c3b68so10422367fac.7;
        Wed, 26 Oct 2022 10:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HB//srE+jyi0FWpKiy+4h9s6yd6ZaGXhIBWWMCtKONM=;
        b=aJlZ4XPvU/q3JZwvih+TIr+QjqcQFmvC7o0ebvNJa+JIsrZrplk843z3qUEUVe1g75
         VFMdpZrbIMhllF3GptSCBdt/qPkIo7i/exjOYgLRTlZRSk92rxbBnMXznJgXmhsIbzsq
         AM4BNSJzozi5KvIMV1iR18qKInJcreHk+l2kH7YPy8rdygXAy76Q4RvJYiuxWG23J6HY
         r5o8/paM9h4f4p3bj4JnwVka2d9n4OGZi3EQlf6p5XEr8rVTNGGqzuekHbq0yafT1CB1
         NJ/lwynV7n5E8IlOiMH0mA1whH4V0gY89fcMrhzEdyP2E66PoLdplirKPrrV5logkrN1
         duqg==
X-Gm-Message-State: ACrzQf2Q/+Am5o7laK5eXaZYIsdeYhRdYlIqOwvQbZgnaXeI/o0LavDF
	1bvMjofqaJud4gOl3RtJoQ==
X-Google-Smtp-Source: AMsMyM7519BMQbcZ6P8S30eJ39PNdmtUMBDMdv4cp8EuTysDhqzQIi3UvRg1RXimILV387Wj+AclvQ==
X-Received: by 2002:a05:6870:63aa:b0:13a:fe6c:5ed0 with SMTP id t42-20020a05687063aa00b0013afe6c5ed0mr3049476oap.257.1666806423841;
        Wed, 26 Oct 2022 10:47:03 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z22-20020a4a2256000000b004767df8f231sm2349508ooe.39.2022.10.26.10.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 10:47:03 -0700 (PDT)
Received: (nullmailer pid 811863 invoked by uid 1000);
	Wed, 26 Oct 2022 17:47:04 -0000
Date: Wed, 26 Oct 2022 12:47:04 -0500
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, =?iso-8859-1?Q?n=E7_=DCNAL?= <arinc.unal@arinc9.com>, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v1 net-next 7/7] dt-bindings: net: mscc,vsc7514-switch:
 utilize generic ethernet-switch.yaml
Message-ID: <20221026174704.GA809642-robh@kernel.org>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com>
 <20221025050355.3979380-8-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025050355.3979380-8-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_104707_300671_E9C1E9C2 
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

On Mon, Oct 24, 2022 at 10:03:55PM -0700, Colin Foster wrote:
> Several bindings for ethernet switches are available for non-dsa switches
> by way of ethernet-switch.yaml. Remove these duplicate entries and utilize
> the common bindings for the VSC7514.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> ---
>  .../bindings/net/mscc,vsc7514-switch.yaml     | 36 +------------------
>  1 file changed, 1 insertion(+), 35 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
> index ee0a504bdb24..1703bd46c3ca 100644
> --- a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
> @@ -19,11 +19,8 @@ description: |
>    packet extraction/injection.
>  
>  properties:
> -  $nodename:
> -    pattern: "^switch@[0-9a-f]+$"
> -
>    compatible:
> -    const: mscc,vsc7514-switch
> +    $ref: ethernet-switch.yaml#

??? 'compatible' is a node?

Rob

