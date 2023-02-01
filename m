Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0604C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdu/cSdrf95lHEkaUXGHj3bo8fqoVL5yH9BapQUMiuo=; b=la8PvdpcNSHhmVUAFaK+adiYmv
	Tg5G8246jrN88L24F0i7SIjIWA/t8d7dbjmCKiei2u4MHcIo/lu1rBiHzjgDJU/zQr4Sse1VtArqT
	rGY4natyYhcYeDZVnvdUJt4+e2FD+qJ0f6+HSbe0WCUyOil9L7hqgm0LoGaAMXaA8jmgPYsb4Snx1
	bjQ3hASj06/OixCfUxzsgCLBa79DUi4SK3mtVPfm6W/KvidzSOFF8e89gVXjMeb/sfZGskhp6Rm7r
	rYzFFjZICII7YJRHCLo5NqqiyOxcEHXsCfsIe4ju0cSn1M4g2mNAr6l39aVRjr/edFcccNUL5rql3
	Reb05Unw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHnE-00DBgO-Dq; Wed, 01 Feb 2023 18:25:12 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHn2-00DBap-6Q; Wed, 01 Feb 2023 18:25:01 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 32BA732009B8;
	Wed,  1 Feb 2023 13:24:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 01 Feb 2023 13:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675275896; x=1675362296; bh=rdu/cSdrf95lHEkaUXGHj3bo8fqo
	VL5yH9BapQUMiuo=; b=CV7kgIE3AZZdHao+BNdk6vds8PWdGb3GcGOmZzU7IXG4
	MRbrZZesw1p98Ub/ppz8lTBdsxADyPJkU3A9oOBRlmSLnUYYEfawHosLNeGs3Vvt
	j4B92h9sAxP7TiHk+PTutosjwxnvfNEOmHLThojboAcyjXR/PMp5gTv4n/HbF2Jq
	ixgm+8poal0ku5r9xnqFLtZFDEMxMCzHVsTJLmrqmPPxnaVCL3WJr5Drpsqo6ysq
	VoAI/Zc8yXnKhBAWv+FKOW+a7rYlchL/I4Hq6+0/599vXq6rlD7ez8PQAsW/9nQZ
	qo0Sx2oLBor+Jo8j9S37B16eohf7/INduBpNSUOUXQ==
X-ME-Sender: <xms:d67aYy4qxwFGX87O-G2B7M5zxfNZ74Y9mtMbxo8516e9D8bhKTKFzQ>
    <xme:d67aY75lEMCPrxc4H9pul-2v-J1jgKXwNmZZXLgBjL380mj4lQ3INXR-fJtD_gBjc
    aqayBisF96gOgI>
X-ME-Received: <xmr:d67aYxde7AhmFYf5geMb6OVzl7TZpePk5m93x3K5Karc8BF_O6hFyvRjtMlSh9bC0gMvlifcnI-6pA7b1CCjIPnZnTU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefiedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefkugho
    ucfutghhihhmmhgvlhcuoehiughoshgthhesihguohhstghhrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvudefveekheeugeeftddvveefgfduieefudeifefgleekheegleegjeej
    geeghfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hiughoshgthhesihguohhstghhrdhorhhg
X-ME-Proxy: <xmx:d67aY_IlRB3S5TvZlz0o0JCqGYk-kekSFXHC1k4gLs57JEDGrwOmHA>
    <xmx:d67aY2JYd8Oqu_8vARdEyvRdvd2bj94vUMckvqhcmT51VKOrxJJe9w>
    <xmx:d67aYwxKd2oRs3vn-UItsemryABabt3_l0YJN5FmVULsC7yP393h_w>
    <xmx:eK7aY81CA2_3n8FClr5BuI9CkoGQUyvdWQ8klVgJX5u4IrRI1wOKpw>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Feb 2023 13:24:54 -0500 (EST)
Date: Wed, 1 Feb 2023 20:24:51 +0200
From: Ido Schimmel <idosch@idosch.org>
To: "Hans J. Schultz" <netdev@kapio-technology.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,	Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,	Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>,	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER"
 <UNGLinuxDriver@microchip.com>,	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [PATCH net-next 4/5] net: bridge: ensure FDB offloaded flag is
 handled as needed
Message-ID: <Y9qucziByvXsx5Q0@shredder>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <20230130173429.3577450-5-netdev@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130173429.3577450-5-netdev@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_102500_288217_D6293711 
X-CRM114-Status: GOOD (  18.67  )
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

On Mon, Jan 30, 2023 at 06:34:28PM +0100, Hans J. Schultz wrote:
> Since user added entries in the bridge FDB will get the BR_FDB_OFFLOADED
> flag set, we do not want the bridge to age those entries and we want the
> entries to be deleted in the bridge upon an SWITCHDEV_FDB_DEL_TO_BRIDGE
> event.
> 
> Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>
> ---
>  net/bridge/br_fdb.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/net/bridge/br_fdb.c b/net/bridge/br_fdb.c
> index e69a872bfc1d..b0c23a72bc76 100644
> --- a/net/bridge/br_fdb.c
> +++ b/net/bridge/br_fdb.c
> @@ -537,6 +537,7 @@ void br_fdb_cleanup(struct work_struct *work)
>  		unsigned long this_timer = f->updated + delay;
>  
>  		if (test_bit(BR_FDB_STATIC, &f->flags) ||
> +		    test_bit(BR_FDB_OFFLOADED, &f->flags) ||
>  		    test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &f->flags)) {
>  			if (test_bit(BR_FDB_NOTIFY, &f->flags)) {
>  				if (time_after(this_timer, now))

Looks correct

> @@ -1465,7 +1466,9 @@ int br_fdb_external_learn_del(struct net_bridge *br, struct net_bridge_port *p,
>  	spin_lock_bh(&br->hash_lock);
>  
>  	fdb = br_fdb_find(br, addr, vid);
> -	if (fdb && test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &fdb->flags))
> +	if (fdb &&
> +	    (test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &fdb->flags) ||
> +	     test_bit(BR_FDB_OFFLOADED, &fdb->flags)))

This also looks correct, but the function name is not really accurate
anymore. I guess you can keep it as-is unless someone has a better name

>  		fdb_delete(br, fdb, swdev_notify);
>  	else
>  		err = -ENOENT;
> -- 
> 2.34.1
> 

