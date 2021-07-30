Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0026C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 16:19:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8A4260EFD
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 16:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8A4260EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W81yzn0fkm6t32KISacbAQ7EKgldP/auQyGkuwenzUM=; b=NDcHJImeISdcCY
	dAyPaNDsJPoNc146aD68UbTz63DeaX25mOmIX645V/AjkJt0kIuozcobzkL09+alXq2neWU8E/CRZ
	/lfbyNR6iKRDOwMOXIoaUBcu5jwD7hbnaqfx4PBTWlDQIpflBZqs94IGfeHqOUkkznkrQzTkHpd9l
	aPwEaTi/2Vp/pmZ+OuGOuKENEfAWyffUrelWi/eeO+nmIYjdYXJfxF1Vqhi0UAGwHbCjD8+jcRRgV
	/fq81kcP9pibbc/Bj/u5y/bTnB61inzjDf38gTQO1ToIE8ECvhQ4LSYtwDXgYSdneZ057xQApmDMb
	RMDS2CFMTSf6DfEh66Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9VE8-009TCE-7O; Fri, 30 Jul 2021 16:19:12 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9VDu-009TAF-2T; Fri, 30 Jul 2021 16:19:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id yk17so10040957ejb.11;
 Fri, 30 Jul 2021 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rnL+DT6WaAAlihW1AoN/tB2D11HIMglWHsy5YB9xalA=;
 b=nJ4C4oqp2So/xg0u8hYcnVzRvBDxqLZqv6TA/A8fsa6hAV5GzDIuCa35v34njdPiPe
 tE1+DKt0K8T7UR3996CwY0zfCmcdH5+IGRlBGVMMarDKISnRnXRLoBLs1kvfMllVvQ7v
 XAhKFDdzCK8/fltQmiwOVcURqavpdHwNh8g1CLOSpqKxhOHSjsEnXvM0MPjbt+MFgYuF
 A61MXrgKQ9Qrhya/x4AJ3Bd1IMTY3P2eklRwYXHcsxYFkbZ2jutMGCb3BBNEkRNvJ/Ub
 buCsYVzYXpDiTRJQUtnkt+F9K/u1IieZYdmmFoqEzb4igfwrU80eYNZJ9XpiKWhp7yra
 4tOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rnL+DT6WaAAlihW1AoN/tB2D11HIMglWHsy5YB9xalA=;
 b=bBOwbPpp6lg19ADt4T8hRLjzTYN2UtzFOiJGSbObbFjXOJ0Y+93/IGFp7HWARWL39K
 DYKafLoKPOlDOlxnQEcBKXUvEtYay2Nf35QAxW7M5duFEa3EzJEmT2vOFY6U9WmUyFVK
 +lvs2Hv3g/VEZqwaGC4E7srxKoOY/zXkxyWj/FYZopVIhwWuOR1qVDxclXwZ8QKheL0p
 Xw3PyqnsgxJVqRwU5gNaEal6ZnBXbiCv+ackgWyuZvKNxSz7d2uTkCULRer9w6w+nk5i
 98s6zepLUVOgsA+reVrYvwlRhv9L/rLB4+TKxi3MTcqQkSfBjAdY2CFr/DUyrmnpMYjE
 skzA==
X-Gm-Message-State: AOAM531FBCvXFRlZtt+0ILZb4JWQHo0p5ZOxtOEkUTrYZfQBCob6cx/q
 u0elRU+OyWq3CB2F9cfa+pw=
X-Google-Smtp-Source: ABdhPJzzuPrv2SqvZYSlUSsr3w1X7odtfbVxsd3yG7NU5OJbhDUx0qQgpnj5n0ROyUD9H8ZfXs+9rQ==
X-Received: by 2002:a17:906:24d3:: with SMTP id
 f19mr3326764ejb.391.1627661935282; 
 Fri, 30 Jul 2021 09:18:55 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id cf16sm874035edb.92.2021.07.30.09.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 09:18:54 -0700 (PDT)
Date: Fri, 30 Jul 2021 19:18:52 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next 2/2] net: dsa: mt7530: trap packets from
 standalone ports to the CPU
Message-ID: <20210730161852.4weylgdkcyacxhci@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-3-dqfext@gmail.com>
 <20210729152805.o2pur7pp2kpxvvnq@skbuf>
 <CALW65jbHwRhekX=7xoFvts2m7xTRM4ti9zpTiah8ed0n0fCrRg@mail.gmail.com>
 <20210729165027.okmfa3ulpd3e6gte@skbuf>
 <CALW65jYYmpnDou0dC3=1AjL9tmo_9jqLSWmusJkeqRb4mSwCGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALW65jYYmpnDou0dC3=1AjL9tmo_9jqLSWmusJkeqRb4mSwCGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_091858_160972_22535113 
X-CRM114-Status: GOOD (  28.94  )
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

On Fri, Jul 30, 2021 at 11:45:41PM +0800, DENG Qingfang wrote:
> On Fri, Jul 30, 2021 at 12:50 AM Vladimir Oltean <olteanv@gmail.com> wrote:
> > I have the MT7621 GSW, and sadly this reference manual isn't the best in
> > explaining what is and what is not possible. For example, I am still not
> > clear what is meant by "VID1" and "VID0". Is "VID1" the inner (customer)
> > VLAN tag, and "VID0" the outer (service) VLAN tag, or "VID1" means the
> > actual VLAN ID 1?
> >
> > And the bits 3:1 of VAWD1 (VLAN table access register) indicate a FID
> > field per VLAN. I cannot find the piece that you quoted in this manual.
> > But what I expect to happen for a Transparent Port is that the packets
> > are always classified to that port's PVID, and the VLAN Table is looked
> > up with that PVID. There, it will find the FID, which this driver
> > currently always configures as zero. In my manual's description, in the
> > "Transparent Port" chapter, it does explicitly say:
> >
> >         VID0 and VID1 will store PVID as the default VID which is used
> >         to look up the VLAN table.
> >
> > So I get the impression that the phrase "the VLAN table is not applicable"
> > is not quite correct, but I might be wrong...
> 
> Alright, I think I've made some progress.
> In the current code, we only use two combinations to toggle user
> ports' VLAN awareness: one is PCR.PORT_VLAN set to port matrix mode
> with PVC.VLAN_ATTR set to transparent port, the other is PCR.PORT_VLAN
> set to security mode with PVC.VLAN_ATTR set to user port.
> 
> It turns out that only PVC.VLAN_ATTR contributes to VLAN awareness.
> Port matrix mode just skips the VLAN table lookup. The reference
> manual is somehow misleading when describing PORT_VLAN modes (See Page
> 17 of MT7531 Reference Manual, available at
> http://wiki.banana-pi.org/Banana_Pi_BPI-R64#Resources). It states that
> PORT_MEM (VLAN port member) is used for destination if the VLAN table
> lookup hits, but actually it uses **PORT_MEM & PORT_MATRIX** (bitwise
> AND of VLAN port member and port matrix) instead, which means we can
> have two or more separate VLAN-aware bridges with the same PVID and
> traffic won't leak between them.

Ah, but it's not completely misleading. It does say:

	2'b01: Fallback mode

	Enable 802.1Q function for all the received frames.
	Do not discard received frames due to ingress membership violation.
	**Frames whose VID is missed on the VLAN table will be filtered
	by the Port Matrix Member**.

(emphasis mine on the last paragraph)

> So I came up with a solution: Set PORT_VLAN to fallback mode when in
> VLAN-unaware mode, this way, even VLAN-unaware bridges will use
> independent VLAN filtering.

If you did indeed test that the Port Matrix is still used to enforce
separation between ports if the VLAN table _does_ match and we're in
fallback mode, then we should be okay.

> Then assign all standalone ports to a reserved VLAN.

You mean all standalone ports to the same VLAN ID, like 4095, or each
standalone port to a separate reserved VLAN ID? As long as address
learning is disabled on the standalone ports, I guess using a single
VLAN ID like 4095 for all of them is just fine, the Port Matrix will
take care of the rest.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
