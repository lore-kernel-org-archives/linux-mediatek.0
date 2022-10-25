Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8D9C38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 21:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deetLSjfSLw9NGtsLyl5oAnaBu5KwyE7PmCTC5CrpT4=; b=OEog2s0PB2CVMVrH4R/qPm8iBR
	o2iQr1mGAy004SXh8qhZpa7IXi+MSBk+RiVTkdodAj2hk2nddjMPg4pocrHvlwW8VWRhUep/kPCN4
	M7XGGHQDthfOn7899/nxDJ6SdJiztW0QGU3qYZ0VQDFV17/W+YFT5YbFb4Eyfs0VOYHgRZ6Eu6wQ/
	i/PLseT5SDZ5Ca6YTel9xBk1n6gefJErFU1BFSw77X0xQS11Xs+La1chrbgK1epac6xl/nLRa84uL
	Hvxm1EWhxr2+61bpNOfsSGC/uqDEYTf0l8Bfp5o01gjgINUr5jUKlpdMs+fS0iFpp7rAuYChoJ+3t
	S7Gr0N/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onRMN-007E9K-68; Tue, 25 Oct 2022 21:21:19 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onRMJ-007E8R-K2; Tue, 25 Oct 2022 21:21:17 +0000
Received: by mail-oo1-f49.google.com with SMTP id r15-20020a4abf0f000000b004761c7e6be1so2052355oop.9;
        Tue, 25 Oct 2022 14:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deetLSjfSLw9NGtsLyl5oAnaBu5KwyE7PmCTC5CrpT4=;
        b=KVKp0CVS+rELr8TabCZ0oZJ8bTtQQiezDvmAga3yVomgRY7+0KVmWWhj13GTEi52VL
         zCdXCH/ZOZtE9NfYD12bHbOanfpPiidkW+aCazCU8xkcdFm1wSwyy98jqhjq7ntKE2GK
         1WIuVEcwNzRE6M5MFWCsQ7sQDxzkvxqkW2f+8j42fRtWmQwUal+K8eFKlZbrb2CkMXvZ
         f9JDuMUTdx3GnA33T1iMSlMRecR/UoF7raQ7Z/xk/I47LW9XaAidyi6gDRJg/D7Kz+OS
         agAaQ0GiIXIKdZXZ1C7f9FpBVecmC0FXMXpMVee+/iM9qZWSMqk5Z30apKvNaZu2rA9B
         zGXg==
X-Gm-Message-State: ACrzQf1BxBrGQ2GnDNlLYjjz51sA0I7Rk4xjtMCLbu6cwtQyE52e9HYA
	PTkeM8FmrNvmnPNQRRLVpA==
X-Google-Smtp-Source: AMsMyM7B0w6ukcpx4u+vNpmoWkDfOMj27vFI0GB9Idy7Se4NJx5Z1z15XHQVQGmHzX5VFVzePHTM/w==
X-Received: by 2002:a4a:a387:0:b0:480:9a7a:4e99 with SMTP id s7-20020a4aa387000000b004809a7a4e99mr17647401ool.4.1666732873594;
        Tue, 25 Oct 2022 14:21:13 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c31-20020a9d27a2000000b006622d085a7fsm1449429otb.50.2022.10.25.14.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 14:21:13 -0700 (PDT)
Received: (nullmailer pid 3335003 invoked by uid 1000);
	Tue, 25 Oct 2022 21:21:14 -0000
Date: Tue, 25 Oct 2022 16:21:14 -0500
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, =?iso-8859-1?Q?n=E7_=DCNAL?= <arinc.unal@arinc9.com>, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v1 net-next 3/7] dt-bindings: net: dsa: qca8k: utilize
 shared dsa.yaml
Message-ID: <20221025212114.GA3322299-robh@kernel.org>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com>
 <20221025050355.3979380-4-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025050355.3979380-4-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_142115_676068_E5814A22 
X-CRM114-Status: GOOD (  22.64  )
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

On Mon, Oct 24, 2022 at 10:03:51PM -0700, Colin Foster wrote:
> The dsa.yaml binding contains duplicated bindings for address and size
> cells, as well as the reference to dsa-port.yaml. Instead of duplicating
> this information, remove the reference to dsa-port.yaml and include the
> full reference to dsa.yaml.

I don't think this works without further restructuring. Essentially, 
'unevaluatedProperties' on works on a single level. So every level has 
to define all properties at that level either directly in 
properties/patternProperties or within a $ref.

See how graph.yaml is structured and referenced for an example how this 
has to work.

> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> ---
>  .../devicetree/bindings/net/dsa/qca8k.yaml         | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> index 978162df51f7..7884f68cab73 100644
> --- a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> @@ -66,22 +66,16 @@ properties:
>                   With the legacy mapping the reg corresponding to the internal
>                   mdio is the switch reg with an offset of -1.
>  
> +$ref: "dsa.yaml#"
> +
>  patternProperties:
>    "^(ethernet-)?ports$":
>      type: object
> -    properties:
> -      '#address-cells':
> -        const: 1
> -      '#size-cells':
> -        const: 0
> -
>      patternProperties:
>        "^(ethernet-)?port@[0-6]$":
>          type: object
>          description: Ethernet switch ports
>  
> -        $ref: dsa-port.yaml#
> -
>          properties:
>            qca,sgmii-rxclk-falling-edge:
>              $ref: /schemas/types.yaml#/definitions/flag
> @@ -104,8 +98,6 @@ patternProperties:
>                SGMII on the QCA8337, it is advised to set this unless a communication
>                issue is observed.
>  
> -        unevaluatedProperties: false
> -

Dropping this means any undefined properties in port nodes won't be an 
error. Once I fix all the issues related to these missing, there will be 
a meta-schema checking for this (this could be one I fixed already).

>  oneOf:
>    - required:
>        - ports
> @@ -116,7 +108,7 @@ required:
>    - compatible
>    - reg
>  
> -additionalProperties: true

This should certainly be changed though. We should only have 'true' for 
incomplete collections of properties. IOW, for common bindings.

> +unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.25.1
> 
> 

