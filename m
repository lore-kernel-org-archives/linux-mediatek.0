Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B97C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 22:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JglhUSuAsvyo/02iuoDdhbFLRdL0c14GOno7/e71c6I=; b=ZpPjCugUFbUr6Sav401tlKb9L6
	DS0FD738jUvo+Sa9MDcHlUy5uC/R2Ma9AI3MQXdCzHXGScbLarrv+Hu8PtQbvFNbgadNjODCOMeRd
	5FsJrHYkoR5R89YIQ2DBNOysz1jqfzUKI+0bqh5nEAtA+t21XviWb8TfX0RKfASZ+onH+PjiFf8xh
	0+NRVDxyc0acl59LOJI7GBcvp5dijvZ77IShM4UlmG9et3EKF++Rtm2p7V/MuDwzVPsKAqtDPxCtY
	F02uSWgSpaY0anlXZI+wMXkBsW7+TlNPJs7V2TymU3V2Q9piRlYQJNCuzUkFFBr3yNSbpgLwKysGU
	jRvyCStA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oleGY-002Kzr-5k; Thu, 20 Oct 2022 22:43:54 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oleGM-002KvB-Q3; Thu, 20 Oct 2022 22:43:44 +0000
Received: by mail-ed1-x534.google.com with SMTP id z97so1696030ede.8;
        Thu, 20 Oct 2022 15:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JglhUSuAsvyo/02iuoDdhbFLRdL0c14GOno7/e71c6I=;
        b=UVFcLtLRlFJ23BO5nFdHnG4XQRcYTdnQfD3m/QakLfwgOixkkCd7UJlVA+CHErZDSK
         yqcpu2eHqMGfmTPApN2EotBAlWuycXT2OjFAFM1+5hggxKMnxWXGuezOaAd4WEJlzw/E
         QwfCAicGgtNoOd8NE+jP3QuxiLJQ5qMyH/pDBuCnlZYt4z3r6VCKUlsfCNk+YLZNLAOA
         jZfpDE2kC2IhtsQcsYya9US9kOGVA9O8AzfTEwo/8FQZKplzXol7D+K0m8g9+ZJMdMlA
         7qnuH1rqNqLEFKQ+7QqHXn3BuFaESpqJ+j9E4Q1RUqqQor0Pmd9ogjMf6JpK5JbYc/PN
         U2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JglhUSuAsvyo/02iuoDdhbFLRdL0c14GOno7/e71c6I=;
        b=m6nCSHg2XNfZ+TchECAqz1AMcWtzMlrIk838ePvoXq/V6vUsbl9oXoeXhbcVfzpNQ4
         R0bIBUjGcpFPXKULHk1b/xXYDNUhRR13vJBs7fgfi/Sbl5iKpV/WikjtHV0woaJkDCJ0
         FuReDlFiySq8b0D9NJNeWrUM+Ayd6L/KoGSET9hMHjaVKvcS/azwo6OouxQSzT3BrxaG
         0LgMWMGWlr4Lg9MFKWE/BZbH3UO821vArM+He4PFfp/85oHWtyHoxUqq1hhIpSqZ/aNj
         zRgi933jii12YFhKKuhob7q7VdxCI36aPe8kiO3oPD6pQrIZsG/f8GEd1bq3Dp+zN55w
         5hCw==
X-Gm-Message-State: ACrzQf29p5Ho8InO8WzsEXVlZXJcxaKqCqi3AloVuW7nzQtXmNY7KsHn
	sxcE6I8Ldd94kXOvCv4RFQw=
X-Google-Smtp-Source: AMsMyM5MjXkVhqFJ0DzPxQqFB+bWxrQP/KKt/X60NxMrSXVU8VHjgZ1HhV+RGAF8iAk/TVSu8j+SmA==
X-Received: by 2002:a05:6402:518b:b0:45d:9a19:66d2 with SMTP id q11-20020a056402518b00b0045d9a1966d2mr14121112edd.43.1666305818360;
        Thu, 20 Oct 2022 15:43:38 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id w14-20020a170906384e00b0078246b1360fsm10790195ejc.131.2022.10.20.15.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 15:43:37 -0700 (PDT)
Date: Fri, 21 Oct 2022 01:43:34 +0300
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
Subject: Re: [PATCH v8 net-next 03/12] net: bridge: enable bridge to install
 locked fdb entries from drivers
Message-ID: <20221020224334.ksh4xciad7yro3cj@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-4-netdev@kapio-technology.com>
 <20221020125549.v6kls2lk7etvay7c@skbuf>
 <e1184c879642c35e4ff6f19e0fd5de46@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1184c879642c35e4ff6f19e0fd5de46@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_154342_887641_69EF19F8 
X-CRM114-Status: GOOD (  18.80  )
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

On Thu, Oct 20, 2022 at 09:29:06PM +0200, netdev@kapio-technology.com wrote:
> On 2022-10-20 14:55, Vladimir Oltean wrote:
> > On Tue, Oct 18, 2022 at 06:56:10PM +0200, Hans J. Schultz wrote:
> > > diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
> > > index 8f3d76c751dd..c6b938c01a74 100644
> > > --- a/net/bridge/br_switchdev.c
> > > +++ b/net/bridge/br_switchdev.c
> > > @@ -136,6 +136,7 @@ static void br_switchdev_fdb_populate(struct
> > > net_bridge *br,
> > >  	item->added_by_user = test_bit(BR_FDB_ADDED_BY_USER, &fdb->flags);
> > >  	item->offloaded = test_bit(BR_FDB_OFFLOADED, &fdb->flags);
> > >  	item->is_local = test_bit(BR_FDB_LOCAL, &fdb->flags);
> > > +	item->locked = test_bit(BR_FDB_LOCKED, &fdb->flags);
> > 
> > Shouldn't this be set to 0 here, since it is the bridge->driver
> > direction?
> 
> Wouldn't it be a good idea to allow drivers to add what corresponds to a blackhole
> entry when using the bridge input chain to activate the MAB feature, or in general
> to leave the decision of what to do to the driver implementation?

The patch doesn't propose that. It proposes:

| net: bridge: enable bridge to install locked fdb entries from drivers
| 
| The bridge will be able to install locked entries when receiving
| SWITCHDEV_FDB_ADD_TO_BRIDGE notifications from drivers.

Please write patches which make just one logical change, and explain the
justification for that change and precisely that change in the commit
message.

