Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D2DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 22:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuxcgTkIRC5WG6rM4q/CSaRgfUH0Ti3MoOBIFAp7H8s=; b=Rc97uOM2Qe5SEIm+DSVzAoS3G+
	0zDgiZCKUDsIUeaM2z0F0B5d7uEZhuHyXc5/3jRWoq1ywj6ghnngIKeYaj4VOiKgyn9q5vRrjatSF
	+Qd9Xx1BabQNP/Oq52fzk3eDdIS3z1CMDFycrofeuX5how0QpNPdWRxMqFKmZAa1+Xe22CI1WLtof
	RI19ZeXbL8BadXXX1l8+EraVPT2/btNT0cN+PqXGB/MfelhmokvMrJqYQxHEw6a9f380sFwlAOMnh
	opUgyFFys9wiupRc5c01LNbofVeaAPbANQVXpbpjc+9H9ks6r9drkcbqZsLZRGfPjRe90vi2fRqEP
	mCpBaHtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oleU1-002REv-3X; Thu, 20 Oct 2022 22:57:49 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oleTo-002R81-JV; Thu, 20 Oct 2022 22:57:37 +0000
Received: by mail-ed1-x530.google.com with SMTP id r14so1741258edc.7;
        Thu, 20 Oct 2022 15:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JuxcgTkIRC5WG6rM4q/CSaRgfUH0Ti3MoOBIFAp7H8s=;
        b=XBJzFhduueKPu1ACZxmcj5cXRa0nb0p5dX8b6x8utN2F40sVgNnz2Vwo93T3WLnBcx
         Yx3WwrvmN9Nuh/q4vOjOu0pqXnDTWqYB4KV9B3sCwZOf7c8OCwjoNM/D1TNvmc045ZzX
         Poo3JVc6Gu+DF650q6sVaij7GSbGVXbKX5JW9xSnGo2M+EdB4pcsbE0152s/sylYv+Nc
         ALPztrqDuyQF/Ci2P4snXxWjZKRtHnNH3GhbYR/zFvz6RX+vOKF1y9KazvTME97oRexc
         94w80ZyNJO0Z5bBflaDs/V5ISm1JA/Dg+OYU7d/pyJvJYa/mJ0Vv6e7Q6YanX5FVgqB4
         eYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuxcgTkIRC5WG6rM4q/CSaRgfUH0Ti3MoOBIFAp7H8s=;
        b=fITjjP8XDzur4HBNVI7UwxEGC9l6bxXJBXJYK43axpdmlrA9YBxs0hZ+VYqoNNNqa5
         PtcZglRabREG9swWohqAPJj/oApT8ACsiOAvjAFD+U+WucfGHz9Cag5pPk2apKwvhQzK
         UkxeYc0IbmVRbpFGsJLAp9ewMyBGFg6GH5uazafC73xCvrxJU5b/NW4Deki4CwF/PLEG
         Gu9IHamzaMc9Gtcb+ChXhM0jMZyJCZQLqU7lcaSzSnZKcH6yWako42ZubUkw3p6SjCxO
         MtVYw9mmVGLZtXqTZJVt/mxIzoHvAbWzQk6Pq6JbQwcslt7abcEHusupR2Rnpdd8/adt
         Q0Jw==
X-Gm-Message-State: ACrzQf257zeWS4vYEfwut24Y57QwEl8phtJ+YpHGNb3ADqyp0ypVonEo
	OrFIA8d8cluc2IjEJQs93S5Jb7QwW2Iddw==
X-Google-Smtp-Source: AMsMyM7/vnHFskrIzjNC7ybOEBIlorfKrTTq/Ou6mds57aeFaKcu+F9HahwfD0wuLF52vhDnh4xpcw==
X-Received: by 2002:a17:906:58cc:b0:78d:ce9c:3787 with SMTP id e12-20020a17090658cc00b0078dce9c3787mr12707611ejs.715.1666306643405;
        Thu, 20 Oct 2022 15:57:23 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id l6-20020a1709062a8600b0073d796a1043sm10750046eje.123.2022.10.20.15.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 15:57:22 -0700 (PDT)
Date: Fri, 21 Oct 2022 01:57:19 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: netdev@kapio-technology.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
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
	Ido Schimmel <idosch@nvidia.com>,
	Florent Fourcot <florent.fourcot@wifirst.fr>,
	Hans Schultz <schultz.hans@gmail.com>,
	Joachim Wiberg <troglobit@gmail.com>,
	Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 10/12] net: dsa: mv88e6xxx: mac-auth/MAB
 implementation
Message-ID: <20221020225719.l5iw6vndmm7gvjo3@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221020132538.reirrskemcjwih2m@skbuf>
 <2565c09bb95d69142522c3c3bcaa599e@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2565c09bb95d69142522c3c3bcaa599e@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_155736_709136_25295201 
X-CRM114-Status: GOOD (  13.60  )
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

On Thu, Oct 20, 2022 at 10:20:50PM +0200, netdev@kapio-technology.com wrote:
> In general locked ports block traffic from a host based on if there is a
> FDB entry or not. In the non-offloaded case, there is only CPU assisted
> learning, so the normal learning mechanism has to be disabled as any
> learned entry will open the port for the learned MAC,vlan.

Does it have to be that way? Why can't BR_LEARNING on a BR_PORT_LOCKED
cause the learned FDB entries to have BR_FDB_LOCKED, and everything
would be ok in that case (the port will not be opened for the learned
MAC/VLAN)?

> Thus learning is off for locked ports, which of course includes MAB.
> 
> So the 'learning' is based on authorizing MAC,vlan addresses, which
> is done by userspace daemons, e.g. hostapd or what could be called
> mabd.

