Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A57C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpnE3eQS5jFmH8DCRl3EjJFlQbAfg13vFUXDbr+rro0=; b=qPWena2iuAgj2z
	jQYvLRLhQ4R6JYeeZjGowWADXnNTp+C1hDd6Iir07Bg7+qRALxuWsQ2Sjh7S06bQg07udZ1v8tYB3
	+hUQ6gkeSkWMQl1TDsgbqV8xImts1gr5Mq2HsI/WF7gmUw6KHUqESSNNBIueoZVGpKnpA0gtqn8LE
	8fhhwENF+Frm02phiNmPizs0r7Rlvom4D2c/fHsXUSjnRfbnia2opgRFGfMFcl4WidHiR5BqEEL+u
	eG3ZxQuMK92DzvJ+p4iVp6/8ech2XJ5kPk2SflqB9/Xe3p+i6QGqtyjBMbZiqMkffN7cgPmm6PoFi
	CQHl5Y4VcpiK41sc7JEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5kTw-002swX-AE; Fri, 07 Jan 2022 08:20:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5kTt-002svz-U7; Fri, 07 Jan 2022 08:20:15 +0000
X-UUID: d9b6bea570fa42fb8a7dd1625c1cb4a4-20220107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2d+nbRXvfaxn5Y+I3iJ2UI4goeWASKRLXryA9Ipx0vc=; 
 b=LHKjoj6JHMoAvylmJG1jqrEghA1MhDuOBNCsGgWsCJuP9QnHEOnbxjvLWQgZK18Y1erwybUnKW1bkxRWgg80QzCryICl+xwQRKjwpsZB25KiGejXOzM3kfJmtitgSjoYMGD1jTExlyhyFOKon6ArNz+k+XrevHXbL+8qIupVR2g=;
X-UUID: d9b6bea570fa42fb8a7dd1625c1cb4a4-20220107
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 647890231; Fri, 07 Jan 2022 01:20:10 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Jan 2022 00:20:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 7 Jan 2022 16:19:55 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 Jan 2022 16:19:54 +0800
Message-ID: <21ba4c9d2f3a7a3d8c12b303fc6bea4b19ef092f.camel@mediatek.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: add cap-sdio-async-int flag
From: Axe Yang <axe.yang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, "Eric
 Biggers" <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, "Stephen
 Boyd" <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
 <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Fri, 7 Jan 2022 16:19:54 +0800
In-Reply-To: <YdTLI/Nms4JiNutt@robh.at.kernel.org>
References: <20211227083641.12538-1-axe.yang@mediatek.com>
 <20211227083641.12538-2-axe.yang@mediatek.com>
 <YdTLI/Nms4JiNutt@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_002014_006400_E0E18C73 
X-CRM114-Status: GOOD (  19.97  )
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

On Tue, 2022-01-04 at 16:33 -0600, Rob Herring wrote:
> On Mon, Dec 27, 2021 at 04:36:39PM +0800, Axe Yang wrote:
> > Asynchronous interrupt is a mechanism that allow SDIO devices alarm
> > interrupt when host stop providing clock to card. Add a DT flag to
> > enable this feature if it is supported by SDIO card.
> 
> A card property should be in the card node. Is this not discoverable?

Thank you for your comment.
Async interrupt is not a 'card property', but more like a protocol.
The intention of this flag is to decide whether to support this feature
on SDIO host side.
Before that, host need to confirm that async interrupt is supported on
card side(by read and parse Support Async Interrupt segment in CCCR
from card).

> 
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
> > index 25ac8e200970..7230421583c6 100644
> > --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> > @@ -165,6 +165,11 @@ properties:
> >      description:
> >        eMMC hardware reset is supported
> >  
> > +  cap-sdio-async-int:
> 
> Perhaps be consistent with the next property and use 'irq'.

Will fix it in next version.

> 
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      SDIO async interrupt is supported.
> > +
> >    cap-sdio-irq:
> >      $ref: /schemas/types.yaml#/definitions/flag
> >      description:
> > -- 
> > 2.25.1
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
