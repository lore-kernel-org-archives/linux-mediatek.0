Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EA8C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 00:56:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A5AD61003
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 00:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A5AD61003
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gvTQWwgnghsZMzAr/P5EAuLQKoShQpruM6uPy9Wnk/4=; b=emnHLBBy2ZEIRMJWsbt4LA5vK
	/ea8QqXIqBwKMZvYTaQaU7YnliMozfjXRBOpq/d6u40CjHwEj1W27CDewevLXjbYKQZdBClDJMxWX
	mh2uZJze6TYvl482tQS2xJ+LRqUWWoQpzr1MGMJFj2gIoBZZCDcD+eHg8SohOW0TlNPwE723cAPpq
	LWM3iYuIFFrh1DGwxaMQi6hi3VaIU2dAKwNXFWCge80DbcDOGBjnL/P+svz0Td9OZAYVRRPTmDhrm
	/pybay2SqDUhLFKSFhGXPZ/4tjpSNsNuF31oBOJ9hR/xHCRgfCW9ApvnZeoWuX56GHwb4z2AhA3Y1
	iSa7dItRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lW7M1-007zD3-Jh; Tue, 13 Apr 2021 00:56:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW7Lx-007zCQ-P2; Tue, 13 Apr 2021 00:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JlgNNW6opfbYsb2HY0jilFyMHcv1A4vZ2Vd6HwbRFUs=; b=4akmqH38kFHzDFi9+44DcjaCnX
 iGDRGIFwNIuqKdYe+sH+u+Ai683yrGxORuyDjkrFdoQyn3yakQnfiJWlEIBZotDBGn5GqnkgDlW+h
 MeNH/gOXZFZj134OHplaFnIjYIbfs1oRWMvxmPo/quDceB1pR4vWj2eDnuPl8+IZhLri5WVDemBkB
 1m23k3hg+dhkk+B06T2lYJnBHhOEHwrR+AQ0U5/AzvNfSH+F6907Q/8ItV7U3NLOi/1IpBL92tahP
 v4hJzZhlI+4NE+x8V0/UHPbjx5+aYuqEZwoXZ+00biYrsEmzofzCb/xUyx/7pwypty80EGBa6CS/E
 V9RWLzuA==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW7Lv-006ezb-3X; Tue, 13 Apr 2021 00:56:28 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lW7LN-00GOEl-SK; Tue, 13 Apr 2021 02:55:53 +0200
Date: Tue, 13 Apr 2021 02:55:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Walle <michael@walle.cc>
Cc: ath9k-devel@qca.qualcomm.com, UNGLinuxDriver@microchip.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linux-omap@vger.kernel.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Andreas Larsson <andreas@gaisler.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Joyce Ooi <joyce.ooi@intel.com>,
 Chris Snook <chris.snook@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Sunil Goutham <sgoutham@marvell.com>, Fugang Duan <fugang.duan@nxp.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vadym Kochan <vkochan@marvell.com>, Taras Chornyi <tchornyi@marvell.com>,
 Mirko Lindner <mlindner@marvell.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Byungho An <bh74.an@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Wingman Kwok <w-kwok2@ti.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Kalle Valo <kvalo@codeaurora.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Stanislaw Gruszka <stf_xl@wp.pl>,
 Helmut Schaa <helmut.schaa@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next v4 1/2] of: net: pass the dst buffer to
 of_get_mac_address()
Message-ID: <YHTsGXbbr8mkifDo@lunn.ch>
References: <20210412174718.17382-1-michael@walle.cc>
 <20210412174718.17382-2-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412174718.17382-2-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_175627_175920_EDF2ADB5 
X-CRM114-Status: GOOD (  29.78  )
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

On Mon, Apr 12, 2021 at 07:47:17PM +0200, Michael Walle wrote:
> of_get_mac_address() returns a "const void*" pointer to a MAC address.
> Lately, support to fetch the MAC address by an NVMEM provider was added.
> But this will only work with platform devices. It will not work with
> PCI devices (e.g. of an integrated root complex) and esp. not with DSA
> ports.
> 
> There is an of_* variant of the nvmem binding which works without
> devices. The returned data of a nvmem_cell_read() has to be freed after
> use. On the other hand the return of_get_mac_address() points to some
> static data without a lifetime. The trick for now, was to allocate a
> device resource managed buffer which is then returned. This will only
> work if we have an actual device.
> 
> Change it, so that the caller of of_get_mac_address() has to supply a
> buffer where the MAC address is written to. Unfortunately, this will
> touch all drivers which use the of_get_mac_address().
> 
> Usually the code looks like:
> 
>   const char *addr;
>   addr = of_get_mac_address(np);
>   if (!IS_ERR(addr))
>     ether_addr_copy(ndev->dev_addr, addr);
> 
> This can then be simply rewritten as:
> 
>   of_get_mac_address(np, ndev->dev_addr);
> 
> Sometimes is_valid_ether_addr() is used to test the MAC address.
> of_get_mac_address() already makes sure, it just returns a valid MAC
> address. Thus we can just test its return code. But we have to be
> careful if there are still other sources for the MAC address before the
> of_get_mac_address(). In this case we have to keep the
> is_valid_ether_addr() call.
> 
> The following coccinelle patch was used to convert common cases to the
> new style. Afterwards, I've manually gone over the drivers and fixed the
> return code variable: either used a new one or if one was already
> available use that. Mansour Moufid, thanks for that coccinelle patch!
> 
> <spml>
> @a@
> identifier x;
> expression y, z;
> @@
> - x = of_get_mac_address(y);
> + x = of_get_mac_address(y, z);
>   <...
> - ether_addr_copy(z, x);
>   ...>
> 
> @@
> identifier a.x;
> @@
> - if (<+... x ...+>) {}
> 
> @@
> identifier a.x;
> @@
>   if (<+... x ...+>) {
>       ...
>   }
> - else {}
> 
> @@
> identifier a.x;
> expression e;
> @@
> - if (<+... x ...+>@e)
> -     {}
> - else
> + if (!(e))
>       {...}
> 
> @@
> expression x, y, z;
> @@
> - x = of_get_mac_address(y, z);
> + of_get_mac_address(y, z);
>   ... when != x
> </spml>
> 
> All drivers, except drivers/net/ethernet/aeroflex/greth.c, were
> compile-time tested.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michael Walle <michael@walle.cc>

I cannot say i looked at all the changes, but the ones i did exam
seemed O.K.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
