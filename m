Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBDEC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 15:29:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2CA261353
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 15:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2CA261353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1wJ59GY2r76x6VFygBfTefhd1J0ceLXvBLkiKwG7a9g=; b=X8YWll0Z/Bo05Bln5ORd5DDzd
	P0A+7VuFwFYlkituZik7E57PWjr7E49pEFDMML78wlCxI6o66kTVBBnf518feWP9/zn/m/wIzHgNv
	NFNtW5cTmpuYp2/8J9kOInMQGXwojyoJIBK7ylUgvJk/LkO3pG+0zscfqTDUuXY7D4LCFcC6WZrS7
	Oq0KA7trDDOwsutHbC/xBw8l2hvgoSduZHzYKzwi06o9BmO2BuPMwKaMqarSPL4M9oO3ub4Xe1aje
	2g1cPPqixD3YkH7XTH5KHjjk+D9OtdDOywWTp7OoIvGNZEAWvFc3MPbB0NQDZx//6cv7YoiZ1G4OD
	p3o8WLTIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWKyw-009esi-9k; Tue, 13 Apr 2021 15:29:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKyu-009esC-Bx
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 15:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Tzst4teGsUoIZnd0R8IxVImn0/EL/BJJDcQq4MQFjo4=; b=YzsCrEgL2+xPdeA8dtwAHMABI7
 wlO/2dfERaPZmSh5iGREGOn6k1MUbUc631TT9Ay4beDZVZJjdoYXVBje6BCkF70PJYg+X8QlIAp9W
 VM4jPCV8T32nwAYSCslwRm9xeRaDOWdBCDhiamy/Dm8VCHQ4ANNp3ktP5HQz0+/NN/Y4HI7o0ZD6h
 HX5ggCvF7iqBHT4kLj6gtSvn9NsToh34ZwJ4flUc/YYX0XGHFuR00wZAyIJOXopicUSL6Nr4dVijW
 hfueJ50n2M6pStym5oTL9n9mOPAa3DbRVtE6VeAf5z9IZDq319f50b21hwgfEx3cX/UX1BOT4kwwW
 WtLs+oDw==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKyq-00791P-Lh
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 15:29:35 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so1475355pjb.1
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Apr 2021 08:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=Tzst4teGsUoIZnd0R8IxVImn0/EL/BJJDcQq4MQFjo4=;
 b=S3zmzlLlDts+/gEFYumbHLX8X8Rqk/4FnMtLjuXf4L718dbKhoPzjH8zhXtIOQkflS
 Y8edxv/En47poNL0GJVtLjpfb7dQP2kJKH4wKemMoEA1ARslDPSaooNJRFal0iE2UuGV
 NemLLy+CofV/dML0jLBe6e6XFpkFzko+n4gK8X9kAhEMm9jXapQyHRIv0aS0DEz+7JuX
 FqkiwdFOcHfwwCqCRbq0JeBiC6ilqfXJNdv99SI0mXpaqUq9Ms+t+DW84pCrednE5fpK
 mADBd+KVY8nBuBWQpZ5e+OVT6RIBnEVokaYZnDrRQHNSY2LGN8vTqgqsJL9zYS4g6o/E
 M0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=Tzst4teGsUoIZnd0R8IxVImn0/EL/BJJDcQq4MQFjo4=;
 b=DTy+65IP3Se/86SRYivfg0tfjjDFsZzJ5R50/d2uhJ6evvMchVIu4BrGByrresy18A
 7GcZOWZavv3YvD7OuJP3XCYLnXsuvbXIrsHMRs+BlFGGvb0kUy6mqoTo55vn8cd97KJa
 AywsdiJJdAS6VjBCuGtUj/w2bnRRtXQQmrWi3NlwR8MGt4LgZ7xOZwaz2IlKxLA90+gU
 YT/rLdwDXvAM9/AiL6vAGKVicuy4/aJwN1myW6fqKDsfX/ZolB7fxZNTUdOVYuQ+p6wx
 IuVio/SrqCusekMH4oa+pJXw7/RhquKsj/TizP5H2O61dSDCF6dCvtKIAzArSlp+mmbq
 ymhg==
X-Gm-Message-State: AOAM530t6syM9wWYftfDPUWY0TTOhdUWw+rhLPDXXHuzmmLdTiAbBlH5
 jQzspnnkbZkHmSrL4xSRcd0=
X-Google-Smtp-Source: ABdhPJwYeKgUkvJZKeaa5VJTZBxqfvRjLXKooh+l9jFPdIugJz+CK1Rw/1dRmLCAvQuTmAGRkjejTg==
X-Received: by 2002:a17:90b:1bce:: with SMTP id
 oa14mr587690pjb.9.1618327771605; 
 Tue, 13 Apr 2021 08:29:31 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g4sm14852078pgu.46.2021.04.13.08.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 08:29:30 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Marc Zyngier <maz@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Greg Ungerer <gerg@kernel.org>
Subject: Re: [RFC v4 net-next 2/4] net: dsa: mt7530: add interrupt support
Date: Tue, 13 Apr 2021 23:29:20 +0800
Message-Id: <20210413152920.2190769-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YHWUK+tG3v9ZU/DT@lunn.ch>
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-3-dqfext@gmail.com> <87fszvoqvb.wl-maz@kernel.org>
 <20210412152210.929733-1-dqfext@gmail.com> <YHTgu1+6GZFdFgWJ@lunn.ch>
 <8735vuobfo.wl-maz@kernel.org> <YHWUK+tG3v9ZU/DT@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_082932_732799_871B424F 
X-CRM114-Status: GOOD (  25.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 13, 2021 at 02:52:59PM +0200, Andrew Lunn wrote:
> > I guess this is depends whether the most usual case is to have all
> > these interrupts being actively in use or not. Most interrupts only
> > use a limited portion of their interrupt space at any given time.
> > Allocating all interrupts and creating mappings upfront is a waste of
> > memory.
> > 
> > If the use case here is that all these interrupts will be wired and
> > used in most cases, then upfront allocation is probably not a problem.
> 
> Hi Marc
> 
> The interrupts are generally used. Since this is an Ethernet switch,
> generally the port is administratively up, even if there is no cable
> plugged in. Once/if a cable is plugged in and there is a link peer,
> the PHY will interrupt to indicate this.
> 
> The only real case i can think of when the interrupts are not used is
> when the switch has more ports than connected to the front panel. This
> can happen in industrial settings, but not SOHO. Those ports which
> don't go anywhere are never configured up and so the interrupt is
> never used.

Hi Andrew

This is what the extra check (BIT(p) & ds->phys_mii_mask) avoids.

Currently the mv88e6xxx driver does not have this check, and creates
15 PHY IRQ mappings on my 88E6176 unconditionally, leaving a gap in
/proc/interrupts:

...
 57:          0          0  mv88e6xxx-g1   3 Edge      mv88e6xxx-f1072004.mdio-mii:00-g1-atu-prob
 59:          0          0  mv88e6xxx-g1   5 Edge      mv88e6xxx-f1072004.mdio-mii:00-g1-vtu-prob
 61:          8          5  mv88e6xxx-g1   7 Edge      mv88e6xxx-f1072004.mdio-mii:00-g2
 63:          8          4  mv88e6xxx-g2   0 Edge      mv88e6xxx-1:00
 64:          0          0  mv88e6xxx-g2   1 Edge      mv88e6xxx-1:01
 65:          0          0  mv88e6xxx-g2   2 Edge      mv88e6xxx-1:02
 66:          0          0  mv88e6xxx-g2   3 Edge      mv88e6xxx-1:03
 67:          0          2  mv88e6xxx-g2   4 Edge      mv88e6xxx-1:04
// IRQ 68~77 are created but not used
 78:          0          0  mv88e6xxx-g2  15 Edge      mv88e6xxx-f1072004.mdio-mii:00-watchdog
...

You may as well add irq_set_nested_thread(irq, true) to irq_domain_map
so all IRQs share a single thread.

> 
>       Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
