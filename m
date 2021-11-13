Return-Path: <SRS0=uv63=QA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBA4C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 07:38:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B82610FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 07:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65B82610FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GmiKlCQxaQO3ZSmmr7elUpmDJYcYkNjc3PQ7L4IJGk=; b=KRoBKlU8xM8ZHG
	dsy9eZ/jZudmQD88nefezIiIj7ddH+FyrcSCmtShTqnE3Xa6X1WY1zXzubQ0fYLb31uv8u59P4tQs
	rETnqfXr3b6HvpH6aZhiTuk1PXctZY++pn75/nbbXfXhjecoA769rV67ePZpqbjUoMF5nGzPDXeun
	KQq8fnpiCxhN9bKz4AoiRwBx+UzLJ6A6ULq2rBdtQoT1bVaLW5OUEYz8tPnu6AsmolKVRjQoT6PLQ
	KZlX2RR60QdqxO8XPpVq+4yp0bZPW6chGGODJ9NSDhOfL1gzvby4EupnfzBOm6IIR4kv3mRDVpLdS
	1kgKspTrjXAHwkmUsfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlnbv-00CJHZ-Pp; Sat, 13 Nov 2021 07:38:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlnbj-00CJFv-8J; Sat, 13 Nov 2021 07:37:53 +0000
X-UUID: e21b220637a2453dbcd1efb66e8c4263-20211113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3CcmwmG9wnA+1Z3HaoflW55pO15Lyi+1HRNgCZzfSno=; 
 b=BkpEq3RQi0clhC/VK0HY5AxGgYBbPtuKKeHx5qcx07kG9v+PjH5hRp22F3IfnQmmaEY//PqQs2dO1KAO62NTOE7yaZ2eHyu2BELGHHXBtzYxj8mbayo9wfCAbA0OLLJ0uqij1CpMoFgkJC1lgBWKYG/q6G02bvZIdko8KtXbHio=;
X-UUID: e21b220637a2453dbcd1efb66e8c4263-20211113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 864764544; Sat, 13 Nov 2021 00:37:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Nov 2021 23:27:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 13 Nov 2021 15:27:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 13 Nov 2021 15:27:46 +0800
Message-ID: <24035c4a5cd6f33fded4fb30e2f153013663c403.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtk-xhci: add support ip-sleep
 for mt8195
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Sat, 13 Nov 2021 15:27:46 +0800
In-Reply-To: <YY6dAT3OHbu0CO/J@robh.at.kernel.org>
References: <20211102060049.1843-1-chunfeng.yun@mediatek.com>
 <YY6dAT3OHbu0CO/J@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_233751_344385_05A6C4C2 
X-CRM114-Status: GOOD (  16.59  )
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

On Fri, 2021-11-12 at 10:57 -0600, Rob Herring wrote:
> On Tue, Nov 02, 2021 at 02:00:47PM +0800, Chunfeng Yun wrote:
> > There are 4 USB controllers on MT8195, each controller's wakeup
> > control is
> > different, add some spicific versions for them.
> 
> specific
Will fix it, thanks

> 
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml          | 6
> > +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-
> > xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-
> > xhci.yaml
> > index 11f7bacd4e2b..41efb51638d1 100644
> > --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > @@ -146,7 +146,11 @@ properties:
> >              2 - used by mt2712 etc, revision 2 following IPM rule;
> >              101 - used by mt8183, specific 1.01;
> >              102 - used by mt8192, specific 1.02;
> > -          enum: [1, 2, 101, 102]
> > +            103 - used by mt8195, IP0, specific 1.03;
> > +            104 - used by mt8195, IP1, specific 1.04;
> > +            105 - used by mt8195, IP2, specific 1.05;
> > +            106 - used by mt8195, IP3, specific 1.06;
> > +          enum: [1, 2, 101, 102, 103, 104, 105, 106]
> >  
> >    mediatek,u3p-dis-msk:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > -- 
> > 2.18.0
> > 
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
