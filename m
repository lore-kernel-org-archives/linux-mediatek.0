Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CB4C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 23:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwVitJc+OKf+8w4wSRaaZOyHv8YAZ//3DtpKET00R7I=; b=s+DDzpA2v5K0qhhAGnI9KaLaWm
	xuiR6+XLvnt8eaElYp3wmpZTlOKjaXGFBjjjboeROFPD2a79th0eIcOJVv0Wy9UKdcKaok9HlplfY
	D1meqe5cjdeYFgw5yxJaeVjjJR+5t8X5R1vsfDOBmVdXzktzLmAG2rul310w7Gi9kD+/gUVoJx6/L
	gN+1fxR/OXGLPJ8uCCSffnTaKScQyZDqSvviKjZ29mhVAwfTrOpmLeZm2t6zy2eQU8xIf2mYe7z16
	sqzR0uKHE6P+XZZpgM9RVpAcemyhnWUNX+uxAOL/+CAKGq5boHF65nSKpk5rSEeIcsvIM1KWMnG2J
	MrB0P1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osuAy-000YOs-6X; Wed, 09 Nov 2022 23:08:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osuAv-000YNR-Fm; Wed, 09 Nov 2022 23:08:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id o30so110930wms.2;
        Wed, 09 Nov 2022 15:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LwVitJc+OKf+8w4wSRaaZOyHv8YAZ//3DtpKET00R7I=;
        b=hBckYn0WxZvQCSKJBFl3QcweKiTVzJiGEsjEaBhtXNElu3i8fx7xHVayMhZ/82qZWz
         Vw1DDRQpFx7OXW7pGWHrN6na6/ByAgBzax4W9/viPKIiJTtedoVNn0iLUB4jBLeIUU9l
         Ad1AHLLzd1eTEdb2Vq7bCkUK+1s61+bY1VZFLx/28sWvBPZcZBUa/5kIPRnmhyH8KsrE
         mmX0w3c1XIL2xypjVCrGVdZAMhiaSkjAx+4U6/03FzWoW63P5OsspCyPxf4YR7nZaZR7
         QG4NZR52xZe6IeJELNJ2cKzhvyJ5X/YqvryHyqAveQO6o8sUHcvV+yUSJ+bYRotzLoGo
         ETTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwVitJc+OKf+8w4wSRaaZOyHv8YAZ//3DtpKET00R7I=;
        b=KHfWNHL3rp0OwjPwMdHHq2KPATrm61/uYoLEYRVZEjSer651zZRa2kjo6MhyOwSCFP
         y4vpdkeQsZe1an654rEnQHqlU8vzjfKvtfYU42ExGxCPsQTrhlYvypxq30CUEDRZDFO6
         Ae1IOr9s1YmugmynwyIucAGuu3TlGR9v7oQtvxzsl5E4p2zUVtyuxPLhQcdMgKAvOyWm
         rvalsdj498EeZKiiZJaa/pPwMihrFQ7sqaFLYHkQ7YPTbxb32hG601oSpIh8b7B2AOmL
         HORdmMVD5g14BddV7kXLWXk2BdSKK/NuBEZdmHq9qnGzIZ1q0hzDLHQa3fhaJiVXXikw
         8CSA==
X-Gm-Message-State: ACrzQf1u5HxSN8OZ5Ab3CX5AxE8upQPysV/leGWlIqym/VfhTIqU41MK
	zTdBLRrf6uxwFVQAjcDZWaM=
X-Google-Smtp-Source: AMsMyM4AJxypXUVf/EsY503k79RpGyRHyzcplzZwHSA1aIE3JjDY7Zwoj701g6KVLOuJRL8C9m3FXg==
X-Received: by 2002:a05:600c:4b27:b0:3cf:8ec7:b8f with SMTP id i39-20020a05600c4b2700b003cf8ec70b8fmr23266575wmp.69.1668035283125;
        Wed, 09 Nov 2022 15:08:03 -0800 (PST)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id fc18-20020a05600c525200b003b49bd61b19sm3288752wmb.15.2022.11.09.15.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 15:08:02 -0800 (PST)
Date: Thu, 10 Nov 2022 01:07:59 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 net-next 2/6] dt-bindings: net: dsa: qca8k: utilize
 shared dsa.yaml
Message-ID: <20221109230759.gw7prntz7i5lxwiq@skbuf>
References: <20221104045204.746124-1-colin.foster@in-advantage.com>
 <20221104045204.746124-1-colin.foster@in-advantage.com>
 <20221104045204.746124-3-colin.foster@in-advantage.com>
 <20221104045204.746124-3-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104045204.746124-3-colin.foster@in-advantage.com>
 <20221104045204.746124-3-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_150805_596235_226A2631 
X-CRM114-Status: GOOD (  13.29  )
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

On Thu, Nov 03, 2022 at 09:52:00PM -0700, Colin Foster wrote:
> The dsa.yaml binding contains duplicated bindings for address and size
> cells, as well as the reference to dsa-port.yaml. Instead of duplicating
> this information, remove the reference to dsa-port.yaml and include the
> full reference to dsa.yaml.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> ---
> 
> v1 -> v2
>   * Add #address-cells and #size-cells to the switch layer. They aren't
>     part of dsa.yaml.

I'm afraid this is not the correct resolution to the warnings you saw.
There is no reason to have #address-cells = <1> under the "switch" node,
since none of that node's children have a unit address (see: "ports", "mdio").
The schema example is wrong, please fix that.

