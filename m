Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC954C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 09:15:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B28D761057
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 09:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B28D761057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1AYymdIiFBs91+SA7NBw0ZfBldvet/C4v+7sS7BIlg=; b=owUZuniZephG7Y
	pnLpuGUIdFGjGDiQC+Tjs22kmBprRGtb19nBsNi9yb4dUr178gwFSY0+nKElAfSh/79ZBlRhD8TwA
	olBgjB8cQfzFKAYCJPS6icc5UWflA6G6GV9oWnfBhsefsIcnBBqTdKt4NmvS0IinqpcON9nSlc7WG
	Q7PGfiEoIa8IX/pVx10KXsUzR03XCVytCfC1T4wrHt7p/VCTGJ060QryXOpJNiGYcEByTjggUZFz+
	/Ul6bfa3D+M+O/tv4nW10aPuztumVLHUuTyS5vLlvGEQ0fMtlpzJ115zWVtD+Pgy9eWFKkX9eire4
	0niFv9zQeSdAc0F36WEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM5Hl-00BPjE-UV; Fri, 03 Sep 2021 09:14:57 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM5HV-00BPdH-0W; Fri, 03 Sep 2021 09:14:42 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so3422473pjw.2; 
 Fri, 03 Sep 2021 02:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=kb8Z5KH61dlFFT8cs85Ri7+/n7iNLKzAMoxXAmW2ceA=;
 b=VS5jH6/vJozUZwnuawGnyMC48QMXnhiunRInAGDzbwL/WM0K4OHttgn8v1WCHsygYV
 XtAU90YgcTIDbfWQpOteVNWViEFrEkjPcJJbHLsCiJAFOUNxLEK6hbYR9cNxExvnShpo
 LyqlT+c3lp5cystcpuSx+j0P2kH/r09xPyCfn8NuA0A1cshCiFaVISLRV+ZhlfT3bTUP
 PhxSKw5dKyHQXBpu3yLlhAYWERBo7a+fMAYKdQEVJADI+D33toqWqcNflbD1oxzKiRG8
 L35MKyfOzPdC/cBx/XIsdgFwmgaenK14tAvoVkxX5Zhywm8m/dL90ZbZ+9rnlCfrSOYJ
 TJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=kb8Z5KH61dlFFT8cs85Ri7+/n7iNLKzAMoxXAmW2ceA=;
 b=GzVaHVZW78qErGSucGQtaz09P3m3QyNqzy4539JraVlZxlzBS4RWekPy6y0+nIlv5y
 6pA7/4C6H4XvBwJF1mSvyX5q606xdreGQ4s6IWZE1jTsC3tL/jPknHqiy71QkNDvCwex
 c8doTVvZakQTo1ru8CGDDaVAgJm0Kovg0g+x8CZnd63IjTrg/+PN6BfF2IcciFt+G+ts
 t81glcoXVI3fDCPTzHAKCxKwFdtrQVhv48+NUzmlAstidvyQjA5GSZQ3NykQMkhOOi/k
 7ZcGGl0IHfwGlHAz58FKvj1kvInBK1/txPZkIuq3YBAngY9PspeWUe2XO9+EQtML7tLS
 rfUg==
X-Gm-Message-State: AOAM532I3P1a9s55hOjNG8c28/Iuf4PnroOigObXhXQqbdevyyyWcSss
 1Jd9Bpmdr1ytof++dfmYOwCyLGKrZpPgHA==
X-Google-Smtp-Source: ABdhPJz1EryyIfzYCwBsKI7WGd4sPcZ3VHNRIpfsK7XuoGifQUKu3AiOsDLxBMlWacWq67iuYF7Weg==
X-Received: by 2002:a17:90a:6282:: with SMTP id
 d2mr8791405pjj.189.1630660479349; 
 Fri, 03 Sep 2021 02:14:39 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id y1sm5766231pga.50.2021.09.03.02.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:14:38 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 4.19.y] net: dsa: mt7530: disable learning on standalone
 ports
Date: Fri,  3 Sep 2021 17:14:30 +0800
Message-Id: <20210903091430.2209627-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YTBoDaYDJfBz3YzN@kroah.com>
References: <20210824055509.1316124-1-dqfext@gmail.com>
 <YSUQV3jhfbhbf5Ct@sashalap>
 <CALW65ja3hYGmEqcWZzifP2-0WsJOnxcUXsey2ZH5vDbD0-nDeQ@mail.gmail.com>
 <YSi8Ky3GqBjnxbhC@kroah.com> <20210902053619.1824464-1-dqfext@gmail.com>
 <YTBoDaYDJfBz3YzN@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_021441_106755_06C71460 
X-CRM114-Status: GOOD (  26.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 02, 2021 at 07:58:37AM +0200, Greg KH wrote:
> On Thu, Sep 02, 2021 at 01:36:19PM +0800, DENG Qingfang wrote:
> > On Fri, Aug 27, 2021 at 12:19:23PM +0200, Greg KH wrote:
> > > On Tue, Aug 24, 2021 at 11:57:53PM +0800, DENG Qingfang wrote:
> > > > Standalone ports should have address learning disabled, according to
> > > > the documentation:
> > > > https://www.kernel.org/doc/html/v5.14-rc7/networking/dsa/dsa.html#bridge-layer
> > > > dsa_switch_ops on 5.10 or earlier does not have .port_bridge_flags
> > > > function so it has to be done differently.
> > > > 
> > > > I've identified an issue related to this.
> > > 
> > > What issue is that?  Where was it reported?
> > 
> > See Florian's message here
> > https://lore.kernel.org/stable/20210317003549.3964522-2-f.fainelli@gmail.com/
> 
> THat is just the patch changelog text, or is it unique to this
> stable-only patch?  It is not obvious at all.

The issue is with all DSA drivers that do not disable address learning
on standalone ports.

"With learning enabled we would end up with the switch having
incorrectly learned the address of the CPU port which typically results
in a complete break down of network connectivity until the address
learned ages out and gets re-learned, from the correct port this time."

> 
> > > > > 2. A partial backport of this patch?
> > > > 
> > > > The other part does not actually fix anything.
> > > 
> > > Then why is it not ok to just take the whole thing?
> > > 
> > > When backporting not-identical-patches, something almost always goes
> > > wrong, so we prefer to take the original commit when ever possible.
> > 
> > Okay. MDB and tag ops can be backported as is, and broadcast/multicast
> > flooding can be implemented in .port_egress_floods. 
> 
> So what are we supposed to do here?

Function port_egress_floods is refactored to port_bridge_flags in commit
a8b659e7ff75 ("net: dsa: act as passthrough for bridge port flags"). I can
backport the mt7530_port_bridge_flags function as port_egress_floods.

> 
> totally confused,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
