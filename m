Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50E3C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 12:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJswdS7kC+5Dq/oSBvb9hTl0H5TWQ6aU0davE3hjl1Y=; b=falkWaz+s1c2Rw/83i03nob3dP
	+rS5EnsrWkjDi3ke5EzROyHDNufrz4B//4Xy2ls9a64NrvBaHLj5SABOMOIFJ83r+PUEWHdaJzQny
	BHm4LyNlcYrRyOweatXr14v6gSYp+k+lk8m0dSRPm5PwAtW7eY9vnTtuxHuYeagcf9bMJNP5Y9tru
	V6fVzMuIMrOWVsuJShgApe8o5GVJODJRB8tUVrKpMp9vjXpfelqvIUTfjkA5uzy+lkkWG61vIXGWF
	O/v468z23SO/EYi1EBi19USOgmuOTst4K24rZVByARl5ZKp0wVS9fHTbjzTBawwrjhCgK4nP8YkJ3
	X8szhl+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omDCk-00CVd2-B4; Sat, 22 Oct 2022 12:02:18 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omDCX-00CVYq-Uk; Sat, 22 Oct 2022 12:02:07 +0000
Received: by mail-ed1-x535.google.com with SMTP id z97so15010753ede.8;
        Sat, 22 Oct 2022 05:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xJswdS7kC+5Dq/oSBvb9hTl0H5TWQ6aU0davE3hjl1Y=;
        b=dvzFO2xkBvm/I20DsGFjUnIHX/SdJqe96jZQplwuGvJpQE4bAzpLO0o/eH7aNuN1tI
         UJcjmOTutwMDaISNJqVGDAnOtGq5GkpDWhHNxclYnyNCg+IdJZLja8Rf55StXWvKatpF
         yKnVmqSOFj+g5UFG75lcNmGxsSmbyHf3MG8LEsvNuYV26gmdyAMDkNCxLEkuM1c+NN+L
         Fa5Qnhk7EKEegtg5NV3PwfHWw5FJPQKv92qfP04bfdV1tdoo6uAuC13WTqfM5Xt3LblO
         BczxEoKr+pCJVLvA1jJ/hm7FlpgtHfG5xa3xhZ3VgL5kca9F+WGw25fyyz++/lAAMFDs
         dXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJswdS7kC+5Dq/oSBvb9hTl0H5TWQ6aU0davE3hjl1Y=;
        b=YNZ+g5vSXB5gtamc+w02qqplH53mNJ9/vwnGrfX9ds6mDJeJs7BRELsHnJOJ8X3x0o
         EbLRN6zWE5rQeVTsCw4E2svfICrWpXOpO5CRUKSgRrq98RA2vgf5D+mh8Blendcgz+0f
         S5aVEKzVZcvqMtrTi2R7PtGwXGtSF2b0OK/cX0HaUjDDfIiTRmgcrF6PVPXogMimAxyF
         ZdLMuaYlr5eAIeMsRIiO9IjguFssZpaXoutQKoml3YULhf4UTUCz6LK62LgbMmIiQufa
         smUHorHoIgjiXCrtpcFySC0Pp35EmlqFrXuHgH7nbam5BGDW/i2XXv30EYXoE06nNjOS
         klYw==
X-Gm-Message-State: ACrzQf1Sr+dUhBw+UHxPBY9bpuw68NcRNz4NiAeB72lLdQes7O5VBJug
	0EkdSR93boYdicKZi9K/lM0=
X-Google-Smtp-Source: AMsMyM6Fmdy49HywfzOaMBOmuOmQiypZLiOuHNCnJMuBTRIFt8BiFMip0M63IhGdvg3IsRPPq/Kt0g==
X-Received: by 2002:a17:907:a06e:b0:79f:e42d:8d54 with SMTP id ia14-20020a170907a06e00b0079fe42d8d54mr3497885ejc.72.1666440124277;
        Sat, 22 Oct 2022 05:02:04 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id u13-20020aa7d54d000000b00458478a4295sm15051796edr.9.2022.10.22.05.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 05:02:03 -0700 (PDT)
Date: Sat, 22 Oct 2022 15:02:00 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: netdev@kapio-technology.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Oleksandr Mazur <oleksandr.mazur@plvision.eu>,
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
Message-ID: <20221022120200.no5pl54bcfa3wcnd@skbuf>
References: <20221020225719.l5iw6vndmm7gvjo3@skbuf>
 <82d23b100b8d2c9e4647b8a134d5cbbf@kapio-technology.com>
 <20221021112216.6bw6sjrieh2znlti@skbuf>
 <7bfaae46b1913fe81654a4cd257d98b1@kapio-technology.com>
 <20221021163005.xljk2j3fkikr6uge@skbuf>
 <d1fb07de4b55d64f98425fe66156c4e4@kapio-technology.com>
 <20221021173014.oit3qmpkrsjwzbgu@skbuf>
 <b88e331e016ad3801f1bf1a0dec507f3@kapio-technology.com>
 <20221021181411.sv52q4yxr5r7urab@skbuf>
 <37dc7673fde2b8e166a5ed78431a2078@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37dc7673fde2b8e166a5ed78431a2078@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_050206_037342_6D9CCF5D 
X-CRM114-Status: GOOD (  13.33  )
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

On Sat, Oct 22, 2022 at 09:24:56AM +0200, netdev@kapio-technology.com wrote:
> I will not say that you are not making sense as for the mv88e6xxx, as it
> needs port association in all cases with BR_PORT_LOCKED, MAB or not, and
> port association is turned on in the driver with learning turned on.
> 
> That said, there must be some resolution and agreement overall with this
> issue to move on. Right now port association is turned on in the mv88e6xxx
> driver when locking the port, thus setting learning off after locking will
> break things.

This already needs to be treated as a bug and fixed on its own. Forget
about MAB.

You're saying that when BR_LEARNING=on and BR_PORT_LOCKED=on, the
mv88e6xxx driver works properly, but the software bridge is broken
(learns from link-local multicast).

When BR_LEARNING=off and BR_PORT_LOCKED=on, the software bridge is not
broken, but the mv88e6xxx driver is, because it requires the PAV
configured properly.

And you're saying that I'm the one who suggests things should work
differently in software mode vs offloaded mode?!

Why don't you
(a) deny BR_LEARNING + BR_PORT_LOCKED in the bridge layer
(b) fix the mv88e6xxx driver to always keep the assoc_vector set
    properly for the port, if BR_LEARNING *or* BR_PORT_LOCKED is set?

