Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB2BC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 21:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mjzds2RzECUq1xcqjJsP8nfg2ZPV+dnkXlgwu7if9PE=; b=oaeokboM3UTpslZr64gCmx2LQd
	XKPYHKdVNo++cGPmn7bRWZt/yYvtc1647jp8ulpSuEdMSpf65I98dLEGG4DB2VyPl3oM4qQmMadHg
	nX08dDgtzZJ7noDrKNKo+K5v01wtBK5G/sFarNzh3GKatkIftvt7rHpeJ9+dh542dWrFNl+AALikz
	BxmdUpiVbHNKsbJCGSod2bKQdWmSTEFo9T60i6Kki+WSZpCrmhjKz9pXfX4L3uRNUT00DgBvK3qNl
	ZpYIEabqoMLsfCn4cM7f2+Q70N2xv9lK/KkpBhdfkCp7dP/p/vvXKgW/Tol/SkT0dwLAbCjh5BHk8
	UjZSGMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JJZ-00AusJ-PM; Mon, 05 Dec 2022 21:47:53 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JJX-00Aup8-8X; Mon, 05 Dec 2022 21:47:52 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-142b72a728fso15079991fac.9;
        Mon, 05 Dec 2022 13:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mjzds2RzECUq1xcqjJsP8nfg2ZPV+dnkXlgwu7if9PE=;
        b=nLxcstJY+BHVG3PztOv43AKINLN1qLzF7Jx2/toiE6LY/7EiSeZfod3Rj8zC8Ac/qp
         2BaA1ydMK/ogNxP0eleGOUKQKwLJ+6T4n7ptKcNMG4RZusGeygeSNK6UnjO9CY2VlENr
         uXQlGLoJtJjO+ZgASK3uNxCAzh+CCrAUHXr++4P+5zbp2cW5o58kgoBdXP7Ng970Tcl2
         Ye0PgXS/IsiS+7GmdpuKJDcDDbCnar9eyJVKDWa3MSF//94+92rolXydXTUcyJpjkXDV
         W/GmaPf6rL8CaKWj0AayD2jsznHEhi9fSW0Y0tXh72uZIVgx786LRTWJmhZxTlrPK4I3
         290A==
X-Gm-Message-State: ANoB5pl+SCEkvff3d1jStunVxBorNixZpbNcIo/NwmhDDzl0CHTz2Jin
	Y4XTaEj3822wfW8SYvXB4Q==
X-Google-Smtp-Source: AA0mqf4QO8UMt6OJ+ls46GBA4Vjcws9My+eLdy2ZBabpLPBkFaP2SMxFEfNh2jRUy5s9QIaB0EhSmg==
X-Received: by 2002:a05:6870:7988:b0:13c:84e6:96d2 with SMTP id he8-20020a056870798800b0013c84e696d2mr4030384oab.72.1670276869061;
        Mon, 05 Dec 2022 13:47:49 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y7-20020a4ac407000000b0049ea9654facsm7064489oop.32.2022.12.05.13.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:47:48 -0800 (PST)
Received: (nullmailer pid 2682645 invoked by uid 1000);
	Mon, 05 Dec 2022 21:47:47 -0000
Date: Mon, 5 Dec 2022 15:47:47 -0600
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
Subject: Re: [PATCH v4 net-next 7/9] dt-bindings: net: add generic
 ethernet-switch
Message-ID: <20221205214747.GA2679200-robh@kernel.org>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-8-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202204559.162619-8-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_134751_373377_D9C6CF2A 
X-CRM114-Status: GOOD (  17.64  )
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

On Fri, Dec 02, 2022 at 12:45:57PM -0800, Colin Foster wrote:
> The dsa.yaml bindings had references that can apply to non-dsa switches. To
> prevent duplication of this information, keep the dsa-specific information
> inside dsa.yaml and move the remaining generic information to the newly
> created ethernet-switch.yaml.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> 
> v3 -> v4
>   * Update ethernet-ports and ethernet-port nodes to match what the new
>     dsa.yaml has. Namely:
>       "unevaluatedProperties: false" instead of "additionalProperties: true"
>       "additionalProperties: true" instead of "unevaluatedProperties: true"
>     for ethernet-ports and ethernet-port, respectively.
>   * Add Florian Reviewed tag
> 
> v2 -> v3
>   * Change ethernet-switch.yaml title from "Ethernet Switch Device
>     Tree Bindings" to "Generic Ethernet Switch"
>   * Rework ethernet-switch.yaml description
>   * Add base defs structure for switches that don't have any additional
>     properties.
>   * Add "additionalProperties: true" under "^(ethernet-)?ports$" node
>   * Correct port reference from /schemas/net/dsa/dsa-port.yaml# to
>     ethernet-controller.yaml#
> 
> v1 -> v2
>   * No net change, but deletions from dsa.yaml included the changes for
>     "addionalProperties: true" under ports and "unevaluatedProperties:
>     true" under port.
> 
> ---
>  .../devicetree/bindings/net/dsa/dsa.yaml      | 28 +-------
>  .../bindings/net/ethernet-switch.yaml         | 66 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 69 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-switch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> index 5081f4979f1b..843205ea722d 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> @@ -18,6 +18,8 @@ description:
>  
>  select: false
>  
> +$ref: "/schemas/net/ethernet-switch.yaml#"

You can drop quotes here.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

This is a nice clean-up.

Rob

