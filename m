Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050B7FC6197
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Sep 2024 05:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1M7ruRNRUYjRohbwuaCuLvbF8h8qL/m91LCjTsa0pY=; b=Cij1adzqz4QooKu2klWquuMzIH
	cuRFl9qx0qzB6zJRM24CJ72AC+Vuo/yH68nCg1+ftNBdd4FAERBD0epvsd4cZYqrcwlqIX8+++cV/
	NvKMFcjTaaOALgkdcAm8Odnt1Z5699SmzC2QF4Z8DKG8XEj+p11mE5YnwDNztgxPJN4pebopmqB29
	0et5EJVlTb4upUlyOmJziAM3gSNKTvY4ZWI6zWiQ4BOQje3CgmpKuUxfyn2VpUaSr9zlYsi0SZkEG
	u+XeyA3nhZx0LrikuczauKWEJIR2iPo5gIBPl0YNyoI8oD7ExmOyWmuXVnLSv4BDcmHDBt4c/OO+4
	cYiGUUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spLoY-00000000AdP-2gDq;
	Sat, 14 Sep 2024 05:59:22 +0000
Received: from flow7-smtp.messagingengine.com ([103.168.172.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spLmF-00000000AKZ-3q2o
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Sep 2024 05:57:01 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailflow.phl.internal (Postfix) with ESMTP id 946DF2000B1;
	Sat, 14 Sep 2024 01:56:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sat, 14 Sep 2024 01:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1726293416; x=1726300616; bh=r1M7ruRNRU
	YjRohbwuaCuLvbF8h8qL/m91LCjTsa0pY=; b=oiKgM+gD3RT2ib83IZzlMUM41J
	1QbbZbmqBdJBHGGq2WpIaVCB+Ge+quoKsOMtuTLjJU5FPrpf3AWVOSXUWufjkobc
	Ux0gg/ailm0C6haQPKngJlphanol8xtASqkbxiRNz99xBSdrvitByIwdSb21ynUP
	KjVrk8hB3bAQpmUgemoRUpsK+bKiiAIPPDWPapZSagCdKMQ5ge1AW/XrsWFQTwMP
	F4RDYSkfDl+Wcd9dVsnrVtym0x6XIZOrwiCRwgvpIx5h5j55RnWUnbhFUG9s3cog
	fjUNDG1LVo+t1N5W4dgZuvH1AcytA0fLz8imKR9A7wp7OTVZzKxu1ycFvz5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726293416; x=1726300616; bh=r1M7ruRNRUYjRohbwuaCuLvbF8h8
	qL/m91LCjTsa0pY=; b=dTvhx3KGz7lzodcLtN7FWvG6iRBbtM/oQwdQbCu5H/2C
	jj8ghPZhTT6JIuj2tIKfeGxBj2IkfRK80+ExL484EeqmZrhVsLg2l5vPGtYnwfZl
	EVZXr9lnXwWosTTY/s9V1mZvmdv8K7qvLZPitDJgcFCDukmM9kHRZIi5FSJjIJRA
	mIi6qaWZGknB3hgZRpwuTqTJmdERu+HLupSUz6isZMqog5g5W0OhIwa7l05Btgp4
	w8+NRO/8sdktwMl7uD2jW1PioE3Cm4rp/uFIAP80+aDpYxZIPnGhlRCDMOyX0zlh
	CtLZcLuqnQHFPbX/qEDrcG1yXxIikp/CeVIlURxUQA==
X-ME-Sender: <xms:pyXlZo0ykIxWD-4xYHvIY8eHb8ErwcjcJqz8nEN6qGnQDD666ZKqzA>
    <xme:pyXlZjFQwo4CElZ8_eq9qnVJabBqGqA7P5ZN70N1B-o4yxzh64J8yLDgtIt349CEW
    ShDLB750snMgg>
X-ME-Received: <xmr:pyXlZg6DVL-59vM29UlEnostWe8LhObGPwQ0ImNW3zzeSuwEgVOTX6MYjnCPYFq_07wWuALjworwc3bgLKYrESsBxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejledguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeegheeuhefgtdeluddtleekfeegjeetgeeikeehfeduieffvddufeef
    leevtddtvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
    pdhnsggprhgtphhtthhopeehgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprg
    hnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepohhlthgvrghnvhesghhmrghilhdr
    tghomhdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesshhivghmvg
    hnshdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegrrhhinhgtrdhunhgrlhesrghrihhntgelrdgtohhmpdhrtghpth
    htohepuggrnhhivghlsehmrghkrhhothhophhirgdrohhrghdprhgtphhtthhopeguqhhf
    vgigthesghhmrghilhdrtghomhdprhgtphhtthhopehsvggrnhdrfigrnhhgsehmvgguih
    grthgvkhdrtghomhdprhgtphhtthhopehfrdhfrghinhgvlhhlihesghhmrghilhdrtgho
    mh
X-ME-Proxy: <xmx:pyXlZh3NhZ47W8ot1yzi438QqhshqQMC_t9XFoqvfNOTSMt5VhKiEw>
    <xmx:pyXlZrEnQC7yKvdjSbHpNdDdDCFjizNJ7TGZIjnSiciYgqbskDAwaA>
    <xmx:pyXlZq-IDOu97cyMH9awHz4QyfjAFCflPRcJso-FJKiv2wBdSj1ksw>
    <xmx:pyXlZgn-FI0AoKPDAFRSg9cIKczVtuMSzJNK60Ux6G4dAS_2JdCfYw>
    <xmx:qCXlZlD-5VlMMQYk06m3uJiE1IpLx5akx0bxavQG_4jtn2jPM_iELKKW>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Sep 2024 01:56:54 -0400 (EDT)
Date: Sat, 14 Sep 2024 07:56:52 +0200
From: Greg KH <greg@kroah.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	"A. Sverdlin" <alexander.sverdlin@siemens.com>,	netdev@vger.kernel.org,
	=?iso-8859-1?Q?Ar1n=E7_=DCNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,	Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	UNGLinuxDriver@microchip.com,
	Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	linux-mediatek@lists.infradead.org, bridge@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] net: dsa: RCU-protect dsa_ptr in struct net_device
Message-ID: <2024091436-gas-phonebook-0018@gregkh>
References: <20240910130321.337154-1-alexander.sverdlin@siemens.com>
 <20240910130321.337154-2-alexander.sverdlin@siemens.com>
 <20240913190326.xv5qkxt7b3sjuroz@skbuf>
 <28d0a7a5-ead6-4ce0-801c-096038823259@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28d0a7a5-ead6-4ce0-801c-096038823259@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_225700_263297_7DEF0F85 
X-CRM114-Status: GOOD (  15.74  )
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

On Fri, Sep 13, 2024 at 09:27:23PM +0200, Andrew Lunn wrote:
> > >  drivers/net/dsa/mt7530.c                    |   3 +-
> > >  drivers/net/dsa/ocelot/felix.c              |   3 +-
> > >  drivers/net/dsa/qca/qca8k-8xxx.c            |   3 +-
> > >  drivers/net/ethernet/broadcom/bcmsysport.c  |   8 +-
> > >  drivers/net/ethernet/mediatek/airoha_eth.c  |   2 +-
> > >  drivers/net/ethernet/mediatek/mtk_eth_soc.c |  22 +++--
> > >  drivers/net/ethernet/mediatek/mtk_ppe.c     |  15 ++-
> > >  include/linux/netdevice.h                   |   2 +-
> > >  include/net/dsa.h                           |  36 +++++--
> > >  include/net/dsa_stubs.h                     |   6 +-
> > >  net/bridge/br_input.c                       |   2 +-
> > >  net/core/dev.c                              |   3 +-
> > >  net/core/flow_dissector.c                   |  19 ++--
> > >  net/dsa/conduit.c                           |  66 ++++++++-----
> > >  net/dsa/dsa.c                               |  19 ++--
> > >  net/dsa/port.c                              |   3 +-
> > >  net/dsa/tag.c                               |   3 +-
> > >  net/dsa/tag.h                               |  19 ++--
> > >  net/dsa/tag_8021q.c                         |  10 +-
> > >  net/dsa/tag_brcm.c                          |   2 +-
> > >  net/dsa/tag_dsa.c                           |   8 +-
> > >  net/dsa/tag_qca.c                           |  10 +-
> > >  net/dsa/tag_sja1105.c                       |  22 +++--
> > >  net/dsa/user.c                              | 104 +++++++++++---------
> > >  net/ethernet/eth.c                          |   2 +-
> > >  25 files changed, 240 insertions(+), 152 deletions(-)
> > 
> > Thank you for the patch, and I would like you to not give up on it, even
> > if we will go for a different bug fix for 'stable'.
> > 
> > It's just that it makes me a bit uneasy to have this as the bug fix.
> 
> +1
> 
> We should try for a minimal fix for stable, and keep this for
> net-next, given its size.
> 
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> 
> * It must be obviously correct and tested.
> * It cannot be bigger than 100 lines, with context.

It's fine if it fixes something properly, to go over those limits.

