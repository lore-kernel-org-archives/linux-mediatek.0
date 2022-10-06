Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E62C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 12:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1YUsSec42NZr0uNUmwzdZCJ/cJRubpYY6BaXUzZ9Jw=; b=OSYyII+hErIkTsKrd95WbSCLzg
	i46EzM7ZxCBYnWl9e8MImM7GP4XTBfQN7PfS22cd9gkGgfN0k7V/RsyaEKQ4DPNlAGG/H+Gdn9OIg
	a3Cvb6qpNXjDkB/J4yV846U7EQJBJdw9HsW7k0xuxnG0bQDesjBRO5A02BCigoZqUEelyt7oEjdou
	vSHOSld5OZ2ZaP9YulnrMr4k4pDWHQjzN5bsazUnU6NPJKOWg5KXgLjAKY5iwH66rOqPBb6zzYrS0
	Wv+fc1oNkw4k6/MzVC0lYwskrYWwCZ2281Mcawq84y86rfxbXZly/7VhSvM0zZ44eMplaaF2kYSnv
	LT6arCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPxb-002FjB-9q; Thu, 06 Oct 2022 12:26:43 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPxO-002EU1-Rk; Thu, 06 Oct 2022 12:26:32 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id A97F418844A7;
	Thu,  6 Oct 2022 12:24:17 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 9148025001FA;
	Thu,  6 Oct 2022 12:24:17 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 7014B9EC0005; Thu,  6 Oct 2022 12:24:17 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 06 Oct 2022 14:24:17 +0200
From: netdev@kapio-technology.com
To: davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Andrew
 Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir
 Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens
 <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jiri Pirko
 <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu
 <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan
 <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>, Christian Marangi
 <ansuelsmth@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Yuwei Wang
 <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>, Ido Schimmel
 <idosch@nvidia.com>, Florent Fourcot <florent.fourcot@wifirst.fr>, Hans
 Schultz <schultz.hans@gmail.com>, Joachim Wiberg <troglobit@gmail.com>, Amit
 Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 net-next 8/9] net: dsa: mv88e6xxx: add blackhole ATU
 entries
In-Reply-To: <20220928150256.115248-9-netdev@kapio-technology.com>
References: <20220928150256.115248-1-netdev@kapio-technology.com>
 <20220928150256.115248-9-netdev@kapio-technology.com>
User-Agent: Gigahost Webmail
Message-ID: <b5cdf29e7b5a5f7fa4ab1df4c5fd6e62@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_052631_098260_83584EBA 
X-CRM114-Status: GOOD (  13.76  )
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

On 2022-09-28 17:02, Hans Schultz wrote:
> From: "Hans J. Schultz" <netdev@kapio-technology.com>
> 
> Blackhole FDB entries can now be added, deleted or replaced in the
> driver ATU.
> 
> Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>
> ---
>  drivers/net/dsa/mv88e6xxx/chip.c | 78 ++++++++++++++++++++++++++++++--
>  1 file changed, 74 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/dsa/mv88e6xxx/chip.c 
> b/drivers/net/dsa/mv88e6xxx/chip.c
> index 71843fe87f77..a17f30e5d4a6 100644
> --- a/drivers/net/dsa/mv88e6xxx/chip.c
> +++ b/drivers/net/dsa/mv88e6xxx/chip.c
> @@ -2735,6 +2735,72 @@ static int mv88e6xxx_vlan_msti_set(struct 
> dsa_switch *ds,
>  	return err;
>  }
> 
> +struct mv88e6xxx_vid_search_ctx {
> +	u16 vid_search;
> +	u16 fid_found;
> +};
> +
> +static int mv88e6xxx_find_fid_on_matching_vid(struct mv88e6xxx_chip 
> *chip,
> +					      const struct mv88e6xxx_vtu_entry *entry,
> +					      void *priv)
> +{
> +	struct mv88e6xxx_vid_search_ctx *ctx = priv;
> +

FYI: I have already made updates to this part to use mv88e6xxx_vtu_get() 
instead of the walk, which also fixes a problem when vid=0 in this 
implementation.

