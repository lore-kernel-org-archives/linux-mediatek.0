Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C712C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKLst5r1ziRIfPPKX/kT52qsCxXk+9ZfBCcVYDqUrnU=; b=S7AXMX+1ZtFkooqJtTyznoTAXc
	inOO7aRXyscpik40JGgpSD3sLkC+aEe08uPYzrTeEbzvLrcUa8Y977b9dWCgNoclK1xBMWbOLoU2u
	fhZvZPhtQBMIcGqM3VdxqSpVV1CzyYkj7TUGKFixV81bHO//Oc1oW2I3sWD/774hC/cfcc/wCI5el
	XkqnMDKMHqplzaeQbFlEKJJLg1ZAxLM8c4JEzPp7dx1LLy0lVR0Ht6U1xnreXppQafdFZFBgifT8H
	dZ9FWtiXnplaadRjMaXqSxLAWqCGfQO0jkCdFTlBzSMJmXtljdTbX+sqUeAtqUGS4EhKkdbENufZD
	u9eg3x1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KLl-007pGv-B3; Mon, 04 Jul 2022 11:34:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JvR-007SvC-5i; Mon, 04 Jul 2022 11:07:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BBF07615F6;
	Mon,  4 Jul 2022 11:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4F6C3411E;
	Mon,  4 Jul 2022 11:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656932850;
	bh=ShPSNOvgzATtn2/Bsxk03dhF7u+9UjNpwSKkcGRvTT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yg7oJSBac1jklWTdfgCXuJ3ysIGEvXrqf9/zfqWj42Iyu5IX6vLXQxNYM/N8zePVv
	 gl+h3HeUDHDoljmR2gePU76jeomtKSKBVHs4jLc0sVpZAXzp8rEBO43+ANIOsKdZ6Y
	 UAo9IGe43RtjSE/pzqD1J5iVI+6bU5b1kL+Sse4w=
Date: Mon, 4 Jul 2022 13:07:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: szuni chen <szunichen@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
	Helge Deller <deller@gmx.de>, chiaen_wu@richtek.com,
	alice_chen@richtek.com, ChiYuan Huang <cy_huang@richtek.com>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux LED Subsystem <linux-leds@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux PM <linux-pm@vger.kernel.org>,
	USB <linux-usb@vger.kernel.org>,
	linux-iio <linux-iio@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v4 08/13] usb: typec: tcpci_mt6370: Add Mediatek MT6370
 tcpci driver
Message-ID: <YsLJ7+HiqaBTwCLg@kroah.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-9-peterwu.pub@gmail.com>
 <YsKXcnys2Wa8Zz0p@kroah.com>
 <CA+hk2fYA3phYAoh+BFr0ddy9MR8Ro1WCoqBpa1UK2StwMtLyfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+hk2fYA3phYAoh+BFr0ddy9MR8Ro1WCoqBpa1UK2StwMtLyfQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_040733_358979_A3F93359 
X-CRM114-Status: GOOD (  20.93  )
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

On Mon, Jul 04, 2022 at 05:31:29PM +0800, szuni chen wrote:
> Greg KH <gregkh@linuxfoundation.org> 於 2022年7月4日 週一 下午3:32寫道：
> >
> > On Mon, Jul 04, 2022 at 01:38:56PM +0800, ChiaEn Wu wrote:
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Add chip level mt6370 tcpci driver.
> >
> > What does this mean?  Please provide more information about the hardware
> > being supported here so we know how to review this.
> 
> Dear Greg,
> 
> MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery charger,
> a USB Type-C & Power Delivery (PD) controller, dual flash LED current sources,
> a RGB LED driver, a backlight WLED driver, a display bias driver and a
> general LDO for portable devices.
> 
> This driver is used for the Type-C & Power Delivery controller in
> MediaTek MT6370 IC.
> 
> If we change the commit message to
> 
> "Add MediaTek MT6370 tcpci driver.
> MediaTek MT6370 is a multi-functional IC that includes USB Type-C.
> It works with Type-C Port Controller Manager to provide USB PD and USB
> Type-C functionalities."
> 
> does this meet your requirements?

What would you want to see if you were reading a changelog text for an
unfamiliar hardware device?  More text is always better!

thanks,

greg k-h

