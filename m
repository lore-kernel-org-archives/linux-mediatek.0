Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D06FA373D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 17:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eODYg6i1slVemJXiAd3VXkmdvCvejpnoks2e1b1sQZA=; b=GMIZqpnhx7RCoFGpI3VxEIw+YT
	wCQhceByCpgh71+7GR9mIPXTeF/tcDl1YxlZZoDQq4iHmzGXW8lFtfE/BeS7T1LXdzJXwEW524e8g
	BQ6vR8cF8Etj1B1BYFYfQvw11/roJiOWVEbcvIPBmk/wmpLmugyfZGQYI93m1jvukddDb2bEPedFx
	f9o72ep/pvu86/dHAxyKTgpBaAnx4WvxEoSvClaMLgwZbm8Fe1JnYyxviJt2V5IoudbYle85tQvz/
	K708x9aqWwMo2auE8hqeBAuNyC3lhu5rsjHaTo3XCWG7xvRdGLTR/ppzsaiMlLsJ8XavnobC2DOjB
	VSFt8Xjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olvqr-009CJQ-1m; Fri, 21 Oct 2022 17:30:33 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olvqg-009CFl-9F; Fri, 21 Oct 2022 17:30:23 +0000
Received: by mail-ed1-x534.google.com with SMTP id l22so8502288edj.5;
        Fri, 21 Oct 2022 10:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eODYg6i1slVemJXiAd3VXkmdvCvejpnoks2e1b1sQZA=;
        b=kWmjcACfBGi4HGfSDqndyHtIVP5QX7I1bLM11RrayrZIHqCnhQks9SjBSlMCCHEK80
         3Olz0moI9h1U0OlYkoEqiu2hmUXnePYex6ofPDYB+7XQyM6xvTTUlsKpGxQ7A00r8Qiz
         2+yiokVqPbgJw3B97d9FN4gxPBWlld6vPoLR+yVJp0cxnR4nuH0HQlVF9u+Mt8Y9WJsF
         S5C1i/6ryyquWA+8VoY9IbDLwHRD3s79dKSRYFUQ8vmbRB9XAksydxeCCCfLeVenCyhs
         T5+eBUYX/+qKlh6s7y2e4VyeezWIF2MQsYA3j9ja+JFF71uvZwts4f4aPzxQtv5neO41
         vulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eODYg6i1slVemJXiAd3VXkmdvCvejpnoks2e1b1sQZA=;
        b=YWPSG3sDGfb2PU6HlMtXwGD7lDCBzICVVcF8cx8orruHsjbWczef+LzPEU6nh+on/q
         FuJIT70Scx5uo+rBHpVU0eK+CMzzh2EKycAtTfImK7vHFLCaUcjxJfUWvqT80xi43bfY
         i3u2LDEEXODBQb88R5UW7ZQMFKenwEEbkdYGJbLuHBTt/ddtVWg2XOKNhJZWrgz/JVbp
         sMGo8pNxValerRya72TGgl5agl97XX3/uvp1F73ZtHVu5YxuALinND0KbEXhQIj/B5Kp
         Sw4tdpQXav3bmmikPy6ueuJRP14P95SyBtLc37uekBlmlZt4Pnt8946P5ap4nDQz0+0Q
         eYPA==
X-Gm-Message-State: ACrzQf2tNkgQDpsHoFOadOc9rLmwlF82+WJMBpLe3rjFHagA5QYZ6ViL
	S0urIYa4vvMmgD6/9U7sG+w=
X-Google-Smtp-Source: AMsMyM4s9UluzXOoPf7cYQVSBAmze6LMyEYjVNnYAFVkJdkbmtuP1IWFdO4gUJPrPwh+bE9aZswPGA==
X-Received: by 2002:a17:907:7611:b0:78d:9d69:adf9 with SMTP id jx17-20020a170907761100b0078d9d69adf9mr16728025ejc.283.1666373418592;
        Fri, 21 Oct 2022 10:30:18 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id g13-20020a170906538d00b0073d638a7a89sm11999567ejo.99.2022.10.21.10.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 10:30:17 -0700 (PDT)
Date: Fri, 21 Oct 2022 20:30:14 +0300
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
Message-ID: <20221021173014.oit3qmpkrsjwzbgu@skbuf>
References: <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221020132538.reirrskemcjwih2m@skbuf>
 <2565c09bb95d69142522c3c3bcaa599e@kapio-technology.com>
 <20221020225719.l5iw6vndmm7gvjo3@skbuf>
 <82d23b100b8d2c9e4647b8a134d5cbbf@kapio-technology.com>
 <20221021112216.6bw6sjrieh2znlti@skbuf>
 <7bfaae46b1913fe81654a4cd257d98b1@kapio-technology.com>
 <20221021163005.xljk2j3fkikr6uge@skbuf>
 <d1fb07de4b55d64f98425fe66156c4e4@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1fb07de4b55d64f98425fe66156c4e4@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_103022_349544_ED4EE255 
X-CRM114-Status: GOOD (  24.44  )
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

On Fri, Oct 21, 2022 at 07:18:59PM +0200, netdev@kapio-technology.com wrote:
> On 2022-10-21 18:30, Vladimir Oltean wrote:
> > On Fri, Oct 21, 2022 at 03:16:21PM +0200, netdev@kapio-technology.com wrote:
> > > As it is now in the bridge, the locked port part is handled before learning
> > > in the ingress data path, so with BR_LEARNING and BR_PORT_LOCKED, I think it
> > > will work as it does now except link local packages.
> > 
> > If link-local learning is enabled on a locked port, I think those
> > addresses should also be learned with the BR_FDB_LOCKED flag. The
> > creation of those locked FDB entries can be further suppressed by the
> > BROPT_NO_LL_LEARN flag.
> > 
> > > If your suggestion of BR_LEARNING causing BR_FDB_LOCKED on a locked port, I
> > > guess it would be implemented under br_fdb_update() and BR_LEARNING +
> > > BR_PORT_LOCKED would go together, forcing BR_LEARNING in this case, thus also
> > > for all drivers?
> > 
> > Yes, basically where this is placed right now (in br_handle_frame_finish):
> 
> As I don't know what implications it would have for other drivers to have learning
> forced enabled on locked ports, I cannot say if it is a good idea or not.
> Right now learning is not forced either way as is, but the consensus is that learning
> should be off with locked ports, which it would be either way in the common case I
> think.

I don't think I fully understand what you mean by forcing BR_LEARNING.
A bridge port gets created with a default set of flags as can be seen in new_nbp().
Those flags include BR_LEARNING but don't include BR_PORT_LOCKED.

The user can decide he wants to make the port use 802.1X without MAB, so
he enables BR_PORT_LOCKED and disables BR_LEARNING, all with the same
netlink command (ip link set swp0 type bridge_slave learning off locked on).

How was the driver forced into anything?

