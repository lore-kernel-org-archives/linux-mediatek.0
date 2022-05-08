Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F45C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 May 2022 09:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZdXMzlTi7K9sPLA1tIZeio9qOpSsUoMe6RjVLQ/zzc=; b=2H1jjPuqKoRn8V
	n/oAxWvBY3VWbjfUBiswWHtlbObZCXbyBN7rRgev7Pfs6WlXcgV0ee0LqjReqLoqz3Om0F2GoUAZI
	LZ9KW3rdZMg8rLcRUhy61orWZAxBFKFse6EmfXgA7Wrx1fxnvkVoUrAoEI0PcgoH+RXhXVClxnhrH
	PMduJKUc8jOZQnvYulx63PuhuRHxDr7txKq2Yv37fJofZJYl+yNkrszUO3ya8tSuAP4cSsR6Bqvwk
	UTObEXDDYRzHr7QRsDdupK9Ptd7Q3E9LSaWczfeotAuozoRpEhHKfCnTKMSS0oaB6JVvt4CtlHtTs
	uCh4w5M+mo/dop+qFoKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nndQU-009hFU-Oa; Sun, 08 May 2022 09:42:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nndQR-009hCe-Bd; Sun, 08 May 2022 09:42:04 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nndQD-0008Ms-Hg; Sun, 08 May 2022 11:41:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 frank-w@public-files.de
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Greg Ungerer <gerg@kernel.org>,
 =?ISO-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v3 5/6] dt-bindings: net: dsa: make reset optional and add
 rgmii-mode to mt7531
Date: Sun, 08 May 2022 11:41:48 +0200
Message-ID: <2509116.Lt9SDvczpP@phil>
In-Reply-To: <DC0D3996-DFFE-4E71-B843-8D34C613D498@public-files.de>
References: <20220507170440.64005-1-linux@fw-web.de>
 <06157623-4b9c-6f26-e963-432c75cfc9e5@linaro.org>
 <DC0D3996-DFFE-4E71-B843-8D34C613D498@public-files.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_024203_445952_BD464E61 
X-CRM114-Status: GOOD (  22.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am Sonntag, 8. Mai 2022, 08:24:37 CEST schrieb Frank Wunderlich:
> Am 7. Mai 2022 22:01:22 MESZ schrieb Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:
> >On 07/05/2022 19:04, Frank Wunderlich wrote:
> >> From: Frank Wunderlich <frank-w@public-files.de>
> >> 
> >> Make reset optional as driver already supports it, 
> >
> >I do not see the connection between hardware needing or not needing a
> >reset GPIO and a driver supporting it or not... What does it mean?
> 
> My board has a shared gpio-reset between gmac and switch, so both will resetted if it is asserted. Currently it is set to the gmac and is aquired exclusive. Adding it to switch results in 2 problems:
> 
> - due to exclusive and already mapped to gmac, switch driver exits as it cannot get the reset-gpio again.
> - if i drop the reset from gmac and add to switch, it resets the gmac and this takes too long for switch to get up. Of course i can increase the wait time after reset,but dropping reset here was the easier way.
> 
> Using reset only on gmac side brings the switch up.

I think the issue is more for the description itself.

Devicetree is only meant to describe the hardware and does in general don't
care how any firmware (Linux-kernel, *BSD, etc) handles it. So going with
"the kernel does it this way" is not a valid reason for a binding change ;-) .

Instead in general want to reason that there are boards without this reset
facility and thus make it optional for those.

Heiko

> >> allow port 5 as
> >> cpu-port 
> >
> >How do you allow it here?
> 
> Argh, seems i accidentally removed this part and have not recognized while checking :(
> 
> It should only change description of reg for ports to:
> 
> "Port address described must be 5 or 6 for CPU port and from 0 to 5 for user ports."
> 
> regards Frank
> 





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
