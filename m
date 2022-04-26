Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8989EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 11:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7ba/dWlx17GmDNSY6+KTXudX+cHx12R2mWR4mtkqRs=; b=f36lQ3H8zAMd5f
	9KNuKlvzKeQLKMDUKM9swMCPaUHHh5WGpZEmOKgTerYqjgGkGYkkoppjRsOHkCTCPz5OEq/gQpEFP
	2h9B8xXkfWCQ2G0AJJu6nDL2U1eOF1DSLIgDnq26iGlEFT6ZOHTaMamNPvZ8MslsRoy++qsJ9CRFr
	PmrRz7+tvp7h3yUSh9MTYuqrLZZTXeB60OmX0aKIQr6vNHk3t8Z8uHe6FPG+F3pAPb5mY2QR3zT9b
	Q3BpbvswuhSkOvtX7GX+UTjU8yn06vhkEkbF0zqaL1Nfa/cWvJE8aSsLDoyKTa2D801QGg+zOjl5P
	PeCNRAdpyX/wyTez9adg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njJWs-00E6jj-F7; Tue, 26 Apr 2022 11:38:50 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njJWo-00E6fl-Kn; Tue, 26 Apr 2022 11:38:48 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1njJWa-0002ta-00; Tue, 26 Apr 2022 13:38:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 8E0F3C01B1; Tue, 26 Apr 2022 11:32:03 +0200 (CEST)
Date: Tue, 26 Apr 2022 11:32:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] MIPS: dts: align SPI NOR node name with dtschema
Message-ID: <20220426093203.GA9655@alpha.franken.de>
References: <20220407143328.295762-1-krzysztof.kozlowski@linaro.org>
 <249f6136-6dd6-0c03-df86-7da02a1b17f0@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <249f6136-6dd6-0c03-df86-7da02a1b17f0@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_043846_854456_B0003C0C 
X-CRM114-Status: GOOD (  14.83  )
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

On Tue, Apr 26, 2022 at 09:46:33AM +0200, Krzysztof Kozlowski wrote:
> On 07/04/2022 16:33, Krzysztof Kozlowski wrote:
> > The node names should be generic and SPI NOR dtschema expects "flash".
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  arch/mips/boot/dts/brcm/bcm97358svmb.dts                   | 2 +-
> >  arch/mips/boot/dts/brcm/bcm97360svmb.dts                   | 2 +-
> >  arch/mips/boot/dts/brcm/bcm97425svmb.dts                   | 2 +-
> >  arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 2 +-
> >  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts         | 2 +-
> >  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts         | 2 +-
> >  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> Hi all,
> 
> Anyone from MIPS folks willing to take it? I got three acks, so maybe
> that means I should handle it?

I'll take it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
