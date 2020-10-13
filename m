Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADF2C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 07:35:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE699205CA
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 07:35:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wXMY8/5t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tCLw59qt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE699205CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ws3g9yD/bBpBsutjActe+L9PablDjjsNbxF/9h4YA40=; b=wXMY8/5tH1i3iOdbChNGIAyJT
	2SEdPQMIH45YCkj2U/VXc3XdbGOM4kRIrvpysedF0zqWENWApLjI2Q51S+MX4xe8/MgQTr+5mNkU6
	mNVxjgpRZX42+R7iEgD52XwJcpPgOoGdAg+p0SAsGLt/XBAbkTkCjTgZ1oYXHadtfsVz2+XgSObUW
	9U+SarBmQU6DFpisGHU+HrhdJgf/AticR6m06zGUivuFsv3Nwu0Gw5Pnqeq4MkMW1pYIQYwzhCZRV
	GqaVlKkIcyHZXQHgo7Gq4swjC9wJhulH0h827WpgP60Q9xamXvBQSO6QyxlcZu+8KYFLXY602scyL
	VFo7ccgrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSEpo-00034L-QF; Tue, 13 Oct 2020 07:35:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSEpl-00033L-US; Tue, 13 Oct 2020 07:34:59 +0000
X-UUID: 7f1296a341a047b8b401084e50fd8ed2-20201012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NhVO6qrUz779jbsjX2Ikk7b4lJypQXusY9/S6kpeNkY=; 
 b=tCLw59qtordvFFVFy7pvuBg99W4QmSdujBAJFJT6biD2/3DOVXLP9a6ZwhOM/S1hEREeekzXrfbKGmQJDaUzE3qmeDCUjtX8scDFOPffAmj1HfFTe1K/G0D2CqR+OoF86sO51u8DI47dd0AJwDhUXarfO0qzZJNWUnCVcoslZlw=;
X-UUID: 7f1296a341a047b8b401084e50fd8ed2-20201012
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1116795014; Mon, 12 Oct 2020 23:34:32 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 00:34:31 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 13 Oct 2020 15:34:28 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Oct 2020 15:34:28 +0800
Message-ID: <1602574467.29336.64.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: add properties for hard wired
 devices
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 13 Oct 2020 15:34:27 +0800
In-Reply-To: <20201012160038.GA1618651@bogus>
References: <3db52d534065dcf28e9a10b8129bea3eced0193e.1602318869.git.chunfeng.yun@mediatek.com>
 <bd71ed260efd162d25e0491988d61fcf1e589bc0.1602318869.git.chunfeng.yun@mediatek.com>
 <20201012160038.GA1618651@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 808F5C65F94737A36C1DDF462A60B7D27527B5E22BB6950CA26F91DCA51009302000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_033458_113793_14C694B6 
X-CRM114-Status: GOOD (  21.33  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-10-12 at 11:00 -0500, Rob Herring wrote:
> On Sat, Oct 10, 2020 at 04:43:12PM +0800, Chunfeng Yun wrote:
> > Add some optional properties which are needed for hard wired devices
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2 changes suggested by Rob:
> >    1. modify pattern to support any USB class
> >    2. refer to usb-device.yaml instead of usb-device.txt
> > ---
> >  .../devicetree/bindings/usb/usb-hcd.yaml      | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> 
> You can fold this into the first patch. While not explicit before, it 
> was implied.
Ok

> 
> Rob
> 
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > index 7263b7f2b510..42b295afdf32 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > @@ -22,9 +22,28 @@ properties:
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
> > +  "^[a-f]+@[0-9a-f]+$":
> 
> Just define the unit-address here: "@[0-9a-f]+$"
When I define it as "@[0-9a-f]+$", there is error:
"usb-hcd.example.dt.yaml: usb: hub@1: 'compatile' is a required
property"

> > +    type: object
> > +    $ref: /usb/usb-device.yaml
> > +    description: The hard wired USB devices
> 
> Need to also define 'reg' and 'compatible' here.
'reg' and 'compatible' are already defined in usb-device.yaml

> 
> > +
> >  examples:
> >    - |
> >      usb {
> >          phys = <&usb2_phy1>, <&usb3_phy1>;
> >          phy-names = "usb";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        hub@1 {
> > +            compatible = "usb5e3,610";
> > +            reg = <1>;
> > +        };
> >      };
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
