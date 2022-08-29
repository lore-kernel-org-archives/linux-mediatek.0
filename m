Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BEBECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 11:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RDIcXaS5jF1+5uoBIFSSk003ecVsgybqw2FzM1pilE=; b=nKmUZDTVbJgRTOlCSBu4/QH1g8
	fK5BesqAgOjfJlvoh8ixS7xbDBQgcucs9NPt8HmwflkbDzu2nBSoJ6C9Buzj0Np+7lPdCEjYw331x
	dGa7XSoRLS9Sen37y7qPhohtMMB5B5M8PT9vsg88kHrpPfYXonG9uNDoY3XeLtnG7FNJ+pvI3pkZF
	LkiXiKesut4z1Mxtt4Teqzk7g4CkKeVbXlZmWOsTIjw7kqrc/3poID7kFJ5u0W3OQHrp/otJzP3Px
	LsxmZNEc+z2AJU4TWxIHTguyUW0VRe/LMerFLj6AE6UcEqAOWrXxfnWHNy5wiolitF4Ay0kbDorx6
	ku5aMr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSd2Y-008Bsb-KE; Mon, 29 Aug 2022 11:34:50 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSd2C-008BUr-DK; Mon, 29 Aug 2022 11:34:29 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id A21921884505;
	Mon, 29 Aug 2022 11:34:21 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 9954B25032B7;
	Mon, 29 Aug 2022 11:34:21 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 8D1D49EC0003; Mon, 29 Aug 2022 11:34:21 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Mon, 29 Aug 2022 13:34:21 +0200
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@nvidia.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt
 Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung
 Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, Christian Marangi
 <ansuelsmth@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Yuwei Wang
 <wangyuweihx@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 net-next 1/6] net: bridge: add locked entry fdb flag to
 extend locked port feature
In-Reply-To: <Ywo16vHMqxxszWzX@shredder>
References: <20220826114538.705433-1-netdev@kapio-technology.com>
 <20220826114538.705433-2-netdev@kapio-technology.com>
 <Ywo16vHMqxxszWzX@shredder>
User-Agent: Gigahost Webmail
Message-ID: <ae1fb003f7e1abdecaa36243e3b1a16c@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_043428_780219_4CE2B4EE 
X-CRM114-Status: GOOD (  17.23  )
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

On 2022-08-27 17:19, Ido Schimmel wrote:
> 
> How about the below (untested):
> 
> diff --git a/net/bridge/br_input.c b/net/bridge/br_input.c
> index 68b3e850bcb9..9143a94a1c57 100644
> --- a/net/bridge/br_input.c
> +++ b/net/bridge/br_input.c
> @@ -109,9 +109,18 @@ int br_handle_frame_finish(struct net *net,
> struct sock *sk, struct sk_buff *skb
>                 struct net_bridge_fdb_entry *fdb_src =
>                         br_fdb_find_rcu(br, eth_hdr(skb)->h_source, 
> vid);
> 
> -               if (!fdb_src || READ_ONCE(fdb_src->dst) != p ||
> -                   test_bit(BR_FDB_LOCAL, &fdb_src->flags))
> +               if (!fdb_src) {
> +                       if (p->flags & BR_PORT_MAB) {
> +                               __set_bit(BR_FDB_ENTRY_LOCKED, &flags);
> +                               br_fdb_update(br, p, 
> eth_hdr(skb)->h_source,
> +                                             vid, flags);
> +                       }
> +                       goto drop;
> +               } else if (READ_ONCE(fdb_src->dst) != p ||
> +                          test_bit(BR_FDB_LOCAL, &fdb_src->flags) ||
> +                          test_bit(BR_FDB_LOCKED, &fdb_src->flags)) {
>                         goto drop;
> +               }
>         }
> 
> The semantics are very clear, IMO. On FDB miss, add a locked FDB entry
> and drop the packet. On FDB mismatch, drop the packet.
> 
> Entry can roam from an unauthorized port to an authorized port, but not
> the other way around. Not sure what is the use case for allowing 
> roaming
> between unauthorized ports.
> 
> Note that with the above, locked entries are not refreshed and will
> therefore age out unless replaced by user space.
> 

Okay, I got the semantics (locked/unlocked vs unauthorized/authorized) 
reversed, so I will go with your suggestion.


