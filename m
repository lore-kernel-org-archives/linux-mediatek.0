Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DA1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOH+SAvEio7O7UphzrU015mgZL4S5GjvQ83SqFYdkNo=; b=g/aQztRMiip3DB
	22Mb9RFGfold0Wxmc/XeFqsCEvZDCp6zg1Sc/zuEEDJ7GB/+n3nBMQqvNmmW54db5jnTNJyDi/iVn
	bcHIJccIGr/dkK9nXQ4kwF2SevMh2jdLoPQbwee3mvQ33DSCVKL3ByvVnC6M0cDKyR3y2RaimrUMK
	V9Jvav+jH4jjRvjANaXpSNMEBPEdm3BHhmWtlR+XMQ1aQMxBNpaaj6ltwVUvXxAoNIEGWLdOid0yk
	UAbizH8DYTKgSpKRL2t0dkO7hr4KQp3gRwsMn/WFlkinSm5dEs9/OOhMG1tyMuuNUTGTMeyImAoPP
	n4bOsuuHz6ZAEQHpbbsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noiiQ-0069Jm-SL; Wed, 11 May 2022 09:33:06 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noii9-0069DY-N6; Wed, 11 May 2022 09:32:51 +0000
Received: by mail-ej1-x62d.google.com with SMTP id g6so2864444ejw.1;
 Wed, 11 May 2022 02:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2R9/wURm7kp9KYQIXozUkX8wxPrKLslH4VaNDn0oWs0=;
 b=NyCv4qaeunkpTmK532/dsGATD0bujUE4v5Vxrzx1AWaKsSj2yPcr4r8WgGA6StMOTl
 7/wBM5yd9WZzBTmo/Rm9HrzZMbJJ43aLaJg6xrknx7WurkcBnxWjFZ+kNiHzTBv4F4U5
 lz/8EZKUEZgigkbGKe5jvQOPHTiGFRXwCu3PybIEzIkYHeQdeCm3B7K02CxUH8o2AyeV
 3kdVOYAVF230sZOEIIaCbUyj7QqEnvs3yaWaXLxa8oNPgp7mWhZyOOorN+nlvMjYLLeC
 VcWC5hOQQrQNV7mVssCd5Bv1uGBEKpOD1GjyZHV/Ach/Bn52Vc4dW2IFlukxSLSoItf9
 YJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2R9/wURm7kp9KYQIXozUkX8wxPrKLslH4VaNDn0oWs0=;
 b=eAHykp3JldArNxNB5AzTa1WIIT6XC1Ca76gVXy3agPnbTBheyVgj5aHKFTnxVia7uf
 svnRLRrEL912AT2BS8QT+Y4TelGsTPso/vKzypOvfKm4X6Ocoaupj4d5meZ2Te6fDLWm
 gumm65WuV/wUKbqztRoMB3du22z7WU6lbaso+Y7iY3RUOVPoFhQ8Eo4UmnpIq94kTYe9
 RxrYWnk/zl2GDDohHNWdVuWN3Eu8w8QquldhEafFrB0KUK6/Jtz5E2Pe3shczV53tbOa
 N7dUI4AT+0qvu4pl7K+iQ1Ubg6t1dyRuxKCXq51pjkYxtP2NEVKzjDuS7o3A8ajoE0HJ
 BDjA==
X-Gm-Message-State: AOAM532dgP5cZCBLwVKtACaPOx0/WgETyB/6VsThSdUDv7BQCTwU1xwA
 AJsQIHdTwL8HsNpuHjZJEO4=
X-Google-Smtp-Source: ABdhPJy72CHL5PbNvu8py5RH4+WygdZt84TQ+hEVKauUfv/IexceOSRwzVyV10jkyrFutSL3AiPtlA==
X-Received: by 2002:a17:907:338b:b0:6f4:6e1:ed66 with SMTP id
 zj11-20020a170907338b00b006f406e1ed66mr23286843ejb.341.1652261567507; 
 Wed, 11 May 2022 02:32:47 -0700 (PDT)
Received: from skbuf ([188.25.160.86]) by smtp.gmail.com with ESMTPSA id
 m12-20020a17090607cc00b006f3ef214df2sm765426ejc.88.2022.05.11.02.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 02:32:46 -0700 (PDT)
Date: Wed, 11 May 2022 12:32:45 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: dsa: tag_mtk: add padding for tx packets
Message-ID: <20220511093245.3266lqdze2b4odh5@skbuf>
References: <20220510094014.68440-1-nbd@nbd.name>
 <20220510123724.i2xqepc56z4eouh2@skbuf>
 <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
 <20220510165233.yahsznxxb5yq6rai@skbuf>
 <bc4bde22-c2d6-1ded-884a-69465b9d1dc7@nbd.name>
 <20220510222101.od3n7gk3cofwhbks@skbuf>
 <376b13ac-d90b-24e0-37ed-a96d8e5f80da@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <376b13ac-d90b-24e0-37ed-a96d8e5f80da@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_023249_825929_31B798EB 
X-CRM114-Status: GOOD (  26.85  )
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

On Wed, May 11, 2022 at 10:50:17AM +0200, Felix Fietkau wrote:
> Hi Vladimir,
> 
> On 11.05.22 00:21, Vladimir Oltean wrote:
> > It sounds as if this is masking a problem on the receiver end, because
> > not only does my enetc port receive the packet, it also replies to the
> > ARP request.
> > 
> > pc # sudo tcpreplay -i eth1 arp-broken.pcap
> > root@debian:~# ip addr add 192.168.42.1/24 dev eno0
> > root@debian:~# tcpdump -i eno0 -e -n --no-promiscuous-mode arp
> > tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> > listening on eno0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
> > 22:18:58.846753 f4:d4:88:5e:6f:d2 > ff:ff:ff:ff:ff:ff, ethertype ARP (0x0806), length 60: Request who-has 192.168.42.1 tell 192.168.42.173, length 46
> > 22:18:58.846806 00:04:9f:05:f4:ab > f4:d4:88:5e:6f:d2, ethertype ARP (0x0806), length 42: Reply 192.168.42.1 is-at 00:04:9f:05:f4:ab, length 28
> > ^C
> > 2 packets captured
> > 2 packets received by filter
> > 0 packets dropped by kernel
> > 
> > What MAC/driver has trouble with these packets? Is there anything wrong
> > in ethtool stats? Do they even reach software? You can also use
> > "dropwatch -l kas" for some hints if they do.
> 
> For some reason I can't reproduce the issue of ARPs not getting replies
> anymore.
> The garbage data is still present in the ARP packets without my patch
> though. So regardless of whether ARP packets are processed correctly or if
> they just trip up on some receivers under specific conditions, I believe my
> patch is valid and should be applied.

I don't have a very strong opinion regarding whether to apply the patch or not.
I think we've removed it from bug fix territory now, until proven otherwise.
I do care about the justification (commit message, comments) being
correct though. If you cannot reproduce now, someone one year from now
surely cannot reproduce it either, and won't know why the code is there.
FYI, the reason why you call __skb_put_padto() is not the reason why
others call __skb_put_padto().

> Who knows, maybe the garbage padding even leaks some data from previous
> packets, or some other information from within the switch.

I mean, the padding has to come from somewhere, no? Although I'd
probably imagine non-scrubbed buffer cells rather than data structures...

Let's see what others have to say. I've been wanting to make the policy
of whether to call __skb_put_padto() standardized for all tagging protocol
drivers (similar to what is done in dsa_realloc_skb() and below it).
We pad for tail taggers, maybe we can always pad and this removes a
conditional, and simplifies taggers. Side note, I already dislike that
the comment in tag_brcm.c is out of sync with the code. It says that
padding up to ETH_ZLEN is necessary, but proceeds to pad up until
ETH_ZLEN + tag len, only to add the tag len once more below via skb_push().
It would be nice if we could use the simple eth_skb_pad().

But there will be a small performance degradation for small packets due
to the memset in __skb_pad(), which I'm not sure is worth the change.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
