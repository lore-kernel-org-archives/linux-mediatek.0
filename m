Return-Path: <SRS0=1s7f=AG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0474C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2020 09:16:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5EC20709
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2020 09:16:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TOXybNix";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="iB+W7Xiz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD5EC20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eLtaigDemsd8w8qmL9+WwrRQbRHKXEYr2zmq9mHNKb4=; b=TOXybNixXMF/MxEBAjK0pcEiM
	3IQMexn4abAbDXeVl9uLZ+z12XDQFO7EJ/UO2g4B0DPLB0e44T+Qpacxi3pyaJCc4uG+zdYzbRi+2
	nVgmI8Y+TMLPPFBqEpr3WFQeXaQfDPGvVB/mOzOLjc0TESAoSgKMLGIcu6oxZ09L5rzOl+6q3fL5K
	3dNigOP02FOxWJcPo5nByGcxWmVDzj/io3EVnp0MVSQKsh0SIUaSHB+o5ylCQxaVpqgL92AM2oxqs
	Dfv58add7S1668sjekYAPf9a8ERbDR1B3oaNJtX6x5/F8i4Oh21lw9saPaP7F6AlvF+718LxxhiEr
	7n7HKD4yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joNzZ-0007Ca-L7; Thu, 25 Jun 2020 09:16:21 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joNzT-0007AK-Sl
 for linux-mediatek@lists.infradead.org; Thu, 25 Jun 2020 09:16:16 +0000
Received: by mail-io1-xd43.google.com with SMTP id i4so5244231iov.11
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2020 02:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XiSuE1sOXIBipbRmQaXWKIM5hIBA/1GaMgH8/QBx+Fg=;
 b=iB+W7XizU/ZyE68RYq0Wy4WGwaVug8o35XV3WoVujzhd4fj/jviokDCLfKsAQNC/CD
 MyjHMfGahHsCmh+oNfL4i4fg/Hb/6rvxRKd7w2PvYmqMcysZPcQJBmTMsBPhx+WOoEsx
 sYURxtLFEFzEW28VjADaxTZh/LDWcFA4+Q7lAQjdn+vsj3IgSUam5KQTIduedT/ZowyW
 BerGQgVSZmKKMJoRZikaa7enYMqpZrY1zQ9+Qw8deZc/FMtg+PJ/JBKKtQRGBgloKC7o
 MRB8xVCpEPuusL9dD5xscCw3iNFGIq00p9DefAs9DqKlrMYOfvBO4YsPKk+Q8tJ/ZxEN
 w2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XiSuE1sOXIBipbRmQaXWKIM5hIBA/1GaMgH8/QBx+Fg=;
 b=AQRW5UBHGSeJzjE4uSNj7nMdA8DRKV/vDedIbbGm1qFJYABM5SxctQ8ly/Kd8pzCoF
 W37uENmaCnUgBUsvbJ5pYjkbIZlCH3Ay4tgWlK1sspSIx6aefy748gz9tWL4NKK8fdfU
 R5sP76mL+H0WewL1QqAP860+vtXI3wlArfgVxVIKVKHZpxL6TG+/kZ7VBLjxO50oFXAa
 tBQ+is+tQawacotgNwgzeKJs5RlzlVFWWU61m9JQesiTZ3KTbJgqouS7SCn6Xmay3Jxg
 QM9Ot1ONDIvfUIBWpL7LzQbDtwVcBcgjhKOtJgst4iLvFGI2LeD5vVBji7FXOg9GMYUm
 kVkQ==
X-Gm-Message-State: AOAM531g4ignnn5GgS1w+VZGHhQL67XYbus7+vnQof+ntMSdmckiBz7O
 VQwODAUlPLVskU1qurJkNR+sFHIkRwk9YgwBn0hDWA==
X-Google-Smtp-Source: ABdhPJxfpwzz3MthY2lWlmiAjEp1yFspUytO7/QblbPNv/YGcRZeoCZxvPdkVQWmmMe0TIcWMFI5nbF4CoLcMrctrC0=
X-Received: by 2002:a02:ac8e:: with SMTP id x14mr71189jan.57.1593076573834;
 Thu, 25 Jun 2020 02:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200622100056.10151-1-brgl@bgdev.pl>
 <20200622100056.10151-7-brgl@bgdev.pl>
 <39e761f3-6607-d209-61df-535330f50db3@gmail.com>
In-Reply-To: <39e761f3-6607-d209-61df-535330f50db3@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Jun 2020 11:16:02 +0200
Message-ID: <CAMRc=MfE9JjNiZr9_nL37Zbgz_OpKXW1sbdWvbTeq2_orOBKAw@mail.gmail.com>
Subject: Re: [PATCH 06/11] phy: un-inline devm_mdiobus_register()
To: Florian Fainelli <f.fainelli@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-doc <linux-doc@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>, Frank Rowand <frowand.list@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 intel-wired-lan@lists.osuosl.org, Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 23, 2020 at 1:55 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 6/22/20 3:00 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Functions should only be static inline if they're very short. This
> > devres helper is already over 10 lines and it will grow soon as we'll
> > be improving upon its approach. Pull it into mdio_devres.c.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  drivers/net/phy/Makefile      |  2 +-
> >  drivers/net/phy/mdio_devres.c | 18 ++++++++++++++++++
> >  include/linux/phy.h           | 15 ++-------------
> >  3 files changed, 21 insertions(+), 14 deletions(-)
> >  create mode 100644 drivers/net/phy/mdio_devres.c
>
> This would likely require an update to the MAINTAINERS file for this new
> file to be picked up by the correct entry.

It's already included in drivers/net/phy/ in the ETHERNET PHY LIBRARY entry.

Bartosz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
