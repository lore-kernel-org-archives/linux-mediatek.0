Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA91C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 20:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2i9kAduLyvWzDNPasV+KzeGgY8drvOps/KxoO5LHdEw=; b=lfEzCKAVGGDzE+L5Ajc3DPjiGs
	PaYTL+eGw923v+XWC5HjQ044shBZ1OEaahua/L6Phl4SCdW7kZH1+Y0AVmeLiz9GEZJjaz9RzpHKo
	uB1/ikhxHXwCHBrpNn1xW3ii4hTtEsr9/l4zyw/LwJq9JD/2DhLEU2l/QCMnnfyFcYBL0LzlE7brB
	9El8rPj18o6G/lIcrE4VRTmoeBEV5Dav/nk6Y97SxnTbhyG2ceuCgBaSQGW8ZWOXK8Nt1+tH9Jygg
	SgaKqt/cdpYVddKkwMYNHXTkH0qJgoks00FuAnGrzZOxjIE/AcEc0f6EFGLS+XA7A9S8CCRuRLK/j
	EOny/oUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO2vL-003XZN-04; Fri, 03 Feb 2023 20:44:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO2v7-003XVZ-RA; Fri, 03 Feb 2023 20:44:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id k16so4771596wms.2;
        Fri, 03 Feb 2023 12:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2i9kAduLyvWzDNPasV+KzeGgY8drvOps/KxoO5LHdEw=;
        b=Vh4yFSLP4dnir5alPOP/BdqGJ1iEQMpXhQ+vDTowlNH9vMovkkNBYPi8Uhk8C7itGw
         pWJPGbneNPZx8bgItqJXAuo9hewbHrvUsmkjhmhjo7iVzDaPKFrVlDjUisuzBbOPzaBk
         hoew3vOtR7JhNkpbPch0cih/aKZQY3wZX9AulnE0kyyhblR3bKcZnRU35XovU5/9VbYj
         lHi0Szbc9Ujf075Lgy9ykV7iQTSzJNKLodhKzj3evBAx2txbaKjEgLHvLZEo7Spemc80
         Fne13usGX0QFsuTnmHXtqiB94MQK2ebcXK5/Xito6NgmRWOGINev3LN1yORMLgTrA/pn
         3OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2i9kAduLyvWzDNPasV+KzeGgY8drvOps/KxoO5LHdEw=;
        b=nmRLM8WwF/39I54MnEYckO8Exk0YYtT2k+BQCMZQm9Fx0Lur6V8yRIXF854f4xw78F
         zslhcxAy4U7Svi0R1u2hegWFoYETPdulMBXXqcglAQsNt08vjaUaEdOVCfOucDtcugeS
         i5G1Cu68UtLAG5+dXOwrtpqfPADbaZzSGSPCBfBKrTyDFK6H/CgNSyotzwEJ0TmdiX5H
         34hEZTkdcoBE/4jwRzVw/9mAEGnGGS3nTyurgCZE4T++5YiG3ixwV7oRVJK2jJqD9HqS
         dOMfV4mAHqrnh2Ub/IYAMNtYGusttb74CUduKVORfMUS9Ik2VhAfnjDlzceTOfAEfsiK
         Zdag==
X-Gm-Message-State: AO0yUKV6eURQFGdfakDC4Owsbq/wcsL0sh/E4UIDbFRioxrYSyPbJzIo
	QXTyGTfKGhAE9dxnAKAHxk0=
X-Google-Smtp-Source: AK7set+E0bvJKJbO9QlN+pgygfVmSHBtgpwZ8dotHCW3HBDbg/640wbwRlbuPaDZ1oHGBTvA8Ms6OQ==
X-Received: by 2002:a05:600c:1994:b0:3d3:5709:68e8 with SMTP id t20-20020a05600c199400b003d3570968e8mr10077158wmq.36.1675457065628;
        Fri, 03 Feb 2023 12:44:25 -0800 (PST)
Received: from skbuf ([188.26.57.116])
        by smtp.gmail.com with ESMTPSA id r30-20020adfa15e000000b002bfafadb22asm2834308wrr.87.2023.02.03.12.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 12:44:25 -0800 (PST)
Date: Fri, 3 Feb 2023 22:44:22 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Simon Horman <simon.horman@corigine.com>
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
Subject: Re: [PATCH net-next 5/5] net: dsa: mv88e6xxx: implementation of
 dynamic ATU entries
Message-ID: <20230203204422.4wrhyathxfhj6hdt@skbuf>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <20230130173429.3577450-6-netdev@kapio-technology.com>
 <Y9lkXlyXg1d1D0j3@corigine.com>
 <9b12275969a204739ccfab972d90f20f@kapio-technology.com>
 <Y9zDxlwSn1EfCTba@corigine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9zDxlwSn1EfCTba@corigine.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_124429_923062_40D16A5B 
X-CRM114-Status: GOOD (  16.29  )
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

On Fri, Feb 03, 2023 at 09:20:22AM +0100, Simon Horman wrote:
> > else if (someflag)
> >         dosomething();
> > 
> > For now only one flag will actually be set and they are mutually exclusive,
> > as they will not make sense together with the potential flags I know, but
> > that can change at some time of course.
> 
> Yes, I see that is workable. I do feel that checking for other flags would
> be a bit more robust. But as you say, there are none. So whichever
> approach you prefer is fine by me.

The model we have for unsupported bits in the SWITCHDEV_ATTR_ID_PORT_PRE_BRIDGE_FLAGS
and SWITCHDEV_ATTR_ID_PORT_BRIDGE_FLAGS handlers is essentially this:

	if (flags & ~(supported_flag_mask))
		return -EOPNOTSUPP;

	if (flags & supported_flag_1)
		...

	if (flags & supported_flag_2)
		...

I suppose applying this model here would address Simon's extensibility concern.

