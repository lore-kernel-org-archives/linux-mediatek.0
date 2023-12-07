Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED626C10F05
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGdJaj+nipEQxTSveXAmiJV+rm4rc6npNn2uLL6bkbk=; b=Iuae9nNmYhVV+W9gF4JEjxfhvm
	hfC+36laAJTPZ96YtRluDbdSyDPmTp/CRNwzxpP/1EI39S5HkGlo+G4+SCQFTTF8Gx4CSqyJG0crF
	Dulvsmfr8K3JhfuLQgiZ+BhPZJi+STVGBMihjNGxyy5bN8GFLPTW4bmMH+SiyAVKLsPyoRSmyQ/TG
	hUInRiOHJ6bUV7VRQ7Q4u/wWXLZlW+yxhEjFSHNiHL86zTwm7yESCeToAndg5i61RFEGx6uazZsxP
	Y4jvKEQd6eU5gLu43roql+QghYM/pE5xjECVRQ13N625vTzpIdxr20JB7Hp2MzHlW9lcWZ+HsnbVd
	90BETtOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIUI-00DZVM-2r;
	Thu, 07 Dec 2023 17:48:38 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIUF-00DZUl-0e;
	Thu, 07 Dec 2023 17:48:36 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54bfa9b3ffaso1780219a12.1;
        Thu, 07 Dec 2023 09:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701971312; x=1702576112; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eGdJaj+nipEQxTSveXAmiJV+rm4rc6npNn2uLL6bkbk=;
        b=No6hnT+9QkZ//aKVfh5nt2rp6ty/xmQDwC2wqJIlWalhJy+EUg//z96xK1mf4PFJp0
         U5PndEVEZTgp/rSFkVIW/gS8aYj2LIjpqZSBznrbnYCSDnHuoULHl+9iz852b/88kERX
         vyKP8qFQ0WMqu7V987gbpR13mAK5djkXKefuVAycuiuMxDDZmZI9cJeGTN7p+9MjYGKd
         F0rmfelM45Vo+qhj/cwwCSN3zKKy9bP1EaEGLXDcaOYru+j7A4hFT272fx7XPmnq8Cc/
         QyCYMDiYAXiH/O1ta7yrDOJ3kwwaHV6HUJbKzAHMIUwAc5leMbRjnnFen14M44wBSW6G
         SVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701971312; x=1702576112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGdJaj+nipEQxTSveXAmiJV+rm4rc6npNn2uLL6bkbk=;
        b=fDd1y3uutH3klBeo+e878i/guTJW2SuLPTHJh9jKFNflLAo6pEMI8R1BYNfv7v/I+9
         0Fa5+b+GpsfMwWT0BcNrCyQFMvCrSliNXHay0v/stCI2sc9yFxcKKev/lgBdrSAP4e7Q
         uKLvAz6Uxa3z5pjX4CEN+AbBp6MjSazKHqrN2NOw6a9EJaEO+5N9GRPP96pATOw8m7KL
         nZeEM+kDFzBVSsy2i98J1EzhT0LajBWag3rQRiCL+Ex9zhWBf7yPagMUOh6O5XzKL7tU
         GKMFFYW6pK9k7s9yl2vttOnCTBNgAQQX9wBtk6dO+c6nKaQNe92GUs4C6O1JtOXkfzQX
         E6pg==
X-Gm-Message-State: AOJu0Yzxkla02sRCL/JtQ9PbZeymQvXy6C6StOoL2jW6WpoEprp69ROE
	fdCGxJ2kL/efksGfyd2bI9Q=
X-Google-Smtp-Source: AGHT+IH9JtAFBVDLOxDuaxhYkqJH6nILdbeGTbnDHqIXsocjZ9jc5oOf17wbntRQ2k4XgpUcl8BcvA==
X-Received: by 2002:a17:906:c284:b0:a1d:2739:7772 with SMTP id r4-20020a170906c28400b00a1d27397772mr1598356ejz.147.1701971312110;
        Thu, 07 Dec 2023 09:48:32 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id vw11-20020a170907a70b00b00a1cbb055575sm17273ejc.180.2023.12.07.09.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 09:48:31 -0800 (PST)
Date: Thu, 7 Dec 2023 19:48:29 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 01/15] net: dsa: mt7530: always trap frames to
 active CPU port on MT7530
Message-ID: <20231207174829.jccyws7myhxbgr5k@skbuf>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-2-arinc.unal@arinc9.com>
 <ZVjLj6/iCL/muzmH@shell.armlinux.org.uk>
 <ffaa26b3-eb25-47cc-8891-fe3cbcc724da@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffaa26b3-eb25-47cc-8891-fe3cbcc724da@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_094835_265490_35A2BA94 
X-CRM114-Status: GOOD (  38.47  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Dec 02, 2023 at 11:29:18AM +0300, Arınç ÜNAL wrote:
> > I would be tempted to write this as:
> > 
> > 	mask = BIT(cpu_dp->index);
> > 
> > 	if (operational)
> > 		priv->active_cpu_ports |= mask;
> > 	else
> > 		priv->active_cpu_ports &= ~mask;
> > 
> > Now, what happens when active_cpu_ports is zero? Doesn't that mean there
> > is no active CPU port? In which case, wouldn't disabling the CPU port
> > direction be appropriate, such as:
> > 
> > 	if (priv->active_cpu_ports)
> > 		val = CPU_EN | CPU_PORT(__ffs(priv->active_cpu_ports));
> > 	else
> > 		val = 0;
> > 
> > 	mt7530_rmw(priv, MT7530_MFC, CPU_EN | CPU_PORT_MASK, val);	
> > 
> > ?
> 
> In practice, it doesn't seem to matter. The CPU_EN bit enables the CPU port
> defined on CPU_PORT_MASK which is used for trapping frames. No active CPU
> ports would mean that all the DSA conduits are down. In that case, all the
> user ports will be down also. So there won't be any traffic. But disabling
> it is of course more appropriate here.

Ack, DSA takes down the user ports which are affine to a certain conduit
interface when that goes down. See the NETDEV_GOING_DOWN handling in
net/dsa/user.c.

> > 
> > >   struct mt7530_priv {
> > >   	struct device		*dev;
> > > @@ -786,6 +787,7 @@ struct mt7530_priv {
> > >   	struct irq_domain *irq_domain;
> > >   	u32 irq_enable;
> > >   	int (*create_sgmii)(struct mt7530_priv *priv, bool dual_sgmii);
> > > +	unsigned long active_cpu_ports;
> > 
> > So this will be 32 or 64 bit in size. Presumably you know how many CPU
> > ports there can be, which looking at this code must be less than 8 as
> > CPU_PORT_MASK is only 3 bits in size. So, maybe use a u8, and check
> > that cpu_dp->index <= 7 ?

We picked "unsigned long" as storage because that's also the size of the
argument that __ffs() takes. But admittedly, we could have also stored a
smaller variable and promote it to unsigned long when we pass it to __ffs().

> Aren't there other mechanisms to check that cpu_dp->index is a valid port?

cpu_dp->index is guaranteed by DSA to be valid (according to the "reg"
value from the device tree and smaller than ds->num_ports). It's just a
question of balancing this kind of optimization with the possibility
that a future switch appears which has more than MT7530_NUM_PORTS (7) ports.

> At least with phylink_get_caps(), only ports lower than 7 will have proper
> interface modes allowed.
> 
> Here's the code after you and Vladimir's review:
> 
> static void
> mt753x_conduit_state_change(struct dsa_switch *ds,
> 			    const struct net_device *conduit,
> 			    bool operational)
> {
> 	struct dsa_port *cpu_dp = conduit->dsa_ptr;
> 	struct mt7530_priv *priv = ds->priv;
> 	u8 mask;
> 	int val;
> 
> 	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
> 	 * forwarded to the numerically smallest CPU port which the DSA conduit
> 	 * interface its affine to is up.
> 	 */
> 	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
> 		return;
> 
> 	mask = BIT(cpu_dp->index);
> 
> 	if (operational)
> 		priv->active_cpu_ports |= mask;
> 	else
> 		priv->active_cpu_ports &= ~mask;
> 
> 	if (priv->active_cpu_ports)
> 		val = CPU_EN | CPU_PORT(__ffs(priv->active_cpu_ports));
> 	else
> 		val = 0;

You could initialize "val" with 0 at declaration time and you wouldn't
need the "else" branch.

> 
> 	mt7530_rmw(priv, MT7530_MFC, CPU_EN | CPU_PORT_MASK, val);
> }
> 
> struct mt7530_priv {
> 	[...]
> 	u8 active_cpu_ports;
> };

Actually, looking at the code now, I don't understand why we even keep
track of the active_cpu_ports mask in the driver. We could read the
MT7530_MFC register in mt753x_conduit_state_change(), flip the bit
corresponding just to cpu_dp->index (rather than rmw all of CPU_PORT_MASK),
and write back the result. And to address Russell's concern, we could test
whether the resulting CPU_PORT_MASK portion of what we're going to write
back is all-zeroes or not, and if it is, clear the CPU_EN bit, otherwise
set it.

> 
> > 
> > I would also suggest moving irq_enable after create_sgmii, to avoid
> > holes in the struct.
> 
> Sorry, I've got no idea about this. Could you explain why would there
> possibly be holes in the struct with the current ordering of the members of
> the mt7530_priv structure?
> 
> Arınç

FWIW:

$ pahole -C mt7530_priv $KBUILD_OUTPUT/drivers/net/dsa/mt7530.o
struct mt7530_priv {
        struct device *            dev;                  /*     0     8 */
        struct dsa_switch *        ds;                   /*     8     8 */
        struct mii_bus *           bus;                  /*    16     8 */
        struct regmap *            regmap;               /*    24     8 */
        struct reset_control *     rstc;                 /*    32     8 */
        struct regulator *         core_pwr;             /*    40     8 */
        struct regulator *         io_pwr;               /*    48     8 */
        struct gpio_desc *         reset;                /*    56     8 */
        /* --- cacheline 1 boundary (64 bytes) --- */
        const struct mt753x_info  * info;                /*    64     8 */
        unsigned int               id;                   /*    72     4 */
        bool                       mcm;                  /*    76     1 */

        /* XXX 3 bytes hole, try to pack */

        phy_interface_t            p6_interface;         /*    80     4 */
        phy_interface_t            p5_interface;         /*    84     4 */
        unsigned int               p5_intf_sel;          /*    88     4 */
        u8                         mirror_rx;            /*    92     1 */
        u8                         mirror_tx;            /*    93     1 */

        /* XXX 2 bytes hole, try to pack */

        struct mt7530_port         ports[7];             /*    96   168 */
        /* --- cacheline 4 boundary (256 bytes) was 8 bytes ago --- */
        struct mt753x_pcs          pcs[7];               /*   264   280 */
        /* --- cacheline 8 boundary (512 bytes) was 32 bytes ago --- */
        struct mutex               reg_mutex;            /*   544    32 */
        /* --- cacheline 9 boundary (576 bytes) --- */
        int                        irq;                  /*   576     4 */

        /* XXX 4 bytes hole, try to pack */

        struct irq_domain *        irq_domain;           /*   584     8 */
        u32                        irq_enable;           /*   592     4 */

        /* XXX 4 bytes hole, try to pack */

        int                        (*create_sgmii)(struct mt7530_priv *, bool); /*   600     8 */
        unsigned long              active_cpu_ports;     /*   608     8 */

        /* size: 616, cachelines: 10, members: 24 */
        /* sum members: 603, holes: 4, sum holes: 13 */
        /* last cacheline: 40 bytes */
};

It's not like this makes any practical difference, as struct mt7530_priv
isn't used from hot paths, but tidying it up is a good sign of clean,
careful development, and of understanding memory alignment.

