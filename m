Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65EDC46467
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 13:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sA9EhPclZO6+f6VLQzu+GI/zukGWQQoz8R1Dt12GsI=; b=Xs5ImqolKTdLjcT2/bzyx1Yf8d
	lvhiWbzmB/bLRw0/5HgC6Xar9L4e+1fGUqTVBFqFlNVSDf61cjC3tLcLiSxEFsmI3bFTrADv7wa33
	5NVd0V7TAyXZGxd03mDIWPd+62rhK1AYznaSk4WsiMBUq4ZWE8eyXKKrMwvqzS/qKX4B4liNqZaBp
	Ynes9oULXz0iCggGh8Csu07pmUXNS6oDyLbeUQUxUuSIUNbObLu8mz0A3ly3tVd4PGgK17am5VJhc
	UH9icTn/bI3Kpkr6YEReJvPSSpQeZoXklBEvUB9+jvJsrtU4wMnMISmj94Vs2k3RAuyQlZHvirHED
	8daOEcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIVA9-0059nn-SN; Thu, 19 Jan 2023 13:41:05 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIV9w-0059kU-0T; Thu, 19 Jan 2023 13:40:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id w14so2898743edi.5;
        Thu, 19 Jan 2023 05:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2sA9EhPclZO6+f6VLQzu+GI/zukGWQQoz8R1Dt12GsI=;
        b=Ssrumq6PQhx2e/g4Bd6SuNl23SQH9Qv/nzp1Uy9v//x8kEfruuqhhMNDkoX0H6ubCI
         MaR+SU/RqMNRmjwnNWDMEcpz5GjfoleC+3BNcTsopxhWnVzJ1nwvkgl4GUS7gqR9n1Fq
         izOLXvz1I0ML3IDmv7IE1eUXRtk1Yci1fVgckWGdmoTrtO/ZlMVH35H0a2v/yyavFMTI
         dgIH49auVy3dEz1m78McldLsu3o9041upq0t+vH0lbSnrUxZ+kOG4XyhlXJ82KOUrTZk
         0WYx/93yCnKvBMWzXt48IicEnnzHqiPpFmQESj7PjC1dRCf2NXHPeU7yGmFs8AcDl6o1
         hazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sA9EhPclZO6+f6VLQzu+GI/zukGWQQoz8R1Dt12GsI=;
        b=I61jftrPdUxIs92nCZuMx/+zZutIIIw+9qV/f/9U5hVqIsCnX5fmWxr7yIczyBDCOE
         UZ9kmCNKN4AtflhX3I7++m0yiO03cyWv9MN0IeMO0M+rf8F1XdKPKB7/AGXXybJcmdc3
         K1seE4IomDh6RvWzEy7nrXmKU1G3VmwaDBhXoCP5bnj/qYdsfRZhoKnNoLETO8B9N8/h
         C08fh92ru29h+kajJIg6OWnKtvRE/f9c3ADjj23m9/xiA7+uNr+Q4j5dIZWfHepr/mPu
         OqTjTLksoUkaFA3b8Zmzb/+IV2vd4YIGYAOfqzePSXysVPLAMrLUL6oCg/PJ2zB5Kxkx
         kWmA==
X-Gm-Message-State: AFqh2koNnvkR2PE0qUsKB5Ko0UMV4d5yaBIDMvTJt54NBTolWQZvPFvx
	Wd8DCu+HImdkRdCf0aUEGnA=
X-Google-Smtp-Source: AMrXdXvXkuKoZFQFQT4KXsKjMumQ66Scy56M1tiUgcqYCQA/AY3QpuuZlRLh4qPLSeGgenAVe3KP+g==
X-Received: by 2002:a05:6402:cba:b0:49d:25f3:6b4e with SMTP id cn26-20020a0564020cba00b0049d25f36b4emr10522051edb.28.1674135648960;
        Thu, 19 Jan 2023 05:40:48 -0800 (PST)
Received: from skbuf ([188.27.185.85])
        by smtp.gmail.com with ESMTPSA id sb25-20020a1709076d9900b0084c6581c16fsm16304907ejc.64.2023.01.19.05.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:40:48 -0800 (PST)
Date: Thu, 19 Jan 2023 15:40:45 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: netdev@kapio-technology.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
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
Subject: Re: [RFC PATCH net-next 1/5] net: bridge: add dynamic flag to
 switchdev notifier
Message-ID: <20230119134045.fqdt6zrna5x3iavt@skbuf>
References: <20230117185714.3058453-1-netdev@kapio-technology.com>
 <20230117185714.3058453-2-netdev@kapio-technology.com>
 <20230117230806.ipwcbnq4jcc4qs7z@skbuf>
 <a3bba3eb856a00b5e5e0c1e2ffe8749a@kapio-technology.com>
 <20230119093358.gbyka2x4qbxxr43b@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119093358.gbyka2x4qbxxr43b@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_054052_096804_668AE8F2 
X-CRM114-Status: GOOD (  19.11  )
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

On Thu, Jan 19, 2023 at 11:33:58AM +0200, Vladimir Oltean wrote:
> On Wed, Jan 18, 2023 at 11:14:00PM +0100, netdev@kapio-technology.com wrote:
> > > > +	item->is_dyn = !test_bit(BR_FDB_STATIC, &fdb->flags);
> > > 
> > > Why reverse logic? Why not just name this "is_static" and leave any
> > > further interpretations up to the consumer?
> > 
> > My reasoning for this is that the common case is to have static entries,
> > thus is_dyn=false, so whenever someone uses a switchdev_notifier_fdb_info
> > struct the common case does not need to be entered.
> > Otherwise it might also break something when someone uses this struct and if
> > it was 'is_static' and they forget to code is_static=true they will get
> > dynamic entries without wanting it and it can be hard to find such an error.
> 
> I'll leave it up to bridge maintainers if this is preferable to patching
> all callers of SWITCHDEV_FDB_ADD_TO_BRIDGE such that they set is_static=true.

Actually, why would you assume that all users of SWITCHDEV_FDB_ADD_TO_BRIDGE
want to add static FDB entries? You can't avoid inspecting the code and
making sure that the is_dyn/is_static flag is set correctly either way.

