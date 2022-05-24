Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCE4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 03:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iU5ho5n1MhEQfzTAG8wjM0czIB90Is+nUxDlrkz2/lQ=; b=VCYwMIa3P2SfB3
	9fqAa/r2DcGVEljDlSIeYMTQKwmTI+VJEKkDpzOupueP+bh7OWvPTFzfZSCwJlTJ0LJg/eyKmjZH2
	S3D4+WI4zoPO+RSFZLwe1+1hMEOC8JkwQ0Ug3JSfY8seBp1b90S/rqdpOenLQ+2mEyf9dW+hwzsnO
	w1P+qCQFHxFbWC7+8kRyNIGgzd5/t5Jr8r3ZOrDenv0VJcgYmjxuu8O7DYJiqZxw5nKYpu883czEj
	7ihuE15DVwwxSwpJFZUqCAwZvDw8SQejtF0AHBI86tnD91KrpFjIgckUjGoWvtk8NnzASp+otkWjF
	GFIJRxl/hSOYvUa0ExCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntKyv-006ebi-Ny; Tue, 24 May 2022 03:13:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntKyj-006eaW-8X; Tue, 24 May 2022 03:13:04 +0000
X-UUID: 0db6c52b62a544cba50e57cbd8357640-20220523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZrLByKMLaDySPzY7pePqzCsnctAx+/zjZgkRRO0fBbA=; 
 b=VGxcVdu8HERVJcWgkSd/QiNFSSDaUXxz3DirqPhfnFe13M4XB7hI7/oi6ERLEWCkqBxkk3t4nu6wHt9iM+G/dJdS0a5qJWQPd9TtL4AhZZUg4gZetVcKAo1r9QxEhmz49IMlx69m+B2tpkWVb7zrw7BaXaT4DTnfLDwJ9jJ8QqM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:bab72e0b-66e7-414a-bfd5-f4500c9acb4e, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:e2dd607a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 0db6c52b62a544cba50e57cbd8357640-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 311417162; Mon, 23 May 2022 20:12:48 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 20:02:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 24 May 2022 11:02:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 24 May 2022 11:02:44 +0800
Message-ID: <45e49226ddbe44a5205f015c4c80e49239c5d9aa.camel@mediatek.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: mtk-xhci: add support 'resets'
 property
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Date: Tue, 24 May 2022 11:02:43 +0800
In-Reply-To: <40eb8f7ed5b5d6dc3aeb5b82e04986049a2e47f3.camel@mediatek.com>
References: <20220523090449.14430-1-chunfeng.yun@mediatek.com>
 <40eb8f7ed5b5d6dc3aeb5b82e04986049a2e47f3.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_201301_356590_05DAB44F 
X-CRM114-Status: GOOD (  21.74  )
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

Hi Rex-BC,

On Mon, 2022-05-23 at 18:41 +0800, Rex-BC Chen wrote:
> On Mon, 2022-05-23 at 17:04 +0800, Chunfeng Yun wrote:
> > Add 'resets' property to support IP reset usually by top pericfg.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 3
> > +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-
> > xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-
> > xhci.yaml
> > index 084d7135b2d9..892718459d25 100644
> > --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > @@ -113,6 +113,9 @@ properties:
> >    vbus-supply:
> >      description: Regulator of USB VBUS5v
> >  
> > +  resets:
> > +    maxItems: 1
> > +
> >    usb3-lpm-capable: true
> >  
> >    usb2-lpm-disable: true
> 
> Hello Chunfeng,
> 
> Which soc we will use this reset?
This is common for all SoCs, can use it if there is a reset controller
driver supported.

> I am upstreaming another series for system clock reset.
That's good
> I think you should add how to use for this series base on [1].
Currently I test it on mt8195 based on ti-syscon reset driver, luckly
this is transparent for our usb controller drivers;

I could add patches to use this 'resets' property on mt8195/8186 if the
below series are applied.

Thanks

> 
> [1]: 
> 
https://lore.kernel.org/linux-clk/5067ec46-7a82-6b7b-5b07-3102cfaefbf6@collabora.com/T/#m5b6abb9bd2109e4ed9a1a3eeee6e7976892cb8c2
> 
> BRs,
> Rex
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
