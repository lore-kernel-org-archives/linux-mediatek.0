Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6BFC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 11:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y83I/EEj5O1WzvhlqMvy69bC2C3kma+TguYlktElg+U=; b=EMf2Q24l/trKq7iLtRsaw7n3y4
	KRdqMjwk+8k+s/Kb6v5KHoKbXv4FcICOEj3iteN5XvwhjAGktrBWrjiO+VTdltUwNyCR6gw+42DNZ
	uXY1t11RMjAHRAoZl+sw+l38xrW0wGxJSDB11++MK8A4+0JbWupoa2Dz/7RntjRDgnWu8jQHprbYy
	LRAHFdorU8t6UxwFFeN6h0leP+kzf7ejfjAEcAc8uhO3tC6NlSk3S+TnNEyBDZrc768w1NzMugOIf
	M8OiDrp3VrCd7atw1nA2Y9exLVLMtUzaVFag/PYcrE/I1EzTeLCRYZ9IqRc6r1IFQjMpA3buFqI2W
	2jckDYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olq6j-007M6h-Rr; Fri, 21 Oct 2022 11:22:33 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olq6Y-007M3Z-4s; Fri, 21 Oct 2022 11:22:23 +0000
Received: by mail-ed1-x529.google.com with SMTP id l22so4571606edj.5;
        Fri, 21 Oct 2022 04:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y83I/EEj5O1WzvhlqMvy69bC2C3kma+TguYlktElg+U=;
        b=aqI400aFX+Hv1if94yQ/9coImAcoL5xm5EE9Z8Pnq+JQ7MqId0ZuB5eW9kjAqCiUrN
         KMZPlHItsw5EctvNgdlnTcP5laLuqUz+SV1o33najcKCsjf0QARB5ow9Z44sTZTOmSeg
         UrpNC6fH6ciHR2X4rGmdJWOSbH4r9VMHXzYepV/zYSLDnnNwqU+kf3Zv2sg7HE61xVNl
         7t3a9w2kLyvF5PibwmB0qSxZXtgVyxt+2/Ir7YJLUZG06dtskhoVW5tz2mc4jA71zIm4
         UhnubOmNzJl78yCv0QqxYV7AfFoBR+16JycwYyxr/dmdd6j59K4vgycD/Tzgpk9gib2d
         VCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y83I/EEj5O1WzvhlqMvy69bC2C3kma+TguYlktElg+U=;
        b=kT/N5PP4FezPHh2H2/4EVUNwPwd/ef4EGm1cBgM7++eh1CROcYAeI9cwWkpYu7jKTk
         gyPP0p5pI6HWlpdCHLJpFGt5MfPpyTW8s8Ta5Gl1+BdsfcaaA3DTe8PCCYnz53w5sCrj
         ELRZoIKsUof5QxE4saEFzISVId3oz9B/agcpYctCNBhPV9faTcjWihir/If7sbMOeAZw
         2dKaKZUMr1RgHnt+F9ttwNrEPvVrdabD8Ny5Sa7fNgeac5cNkz70zpu1dkVxUIUL+HLI
         hMAh2T/uywyJ0ZWSMHmjBAsAqVUT9QopJsfSHakMt5rWF75FZ1bT2d/V+K2PcyYdzrD9
         xCuw==
X-Gm-Message-State: ACrzQf0JiHlysWyXomwxuhPICPbbulHG0Jcn24SBOh7BC39L49LfrMuS
	OuzB+FQC2hpZe0SIOtOePpA=
X-Google-Smtp-Source: AMsMyM4Ljgcs84MFVGjjaNn1SINn2K1OMLuiOgFc7iq4/CDwKUIaipwaA3YvQFgGhkmQ345GuQJlMw==
X-Received: by 2002:a17:906:db0e:b0:77b:82cf:54a6 with SMTP id xj14-20020a170906db0e00b0077b82cf54a6mr14838182ejb.691.1666351340215;
        Fri, 21 Oct 2022 04:22:20 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id g22-20020a50d5d6000000b00457160c3c77sm13487340edj.20.2022.10.21.04.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 04:22:19 -0700 (PDT)
Date: Fri, 21 Oct 2022 14:22:16 +0300
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
Message-ID: <20221021112216.6bw6sjrieh2znlti@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221020132538.reirrskemcjwih2m@skbuf>
 <2565c09bb95d69142522c3c3bcaa599e@kapio-technology.com>
 <20221020225719.l5iw6vndmm7gvjo3@skbuf>
 <82d23b100b8d2c9e4647b8a134d5cbbf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82d23b100b8d2c9e4647b8a134d5cbbf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_042222_205277_E026AC64 
X-CRM114-Status: GOOD (  24.46  )
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

On Fri, Oct 21, 2022 at 08:47:42AM +0200, netdev@kapio-technology.com wrote:
> On 2022-10-21 00:57, Vladimir Oltean wrote:
> > On Thu, Oct 20, 2022 at 10:20:50PM +0200, netdev@kapio-technology.com
> > wrote:
> > > In general locked ports block traffic from a host based on if there
> > > is a
> > > FDB entry or not. In the non-offloaded case, there is only CPU
> > > assisted
> > > learning, so the normal learning mechanism has to be disabled as any
> > > learned entry will open the port for the learned MAC,vlan.
> > 
> > Does it have to be that way? Why can't BR_LEARNING on a BR_PORT_LOCKED
> > cause the learned FDB entries to have BR_FDB_LOCKED, and everything
> > would be ok in that case (the port will not be opened for the learned
> > MAC/VLAN)?
> 
> I suppose you are right that basing it solely on BR_FDB_LOCKED is possible.
> 
> The question is then maybe if the common case where you don't need learned
> entries for the scheme to work, e.g. with EAPOL link local packets, requires
> less CPU load to work and is cleaner than if using BR_FDB_LOCKED entries?

I suppose the real question is what does the bridge currently do with
BR_LEARNING + BR_PORT_LOCKED, and if that is sane and useful in any case?
It isn't a configuration that's rejected, for sure. The configuration
could be rejected via a bug fix patch, then in net-next it could be made
to learn these addresses with the BR_FDB_LOCKED flag.

To your question regarding the common case (no MAB): that can be supported
just fine when BR_LEARNING is off and BR_PORT_LOCKED is on, no?
No BR_FDB_LOCKED entries will be learned.

