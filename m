Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FDFC41513
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Rm7sueqxojm9JNpe+lV9lCDU26xLCvtonjU/f9MC04=; b=P7PCokxrW5rmamG0TljqyH24SS
	a8JKiEVdg+OC2VFVpv/i+FdbN2yvopaSeRnTCL2KmJTHbAGf7DADxfXWAqVVdO9icCQGWW/EZkyzH
	3jTUOTBcVLgdflqxnCm5KQogZ7rgy8+ITNFT94NbPxax5xfocOQXjhmr/oOS4+dmytm/Ow/UFPy+/
	qZbbBtLMKso6CugdbzVl8b4xp17Jk6Rk/lyCbiTCccea4yVKHnKZWLMAZXJXLrGMdM4ZTrZIwNL30
	w/6mAGQ7U7twvWz5jg3xwTYDkmMmjHV/hQo5/slWIjnuOxpNJOPgnEr17P/vBkad1ijpm+4U5Ki2O
	HSOr2j9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPh3F-0000000FmyW-49W0;
	Fri, 05 Jul 2024 11:24:29 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPh3C-0000000Fmwl-2vMu;
	Fri, 05 Jul 2024 11:24:28 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sPh37-00000000572-213d;
	Fri, 05 Jul 2024 11:24:21 +0000
Date: Fri, 5 Jul 2024 12:24:18 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Elad Yifee <eladwf@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: ethernet: mediatek: Allow gaps in MAC
 allocation
Message-ID: <ZofX4qfGf93Q8jys@makrotopia.org>
References: <379ae584cea112db60f4ada79c7e5ba4f3364a64.1719862038.git.daniel@makrotopia.org>
 <3bda121b-f11d-44d1-a761-15195f8a418c@intel.com>
 <C24C4687-1C00-434D-8C37-BDB85E39456C@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C24C4687-1C00-434D-8C37-BDB85E39456C@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_042426_757333_EBE58D2C 
X-CRM114-Status: GOOD (  21.19  )
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

Hi netdev maintainers,

On Tue, Jul 02, 2024 at 09:05:19AM +0000, Daniel Golle wrote:
> >what about:
> >4733│ static int mtk_sgmii_init(struct mtk_eth *eth)
> >4734│ {
> >4735│         struct device_node *np;
> >4736│         struct regmap *regmap;
> >4737│         u32 flags;
> >4738│         int i;
> >4739│
> >4740│         for (i = 0; i < MTK_MAX_DEVS; i++) {
> >4741│                 np = of_parse_phandle(eth->dev->of_node, "mediatek,sgmiisys", i);
> >4742│                 if (!np)
> >4743│                         break;
> >
> >should we also continue here?
> 
> Good point. As sgmiisys is defined in dtsi it's not so relevant in
> practise though, as the SoC components are of course always present even
> if we don't use them. Probably it is still better to not be overly
> strict on the presence of things we may not even use, not even emit an
> error message and silently break something else, so yes, worth fixing
> imho.
> 

I've noticed that this patch was marked as "Changes Requested" on patchwork
despite having received a positive review.

I'm afraid this is possibly due to a misunderstanding:

The (unrelated and rather exotic) similar issue pointed to by Przemek
Kitszel should not be fixed in the same commit. It is unrelated, and if
at all, should be sent to 'net' tree rather than 'net-next'.

Looking at it more closely I would not consider it an issue as we
currently in the bindings we **require** the correct number of sgmiisys phandles to be
present for each SoC supporting SGMII:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/mediatek,net.yaml#n200
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/mediatek,net.yaml#n245
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/mediatek,net.yaml#n287
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/mediatek,net.yaml#n325

Hence there aren't ever any gaps, also because the sgmiisys phandles are
defined in the SoC-specific DTSI **even for boards not making any use of
them**.

I hence would like this very patch to be merged (or at least discussed)
as-is, and if there is really a need to address the issue mentioned by
Przemek Kitszel, then deal with it in a separate commit.


Cheers


Daniel

