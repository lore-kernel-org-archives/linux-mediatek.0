Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22ED7C35E15
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 21:10:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7E3C2176D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 21:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cn4q94Dy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6gfdjSU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7E3C2176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKdpQx6FGBfpyZw1D/JQH1hy0LmtSIZBUU7N0SCpqo0=; b=Cn4q94Dy1dO5uX
	tRF63k2xIL06TkSculsf4ULxIaTSIsMb9bLtHCLIY3tYqsKcaPSeZyrI8xPyrDilCfHXyToFAk7wA
	o6tucA72yJyKVOeGSoM2NhZOSOMZu5WsFA6x4Kon2eltSYpZhIvZ0Y0rAk1tjQ0Ozl+VZJ8bVBaHq
	8FoDQhnXFRD2i/sRaKWvIDSR3C6F80JLdrgsDWliDKDmwdm8pbPZj1gatELmawp47TveXw7NlLOnb
	nNLAd1RqIrtjj/COoxIuwSbXFpRBTkOCDhpmG1L+yRQwL2KCBt7aHwyi78phaob+oCLqin3oiEHKH
	hyFm2WF/ia9+eNyCNBTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6hSx-00026G-BT; Tue, 25 Feb 2020 21:10:07 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6hSj-0001Px-5o; Tue, 25 Feb 2020 21:09:55 +0000
Received: by mail-ed1-x542.google.com with SMTP id j17so1069202edp.3;
 Tue, 25 Feb 2020 13:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ReknaT/FHBXByMXGGadMEzL/WYd/+sCy+KAJpp5ZwQ=;
 b=g6gfdjSUOo1daNt5JbO1OW+lwH1wDg11Aag/ldGmhkKkxyuiYo8+Th2fgxoAQQ4hXq
 TRfwhYem3PhxViqcWuVx+VibsoPJtyTVagbuspEnHeQYaT2u/LwJMeu3LbXXCD0Gb+P0
 kRLDLX6J05YQ2Y8hv4+QoX7W+8th93s38oDKyijo7aUk+0WA/Q35uUeEjwKyuKG1sJKb
 pHrmZYL+Ul2ujJ6ECXARZynFXSJa6Fk0D+GxbQh8iZeV9tRAEnb/IR6xJlRYeIfUjO0K
 m+I0aO92UvVW8NrmhRC7I6GzDK8oveynokyluJrJ/ckLFboCtOu9kXc5lv28q9nFAWd2
 pQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ReknaT/FHBXByMXGGadMEzL/WYd/+sCy+KAJpp5ZwQ=;
 b=bbqq4ycP6dBZcdORGrH9aDG7bWm/8J8BlvIN5/FYt8jGT6uSZUfiFz/jEpb8M9WG+r
 cMMRO5+xjYPbujqALpYVdU+nMl5XWhdzcoBNkwvQ4LdVy0Vicho6VceIZwkLDqCjvWvP
 MPsZJs9DLtrMXGEH2ajKmVMeem6XSZjB+7IPyeAMRbfADfwgHidCK9AKNCEsxPDZ9Eiv
 AkTUv3nV7KS0og2WQIzkZ6d4duFnvh3PrAVzJzzPTc9ifVzzLW1XC2Zqu3C73Ee+cHk4
 L41W8Gv727VVTfv8cpoK9I0OQWhNxKnHwCSeeVPG/Q1liiKhM0WtztQKv3WxqRCuYeWN
 vXbA==
X-Gm-Message-State: APjAAAXYp6GORKs1pXajOxiPgPNhslKP3iuCQ3CbGgVKysW4q2GTqalR
 f6kGN+8DE/+ONBphoBV9vq7gM3ZPtRCt4ILn5A0=
X-Google-Smtp-Source: APXvYqyAzVm/wNR8w7wh+lAC7aHiC7zE7iGdWgqO+BLhvYvGS2dy2yiQw4bZhX/VBimWuHByQuf8RvIEP4SD4vbjH9A=
X-Received: by 2002:a05:6402:128c:: with SMTP id
 w12mr909815edv.368.1582664986639; 
 Tue, 25 Feb 2020 13:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20200225093703.GS25745@shell.armlinux.org.uk>
 <E1j6Wg0-0000Ss-W7@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1j6Wg0-0000Ss-W7@rmk-PC.armlinux.org.uk>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 25 Feb 2020 23:09:35 +0200
Message-ID: <CA+h21hp8KCqhCasOAGz17k0eRteHVVYK-eANQmn4h443qv=2JQ@mail.gmail.com>
Subject: Re: [PATCH net-next 2/8] net: dsa: propagate resolved link config via
 mac_link_up()
To: Russell King <rmk+kernel@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_130953_219633_1FF3C757 
X-CRM114-Status: GOOD (  12.16  )
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
 Florian Fainelli <f.fainelli@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
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

On Tue, 25 Feb 2020 at 11:39, Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> Propagate the resolved link configuration down via DSA's
> phylink_mac_link_up() operation to allow split PCS/MAC to work.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/dsa/b53/b53_common.c       | 4 +++-
>  drivers/net/dsa/b53/b53_priv.h         | 4 +++-
>  drivers/net/dsa/bcm_sf2.c              | 4 +++-
>  drivers/net/dsa/lantiq_gswip.c         | 4 +++-
>  drivers/net/dsa/mt7530.c               | 4 +++-
>  drivers/net/dsa/mv88e6xxx/chip.c       | 4 +++-
>  drivers/net/dsa/sja1105/sja1105_main.c | 4 +++-
>  include/net/dsa.h                      | 4 +++-
>  net/dsa/port.c                         | 3 ++-
>  9 files changed, 26 insertions(+), 9 deletions(-)
>

It looks like you missed the felix_phylink_mac_link_up() conversion in
this patch? (which also makes it fail to build, by the way, I'm
supposed the Kbuild robot didn't already jump)
Nonetheless, I've manually added the missing speed, duplex, tx_pause
and rx_pause parameters, and it appears to work as before.
Same for sja1105.

Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Regards,
-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
