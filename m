Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7960BC38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 17:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvcibNfnaz6XzedrV0V638dV58F+xBu1nd0O16wGqgo=; b=aywnkyKYjztjJOprrWfASSzAdm
	xwjUiaFjvspjVH1jW7zE4RReXhBqKUUw6xxwvmeFvNB5zqqqAN2z92Xezj1pWI7w3cgcFefNe8lFb
	MI+MyAXcFT+A67oj/nWfbdWVjhvEdgk73Drzjgf0dxjUytUu1ehgH0CpGCRU8gEocbBw2nR7IvSM8
	zeffVXbykEh+SDFXxLeNmyXWTTN7F7K0BQZjpe/2QBOxC7oBFUUV6JaU+ZV5SvTLaJDNg2YOH48zO
	hJkRuaZ1Sg0Kb8akD4HVZoqzFcTQJLs8cxbx8sdCLkjhYImi29yGj3rTVboR6X6M/DtUHdpEmTg7/
	SZZEkApg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on0w1-002R5P-Mo; Mon, 24 Oct 2022 17:08:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on0vm-002QtT-FF; Mon, 24 Oct 2022 17:08:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EAE5614A7;
	Mon, 24 Oct 2022 17:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0086C433C1;
	Mon, 24 Oct 2022 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666631284;
	bh=qWgfUtE4UN4/iCrWAyctAyzwt74lHMnUej7miAfWozs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zu+kqShRcjC8nRPj+ZPavRcjYG48rUxYr/xtUKVxq/tVD3qP4BQ8938gc4JRHh+sQ
	 wUEoCQstYbywkycJbXo1Gx9NudXpA31ePGv1ymKF7AziAkUafYLdFNwgeHV1QImOEK
	 JFwJgG3tBQ+MqnkxeUpIBTBFzGPMlWiBuQYZJPplfyUZSfiekZhXplF9BCf4TEz5cR
	 BoSuO18xOEhTlK5W4tnJUnjIc+5268Ad/+OGpyLVWX/qO+ewTt1u6BRu/hvzFkn3Kl
	 CbW0He1dZ/toR97u7dANoXILUr18MDMSTzT2iOWvvh3xihpjn8Gr15icEr7MzFt17l
	 NwXsJuVW8BO6Q==
Date: Mon, 24 Oct 2022 10:08:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev@kapio-technology.com
Cc: Ido Schimmel <idosch@nvidia.com>, davem@davemloft.net,
 netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Andrew
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
 <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>, Florent Fourcot
 <florent.fourcot@wifirst.fr>, Hans Schultz <schultz.hans@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>, Amit Cohen <amcohen@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bridge@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 02/12] net: bridge: add blackhole fdb entry
 flag
Message-ID: <20221024100801.6c391ff9@kernel.org>
In-Reply-To: <7690b7f836b144b60f60b3b68d3bf784@kapio-technology.com>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
	<20221018165619.134535-3-netdev@kapio-technology.com>
	<Y1FHuXE+X/V9aRvh@shredder>
	<7690b7f836b144b60f60b3b68d3bf784@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_100806_621377_1BE322AD 
X-CRM114-Status: GOOD (  14.03  )
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

On Sun, 23 Oct 2022 07:32:02 +0200 netdev@kapio-technology.com wrote:
> >> @@ -1140,7 +1148,7 @@ static int __br_fdb_add(struct ndmsg *ndm, 
> >> struct net_bridge *br,
> >>  		err = br_fdb_external_learn_add(br, p, addr, vid, true);
> >>  	} else {
> >>  		spin_lock_bh(&br->hash_lock);
> >> -		err = fdb_add_entry(br, p, addr, ndm, nlh_flags, vid, nfea_tb);
> >> +		err = fdb_add_entry(br, p, addr, ndm, nlh_flags, vid, ext_flags, 
> >> nfea_tb);  
> > 
> > I believe the preference is to wrap to 80 columns when possible.  
> 
> Very strange... since I ran checkpatch.pl from the net-next kernel 
> itself and it did not
> give me any warnings about 80 columns, but rather said 'patch is ready 
> for submission'.
> 
> As this is silent, could it be some missing python plugins or something 
> to do with perl?

I run:

./scripts/checkpatch.pl --strict --max-line-length=80


