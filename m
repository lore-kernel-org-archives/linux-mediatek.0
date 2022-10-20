Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4F2C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaGDSW9Uo5gk30Lai/grQJHvjoamn5mhkN1P8X3Mr1c=; b=H6NlUG21b4nWvDdi3f2qoDm6RF
	q+WqmkIeDmR8btg57aYbG0UKGyHgTpuuaPE7OS6OKAjwtTiv7/i8V32UtZ4sWSZrzpmTpJPY9G+JC
	jf0RiwZRkltTF+o4rHS7SpCazt3Y1y5pkVpwpP+Kq7tHksfXgOCSwXLSB3ezcVdDcF6qrKWtyCLWz
	t08Y2BraQAH8HujdMyvwF8Az1CaZWl8vPZr/ySL6VgE6cIxB+Olv2YXMK//az1c96Snxow+6inpg7
	ufXxlyvPQ+0c9k+3NTg3GCvj9FB+99tHFvPndDbPm/CXTN+HGfxDzBu4rmWHansLCalD1TIzs0QZU
	0eQM6m4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olXRA-00GtBl-2Q; Thu, 20 Oct 2022 15:26:24 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olXQr-00GsnP-AN; Thu, 20 Oct 2022 15:26:09 +0000
Received: by mail-ej1-x62a.google.com with SMTP id ot12so394706ejb.1;
        Thu, 20 Oct 2022 08:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AaGDSW9Uo5gk30Lai/grQJHvjoamn5mhkN1P8X3Mr1c=;
        b=XDGSk4LCApoml0aEWA/O3LLO/VsZONiWFe/ectvtscueo6IjH7ZUf9RlJhwtFSIpxQ
         vY++6qdmYZb+oW7zRT7cjXr+GC9giXFUnuCNfw5DiA7j8d1qyob8iMM2osLiToYj1ohv
         MjMD+t1N0GGFjY33uJZGAYwRCYC6M7/DErNQH5hOggVnb9DHFCdUYjpqVdRqokBrlh96
         GkyL6AI+ywx2J+ZQLZtQKEdIhoDTpnzcQvXN+CYIRxi0BkkuQTsDRuTeav78lyAHPmv8
         k8jEA+WOuluVDUj0nveiEfMCshL90NJVUri95IyjOMeZiW8GRh6YgwpYdwZ7tEn6iimD
         AnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaGDSW9Uo5gk30Lai/grQJHvjoamn5mhkN1P8X3Mr1c=;
        b=qN8ctnpRf4vTNK0cru9Nhv32wQpYENmcz+9hZqK7hH0xjIdjiMhG3aQzuw/vd1uwVB
         tfWF7gtPvZNI+Hbqy+kgATUSCB8tJFnmOCtLP5rCcg8f3aCG77Fg0yN+G6DGJEqahtd8
         irCrn5xTkRJHv+wZgrZtuCILBrtpc7feOPTxGM9DCpZu8S7oJKl7QWvu9i3JlLUxa+dG
         Aa3mvW3N64VDLFp0Ji5q2mfUvcT/X66Bz3mjoPqzuGUnEPUDIFHAUNxBsOPmgjlQEhfE
         YHKuHutBdmF3K488xpwBY3eHttt0jx2POEVqhnnQMIS6Ohv9i0IP2zi2EZRywTKyGMru
         tgfw==
X-Gm-Message-State: ACrzQf2bdNDDkK2XdmByqNBYe4Oy7qoIaQBc2Inc/vDEFeO3lHiSOS5Y
	uKWLfA9Jhym8ejgtk/GdVD5peDT+CGzgQg==
X-Google-Smtp-Source: AMsMyM6AS5oI6Y5yVMqB5w4gQHdBr1Y11p9UujtJKBEf/rnNjbaypba0C6Ye03626y0QbW56AhPONA==
X-Received: by 2002:a17:907:a05:b0:77b:b538:6476 with SMTP id bb5-20020a1709070a0500b0077bb5386476mr11709107ejc.324.1666279562972;
        Thu, 20 Oct 2022 08:26:02 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id r2-20020a1709061ba200b0078d76ee7543sm10363196ejg.222.2022.10.20.08.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 08:25:58 -0700 (PDT)
Date: Thu, 20 Oct 2022 18:25:54 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: "Hans J. Schultz" <netdev@kapio-technology.com>, davem@davemloft.net,
	kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Yuwei Wang <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>,
	Florent Fourcot <florent.fourcot@wifirst.fr>,
	Hans Schultz <schultz.hans@gmail.com>,
	Joachim Wiberg <troglobit@gmail.com>,
	Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 05/12] net: dsa: propagate the locked flag
 down through the DSA layer
Message-ID: <20221020152554.rck3skqqdd45fu46@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-6-netdev@kapio-technology.com>
 <20221018165619.134535-6-netdev@kapio-technology.com>
 <20221020130224.6ralzvteoxfdwseb@skbuf>
 <Y1FMAI9BzDRUPi5Y@shredder>
 <20221020133506.76wroc7owpwjzrkg@skbuf>
 <Y1FTzyPdTbAF+ODT@shredder>
 <20221020140400.h4czo4wwv7erncy7@skbuf>
 <Y1FiImF3i4s0bLuD@shredder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1FiImF3i4s0bLuD@shredder>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_082605_405292_F1FC5122 
X-CRM114-Status: GOOD (  33.46  )
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

On Thu, Oct 20, 2022 at 05:58:42PM +0300, Ido Schimmel wrote:
> My understanding is that mv88e6xxx only reads the SMAC and FID/VID from
> hardware and notifies them to the bridge driver. It does not need to
> parse them out of the Ethernet frame that triggered the "violation".
> This is the "ugly" part (in my opinion).

I think that the Marvell approach is uglier, but maybe that's just me.
Between parsing a MAC SA/VLAN ID from an Ethernet frame than having to
concern myself with rate limiting IRQs which need MDIO access, I'd
rather parse Ethernet frames all day long.

With Ethernet we have all sorts of coping mechanisms, NAPI, IRQ
coalescing. The Ethernet interrupts are designed to be very high
bandwidth. You can even put a storm policer on Ethernet traffic and rate
limit the learn frames. I don't like where the Marvell specific impl is
going, I don't think it is a good first implementation of a new feature,
since it will inevitably shape the way in which other hardware with CPU
assisted learning will do things. For example, not sure if blackhole FDB
entries are going to be needed by other implementations as well.

I kind of thought that the Linux bridge would be more resilient to DoS
than it actually is. Now I'm not sure if me and Andrew gave bad advice
with the whole protection mechanisms put in place as UAPI for mv88e6xxx's
quirks.

> > The learn frames are "special" in the sense that they don't belong to
> > the data path of the software bridge*, they are just hardware specific
> > information which the driver must deal with, using a channel that
> > happens to be Ethernet and not an IRQ/MDIO.
> 
> I think we misunderstand each other because I don't understand why you
> call them "special" nor "hardware specific information" :/

I call them special because there is no need to present these packets to
application software. Understood and agreed that they are identical to
the original packet which triggered the trap (plus some metadata which
denotes the trap reason, presumably), although I don't think this really
matters too much.

> We don't inject to the software data path some hardware specific
> frames, but rather the original Ethernet frames that triggered the
> violation. The same thing happens with packets that encountered a
> neighbour miss during routing or whose TTL was decremented to zero.
> The hardware can't generate ARP or ICMP packets, so the original
> packet is injected to the Rx path so that the kernel will generate the
> necessary control packets in response.

Can't speak for IP forwarding offload unfortunately, but it seems like
you presented a different/unrelated situation here. CPU assisted
learning is not slow path processing, because nothing needs to be done
further with that packet except for extracting its MAC SA/VID, and
learning it. The rest of the original packet is really not necessary.

> > *in other words, a bridge with proper RX filtering should not even
> > receive these frames, or would need special casing for BR_PORT_MAB to
> > not drop them in the first place.
> > 
> > I would incline towards an unified approach for CPU assisted learning,
> > regardless of this (minor, IMO) difference between Marvell and other
> > vendors.
> 
> OK, understood. Assuming you don't like the above, I need to check if we
> can do something similar to what mv88e6xxx is doing (because I don't
> think mv88e6xxx can do anything else).

No no, I like having an Ethernet channel (see the first reply to this
email), I think it has benefits and I don't want to make Spectrum follow
an inferior route just because that's the model.

But on the other hand, nobody right now needs the mechanism that Hans
put in place for setting BR_FDB_LOCKED in software, and notifying it
back to the driver. Moreover, when Ethernet-based CPU assisted learning
will come, this mechanism will not be the only possibility, and that
should be a separate discussion. I still think that generic helpers to
emit SWITCHDEV_FDB_ADD_TO_BRIDGE based on an skb are an equally valid
approach, and would diverge significantly less from Marvell without
imposing any real limitation. In the implementation proposed here, we
have variation for the sake of variation, and we come up with
hypothetical examples of how they might be useful. At least half this
patch set is full of maybes, I can't really say I like that.

