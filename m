Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1084CC04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 16:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8tMSv2rkDYD5DdVC6rtsdDDGUU1tvaLkA//RD8Fdsw=; b=ACD/BvZL1L6DsA3eVF7CZ9bAkE
	SPKvmaBR2ZO+Vd9FAKpouz5w0arwxact5/pCNMoBm6+6Ngsx9olb3OKEQZKnDP/7baIExWckI0nsO
	mMfN0c/yNUFpUd+VeRoclv0vvkgjz83QIdqJRdaOnd195w4X3/xh2BSVjwyv1KXyQWvQoJRpzIp5O
	8zeYDduEiRZR/+sLpebO5LfFnC1upax4g0fNhEDRqVPQ/SDUdwp8meCOqnhcx/n1MseR/IO61/bCe
	UA98bieYDIVRkiK3zJ6SXOP39uuPa73hbZOMoWAm7jL5gre6L5ULaF9R4S0hCigzQakO1/qAgvb0E
	ElWupKKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH6C1-00Ase3-CX; Thu, 28 Jul 2022 16:16:57 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH6Bh-00AsHA-8J; Thu, 28 Jul 2022 16:16:38 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1oH6Aw-0008D9-2T;
	Thu, 28 Jul 2022 18:15:51 +0200
Date: Thu, 28 Jul 2022 18:14:47 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [RFC PATCH net-next] dt-bindings: net: dsa: mediatek,mt7530:
 completely rework binding
Message-ID: <YuK193gAQ+Rwe26s@makrotopia.org>
References: <20220726122406.31043-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726122406.31043-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_091637_314454_24BB263E 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sander Vanheule <sander@svanheule.net>, =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

please see a minor comment inline below:

On Tue, Jul 26, 2022 at 03:24:06PM +0300, Arınç ÜNAL wrote:
> [...]
> -  CPU-Ports need a phy-mode property:
> -    Allowed values on mt7530 and mt7621:
> -      - "rgmii"
> -      - "trgmii"
> -    On mt7531:
> -      - "1000base-x"
> -      - "2500base-x"
> -      - "rgmii"
> -      - "sgmii"
> +  There are two versions of MT7530. MT7621AT, MT7621DAT, MT7621ST and MT7623AI

There are two version of MT7530 **supported by this driver**.....
(MT7620 also contains MT7530, switch registers are directly mapped into
SoC's memory map rather than using MDIO like on MT7621 and standalone
variants, and it got FastEthernet PHYs for Port 0-4)


