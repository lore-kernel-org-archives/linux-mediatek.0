Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB62C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 07:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kx9ox3RgFllICeSgyNZsvxiA5RGv5nECI+h9bNxUci0=; b=ItmQ/dySVAt6i/
	RQzuiwLRZss/muxlDop2uXM1my1Br02EPI7BaOsL9+W029y4yAzFw0a2VzIi0TzfJbxkOpd1QsQfJ
	ZV1A28UXMftdmqY2yS8YoDjM1GWvJxNvhyU14uWZY6IuRDmFVRu5m6dfi2QcvDgFgEYkI7h39HbpJ
	lLhOwA9VIE+qUMgNujrPubkjhYw/LeumhBzm4sfTE7++4x3kO3bm/4nJ4inFgpkYXtYO3wvbGzTJ9
	YuCQCICTxMLRPM/Qpw928h4liz+NhJDB6til8cwbAtlngR9a5hxrn3CWnLOLbuv0PqM6NshDOURyX
	RIpGHZySAwWK0Rqn3PZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM2kX-003tzW-42; Mon, 21 Feb 2022 07:04:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM2kU-003tyA-7j; Mon, 21 Feb 2022 07:04:43 +0000
X-UUID: 67013d65d72c4c538bf82001e8c4104f-20220221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uEoGdkJEqwlLmEYIXk929gZzrDXN5LNC5DDzVRIHOlc=; 
 b=YXFati4sGOP9d035luLPPf6DY/CARx9eNFbQ5WTjPW2y+TKNU9PTndzLLmc5QR6Y3qIl74ms2a6F2AEqgcUvtnJr0l0m+TAfO55TFTpYNkqmi99OGoBrJqewTvIumtMvcytpji6vycIalscv3pHwS2Ft7gPryH3kyaFh3CEuNW0=;
X-UUID: 67013d65d72c4c538bf82001e8c4104f-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 380254414; Mon, 21 Feb 2022 00:04:35 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 23:04:34 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 15:04:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 15:04:31 +0800
Message-ID: <21fa48195101b91c09b266f1c4f40eda5d127fdb.camel@mediatek.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mmc: add cap-sdio-async-irq flag
From: Axe Yang <axe.yang@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, "Eric
 Biggers" <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, "Stephen
 Boyd" <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
 <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 21 Feb 2022 15:04:31 +0800
In-Reply-To: <CAPDyKFr8bV+1uTbuhMObvORLGJHsvZHUONJkdY54MXPPRWL5Qw@mail.gmail.com>
References: <20220119103212.13158-1-axe.yang@mediatek.com>
 <20220119103212.13158-2-axe.yang@mediatek.com>
 <CAPDyKFr8bV+1uTbuhMObvORLGJHsvZHUONJkdY54MXPPRWL5Qw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_230442_309837_9979A247 
X-CRM114-Status: GOOD (  27.52  )
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

On Mon, 2022-02-14 at 16:23 +0100, Ulf Hansson wrote:
> On Wed, 19 Jan 2022 at 11:32, Axe Yang <axe.yang@mediatek.com> wrote:
> > 
> > Asynchronous interrupt is a mechanism that allow SDIO devices alarm
> > interrupt when host stop providing clock to card. Add a DT flag to
> > enable this feature if it is supported by SDIO card.
> > 
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 5
> > +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/mmc-
> > controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-
> > controller.yaml
> > index 513f3c8758aa..16fb06f88471 100644
> > --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> > @@ -165,6 +165,11 @@ properties:
> >      description:
> >        eMMC hardware reset is supported
> > 
> > +  cap-sdio-async-irq:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      SDIO async interrupt is supported.
> 
> We already have a DT property for this, I believe.
> 
> "wakeup-source" is probably what you want, but we have additional
> properties that are related to this too. See more below.
> 
> > +
> >    cap-sdio-irq:
> >      $ref: /schemas/types.yaml#/definitions/flag
> >      description:
> 
> The above, "cap-sdio-irq", informs whether the SDIO IRQs can be
> supported at all, by the host controller.
> 
> The property "keep-power-in-suspend" informs whether we can preserve
> the power to the card during a suspend/resume cycle. This should be
> needed in your case too, I think.
> 
> In other words, you may need to combine "cap-sdio-irq",
> "wakeup-source" and "keep-power-in-suspend" to describe your HW.
> 
> However, what perhaps is missing, is a common MMC/SDIO binding that
> let us describe an optional irq-line, which sometimes is being used
> for the wakeup irq. In the sdhci-omap case, we look for an irq
> mapping
> towards "wakeup" if specified in the "interrupt-names" property.
> 
> In some case, when the SDIO card supports an out-of-band IRQ line,
> the
> similar should be specified in the child-node corresponding to the
> SDIO card.
> 
> 

Yes, the intention of the patchset is to wakeup SDIO host in
runtime/system suspend state within SDIO DAT1(in-band wakeup).

I will implement it with "wakeup-source", thanks for your review.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
