Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C04C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 14:06:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55A4C61078
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 14:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55A4C61078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDf6kvoEo/NnkJQNB+tu1/42NTivMwiUFf2pk/vfm2M=; b=nRQjbpmZTfYL/j
	pes3TaWWWlrrRiPZjWodcXBVVlsDpc8wAU1Lr63E2GSoL0b/uW8+UIi4p/mirbWNJPwAjbnuzbM8l
	eEUo64335asmLp3hnihfI6uBBz32my9Z17ltggSZ7AUIKy5xeZOD73XxHczsilZO3Be0qcze7agHb
	+vADTL4HoWW4c7M44WbUCRt6EK2pcPxf9t/+iv3zSEwVfXX7+MNNUEfwjJEKZVLGTcFCrT/rfvbUT
	vJrGJrfoQ+tCcUvkWhGQX2XL9srtpoTDr0mFT5bZMG+drU+a8UiMsrgakwesx8VQAR9bc7OvtA7zl
	LxlsGxwVqh72O+NwJe3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhXxH-00GXQr-UD; Mon, 01 Nov 2021 14:06:31 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhXx5-00GXOB-51
 for linux-mediatek@lists.infradead.org; Mon, 01 Nov 2021 14:06:21 +0000
Received: (qmail 1457560 invoked by uid 1000); 1 Nov 2021 10:06:13 -0400
Date: Mon, 1 Nov 2021 10:06:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@intel.com>,
 "Walt Jr. Brake" <mr.yming81@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nishad Kamdar <nishadkamdar@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH v2] usb: core: reduce power-on-good delay time of root hub
Message-ID: <20211101140613.GC1456700@rowland.harvard.edu>
References: <1618017645-12259-1-git-send-email-chunfeng.yun@mediatek.com>
 <5e907ccd-40bb-2ece-fe05-1a65a74f3aa2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e907ccd-40bb-2ece-fe05-1a65a74f3aa2@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_070619_387062_276A42DA 
X-CRM114-Status: GOOD (  21.85  )
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

On Sat, Oct 30, 2021 at 12:49:37PM +0800, Walt Jr. Brake wrote:
> This patch make USB 3.1 device cannot be detected, and I report the bug [=
1]
> to archlinux three month ago. Yesterday I try to fix it myself, and after=
 I
> revert this patch, compile the kernel and test, it works.
> =

> [1] https://bugs.archlinux.org/task/71660?project=3D1&pagenum=3D2
> =

> =

> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index 22ea1f4f2d66..73f4482d833a 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -148,10 +148,8 @@ static inline unsigned hub_power_on_good_delay(struct
> usb_hub *hub)
> =A0{
> =A0=A0=A0=A0=A0=A0=A0 unsigned delay =3D hub->descriptor->bPwrOn2PwrGood =
* 2;
> =

> -=A0=A0=A0=A0=A0=A0 if (!hub->hdev->parent) /* root hub */
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return delay;
> -=A0=A0=A0=A0=A0=A0 else /* Wait at least 100 msec for power to become st=
able */
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return max(delay, 100U);
> +=A0=A0=A0=A0=A0=A0 /* Wait at least 100 msec for power to become stable =
*/
> +=A0=A0=A0=A0=A0=A0 return max(delay, 100U);
> =A0}

Mathias:

It looks like the bPwrOn2PwrGood value in xhci-hcd's hub descriptor is =

too small for some USB 3.1 devices.

Can you look into this?

Alan Stern

> On 10/4/2021 09:20, Chunfeng Yun wrote:
> > Return the exactly delay time given by root hub descriptor,
> > this helps to reduce resume time etc.
> > =

> > Due to the root hub descriptor is usually provided by the host
> > controller driver, if there is compatibility for a root hub,
> > we can fix it easily without affect other root hub
> > =

> > Acked-by: Alan Stern<stern@rowland.harvard.edu>
> > Signed-off-by: Chunfeng Yun<chunfeng.yun@mediatek.com>
> > ---
> > v2: remove RFC tag, and add acked-by Alan
> > ---
> >   drivers/usb/core/hub.h | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> > index 73f4482d833a..22ea1f4f2d66 100644
> > --- a/drivers/usb/core/hub.h
> > +++ b/drivers/usb/core/hub.h
> > @@ -148,8 +148,10 @@ static inline unsigned hub_power_on_good_delay(str=
uct usb_hub *hub)
> >   {
> >   	unsigned delay =3D hub->descriptor->bPwrOn2PwrGood * 2;
> > -	/* Wait at least 100 msec for power to become stable */
> > -	return max(delay, 100U);
> > +	if (!hub->hdev->parent)	/* root hub */
> > +		return delay;
> > +	else /* Wait at least 100 msec for power to become stable */
> > +		return max(delay, 100U);
> >   }
> >   static inline int hub_port_debounce_be_connected(struct usb_hub *hub,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
