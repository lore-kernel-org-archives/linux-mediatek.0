Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BED3C04A95
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 11:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lb9/zjqYRw+NBkGo45ll85eULcpfPgNmAc+gmZ4GdK8=; b=eqMIH2QUZ7vzZ9lP+Rdcd824tw
	zZVyjNe54p96SjnGSI7BRX82blhzHZXRlKNb13nsu3TvObSyZ74hIPX8SBC15rt0ISPrO98q9O4NZ
	WE7FgiIQzhrraOlSK1ykOGsODpkd4sqMdWJky7rd9IchdZ3NIrR7YK2rKy9qhh0yeG98CmvaiiDct
	/V7tRZb8Kma90RHHbreLei0cFAJIMIfjxyYHuWU13dztJlxx9T5Tu+IAextNhwJ/IpfDEBVpU7HW/
	iCYi1bBTUxv2e838uIn75aeU93U9mtmyIxIuQwNudlwVQKHZrKFo0bshXVQXa6n2eAyql79thUkG0
	e5bnFf0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omD63-00CTjx-7x; Sat, 22 Oct 2022 11:55:23 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omD5q-00CTfG-Ek; Sat, 22 Oct 2022 11:55:11 +0000
Received: by mail-ed1-x52a.google.com with SMTP id t16so15013680edd.2;
        Sat, 22 Oct 2022 04:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lb9/zjqYRw+NBkGo45ll85eULcpfPgNmAc+gmZ4GdK8=;
        b=Zn6DNUW7Q97y/Bj/MSIzEC49CS64UT31QlzoAD6wLkmrUxwL1opBKx7FXFWrSqbXaY
         Kr1KrFPsJ5JFxz0E1ldEufc0LNrVaS6CfxrDGIytU7fsPoRNSf7b8USeKEUhwUXCscFM
         a2eyfsGFdsJkoxvamtodBneDSb4qhyXHHlRu7IuxYnRTevp2bmD1yAVHZeigULn1T3uo
         SomsjVAH+PAFo+dUSfG7fdu4CcnjNb6zpwlwRsUS2LdACbuiopa+fiVo3Kp3Y0SXSwg0
         sJQXpsxD9lNfpN8JbakSleno2DDivomz9MFdYdzSmr8s6ium2N25Al1S20hCR2OOVz/t
         QzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lb9/zjqYRw+NBkGo45ll85eULcpfPgNmAc+gmZ4GdK8=;
        b=ilcY8ZbWtiOFaPiaatOTXu9QwIJRmQRY5gOwP9bSbTff9MJ2CRRiLqGOBXHLGTDcYS
         dwUf9me2CKkRGyoJoW01WJxxB9ZcyfrDmUVmz4KeE/61uk75bRVdH8Ym7fA2ilrkw4Ir
         Cs/Mh/979XsV32OVz1l8kYblMtjhQIwR+o3YaNLnm4sO4SX0YZBf3/TnEeGgsOVUUTbe
         HsRRWAZN5lilTV1UdCA2+pRpx4t4mz0yFV2zqZ3AznpHix9IGL6kug4ctc0mM4j1VwFe
         fR+q1fW51YnbFuE/vM8fEfTBFZsfAZSq3aMDtwjU/vpdf4mDoh0aXJnQB5bWC+ZTMEj0
         ffKQ==
X-Gm-Message-State: ACrzQf2EBN/5e8uHXR6C6cKNNL48Khx7FR18fy7yy+Qh+WDRqIMB1d+/
	ibjQMC/lxltNN/xkkNfhizw=
X-Google-Smtp-Source: AMsMyM5sZekC9ebEG4UlcVJhjIzJk4B8pbY2EdSY2DXkIQxcMmosxQTI6bWhf1D8BYOHHlCeocAkpw==
X-Received: by 2002:a05:6402:1cca:b0:460:7d72:8f2 with SMTP id ds10-20020a0564021cca00b004607d7208f2mr12435625edb.205.1666439709061;
        Sat, 22 Oct 2022 04:55:09 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id fd13-20020a056402388d00b0045b3853c4b7sm14906421edb.51.2022.10.22.04.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 04:55:08 -0700 (PDT)
Date: Sat, 22 Oct 2022 14:55:05 +0300
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
Message-ID: <20221022115505.nlnkfy2xrgrq74li@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221020132538.reirrskemcjwih2m@skbuf>
 <a0269818b270ad0537b991bd98725260@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0269818b270ad0537b991bd98725260@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_045510_519266_CDCA4D88 
X-CRM114-Status: GOOD (  16.76  )
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

On Sat, Oct 22, 2022 at 09:31:06AM +0200, netdev@kapio-technology.com wrote:
> But I think it should be so that turning MAB off will clear the ALE entries
> regardless, as the port can continue to be locked and needing port association,
> or you want them to just age out normally in that case, thus lingering for
> up to bridge ageing time?

Even without BR_PORT_LOCKED, I find it normal that dynamically learned
FDB entries are forcefully aged out when BR_LEARNING is turned off,
instead of lingering on until they expire.

This does not happen in the software bridge, and I did not understand
why (I suspected some backwards compatibility reasons), and for this
reason, it is only from within DSA that we are forcing this behavior to
take place. In dsa_port_bridge_flags(), when BR_LEARNING is turned off,
we call dsa_port_fast_age() which also calls SWITCHDEV_FDB_FLUSH_TO_BRIDGE
(and this clears the bridge software FDB of dynamically learned entries).

I very much expect the same thing with MAB and BR_FDB_LOCKED entries,
that they go away when the BR_PORT_MAB/BR_LEARNING flag (whichever way
we call it) is unset.

Now, if the bridge should initiate the flushing, or still DSA, is
perhaps a topic for further discussion. Given that BR_FDB_LOCKED entries
are new, maybe the bridge could do it in this case (no backwards
compatibility to handle).

Currently the DSA logic mentioned above is bypassed, because we treat
MAB and autonomous learning differently. If we accepted that MAB is
still a form of learning (managed through BR_LEARNING+BR_PORT_LOCKED),
then the DSA logic would kick in, and both the software bridge and the
hardware driver would have a hook to clean up the BR_FDB_LOCKED entries,
plus anything else that is dynamic. The DSA logic would also kick in if
we treated BR_PORT_MAB within DSA like BR_LEARNING, which basically
amounts to the same thing, except for the confusing (IMO) UAPI of having
a flag (BR_PORT_MAB) which is basically a form of learning that isn't
controlled by the BR_LEARNING flag (which is undefined and unclear if it
should be set or not, in BR_PORT_LOCKED mode).

