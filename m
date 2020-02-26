Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F060C4BA18
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 18:22:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B5324653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 18:22:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s9rsn3Bd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI9iBUUh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B5324653
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsGqhDQSRLWhSg1KjbunIEtI87/2Jlmr9BfwjoRt+l0=; b=s9rsn3BdQ/hLLm
	j8y10rivZ3Jh+5meusJkOm6vOFL4QAjYs02EX5WJmGm/dw+7/bGvP+NyTBiJQaOW30A8iBBlNZrP9
	SPbBEBiZl0+Bfd1SV5VMVuHW9nDwMX8r9EWWM+YI5hCltFCLGQmMv145IyCUfuCskcjhAfn86SKtQ
	T40Ulvo8/Bodc2YYcXZDSsKzx9E6tWxPvPVKweFLtPVSwwAf8flF2hXtrgtW+0vE/hL455cOwXa8N
	22h6eQv1its3IDA/OMUVr6gP4YtsKk5D++0A7MlAnM7T46qJVAWHfUKXBT7l5Y+z6EaMY6TqorTEc
	SA3E+tShnow52LbM/W4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j71Js-0003t1-TM; Wed, 26 Feb 2020 18:22:04 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j71Jp-0003sH-Jd; Wed, 26 Feb 2020 18:22:03 +0000
Received: by mail-ed1-x544.google.com with SMTP id g19so4949052eds.11;
 Wed, 26 Feb 2020 10:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ovPhpjCazhkBuPF/3ZKvkZXEB2wEDICs1R4JyVb9o08=;
 b=OI9iBUUhfV6cJMJ9vJ68G9/cgbTv1wHVcLG3LksGDJejAEymTYAcHNfYaJykBuoCYe
 87vy3ZZP1+u0TaBtMLFbjh8l7ziIjEh+V4M8f3I/wxUqb7Ew7PxoqQKRR4ZT048Ejzju
 wyU8A8YVqsth1rJFgn/NB5jkfes01W6LkbdTqYBI3MdZ3P4j2c9kTfU1x/BUFK72+5IV
 JHmXKtnRhNimBUw3yac7D0HrmV6Y9w5aJcXVxQLAIsogWJzBZqOeGnjOwt/ZvdBqUHO5
 x7txNWnt26x8UvtluXLhrabAHgxXnevK2t8iE7HXNw6RDu5P2EuMWsvI9OG7e6P2h/P+
 cEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ovPhpjCazhkBuPF/3ZKvkZXEB2wEDICs1R4JyVb9o08=;
 b=dPlVrhDXGT7k21KhFeztEeYlGLyj5sKhVeoaZuMZE4+4K2v4CQehFHEoxUhXG4ywdb
 DRQrYMll5ypJVb1qhXcKHZSFRCvGl34BKcfcIt1FCFrlzJQ022JlG4W6hTQeGPB5L21o
 a7lhX/6aqKDBKBPkFgs+sYzBxQPhI3jl9aAKt+8+1FglPoD8STD6SeqQl8tCaItF7lyp
 eNOlVZzVIYgThdhznROjC+oXHM0U0RLQgYOC8Du9a8qU1nlg8I8cAVUlH5Aaw3zaGK+D
 f3TsR4V3QD5NkX8ITkt9eJ42KUO4uo81FIs3lqB/1er9JzJrpTpclFB9k9FJHJtyqXhc
 P+Cw==
X-Gm-Message-State: APjAAAUT78OuROaJjTk4jp1hKHV/K+Lx8XYFGuhfFCl4A0uoAfErCmzU
 ObPJO6s8mZyPs6Xn4Eyj9BuDMS1GKcW9cQbVySs=
X-Google-Smtp-Source: APXvYqyWWHDLBD74C4KrlGNwJKHlt0Sr7+Pr/k5MqDzX2pGa8p/QrMHHNyTSgjdqd2CIME9nHLlZVrItPU00x+MTPeA=
X-Received: by 2002:a05:6402:128c:: with SMTP id
 w12mr643997edv.368.1582741318899; 
 Wed, 26 Feb 2020 10:21:58 -0800 (PST)
MIME-Version: 1.0
References: <20200226102312.GX25745@shell.armlinux.org.uk>
 <E1j6tqv-0003G6-BO@rmk-PC.armlinux.org.uk>
 <CA+h21hrR1Xkx9gwAT2FHqcH38L=xjWiPxmF2Er7-4fHFTrA8pQ@mail.gmail.com>
 <20200226115549.GZ25745@shell.armlinux.org.uk>
 <CA+h21hqjMBjgQDee8t=Csy5DXVUk9f=PP0hHSDfkuA746ZKzSQ@mail.gmail.com>
 <20200226133614.GA25745@shell.armlinux.org.uk>
In-Reply-To: <20200226133614.GA25745@shell.armlinux.org.uk>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Wed, 26 Feb 2020 20:21:47 +0200
Message-ID: <CA+h21hqHfC0joRDhCQP6MntFdVaApFiC51xk=tUf3+y-C7sX_Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/8] net: phylink: propagate resolved link
 config via mac_link_up()
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_102201_672475_4659DF89 
X-CRM114-Status: GOOD (  12.12  )
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
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 26 Feb 2020 at 15:36, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
>
> dpaa2 is complicated by the firmware, and that we can't switch the
> interface mode between (SGMII,1000base-X) and 10G.
>
> If the firmware is in "DPMAC_LINK_TYPE_PHY" mode, it expects to be told
> the current link parameters via the dpmac_set_link_state() call - it
> isn't clear whether that needs to be called for other modes with the
> up/down state (firmware API documentation is poor.)
>

With PCS control in Linux, I am pretty sure that you don't want
anything other than DPMAC_LINK_TYPE_PHY anyway.
Basically in DPMAC_LINK_TYPE_FIXED, the MC firmware is in control of
the PCS and polls its link state to emit link notifications to objects
connected to the DPMAC. So Linux control of PCS would class with
firmware control of the PCS, leading to undesirable side-effects to
say the least.

> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> According to speedtest.net: 11.9Mbps down 500kbps up

Regards,
-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
