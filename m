Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C71AC48260
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68+k4SXoZiAs2Pfmb+T8MrZfPAp6t3J0ktPdjp0hv2Q=; b=wQr0GLoxXRmhvjspojYXq4jqoV
	G0YxnyGkIe3DGt9Xft7cxGZrV6isRqLez47hKTHmT48vjMF0UOfrZ/Zlfs018HhWyA9H0fo5hIngF
	KLpA3B8Dhngpv2teE7hTph+GgFGwf3M0CSZ14JQNlXhvQ0mAL4G2azqs9DioF6Wd94U9QMEYL5Tke
	sj8L+PKQgWZs/Hku4/0fsX/IIJ214ykQ+L5z6erA2Gow7J4yUqkHyYR0FDUe99bDiLRfdTtFnlqdr
	w1UsZ8QEdIPckjghCzCSPzlx2ioApgntaWYhDqyaf5o1OS2/wBexqQAKypZM4tGaKIri/jhvc8ysw
	Fhh5S13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvwZ-007Wiu-0z;
	Thu, 25 Jan 2024 09:22:43 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvwV-007Whf-2R;
	Thu, 25 Jan 2024 09:22:41 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so700328466b.0;
        Thu, 25 Jan 2024 01:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706174558; x=1706779358; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=68+k4SXoZiAs2Pfmb+T8MrZfPAp6t3J0ktPdjp0hv2Q=;
        b=UYaW3WJvwGF6ZEL4cdKz6gXM01ZqEgzbLF4tvxOPncT6SYDv7G/RTo/7rglBIXI5dl
         E/7zCs6eet1gso4oRdUoLAvHKIQsXlPlaIuGi1ceY/Xbi6T4xC4MAVA4rp6BrROcyD9t
         DRjVqyHdIZ40C+YTXs5lsypezp9+drv+EnnpG5Q+0UK9/dD51Ol40kljNaQmmgblP40h
         5bnqNJhI++uFTdfjBjIX48VfFNOPgwqb37m/1Y19tIaBBBZwJaT2S4YcM7k6siEim8uJ
         B4YQnX2yCz6KUI0jK8ut+A1il4x7+GCDNhtj+SyOwSavAA1hyG3ryGzAL/M06RlqdArR
         O74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706174558; x=1706779358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68+k4SXoZiAs2Pfmb+T8MrZfPAp6t3J0ktPdjp0hv2Q=;
        b=siGUY10+Jmbg+4M8W3uLVU7y/hF38KUrgZkwXhLKgg5qoQsRK15D8tP7R4qUNFROIY
         lUXOZxxTBQeeUWF9llD2Sxtae4guU8ctHHQCSOK63c6hCg0K8LT898KuLYSrT3gI78zI
         lDW2fh+dNP0qK5Afc7eORL5I86aTOMSC/MMTJBFYOi1UMyvWIhP6NVKW5aWhYWmABmQ9
         oqeh7a1+uKeKYELWAihyH3P5YdX8nvzvIhDXx7AeA5L7cxFjPgjE6LlVNo4JBgVDS7w/
         utQ5GCZ/kEvpFaHlAag6q/VdUTZr4ve/c7Dhyy43admx31rSgz03VA0TmPa7KTSMQki7
         bqgg==
X-Gm-Message-State: AOJu0YwZi/Rhlwx+eZtoLZnA1gcRY3Dw3L10RSm0SLYOWtd76VhLwSrV
	xRCs2oF5Xw9j9GeAR+AbU0qQ5cqiWoHl4vmrhdrI7ZVWjnEElpJ7
X-Google-Smtp-Source: AGHT+IGb3kYbCaRZ+ZhuSYYXxrrQOg6MShvOglOKLYhAH70eCEZmTYRZfmR7UOLljeac6wIatBkRnA==
X-Received: by 2002:a17:906:1ccf:b0:a30:fb95:9387 with SMTP id i15-20020a1709061ccf00b00a30fb959387mr407499ejh.75.1706174557914;
        Thu, 25 Jan 2024 01:22:37 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id gw9-20020a170906f14900b00a311ab95fbdsm815922ejb.63.2024.01.25.01.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 01:22:37 -0800 (PST)
Date: Thu, 25 Jan 2024 11:22:34 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Bauer <mail@david-bauer.net>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: support OF-based registration
 of switch MDIO bus
Message-ID: <20240125092234.czwjwc3izmsl3ekr@skbuf>
References: <20240122053431.7751-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122053431.7751-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_012239_792432_A4F6E4B6 
X-CRM114-Status: GOOD (  19.71  )
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

On Mon, Jan 22, 2024 at 08:34:31AM +0300, Arınç ÜNAL wrote:
> Currently the MDIO bus of the switches the MT7530 DSA subdriver controls
> can only be registered as non-OF-based. Bring support for registering the
> bus OF-based.
> 
> The subdrivers that control switches [with MDIO bus] probed on OF must
> follow this logic to support all cases properly:
> 
> No switch MDIO bus defined: Populate ds->user_mii_bus, register the MDIO
> bus, set the interrupts for PHYs if "interrupt-controller" is defined at
> the switch node. This case should only be covered for the switches which
> their dt-bindings documentation didn't document the MDIO bus from the
> start. This is to keep supporting the device trees that do not describe the
> MDIO bus on the device tree but the MDIO bus is being used nonetheless.
> 
> Switch MDIO bus defined: Don't populate ds->user_mii_bus, register the MDIO
> bus, set the interrupts for PHYs if ["interrupt-controller" is defined at
> the switch node and "interrupts" is defined at the PHY nodes under the
> switch MDIO bus node].
> 
> Switch MDIO bus defined but explicitly disabled: If the device tree says
> status = "disabled" for the MDIO bus, we shouldn't need an MDIO bus at all.
> Instead, just exit as early as possible and do not call any MDIO API.
> 
> The use of ds->user_mii_bus is inappropriate when the MDIO bus of the
> switch is described on the device tree [1], which is why we don't populate
> ds->user_mii_bus in that case.
> 
> Link: https://lore.kernel.org/netdev/20231213120656.x46fyad6ls7sqyzv@skbuf/ [1]
> Suggested-by: David Bauer <mail@david-bauer.net>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

