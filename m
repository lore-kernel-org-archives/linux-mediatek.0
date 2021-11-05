Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FEAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 10:01:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F65F61284
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 10:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F65F61284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIET1vtUXylaH5A6IX1g1EzzeSSOxINrD9YyKx3Y5Kg=; b=fk8dzGfJostZaJ
	Z6ngiOTB3ve8joBLag+YauHDHplhevwzGk2XZa8t6NYJ7ufJH/3FbnCLZhkbzRKQLRnDKNmtpH8xE
	zwwtCPaqbrwLLSnreKKNfduh7LAoAI88zJPlqXgDi3Mei96C3zu5o4KicglY8y2krY8RylshexYs5
	vGfQ/vOpci1qt0lxBjRHro/Wma4DDUP/3kSrWoZHi9dcLWM8FuYdZkyvyggWNDnOHUFFaGTwLOnBJ
	hc/BGBiEGsV5eVHpOQ9mDu3c21/Qu64A5CTb3uQxu29DNWtw/QaxNgNQtNVIZQK87PYbHVetO2ZTK
	6TS84iyf/n1aMQRURXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miw1e-00B2io-Kh; Fri, 05 Nov 2021 10:00:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miw1S-00B2gV-I4; Fri, 05 Nov 2021 10:00:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 895036128E;
 Fri,  5 Nov 2021 10:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636106434;
 bh=9xqJCHW4+6GKO2Maqx5mkTpR7LQgTIZrxQah13VAIMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yxnYLAnDk2gTATOymrSa55+AdtgOYT/VlFyCEs6MrTfmzlmZYopR+ch/sCYYaln1u
 nRbkGRBUJlVewUH01DbDxcfIH7z6Yascv+Y5Dg0hecevCALFYnIFJx0y5hs52EEblV
 OaSPuUwE6cEDc3SnAD9BUBFKOW9y0AxM6gzKEGmk=
Date: Fri, 5 Nov 2021 11:00:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: "Walt Jr. Brake" <mr.yming81@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nishad Kamdar <nishadkamdar@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH v2] usb: core: reduce power-on-good delay time of root hub
Message-ID: <YYUAv5456iyuxaG6@kroah.com>
References: <1618017645-12259-1-git-send-email-chunfeng.yun@mediatek.com>
 <5e907ccd-40bb-2ece-fe05-1a65a74f3aa2@gmail.com>
 <20211101140613.GC1456700@rowland.harvard.edu>
 <3cf46eaf-5443-30df-6d72-b92a6a518afc@linux.intel.com>
 <62d0ac30-f2b9-f58c-cb1e-215ccb455753@gmail.com>
 <13d55059-9f66-8599-54fc-46698bae41d1@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13d55059-9f66-8599-54fc-46698bae41d1@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_030034_664374_68DBD68E 
X-CRM114-Status: GOOD (  28.11  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 03, 2021 at 10:37:33PM +0200, Mathias Nyman wrote:
> On 2.11.2021 22.29, Walt Jr. Brake wrote:
> > On 2/11/2021 17:05, Mathias Nyman wrote:
> >> On 1.11.2021 16.06, Alan Stern wrote:
> >>> On Sat, Oct 30, 2021 at 12:49:37PM +0800, Walt Jr. Brake wrote:
> >>>> This patch make USB 3.1 device cannot be detected, and I report the =
bug [1]
> >>>> to archlinux three month ago. Yesterday I try to fix it myself, and =
after I
> >>>> revert this patch, compile the kernel and test, it works.
> >>>>
> >>>> [1] https://bugs.archlinux.org/task/71660?project=3D1&pagenum=3D2
> >>>>
> >>>>
> >>>> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> >>>> index 22ea1f4f2d66..73f4482d833a 100644
> >>>> --- a/drivers/usb/core/hub.h
> >>>> +++ b/drivers/usb/core/hub.h
> >>>> @@ -148,10 +148,8 @@ static inline unsigned hub_power_on_good_delay(=
struct
> >>>> usb_hub *hub)
> >>>> =A0=A0{
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0 unsigned delay =3D hub->descriptor->bPwrOn2=
PwrGood * 2;
> >>>>
> >>>> -=A0=A0=A0=A0=A0=A0 if (!hub->hdev->parent) /* root hub */
> >>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return delay;
> >>>> -=A0=A0=A0=A0=A0=A0 else /* Wait at least 100 msec for power to beco=
me stable */
> >>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return max(delay, 100U);
> >>>> +=A0=A0=A0=A0=A0=A0 /* Wait at least 100 msec for power to become st=
able */
> >>>> +=A0=A0=A0=A0=A0=A0 return max(delay, 100U);
> >>>> =A0=A0}
> >>> Mathias:
> >>>
> >>> It looks like the bPwrOn2PwrGood value in xhci-hcd's hub descriptor is
> >>> too small for some USB 3.1 devices.
> >>>
> >>> Can you look into this?
> >>>
> >>> Alan Stern
> >>>
> >> At first glance the xhci roothub bPwrOn2PwrGood value looks ok.
> >> xhci spec 5.4.8 states software should wait 20ms after asserting PP, b=
efore
> >> attempting to change the state of the port.
> >>
> >> xhci driver sets desc->bPwrOn2PwrGood =3D 10; (2ms interval, so equals=
 20ms )
> >>
> >> We should probably get this working immediately, so maybe revert that =
patch
> >> while looking into the rootcause.
> >>
> >> Walt Jr. Brake, instead of reverting that patch, could you test if cha=
nging the
> >> xhci roothub bPwrOn2PwrGood value helps.
> >>
> >> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> >> index a3f875eea751..756231a55602 100644
> >> --- a/drivers/usb/host/xhci-hub.c
> >> +++ b/drivers/usb/host/xhci-hub.c
> >> @@ -257,7 +257,7 @@ static void xhci_common_hub_descriptor(struct xhci=
_hcd *xhci,
> >> =A0 {
> >> =A0=A0=A0=A0=A0=A0=A0=A0 u16 temp;
> >> =A0 -=A0=A0=A0=A0=A0=A0 desc->bPwrOn2PwrGood =3D 10;=A0=A0=A0=A0=A0 /*=
 xhci section 5.4.9 says 20ms max */
> >> +=A0=A0=A0=A0=A0=A0 desc->bPwrOn2PwrGood =3D 50;=A0=A0=A0=A0=A0 /* The=
 20ms in xhci 5.4.8 isn't enough for USB 3.1 */
> >> =A0=A0=A0=A0=A0=A0=A0=A0 desc->bHubContrCurrent =3D 0;
> >> =A0 =A0=A0=A0=A0=A0=A0=A0=A0 desc->bNbrPorts =3D ports;
> >>
> >> Thanks
> >> -Mathias
> > =

> > Mathias:
> > =

> > Sorry to reply lately. I test with your patch, it works.
> > =

> > I also test with setting bPwrOn2PwrGood to 45, and it not work.
> > =

> > Seems that the minimal value should be 50 for this case.
> > =

> =

> Thanks for testing, and for checking that 90ms wait isn't enough

Can you send a "real" patch for this so I can get it into the tree soon
to resolve the regression?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
