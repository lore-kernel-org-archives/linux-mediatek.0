Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BB0C388F2
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 09:31:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B8720719
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 09:31:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NvHAsMqY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BWSUHeQ6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70B8720719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m0zgF6v4MPg39almLandwVIP4JKsOOnPfUBNMhfYm4w=; b=NvHAsMqYPdgML/nw3RSgSymvl
	/uf9mGc+/LZfAZSraICJ56agwJLgoEqoi+tQWOSPiTGBp0Lgw2syoowcwiL5BMJkSXDKpw3XcWZHt
	IAmBhXGEDiH2LpA0ImbNBrmUbYu5lL3ihFMfxX3bMJJZSU1OPDXgrulbEZB2hAHCIN09eMeT3IiEE
	Zys9F/qaSyriU3jPgV4ocnRTQCc3O0OWdD/FoxNmh2EzNIXkiwvrA02dQY+t3HQ6t5k/U6NS51IqQ
	g4Kh47EmGt9mCiPqnZW3HWHgdszwbKXKGMd1yXLas9ZeQ9Xy3x+ZB0RqNoWz2Rv19C12pobhWgSM0
	7YwjDWW/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kay5O-0002AS-1t; Fri, 06 Nov 2020 09:31:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kay4C-0001RE-L3; Fri, 06 Nov 2020 09:29:59 +0000
X-UUID: add02b168d294e478af78e03aa36117e-20201106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hwcTnf+x5JkMX4z/81xeJjmzHGsQ5Nx2TTLtSPHzhSo=; 
 b=BWSUHeQ6aItGpnEYy8Jy4h/938Gleo7uVNZQLZ3SVj0xUzoVYqWqP4RbopN6DZfxD8024PPXCFWD0TTqEheeKhMaK22Bx63cv0/XAlFWrG/PPW71JbKW/9qyoDj0H8eDOlCrqBC7ZP57b0SnFNZEPgKegx7kU61VZdt6AN23o2k=;
X-UUID: add02b168d294e478af78e03aa36117e-20201106
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 7833886; Fri, 06 Nov 2020 01:29:50 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 01:29:48 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 17:29:46 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 Nov 2020 17:29:46 +0800
Message-ID: <1604654987.24301.23.camel@mtkswgap22>
Subject: Re: [PATCH 1/2] dt-bindings: usb: mediatek,mtk-xhci: add keep-clock-on
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 6 Nov 2020 17:29:47 +0800
In-Reply-To: <20201104223926.GA54259@bogus>
References: <1604301530-31546-1-git-send-email-macpaul.lin@mediatek.com>
 <20201104223926.GA54259@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_042957_403800_64E2008E 
X-CRM114-Status: GOOD (  24.26  )
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
Cc: devicetree@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng
 Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org, Ainge
 Hsu <ainge.hsu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Macpaul Lin <macpaul@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-11-04 at 16:39 -0600, Rob Herring wrote:
> On Mon, Nov 02, 2020 at 03:18:48PM +0800, Macpaul Lin wrote:
> > Option "mediatek,keep-clock-on" means to keep clock on during system
> > suspend and resume. Some platform will flush register settings if clock has
> > been disabled when system is suspended. Set this option to avoid clock off.
> > 
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > ---
> >  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml |    7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > index ea696c8..a956dde 100644
> > --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > @@ -104,6 +104,12 @@ properties:
> >      description: enable USB remote wakeup, see power/wakeup-source.txt
> >      type: boolean
> >  
> > +  mediatek,keep-clock-on:
> > +    description: |
> > +      Keep clock on during system suspend and resume. Some platform will flush
> > +      register settings if clock has been disabled when system is suspended.
> > +    type: boolean
> > +
> 
> This should be implied by the compatible string.

This should be an property according to system-wide design.

Mtk-xhci may be applied to different product lines for the same platform
(IC). Suspend on phone system is different to tablet or laptop. Phone's
power management module will turn off XHCI's power once the clock has
been turned off. For example, the headset plugged into phone won't do
disconnect and re-enumeration during system suspend. Click a button on
the headset to wake-up phone is necessary, and then, XHCI needs ready to
work immediately.

If the IC has been applied to a tablet or laptop product. When system is
suspending, the headset will be disconnected. The headset will do
re-enumerate when system is waking up. In this kind of applications, the
power of XHCI can be turned off with clock.

> >    mediatek,syscon-wakeup:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      maxItems: 1
> > @@ -175,6 +181,7 @@ examples:
> >          imod-interval-ns = <10000>;
> >          mediatek,syscon-wakeup = <&pericfg 0x400 1>;
> >          wakeup-source;
> > +        mediatek,keep-clock-on;
> >          usb3-lpm-capable;
> >      };
> >  ...
> > -- 
> > 1.7.9.5

After a discussion with Chunfeng, I'll send a new version for 
Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt because the
YAML file still need to be revised. The property
"mediatek,keep-clock-on" will be renamed to "mediatek,str-clock-on" for
implying it relates to suspend/resume capability.

Thanks.
Macpaul Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
