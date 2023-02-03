Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551E0C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 21:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8UifT5o8QIL+1ZOw+vxMKGXi/nfDw7qQB6T6ClS8Ic=; b=dd3NO9L7TW+kPRgAMKjpdXY1bb
	KEhbPKcboTi52tT/zoet/poQ8Rjh9fNAqjYbt9l0hERLClRjyp050VqHUpRgoPj9sGcjpM32k1ndR
	ZM2tOJu0fcTCIYnjkSvuiSKPHjJiiQt3qBRbVE7xXe17wolp8PnGbtHXEWausw4NmjGWAGOL8l4Qe
	TIpgUWnbjjIEYeY2GSDHxrgJ9ZGesFQYBSkjWgSeOjDa53hNlRUAVJBCXpDP1ZWjAgkA8b8zAt+vF
	7/UZCLfF1W7ddJchy20mQCLo+dyGRzwjkJBjLDILfZgDVuVly59sPTSf9FQ9sjz2InZoHa1VTregj
	y9gCPiSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO3Oo-003dHu-5D; Fri, 03 Feb 2023 21:15:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO3Oc-003dDM-0x; Fri, 03 Feb 2023 21:14:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ba1so1706752wrb.5;
        Fri, 03 Feb 2023 13:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v8UifT5o8QIL+1ZOw+vxMKGXi/nfDw7qQB6T6ClS8Ic=;
        b=pd4JdGeGvQ+bwoWBkvvdDb0hhyE/Bxhta6bcG3jxt0dWu7ZCdJQHLjZUYh/neaf8kv
         E2vN7hCsLGKW2de3K6muUrxk3KJCGwOsziVlBtiWxe9afhV1sVgLOZTGjzEZ986sCAQE
         fKtMsX5U/ln9C0+q5QNHGuB2n94r0ojW3gCL6ueoVBlSVA0i1kk9DA76BLAopPpz5a+r
         +w+xc49sVxrSI6XphvcS8f9anBNzfLSR2DfW9+hI22SIZJYNLUdgyFra+/+vBm50At92
         l5Es6QjHbL5/d/8HlTu0B/cTjn6/Uqmc6dzhzy8HEN0z3ioILJcKrb0mAt/0BQo+hytZ
         2vtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8UifT5o8QIL+1ZOw+vxMKGXi/nfDw7qQB6T6ClS8Ic=;
        b=bHpgp3ngtSsLncb6dhyJwm0AoSyrWwM0Vq9QNsrLhqWPUS6/gY8V+7/pl6hqxKPx1A
         BbANKj0xBNU0CJjXFZGrD65qC7+fl/aksS8AEkI5zlWAdeta3mSHOA/ozXk9hqHEH7FK
         c+awguBBPi0B42Cgdhaa+ipLPEo8H1wL1Wb4Dt9ZRwkOtqsD5377LntR6hV1K8qo98Dw
         Q4fqYIIB12B0oyZ44odZDQ9h2Gvhl8nhKF19QJ4wXvf/fFlQUBza7h4F4CH7Lu4b1h7z
         SO23Sa4zGE+vrfjvsd6w4N7+mT4rIN8YOS3ZK/7XMHU8RjMuuqPss36H7OmS/FP8LxfG
         obhA==
X-Gm-Message-State: AO0yUKWR0khqB6kNoFihVfUpMfvE0bB1jzFaxiNOQqmKGQi955edCBng
	GTmZBOLvVlSNQn3KBh8VIrpxSAsFVZ2+RA==
X-Google-Smtp-Source: AK7set+hBed4Vs81Op6a8Moc0ZYf2TGrkIyuIwn9zkILCDF+4akhZ0fn2PUit7H3sH6BdDxxPfJo6w==
X-Received: by 2002:a05:6000:1f0f:b0:2bf:bbd1:1db3 with SMTP id bv15-20020a0560001f0f00b002bfbbd11db3mr10247467wrb.44.1675458895502;
        Fri, 03 Feb 2023 13:14:55 -0800 (PST)
Received: from skbuf ([188.26.57.116])
        by smtp.gmail.com with ESMTPSA id w7-20020adff9c7000000b002be546f947asm2835380wrr.61.2023.02.03.13.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 13:14:55 -0800 (PST)
Date: Fri, 3 Feb 2023 23:14:51 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Ido Schimmel <idosch@idosch.org>
Cc: netdev@kapio-technology.com, davem@davemloft.net, kuba@kernel.org,
	netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [PATCH net-next 0/5] ATU and FDB synchronization on locked ports
Message-ID: <20230203211451.3rhg2kg6tjmmhfmp@skbuf>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <Y9lrIWMnWLqGreZL@shredder>
 <e2535b002be9044958ab0003d8bd6966@kapio-technology.com>
 <Y9vaIOefIf/gI0BR@shredder>
 <3cecf4425b0e6f38646e25e40fd8f0fd@kapio-technology.com>
 <Y9vmfoaFxPdKvgxt@shredder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9vmfoaFxPdKvgxt@shredder>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_131458_110036_BF608AE2 
X-CRM114-Status: GOOD (  30.34  )
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

On Thu, Feb 02, 2023 at 06:36:14PM +0200, Ido Schimmel wrote:
> On Thu, Feb 02, 2023 at 05:19:07PM +0100, netdev@kapio-technology.com wrote:
> > On 2023-02-02 16:43, Ido Schimmel wrote:
> > > On Thu, Feb 02, 2023 at 08:37:08AM +0100, netdev@kapio-technology.com wrote:
> > > > On 2023-01-31 20:25, Ido Schimmel wrote:
> > > > >
> > > > > Will try to review tomorrow, but it looks like this set is missing
> > > > > selftests. What about extending bridge_locked_port.sh?
> > > > 
> > > > I knew you would take this up. :-)
> > > > But I am not sure that it's so easy to have selftests here as it is timing
> > > > based and it would take the 5+ minutes just waiting to test in the stadard
> > > > case, and there is opnly support for mv88e6xxx driver with this
> > > > patch set.
> > > 
> > > The ageing time is configurable: See commit 081197591769 ("selftests:
> > > net: bridge: Parameterize ageing timeout"). Please add test cases in the
> > > next version.
> > 
> > When I was looking at configuring the ageing time last time, my finding was
> > that the ageing time could not be set very low as there was some part in the
> > DSA layer etc, and confusion wrt units. I think the minimum secured was like
> > around 2 min. (not validated), which is not that much of an improvement for
> > fast testing. If you know what would be a good low timeout to set, I would
> > like to know.
> 
> My point is that the ageing time is parametrized via 'LOW_AGEING_TIME'
> in forwarding.config so just use '$LOW_AGEING_TIME' in the selftest and
> set it as high as it needs to be for mv88e6xxx in your own
> forwarding.config.

FWIW, we have a forwarding.config file in tools/testing/selftests/drivers/net/dsa/.
So you could cd to that folder, edit the file with your variable, and run the symlinked
script from there.

> as there was some part in the DSA layer etc

	if (ds->ageing_time_min && ageing_time < ds->ageing_time_min)
		return -ERANGE;

High tech, advanced software.....

You could print the ds->ageing_time_min variable. For mv88e6xxx, my 6390
and 6190 report 3750. I have to admit the ageing time units are confusing,
but Tobias Waldekranz kindly explained in one of those commit messages
that Ido linked to that these represent "centiseconds" (or 37.5 seconds).
And I think we discussed the units with you before. And in general, it's
not hard to find the answer if you search for it, I know I could find it.

Please stop trying to find silly excuses to always go through the path
of minimal resistance.

