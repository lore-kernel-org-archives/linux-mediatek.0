Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA7FC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdfeAVJL1SU2mFuVJ1kQVRCy8ah9BFcYe/si9tBZYrM=; b=JYa9TgxA3mBU6LuJ3edAaen1G4
	ua6uc1nR6bKDwYwEBA/usnf+NOl6lzbrYq+2iZGEV49j+UR4bzJlvwzu8EY7kGLwsda92/HdgGbDB
	3nZSV7WVosHlJFcfUH1lWERZIFYZx9HUrfeCwBovUjSkQTSx7n9qwMToSueh8GAjrm68EO53KI2cI
	s5UsIXc6gMHk6DCiXcK0LAlq4mwVmOaSrAVF7tUId6x8hIXZ+JyBwttacTA/RbLzgMpjnzfVQ4YmH
	mMWQvPb+ciQ3yVO38pLkVAMu+8+qAi+K1dk6NtDt6IzI/dlkCIfvHEQhSuT/xVIVWVKb0QrPTHyFk
	oecQomIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGj0-005mfL-SV; Fri, 15 Jul 2022 08:31:02 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGiq-005mbJ-2a
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 08:30:53 +0000
Received: by mail-lf1-x12b.google.com with SMTP id a9so6679937lfk.11
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 01:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BdfeAVJL1SU2mFuVJ1kQVRCy8ah9BFcYe/si9tBZYrM=;
        b=GLARdVNDa+EOTo/liODtN4RtO7gdJGoxxMiIojNRienYvOHet52dUwDhdzs3SWPu0v
         /VICwkJMevBOcqioe1dIWqIyBxnLId0yHoAeku6sUjnf33FNeq5oHvyuf/Q5YjXcKIPu
         EFmw865o5XztvO0/2QbrIo8oD/KJnxvZJJ66H9QIbT7Nv6DRNqPg8X4CsEO6W4AVjeuW
         5d/7bhWvniaPPPPyGQJQRcR7Obt/jCiKnnUEHiYC2KPMhSMz9PEDnYQJdE83YKdEh8kD
         BhFIO/9XQ3cGoHTg91Lw77vF/TcmAbKhLHAm0yECPwdN2rtKMjen3zEog0N2EVCCMshn
         i4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BdfeAVJL1SU2mFuVJ1kQVRCy8ah9BFcYe/si9tBZYrM=;
        b=ceSQmG1/skTs3k45MgIOv/SowKosZy8kEr+FnEPA0d0fHGp5E48SXTpYAV00dyu4D2
         Nc5MFavhubYRviPOaYv/daPwD0RwgNZw/pEbRUsC1EaKfpx7P+TEb1kD6fs0FU7yPn32
         Y6OhI0pIdUNSUXOJvGsov8ziHVxdsPga7zR+t8BsaPr5L+3f+HFWEezmXZ1OeFGQFISs
         Ncz6kP8SMSOqJTlWckZcs50d4jBf4soCnlFKkiq8A9eOEVSzhK8owIxAzt5phkKSzQzV
         pYP0gM8uRnhKnCVDacn6AYOIn7O0QkVuAUUuDS3kJ+IGcM9EJctNjfflNLO0LcoR55HO
         xDHA==
X-Gm-Message-State: AJIora88PAHTbnRyFaKWZ6ZWU0Aqm10mRwJUkVvdswjEjs1ZciQLiUJz
	LW3bk1jNWWGlUbpEYJx9jIayZupF2FxS9Jj6MEh5jw==
X-Google-Smtp-Source: AGRyM1vmEiGNxsGwfaphjeldpisE1hbkgmPH1zGFyJKH3Y3sHn8434T6rxRbnWsNte9tdSs0qEZP170/McAyw0pTMMo=
X-Received: by 2002:a05:6512:2315:b0:489:cbc1:886a with SMTP id
 o21-20020a056512231500b00489cbc1886amr6852844lfu.428.1657873847553; Fri, 15
 Jul 2022 01:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <Ys7RdzGgHbYiPyB1@shell.armlinux.org.uk>
In-Reply-To: <Ys7RdzGgHbYiPyB1@shell.armlinux.org.uk>
From: Marcin Wojtas <mw@semihalf.com>
Date: Fri, 15 Jul 2022 10:30:37 +0200
Message-ID: <CAPv3WKda3kxNKkd46AbLDTFeQ_V=J8_b1iFZ4oyVFBA9o_fDzQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/6] net: dsa: always use phylink
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Daniel Scally <djrscally@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, George McCollister <george.mccollister@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Landen Chao <Landen.Chao@mediatek.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Sean Wang <sean.wang@mediatek.com>, 
	UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Woojung Huh <woojung.huh@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_013052_123136_1D0618E4 
X-CRM114-Status: GOOD (  14.15  )
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

Hi,

=C5=9Br., 13 lip 2022 o 16:16 Russell King (Oracle) <linux@armlinux.org.uk>
napisa=C5=82(a):
>
> Hi,
>
> This is a re-hash of the previous RFC series, this time using the
> suggestion from Vladimir to create a swnode based fixed-link
> specifier.
>
> Most of the changes are to DSA and phylink code from the previous
> series. I've tested on my Clearfog (which has just one Marvell DSA
> switch) and it works there - also tested without the fixed-link
> specified in DT.
>
>  drivers/base/swnode.c                  |  14 ++-
>  drivers/net/dsa/b53/b53_common.c       |   3 +-
>  drivers/net/dsa/bcm_sf2.c              |   3 +-
>  drivers/net/dsa/hirschmann/hellcreek.c |   3 +-
>  drivers/net/dsa/lantiq_gswip.c         |   6 +-
>  drivers/net/dsa/microchip/ksz_common.c |   3 +-
>  drivers/net/dsa/mt7530.c               |   3 +-
>  drivers/net/dsa/mv88e6xxx/chip.c       | 134 ++++++++++++-------------
>  drivers/net/dsa/mv88e6xxx/chip.h       |   6 +-
>  drivers/net/dsa/mv88e6xxx/port.c       |  32 ------
>  drivers/net/dsa/mv88e6xxx/port.h       |   5 -
>  drivers/net/dsa/ocelot/felix.c         |   3 +-
>  drivers/net/dsa/qca/ar9331.c           |   3 +-
>  drivers/net/dsa/qca8k.c                |   3 +-
>  drivers/net/dsa/realtek/rtl8365mb.c    |   3 +-
>  drivers/net/dsa/sja1105/sja1105_main.c |   3 +-
>  drivers/net/dsa/xrs700x/xrs700x.c      |   3 +-
>  drivers/net/phy/phylink.c              |  30 ++++--
>  include/linux/phylink.h                |   1 +
>  include/linux/property.h               |   4 +
>  include/net/dsa.h                      |   3 +-
>  net/dsa/port.c                         | 175 +++++++++++++++++++++++++++=
++----
>  22 files changed, 290 insertions(+), 153 deletions(-)
>

I tested the patchset on top of net-next/master alone and with my
fwnode_/ACPI patchset:
* On EspressoBIN
* On SolidRun CN913x CEx7 Eval Board
  - with DT (with and without fixed-link description in CPU port)
  - with ACPI (with and without fixed-link description in CPU port)

All works as expected, so:
Tested-by: Marcin Wojtas <mw@semihalf.com>

FWIW, the patches LGTM:
Reviewed-by: Marcin Wojtas <mw@semihalf.com>

Best regards,
Marcin

