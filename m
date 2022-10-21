Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A091C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 16:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diC8NAGcMEsNdERayclB3yX1bYh/brVTx+qg6EEm8xY=; b=B6pdo19S95H3w7/wCai54fmJb7
	4kgEUn0yXftyiQgDzzPYhZ8nRu8SuQro0Mg9N5NSr/LZmpC6ha4tA/PBYp4JrDRHWCOuBdXEynUFk
	Joz18FMl+ULjTl+slUaFfEjR61LbIHPr8N2/s8gqF3MI5+9e6WZlZ5+JtEK/EyvJFCw0OuydtI74H
	nPSGszt9tAYggLZ04LagfjnDEq+9WWGswy6SUsmi+0JBstHN5BHhVp3hmeaPtAJO5Yr98J4UAqVn5
	tdqNJLSLc7ZRR1b3DNkmWps52vJoWmyC80rR2tnB0VPpBIJfFXNdwrL5YhWLFuujxzsaLTKy2lXNc
	uxXZFNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oluug-008vvr-1H; Fri, 21 Oct 2022 16:30:26 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oluuU-008vtb-Sl; Fri, 21 Oct 2022 16:30:16 +0000
Received: by mail-ed1-x532.google.com with SMTP id m16so7853026edc.4;
        Fri, 21 Oct 2022 09:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=diC8NAGcMEsNdERayclB3yX1bYh/brVTx+qg6EEm8xY=;
        b=QuCjTmmNppPf/d2WZbw804dsVjsBi340rAtZVZBKAdL56fNNBr1wJsqU6uehAaZ4uG
         ZtNSVVp1WySs2XoXeGLLjrLOQ2/UPjvVqzt0nE48zKk/lEn51q5YwoeNTyaWjDpCr4ro
         rEEtRW/plhq9pEAd5d282djUJQcff2x5nnmiZL8ObV7Ftlxj+u9V6Wmmc+rPu+HC554S
         SQXQ+C4Di/dR0DgOjpgfOvcamTaZ4UxeBHSLnN9nSGPv+aGxbp4wL2HNetoY+mkGHl37
         SRiV4Enc2XcTkoX3a2qs0/CNN4LPYg+jxr7LHk0ksefOcZ8x4woYWzX95F6ix3YkfteB
         z52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diC8NAGcMEsNdERayclB3yX1bYh/brVTx+qg6EEm8xY=;
        b=WUpFScKxNIwMkE8gTVJbjtwIcAau/gAaucY9Ywuejdh663cXZ377sSvSIBMXVYhPNJ
         peFUrTDYK4sFd35Kxij5MuJPcfCss4K3gRINKI4CFwQ5xNI6sqDMyDpfh+VsPUgnTobn
         2mY0fnOV32BeFjw5NVPKup4EFdbX2JJFG4dLzFQ33tcAnZCCI8X++GKV7nhZt/tG1rCq
         pkH7Bg+YxHv1ttAjAOklZhTJY8rMohB0pfUwrPCcrspEMZTrHIj40JoCEdT8SAmjclHJ
         fmwe4uss8fE6Sz+mrZTS+JdsR4TkW2unxV8GHKUxwGMoXyD/r83Jz1kn+ZLLbXWldr7Q
         9+kA==
X-Gm-Message-State: ACrzQf0A/+/IddxIHPGwFotkE8YMgC5icH155StYqtDBWNA0aXnC+gcc
	j7EpTGJhComXwGKTwuB5SRc=
X-Google-Smtp-Source: AMsMyM78n56+svgX29OjlxCyk6mv2WVNTWp9uU9Jnba9JeGUv0mD6os2HIJ6ZxfS90tmLdfQOT0Awg==
X-Received: by 2002:a05:6402:3896:b0:45c:93c3:3569 with SMTP id fd22-20020a056402389600b0045c93c33569mr18660749edb.37.1666369810213;
        Fri, 21 Oct 2022 09:30:10 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id e18-20020a17090618f200b007828150a2f1sm11938898ejf.36.2022.10.21.09.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:30:09 -0700 (PDT)
Date: Fri, 21 Oct 2022 19:30:05 +0300
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
Message-ID: <20221021163005.xljk2j3fkikr6uge@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221020132538.reirrskemcjwih2m@skbuf>
 <2565c09bb95d69142522c3c3bcaa599e@kapio-technology.com>
 <20221020225719.l5iw6vndmm7gvjo3@skbuf>
 <82d23b100b8d2c9e4647b8a134d5cbbf@kapio-technology.com>
 <20221021112216.6bw6sjrieh2znlti@skbuf>
 <7bfaae46b1913fe81654a4cd257d98b1@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bfaae46b1913fe81654a4cd257d98b1@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_093014_947083_43246C29 
X-CRM114-Status: GOOD (  14.17  )
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

On Fri, Oct 21, 2022 at 03:16:21PM +0200, netdev@kapio-technology.com wrote:
> As it is now in the bridge, the locked port part is handled before learning
> in the ingress data path, so with BR_LEARNING and BR_PORT_LOCKED, I think it
> will work as it does now except link local packages.

If link-local learning is enabled on a locked port, I think those
addresses should also be learned with the BR_FDB_LOCKED flag. The
creation of those locked FDB entries can be further suppressed by the
BROPT_NO_LL_LEARN flag.

> If your suggestion of BR_LEARNING causing BR_FDB_LOCKED on a locked port, I
> guess it would be implemented under br_fdb_update() and BR_LEARNING +
> BR_PORT_LOCKED would go together, forcing BR_LEARNING in this case, thus also
> for all drivers?

Yes, basically where this is placed right now (in br_handle_frame_finish):

	if (p->flags & BR_PORT_LOCKED) {
		struct net_bridge_fdb_entry *fdb_src =
			br_fdb_find_rcu(br, eth_hdr(skb)->h_source, vid);

		if (!fdb_src) {
			unsigned long flags = 0;

			if (p->flags & BR_PORT_MAB) {
			   ~~~~~~~~~~~~~~~~~~~~~~~~
			   except check for BR_LEARNING

				__set_bit(BR_FDB_LOCKED, &flags);
				br_fdb_update(br, p, eth_hdr(skb)->h_source,
					      vid, flags);
			}
			goto drop;
		} else if (READ_ONCE(fdb_src->dst) != p ||
			   test_bit(BR_FDB_LOCAL, &fdb_src->flags) ||
			   test_bit(BR_FDB_LOCKED, &fdb_src->flags)) {
			goto drop;
		}
	}

