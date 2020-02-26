Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_RHS_DOB autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F24C4BA0B
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 11:06:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFAAE20801
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 11:06:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SqGZ0pXD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAB7CUTn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFAAE20801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzE20PwThB7oIQ5gPXAf7TWq3O+KiISLD3e3kIKDlcE=; b=SqGZ0pXDbMWAQz
	o88gGVIhHGgDqtg6ILR24NmY6d13GCJjUbcAgHF7AR3hOaSNQBKw7VJ2snj+c/Le/1xQmkZj0M9f1
	YDLGo7ppprWRnp6mp7EhMM7EPrteH3kX97/vGvS0uk55YsONxIF1ea/4evK8fgBuGo4iNwy11RsQt
	o1ZbIPyqXirPQBksRyJbD9lqsemca95Aj/0vuGjCnC4m3920aTFhoi6qxaHK1ubqhsqdmPMMbDOiZ
	AuFOlrnPsJo/h2idc2IcDc8DHyWRuXi9Zvl8wBnh7DzmRIu+/yNympFrwjuWhWt05AjDxBZlxkpDO
	9LidZqNjwD3y3H3N0oUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6uWL-0000rN-3x; Wed, 26 Feb 2020 11:06:29 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6uWB-0000iW-8T; Wed, 26 Feb 2020 11:06:20 +0000
Received: by mail-ed1-x542.google.com with SMTP id e10so3230260edv.9;
 Wed, 26 Feb 2020 03:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qD490qP8YoHuMggNJ+4rCSwLuR21SazsOZ1+Y/A5tXY=;
 b=nAB7CUTnvsBjhe/PIwUREoSD8Dtea7xSb4TC/ZjuCq1rN7YookFkVvp8f5NZr8ViuK
 JDwLBw/0dPnEXcIRSMONvffCxwYafU6qASRFtw2FNJWsgVFLjapX7Y4NaqL3meEK0zbK
 uNBpTss6XQOEf+r08uX1VGCQ0l4g5Jtd4g7oug1CoUkmD6Lkte+9/zOKo7RA7ZGzOP5h
 34i5PNdEEhbSXfsPuH7I/CNg7jeUY9/lkboGTTuf0f5N0YJ2dZrhkAngbkNKktHnf1FZ
 /TIxN12YKiz/RCiSaMauemnXMy4FcKVLARcxQHPhLrOT7xcsiujLwxQ2HYaqpa7W2KQZ
 s4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qD490qP8YoHuMggNJ+4rCSwLuR21SazsOZ1+Y/A5tXY=;
 b=tN4qjgba8bVBAKI4xq2C9ZBdW4mj9+dZTPyEkZSiQ11kM92Zc+z16B8O9jTxKhiZLD
 F4RxTYBkqsJM3qnhUpBkc+DT0tXzVywbhwJKj5idsTdy/yCSgfdKZePYVBfiSJHmI3nJ
 xlAvItguUpmUMKdvuZyNSRc+vNmyQGwKGQU1YhA1i8SZC2xi2ok6P1hqF5wVw2K1KEgn
 1zVPYK618CvA1E7s7BOe+xmVVtskB5uDw/2ZZHrA1b6vu/gfOCSQJXO9V3UD4Jelvhkk
 RpZIUyERk0gtE2KysNOoazqhUzLF8N55yHZ/ZAMTyBaoG8AmtKikbn2bi8nGkKLkciKS
 AXtA==
X-Gm-Message-State: APjAAAXzVlVmgPyyULtexW4XPhyx9fl1ID83LCaD4rkdI6oeGZk7HOiC
 5kELUd5yJtBezMJLXVC/8RWWqmgDbwVMh7VvV+I=
X-Google-Smtp-Source: APXvYqxKn9EHYJorI3u34MIoTYZ1p/XSstU3KzZU6YSsE3nbzrut7Z7pjBq/4/6dZdIrJEtcRK8EZjxaPv8Js3jOl/c=
X-Received: by 2002:a05:6402:3046:: with SMTP id
 bu6mr4201533edb.139.1582715177721; 
 Wed, 26 Feb 2020 03:06:17 -0800 (PST)
MIME-Version: 1.0
References: <20200226102312.GX25745@shell.armlinux.org.uk>
 <E1j6tqv-0003G6-BO@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1j6tqv-0003G6-BO@rmk-PC.armlinux.org.uk>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Wed, 26 Feb 2020 13:06:06 +0200
Message-ID: <CA+h21hrR1Xkx9gwAT2FHqcH38L=xjWiPxmF2Er7-4fHFTrA8pQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/8] net: phylink: propagate resolved link
 config via mac_link_up()
To: Russell King <rmk+kernel@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_030619_325922_81663D4F 
X-CRM114-Status: GOOD (  22.00  )
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Russell,

On Wed, 26 Feb 2020 at 12:23, Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> Propagate the resolved link parameters via the mac_link_up() call for
> MACs that do not automatically track their PCS state. We propagate the
> link parameters via function arguments so that inappropriate members
> of struct phylink_link_state can't be accessed, and creating a new
> structure just for this adds needless complexity to the API.
>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  Documentation/networking/sfp-phylink.rst      | 17 +++++-
>  drivers/net/ethernet/cadence/macb_main.c      |  7 ++-
>  .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  7 ++-
>  drivers/net/ethernet/marvell/mvneta.c         |  8 ++-
>  .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 19 +++++--
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  7 ++-
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 +-
>  .../net/ethernet/xilinx/xilinx_axienet_main.c |  7 ++-
>  drivers/net/phy/phylink.c                     |  9 ++-
>  include/linux/phylink.h                       | 57 ++++++++++++++-----
>  net/dsa/port.c                                |  4 +-
>  11 files changed, 105 insertions(+), 41 deletions(-)
>
> diff --git a/Documentation/networking/sfp-phylink.rst b/Documentation/networking/sfp-phylink.rst
> index d753a309f9d1..8d7af28cd835 100644
> --- a/Documentation/networking/sfp-phylink.rst
> +++ b/Documentation/networking/sfp-phylink.rst
> @@ -74,10 +74,13 @@ phylib to the sfp/phylink support.  Please send patches to improve
>  this documentation.
>
>  1. Optionally split the network driver's phylib update function into
> -   three parts dealing with link-down, link-up and reconfiguring the
> -   MAC settings. This can be done as a separate preparation commit.
> +   two parts dealing with link-down and link-up. This can be done as
> +   a separate preparation commit.
>
> -   An example of this preparation can be found in git commit fc548b991fb0.
> +   An older example of this preparation can be found in git commit
> +   fc548b991fb0, although this was splitting into three parts; the
> +   link-up part now includes configuring the MAC for the link settings.
> +   Please see :c:func:`mac_link_up` for more information on this.
>
>  2. Replace::
>
> @@ -207,6 +210,14 @@ this documentation.
>     using. This is particularly important for in-band negotiation
>     methods such as 1000base-X and SGMII.
>
> +   The :c:func:`mac_link_up` method is used to inform the MAC that the
> +   link has come up. The call includes the negotiation mode and interface
> +   for reference only. The finalised link parameters are also supplied
> +   (speed, duplex and flow control/pause enablement settings) which
> +   should be used to configure the MAC when the MAC and PCS are not
> +   tightly integrated, or when the settings are not coming from in-band
> +   negotiation.
> +
>     The :c:func:`mac_config` method is used to update the MAC with the
>     requested state, and must avoid unnecessarily taking the link down
>     when making changes to the MAC configuration.  This means the

Just to make sure I understand the changes:
- A MAC with no PCS can be configured in either .mac_config or .mac_link_up
- A MAC that needs to be manually reconfigured to the link mode
negotiated by its PCS needs to have the PCS configured in .mac_config
and the MAC in .mac_link_up
- A MAC with PCS where the MAC follows the PCS negotiation
automatically in hardware is basically equivalent with a MAC with no
PCS, and therefore can be configured in either .mac_config or
.mac_link_up
Is this correct?

Regards,
-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
