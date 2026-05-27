Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91607CD5BD0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 17:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKN54VPAXWs5sF6ceJNmuHYcIYkUxjL/vSmM5J5IU/k=; b=jksZ11lISS9FjOLcCqOS/D3Lqd
	SOfdFsOVH0zccdTkqz4lE+WTxyzTO7Ai3JSucIvSKat+QEPBdu0cmi62U9Af7v8FM8z43VGWqum+x
	+9/yn50XQkLKwlglE7RqTj+ieUHJRUMPczimFdtUfuTDz0d7uiKxqnfSvpMjpq4VvZBmjBiMGBc6C
	nt0Ne0in9REho+GDidsUYAdxWwwIk3g8zPeIJcP8wBENRg1CHw7SX32KuEr7Sx//8Zzzr4J7pNxam
	864ZeRxnM9fXUNkTlSkbaG7+v6UfI3TJVcDO5MphXpZOumDssZnoH8Eb8810gG2nEu1BJbdCLpcbS
	QZqoRqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIGw-00000004aoT-23ly;
	Wed, 27 May 2026 17:42:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIGt-00000004ann-1iYN;
	Wed, 27 May 2026 17:42:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63BF8429E4;
	Wed, 27 May 2026 17:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB471F000E9;
	Wed, 27 May 2026 17:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779903742;
	bh=IKN54VPAXWs5sF6ceJNmuHYcIYkUxjL/vSmM5J5IU/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YWwcELU9M4r41zdQPC6qERI7NXdLXgr43PuuvlJcUNR9EPObjH4P4FEO0GXC13nqf
	 EzW0fD89RHfmeyJv3YySA0EDrhdDg3r+qQzqjaTJePNY2hdPMeGI63sx7hxPEHBoyv
	 YES0VYGMOKF159sxKYnb1U1f/CZRlf++oHgyXNGo=
Date: Wed, 27 May 2026 19:41:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on
 Chromebooks
Message-ID: <2026052710-flagship-unsmooth-ce82@gregkh>
References: <20260515090149.3169406-1-wenst@chromium.org>
 <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_104223_580775_E288BB55 
X-CRM114-Status: GOOD (  45.11  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 27, 2026 at 06:21:00PM +0200, Chen-Yu Tsai wrote:
> On Tue, May 26, 2026 at 11:48 AM Bartosz Golaszewski <brgl@kernel.org> wrote:
> >
> > On Sun, May 24, 2026 at 10:06 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > > >
> > > > > I expect some discussion on this patch, because a) it adds some
> > > > > OF-specific code into an otherwise generic (core) driver, and
> > > > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up powering
> > > > > on the port twice, which negates the port reset part.
> > > > >
> > > >
> > > > I understand that you do this because the port device has no OF node
> > > > assigned. If we wanted to call pwrseq_get() for the port device, is
> > > > there really no other way to associate it with the correct pwrseq
> > > > provider?
> > >
> > > I suppose we could tie the "port@X" node to the usb port device, but
> > > AFAIK no other subsystem does this so we would be introducing a new
> > > pattern.
> > >
> > > In the M.2 pwrseq driver, we would have to match by port node instead
> > > of its parent device node. We may end up with different behavior for
> > > the USB target vs the other targets.
> > >
> >
> > I imagine, we can check the bus type of the parent device to know if
> > this is USB?
> 
> The "bus type" type is probably not exported. However since the DT binding
> explicitly says which port on the M.2 slot is for which connection type,
> I think the matching can do a special case check for the USB port.
> The next obstacle is that the target string is not given to the provider
> match function.
> 
> > > Also, the "port@X" nodes only exist for the OF graph connections to
> > > connectors and/or muxes (this series doesn't deal with the latter).
> > > For directly connected devices, there is a "device@X" child node
> > > directly under the USB hub node. That node is what gets tied to the
> > > the USB device.
> > >
> >
> > Is this a problem? I don't think I understand what you're saying here.
> 
> It shouldn't be. I'm just saying there would be different behavior on
> the USB side for connectors vs onboard devices (like hubs) device nodes.
> 
> I talked to Greg earlier, and he said not to touch the hub driver; the
> hub driver should only deal with features from the USB spec. The
> "onboard USB devices" driver is what should be used. And this would
> be a proper case of adding an auxiliary device to the M.2 slot driver.
> 
> However this seems to completely decouple the power sequencing from the
> USB core. Take the USB A connector for example, it was recently added to
> the onboard USB devices driver. However the connector has a device node
> that is not a child node of any USB host controller or hub; it is connected
> through OF graph. At the same time, since it typically sits at the top
> level of the device tree, a platform device is directly created and the
> driver subsequently binds to that device. This is totally different from
> how the hub and other directly connected onboard USB devices work. In
> the onboard device case, the device node is a child node of the USB hub
> or controller, and the corresponding platform device only gets created
> when the USB hub driver probes, thereby sort of tying it into the USB
> device topology.

Hm, did we mess this up?  If so, we can always change it if you think
this should be done differently.

Hubs should be dealing with the power issues for their ports, so maybe
rethinking this might be wise.  I'm just loath to add hardware-specific
hacks to the hub common code for obvious reasons.  Anything we can do to
pull it out to a separate driver is best so it doesn't affect the 99% of
the users that don't have that crazy hardware :)

thanks,

greg k-h

