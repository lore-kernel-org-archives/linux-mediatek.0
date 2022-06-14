Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81570C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KeZmPWSWJ9Dkjw+S/y1hbP8tLqiqiRcZZWwTGy6nsIE=; b=mZQa+DsQP8Xe9/
	K5kHM488dgM5fiZ/RTuk4gbCnMcfSbj2zkfEqYz12XL8Rq1PdwKaMD2NhAi4iNJOqugqVEsGL29aU
	SO+ityTIMOMAWlXAjiTUhVse66IhS3HBMxV9y01cqpF8jtiug5M33O7MZ1mHL54Na1GZlyeB56i1w
	ueQJiLCRKYfpgQJFGBbgG1z3LE1jcEbE0FLRGIIPpZu2w2r1muQGzTVggEO/OC4M97hZ/5cMgRj+Y
	L1b/LsFrP03p8cznlzNGJu0EmcEaB4mTbGBKO6l2Wc+T9QtDqoYINpSE+7Ke9Gh0I4WnyIazHx4g3
	c3RgjVRJYsLGKOZSZ8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1F5g-00Bc5T-74; Tue, 14 Jun 2022 22:32:52 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1F5c-00Bc4K-Tm; Tue, 14 Jun 2022 22:32:50 +0000
Received: by mail-io1-f45.google.com with SMTP id h8so10903382iof.11;
        Tue, 14 Jun 2022 15:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CVcb2QfZlvcldcNaLh32HL82gx/d45G76khp2L61DK4=;
        b=h4smxfcnhJxlQX6lpfCY+j3RSL3wCDhThYdq63jRKjmw/pGPuaM+G13bgpJm3pdk5y
         /nazUwE4YLS2W7WY/gqMYi7iP5D9ExydFDkYie/UefWux8Zsz52rf6hMLs7s1iJV5Ubh
         XU/0NWnm2DSqYS/WdTJHp6JAFNWsCIn5wssJWywbnKeUCYtXcAF9y/Dd+qaPHiijhANP
         xBaSd7fy+tN5TDbFSNFSvjECxnWI6OYbPFns0EXiMZpMtHwpmopnIKbBnMeTnYZty+bf
         i0qhdDcp/ftBDC0KFCcONnvkHnhgVEJhEqV9lnFOyV7hIWkVbn3WLSrgI/u4mGLaE1dg
         hOrg==
X-Gm-Message-State: AOAM530mjUXpKgXZX+X12Qwkc+y3T4tEfZCYJyyLTZM5yZitJjIk1r03
	uMckbVqkdeyRLzg4E5TJsw==
X-Google-Smtp-Source: ABdhPJyq0EVA3Gxzc2qJ8HO4/M8DLzAPSmeeI6l+hyZb/y7hNm8hyd6w4gg3LC5iya2L+50YOqknZg==
X-Received: by 2002:a05:6638:1411:b0:331:ac08:5ae3 with SMTP id k17-20020a056638141100b00331ac085ae3mr4141226jad.162.1655245964991;
        Tue, 14 Jun 2022 15:32:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id u9-20020a92da89000000b002d4032b41casm5974649iln.32.2022.06.14.15.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 15:32:44 -0700 (PDT)
Received: (nullmailer pid 2848738 invoked by uid 1000);
	Tue, 14 Jun 2022 22:32:42 -0000
Date: Tue, 14 Jun 2022 16:32:42 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v4 1/6] dt-bindings: net: dsa: convert binding for
 mediatek switches
Message-ID: <20220614223242.GA2848631-robh@kernel.org>
References: <20220610170541.8643-1-linux@fw-web.de>
 <20220610170541.8643-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610170541.8643-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_153248_986333_0E81BD47 
X-CRM114-Status: GOOD (  16.85  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>, =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, linux-rockchip@lists.infradead.org, Greg Ungerer <gerg@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jun 2022 19:05:36 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Convert txt binding to yaml binding for Mediatek switches.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v4:
> - fix squash of port 5 as cpu-port
> - drop type from interrupt-controller and add depency for this
> - use ethernet-ports in examples
> - drop address-/size-cells
> 
> v3:
> - include standalone patch in mt7530 series
> - drop some descriptions (gpio-cells,reset-gpios,reset-names)
> - drop | from descriptions
> - move patternProperties above allOf
> 
> v2:
> - rename mediatek.yaml => mediatek,mt7530.yaml
> - drop "boolean" in description
> - drop description for interrupt-properties
> - drop #interrupt-cells as requirement
> - example: eth=>ethernet,mdio0=>mdio,comment indention
> - replace 0 by GPIO_ACTIVE_HIGH in first example
> - use port(s)-pattern from dsa.yaml
> - adress/size-cells not added to required because this
>   is defined at mdio-level inc current dts , not switch level
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 406 ++++++++++++++++++
>  .../devicetree/bindings/net/dsa/mt7530.txt    | 327 --------------
>  2 files changed, 406 insertions(+), 327 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/dsa/mt7530.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
