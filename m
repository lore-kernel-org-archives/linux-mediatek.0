Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058B5C04A95
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 13:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONqnfeRbIJEBHcDA0JYek+JtscZ4zltaVyYcDCSC9kw=; b=qex7iQ9/rE298r5/oso9OOVq5S
	Aft8GSnRBd1zyFWp0ng7hNQeC6gjZKOs1H1u/KCeBkom11AEcwenhkW77oueyxM59Abuv8uS08hut
	/mWhI/rLv+/TLmT4XwwL11D1c/b+DICmjUHnA/sEA5DUp2569wQVvAKxxCqEbP7HlYiWcOLTDCV/1
	q6ggf9mCgLrTcPO1Qz8sWiESFzpQrFg3wNtrnlasO89ltFkEV/YzWGxoQzMiyB+Wkr4cuLRhVRmFO
	RR2Rp4EX+nn5ZY0lODFFouIudFa6SomhQZtAcFwMJHgkaRWO0r9Z1MO5OfvG0m8FFiUZwIUhPKyWx
	sLk39A/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omEjF-00CkQ8-9X; Sat, 22 Oct 2022 13:39:57 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omEj3-00CkMT-Cd; Sat, 22 Oct 2022 13:39:46 +0000
Received: by mail-ed1-x52e.google.com with SMTP id a67so15550655edf.12;
        Sat, 22 Oct 2022 06:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONqnfeRbIJEBHcDA0JYek+JtscZ4zltaVyYcDCSC9kw=;
        b=fYrsxTBTWLXveezVAf3JTB5d1JyTHlrtLy9F2w+mCV3f9qlz4zaL6/KTHWUm9h/MaY
         ml7uAqQR7ELdaNdsh8CMrwhkVd2tVPYE6NutMYTX5/DbWGpLIxzkGkwQSfEL4IC7b+G4
         SvKMOXuG4rl0pJDR4qXG1aNtEM7afgMx4jmNbEo+5o9nOmH71LDVrrweaDE4lN27Mxe8
         /AmFI8FeeE1TTg2SGAzP6qrDDqejZXUWcSIds86ZMkEQdpwzyg2K4Cc+kMUIjGkGfFDi
         1gKAAyMnObim1Vzp8cBs3o667dOJYCsuMtSoeelmb9050ZwCvcYPWWS/k6FIBTPH1qSY
         doEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONqnfeRbIJEBHcDA0JYek+JtscZ4zltaVyYcDCSC9kw=;
        b=eOynk+ns9j5cv9khn5qZs0JjUuEiGl6IQr/j6PPynjt0hczvlSSWA7G74p9ombV+pR
         dCjruj5o7YenKfzixNQU4IJ8Wwxq4LSHqeu+PLYTmgFdsMU+Nuv2rEi8Yb5+S3canWii
         t22h7OZIJwoC21L8opKQNVpZl+Ny2aMEiL51I4aNczIZpQ2rF27xnYrlHY0fcWIKiE5B
         U4+9vKzs/pZB+I16pBe4qMZAmOCJ0AdTUgdSYDA0YH8fLdeZKVXGP+rT/6N0UDwYRuNu
         IlpgWJXavtu1zytC4eWoFLqRaF63PRGDgtCTAYC+xef8DuYAz0ctxQyw1c6trAJwQ6TS
         oMpw==
X-Gm-Message-State: ACrzQf1DMKFXqVGfQLG8qljPGUKZ+2qrEY8oH2yKJ+qgGbtaN0xITBby
	dVFVJKpxF+dt7L4JmrbgsaA=
X-Google-Smtp-Source: AMsMyM4SB7mv6NPFG5Y2VSE+Th+55/a9uKkLQcMf9lcPuog1lmcinWHAY+7KZ7do0aDq5OVu4/Y4AA==
X-Received: by 2002:a05:6402:144a:b0:461:8e34:d07b with SMTP id d10-20020a056402144a00b004618e34d07bmr1085496edx.426.1666445982163;
        Sat, 22 Oct 2022 06:39:42 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id q11-20020a17090676cb00b0074150f51d86sm13083352ejn.162.2022.10.22.06.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 06:39:41 -0700 (PDT)
Date: Sat, 22 Oct 2022 16:39:37 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Oleksandr Mazur <oleksandr.mazur@plvision.eu>
Cc: "netdev@kapio-technology.com" <netdev@kapio-technology.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
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
	Amit Cohen <amcohen@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"bridge@lists.linux-foundation.org" <bridge@lists.linux-foundation.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v8 net-next 10/12] net: dsa: mv88e6xxx: mac-auth/MAB
 implementation
Message-ID: <20221022133937.hfrr7sxaq2zlbnoq@skbuf>
References: <20221021112216.6bw6sjrieh2znlti@skbuf>
 <7bfaae46b1913fe81654a4cd257d98b1@kapio-technology.com>
 <20221021163005.xljk2j3fkikr6uge@skbuf>
 <d1fb07de4b55d64f98425fe66156c4e4@kapio-technology.com>
 <20221021173014.oit3qmpkrsjwzbgu@skbuf>
 <b88e331e016ad3801f1bf1a0dec507f3@kapio-technology.com>
 <20221021181411.sv52q4yxr5r7urab@skbuf>
 <GV1P190MB2019CFA0EB9B5E717F39B621E42C9@GV1P190MB2019.EURP190.PROD.OUTLOOK.COM>
 <20221022113238.beo5zhufl2x645lf@skbuf>
 <GV1P190MB20196AE55C37EB6B88B54CB6E42C9@GV1P190MB2019.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV1P190MB20196AE55C37EB6B88B54CB6E42C9@GV1P190MB2019.EURP190.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_063945_472439_9A87AA83 
X-CRM114-Status: GOOD (  19.84  )
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

On Sat, Oct 22, 2022 at 12:55:14PM +0000, Oleksandr Mazur wrote:
> 
> > I hope the following script will exemplify what I mean.
> ..
> Oh, i get it now.
> 
> Frankly speaking we haven't stumbled across such scenario / issue
> before. But i can tell it does indeed seems a bit broken;
> 
> I think there are 2 options here:
>   1. The setup itself seems insecure, and user should be aware of such behavior / issue;

Be aware, and do what? Port locking is unfit for use if learning is left
enabled (in the way learning is currently done).

>   2. Bridge indeed should not learn MACs if BR_PORT_LOCKED is set.
>   E.g. learning condition should be something like: not BR_PORT_locked
>   and learning is on; 

Rather than violate the BR_LEARNING flag (have it set but do nothing,
which would require even more checks in the fast path), I was proposing
to not allow the BR_PORT_LOCKED | BR_LEARNING configuration at all.
My question to you was if you're aware of any regression in prestera
with such a change.

> > I don't understand the last step. Why is the BR_PORT_LOCKED flag disabled?
> > If disabled, the port will receive frames with any unknown MAC SA,
> > not just the authorized ones.
> 
> Sorry for the confusion. Basically, what i described what i would
> expect from a daemon (e.g. daemon would disable LOCKED); So just
> ignore that part.

But still, why would the daemon disable BR_PORT_LOCKED once a station is
authorized? You're describing a sample/test application, not a port
security solution...

