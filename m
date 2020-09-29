Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB84C4346E
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 06:09:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1A9E20C09
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 06:09:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a9nyEnZw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="h1SlIvBr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1A9E20C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cLmLz0NTJJ/2yZcaWkl6tVNHvz0L+rmkHVOkYXRPBEI=; b=a9nyEnZwIMry0vVycJsLJZcDm
	oIQce/nrEH8RxblBi1/RtIkb7FoigHGsR7iwTbVetR4bWPjYy+d6K1sj/Gx3dFXTsKeNOvqK4Zc0O
	V/VcGYaGAoCx/yH8Q8Lv1S3Ok2nYH09T3bZloxvBBQ9af15eP0e+zbYuAJA5AQ1XqiGGT5fpYYrrr
	0Bv+pmvu+S9I+9qhwJtuDk1R5e43ykkbakJbwYdF2OwR1g3LYJRyJ+teufoNZKhDU5PbUZTY3R9iJ
	40HKTqLogfUoX1SjE5ySAkTOfSQzClO/mOCYNCc8v3tmOZmTdYEOltmGgrUlAG22ys5FyxdN3Omp5
	bbtRJl+fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kN8pK-0004JJ-I7; Tue, 29 Sep 2020 06:09:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kN8pG-0004IU-NZ; Tue, 29 Sep 2020 06:09:24 +0000
X-UUID: 99b49dc938d743d4ab7a4a3ceed7c1cb-20200928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Xw4yksfYd5fXr4ldEJmpjXvMZXzn7kJ9Yq/JIUXEB8A=; 
 b=h1SlIvBrn9lBXhxKTcgPYwhHJZxQLtaLCov5kTs4Yczouf5oxuVdn56TKHwj8gU4DjZWTV2GOoeTt2pu/nuKD3jrnUefXTlk+zQn/9f+Aiu7rJmQWIcyzeincgwO/lNcVpEagEf5dubDANHY7+ldZ2O1XVEaZosC12Ys4hU5GTo=;
X-UUID: 99b49dc938d743d4ab7a4a3ceed7c1cb-20200928
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 645469094; Mon, 28 Sep 2020 22:09:16 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Sep 2020 23:09:14 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Sep 2020 14:09:12 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Sep 2020 14:09:12 +0800
Message-ID: <1601359599.29336.49.camel@mhfsdcap03>
Subject: Re: [PATCH] dt-bindings: usb: add properties for hard wired devices
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 29 Sep 2020 14:06:39 +0800
In-Reply-To: <20200928181247.GA3008733@bogus>
References: <20200928063950.64722-1-chunfeng.yun@mediatek.com>
 <20200928181247.GA3008733@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F8EFEE97F27DC64FB443E5232A9A52AC9BC551E88AE8507045FC3C02669586062000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_020922_927326_4B2F7824 
X-CRM114-Status: GOOD (  19.42  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-28 at 13:12 -0500, Rob Herring wrote:
> On Mon, Sep 28, 2020 at 02:39:50PM +0800, Chunfeng Yun wrote:
> > Add some optional properties which are needed for hard wired devices
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > index 7263b7f2b510..1194a82887e7 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > @@ -22,6 +22,17 @@ properties:
> >      description:
> >        Name specifier for the USB PHY
> >  
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^hub|device@[0-9a-f]+$":
> 
> Could be any class of device, so '@[0-9a-f]+$'
You mean we will use different standard node name for each usb class?
e.g.
Use 'ethernet@*' for a usb ethernet adapter, and use 'camera@*' for a
usb camera sensor?

> 
> > +    type: object
> > +    description: The hard wired USB devices. See usb/usb-device.txt
> 
> Ideally, we'd convert usb-device.txt to schema and reference it here.
Ok, I'll try to do it.

BTW: Does the compatible support pattern? Is there any example I can
refer to?

Thanks

> 
> > +
> >  examples:
> >    - |
> >      usb {
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
