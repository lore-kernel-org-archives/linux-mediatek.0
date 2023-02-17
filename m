Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C397C636D6
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 17:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auVrVbOSTA9pQeJfPXz91TlriegzpUKwC2EMUID2gPE=; b=jHwuZX7DwNGVXnUwQyFEr7cFt0
	I205s4eQMOv5BDfuvICplCUE8jngAYZZjOXnSsjcpl9S8fbHQyzNcMibwR8eCUaToyYp6/fV2r7zk
	VbLhR2UG21WAFDobEEFoipOcnU/F5TMi+DavLX59z82P3RzR+6JxZJSWHkKxWQ/ND4U7rYoZdCRi9
	8f56KtyU9WS9inOIWpgmQNlCgNb88R67k5jYUNLnVgBYUeFD6ZTRrSPz2Xsfnt4kGv93tBOSdBOro
	0WY9DrhODMnHaHeYWfH4hOqD4mT0EtlLmTdcE382t4VcP9S2UQPhIEoT7z3FLQ+L/1Rtk4rdKCUxD
	1ecsiJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT4mu-00FJUs-H8; Fri, 17 Feb 2023 17:44:48 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT4mj-00FJSn-Gh; Fri, 17 Feb 2023 17:44:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id p22so1531460wms.0;
        Fri, 17 Feb 2023 09:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=auVrVbOSTA9pQeJfPXz91TlriegzpUKwC2EMUID2gPE=;
        b=kPts36a0DOfrWbE5EDMVM8XUTfPhcct1+Wh6iYrEUNULUaJQQ940e2QgPodOvnNQ3O
         PYVdDfrIzrIPE0Vc2g/vfe89g2tIAWRInxGmIeY2ABwKLrTGnwzSZXS4/ClMgmErrlyZ
         2VJyFiXyf6FXfFu8h4TAk5sbo9ObWj2hpaMsr5iTHYK0yLpQeXx/71BXJmUTcn6Wvk9c
         PmQQIK6oRsnk/d8C/SuDJEsTzFKhOVo3Uq5HnXasc+0Bv5iNajhahka3DZoCuSzV0nXu
         U1ZgVBV32o0fJltdnu8cEis7bX2g96yWawZ5DbL8oya33c0Sw88227zU/BpoJxCJOwQD
         DEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auVrVbOSTA9pQeJfPXz91TlriegzpUKwC2EMUID2gPE=;
        b=4p8vbw5X5eTFdjymOYyIbaIUJDowTupKVh/L9M5Dlbv9Vr7qbAHHHELA/+hOoWM4HQ
         HKMEUVTJr3cqYD0ePD7mfE0kzJ8Jr9DvfOFv2eZL7QRcRfeJwumysTrbGAYPdlzxxbh3
         8fJdoI2te1kIiWZIqTCxvDsFoK4W6V+Mcm8i0QoTXaLGdHfOOsBa0gvl1fGBIaz2Gf+t
         RwBE/c5BCyKwkuXRjzdbfyF9J/tqIwsPe9Iuv7wHiXHe8RseFJKR+sf+t8xhDQxPe8Qm
         YiyqnYpxR3MQPFHqm8wNjW4Ygv3IGazmRfqzf/Jdj1UpNaDwAUXm2zgAM++sz30gLVex
         J+uQ==
X-Gm-Message-State: AO0yUKWSM05A9/SZJfYJ0HaMK16QkErK8OuNo1VRavs1Z0E61ASJkbue
	LHfE8saBjeGij+jmDOgPNm8=
X-Google-Smtp-Source: AK7set/fy/Eb7Sue92rcdrDm3lCCSH8M5LFbef1BLFLsabLm+s8mqQPhJsjPKF5bbxALYzTFXwfvuA==
X-Received: by 2002:a05:600c:30ca:b0:3d5:365b:773e with SMTP id h10-20020a05600c30ca00b003d5365b773emr1835463wmn.39.1676655874493;
        Fri, 17 Feb 2023 09:44:34 -0800 (PST)
Received: from skbuf ([188.25.231.176])
        by smtp.gmail.com with ESMTPSA id x14-20020a1c7c0e000000b003e20970175dsm6651711wmc.32.2023.02.17.09.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 09:44:34 -0800 (PST)
Date: Fri, 17 Feb 2023 19:44:31 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Hans Schultz <netdev@kapio-technology.com>
Cc: Simon Horman <simon.horman@corigine.com>, davem@davemloft.net,
	kuba@kernel.org, netdev@vger.kernel.org,
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
Subject: Re: [PATCH net-next 5/5] net: dsa: mv88e6xxx: implementation of
 dynamic ATU entries
Message-ID: <20230217174431.bkkvfmtno56mfh5a@skbuf>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <20230130173429.3577450-6-netdev@kapio-technology.com>
 <Y9lkXlyXg1d1D0j3@corigine.com>
 <9b12275969a204739ccfab972d90f20f@kapio-technology.com>
 <Y9zDxlwSn1EfCTba@corigine.com>
 <20230203204422.4wrhyathxfhj6hdt@skbuf>
 <Y94TebdRQRHMMj/c@corigine.com>
 <4abbe32d007240b9c3aea9c8ca936fa3@kapio-technology.com>
 <Y+EkiAyexZrPoCpP@corigine.com>
 <87fsb83q5s.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsb83q5s.fsf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_094437_615914_317A7AEE 
X-CRM114-Status: GOOD (  26.92  )
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

On Tue, Feb 14, 2023 at 10:14:55PM +0100, Hans Schultz wrote:
> On Mon, Feb 06, 2023 at 17:02, Simon Horman <simon.horman@corigine.com> wrote:
> >
> > Just to clarify my suggestion one last time, it would be along the lines
> > of the following (completely untested!). I feel that it robustly covers
> > all cases for fdb_flags. And as a bonus doesn't need to be modified
> > if other (unsupported) flags are added in future.
> >
> > 	if (fdb_flags & ~(DSA_FDB_FLAG_DYNAMIC))
> > 		return -EOPNOTSUPP;
> >
> > 	is_dynamic = !!(fdb_flags & DSA_FDB_FLAG_DYNAMIC)
> > 	if (is_dynamic)
> > 		state = MV88E6XXX_G1_ATU_DATA_STATE_UC_AGE_7_NEWEST;
> >
> >
> > And perhaps for other drivers:
> >
> > 	if (fdb_flags & ~(DSA_FDB_FLAG_DYNAMIC))
> > 		return -EOPNOTSUPP;
> > 	if (fdb_flags)
> > 		return 0;
> >
> > Perhaps a helper would be warranted for the above.
> 
> How would such a helper look? Inline function is not clean.
> 
> >
> > But in writing this I think that, perhaps drivers could return -EOPNOTSUPP
> > for the DSA_FDB_FLAG_DYNAMIC case and the caller can handle, rather tha
> > propagate, -EOPNOTSUPP.
> 
> I looked at that, but changing the caller is also a bit ugly.

Answering on behalf of Simon, and hoping he will agree.

You are missing a big opportunity to make the kernel avoid doing useless work.
The dsa_slave_fdb_event() function runs in atomic switchdev notifier context,
and schedules a deferred workqueue item - dsa_schedule_work() - to get sleepable
context to program hardware.

Only that scheduling a deferred work item is not exactly cheap, so we try to
avoid doing that unless we know that we'll end up doing something with that
FDB entry once the deferred work does get scheduled:

	/* Check early that we're not doing work in vain.
	 * Host addresses on LAG ports still require regular FDB ops,
	 * since the CPU port isn't in a LAG.
	 */
	if (dp->lag && !host_addr) {
		if (!ds->ops->lag_fdb_add || !ds->ops->lag_fdb_del)
			return -EOPNOTSUPP;
	} else {
		if (!ds->ops->port_fdb_add || !ds->ops->port_fdb_del)
			return -EOPNOTSUPP;
	}

What you should be doing is you should be using the pahole tool to find
a good place for a new unsigned long field in struct dsa_switch, and add
a new field ds->supported_fdb_flags. You should extend the early checking
from dsa_slave_fdb_event() and exit without doing anything if the
(fdb->flags & ~ds->supported_fdb_flags) expression is non-zero.

This way you would kill 2 birds with 1 stone, since individual drivers
would no longer need to check the flags; DSA would guarantee not calling
them with unsupported flags.

It would be also very good to reach an agreement with switchdev
maintainers regarding the naming of the is_static/is_dyn field.

It would also be excellent if you could rename "fdb_flags" to just
"flags" within DSA.

