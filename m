Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA22C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 09:11:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D0B161380
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 09:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D0B161380
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vaEY3FlqkZAcAHoA+8XRQoA6ibDp3KMSL7qj838CXOs=; b=CRPgp0NQepSILa
	4J+ejTVjtbuBe0cQUg3Ugz0fcPuIVuXr87IQJO45hx5Xac660jatuUoCIfpzn4gDUf5k6W3eTzCoq
	OMmn7xkrRzOEYd9c/4vzd330tywzkUcxWqelLxAu06sLgSMDdihdkyiB3cobZwwaVQFI7KGMXsXXA
	9K2+hnoC3kzso7xyBSY1iyVAh3W2R1ZcHgres5JJV1iVtLgzah2X3S0iZJ1aJM9l2H+mjZ4lTEdmf
	dE4/cXiDvJiNRTD8XK+bfThcIFTsb+Xa9rce642fFckFiQIjQQ4EBmyOo9Fsmt1KPGeeb2K0roIzc
	VWexRYpo6JC4yGpWc0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ERR-009YkH-6g; Tue, 13 Jul 2021 09:11:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ERC-009Yh2-Sy; Tue, 13 Jul 2021 09:10:48 +0000
X-UUID: 44f5dcc8697c464bbb4bc4d651665d34-20210713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/SkvQQ3+rtq2S0/tdyj0Z0yx4+LQp8I/gV8vayHB1eA=; 
 b=eJeCnaVA92IGHPSnF4fRU+uuPIXGaxtF5vFMGURAcc/jXq0+2SDrAZP4SGsRcPmL8NZBqrS/GDtLMoFSFLv7q/NXzkM/mqHx4nvYKq94h1faSNM3SIOQkzjjk2tji5eH4S1LVq3RGdRgvk/Af0xx7D2zVDCI89YxU4uzn3J+GVc=;
X-UUID: 44f5dcc8697c464bbb4bc4d651665d34-20210713
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 511010394; Tue, 13 Jul 2021 02:10:41 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 02:00:41 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 13 Jul 2021 17:00:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Jul 2021 17:00:38 +0800
Message-ID: <1626166838.29490.4.camel@mhfsdcap03>
Subject: Re: [PATCH v2 02/13] dt-bindings: usb: mtu3: add optional property
 to disable usb2 ports
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 13 Jul 2021 17:00:38 +0800
In-Reply-To: <20210712190809.GA2310371@robh.at.kernel.org>
References: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
 <1624008558-16949-3-git-send-email-chunfeng.yun@mediatek.com>
 <20210712190809.GA2310371@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1F30D6F3E0CBFBFE6BBF7E6E74BA7C17CB540E6A07D0FFC39EB0D4C6EC885D8A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_021047_010402_59EEF4BE 
X-CRM114-Status: GOOD (  21.83  )
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

On Mon, 2021-07-12 at 13:08 -0600, Rob Herring wrote:
> On Fri, Jun 18, 2021 at 05:29:07PM +0800, Chunfeng Yun wrote:
> > Add support to disable specific usb2 host ports, it's useful when
> > a usb2 port is disabled on some platforms, but enabled on others for
> > the same SoC, another case is that the different package may support
> > different number of ports.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: no changes
> > ---
> >  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> > index 2cac7a87ce36..3e6f2750f48d 100644
> > --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> > @@ -166,6 +166,12 @@ properties:
> >      description: The mask to disable u3ports, bit0 for u3port0,
> >        bit1 for u3port1, ... etc
> >  
> > +  mediatek,u2p-dis-msk:
> 
> Just spell out 'mask'.
There is already a property "mediatek,u3p-dis-msk", prefer to use the
same format, thanks

> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: The mask to disable u2ports, bit0 for u2port0,
> > +      bit1 for u2port1, ... etc; but can't disable u2port0 if dual role mode
> > +      is enabled, so will be skipped in this case.
> > +
> >  # Required child node when support dual-role
> >  patternProperties:
> >    "^usb@[0-9a-f]+$":
> > -- 
> > 2.18.0
> > 
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
