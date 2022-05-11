Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FBBC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ea/asF/TPXfWG/hOhh6voiTplwVh5RgW/PC2oviKmM=; b=W3AbwBYA7iO2vN
	fFXGzy0Seu0lRWqLsC/RNL8dFJfviqTn6QaJ/Z+cXbXNvjKru7W4SxpVpRwLzCBRp0SOFFZQyJ7wP
	y7fB2osQ2XgG5nVTVsqGcV+EvEBJKdQuz+HLg3FWDgEgkgNGdR50sdCBcbwl2RUc2MdkBXVUQiNeR
	e08MivBOW67Y5yruUuTXrLiQ5aI/wPb/JhQee5xSMo86cb1zrvMbnYqBxXYki1Sz69bC5x+BXclFb
	s8H2Uuko1c9Id4CHsMR+odM63LpXX8B9YJX6yxhJbokrUqjJtvf9pn8PhtM3Tel1zysBx6mYZjzFy
	DZML3ufMn7nY+9wF8uSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nomIs-006xPW-5a; Wed, 11 May 2022 13:22:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nomId-006xJE-Ax; Wed, 11 May 2022 13:22:45 +0000
Received: by mail-ed1-x533.google.com with SMTP id c12so2523188edv.10;
 Wed, 11 May 2022 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0ydeJwNXVLjgujURZy3RndwdTy+IiCjKQE1tldyTkw4=;
 b=RYfdG2KCUyWdShwKUCumnVsqCjvZ2wtqchHd5sqWze5ZwfgRvtqb7SOZvWktCmJGQi
 c/BeFukvj8h2zRqrRRaZReL1c29FAeqZmJphP8/dLSqwCN3WrkdC2pDKNRH+nO6IxIB6
 eQUVbEY4oTCWolKvI0wn/+UwPewxsVsV3D4xIbHxB8n/WGy6dkUHvN0to51+AemXbu7A
 hGGx1N7UauA5dYMQPIRUQDkTpnVuugLjk9cmPy8pUTn28cwetjGTblRyrznRP6+0DPIN
 Hpz6Z3doGbfqF+gmrGr8iHL8zKAcEe0Miaduap4BWgOgFC6+qDPttw6DUSEdKbgGN+kM
 JapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0ydeJwNXVLjgujURZy3RndwdTy+IiCjKQE1tldyTkw4=;
 b=N6QKBPYDfEU/yrENILwDJaNb20gx5hfIMK1j7mv4ZaFc7O0Vg+tYEOG1qTaZRCvIN1
 A40l5XHqGU1VmRjNyCju8vsf5Hhlxlz1au5mbS6XKa/gi+M8MrpPKPj/PHVpO6OJufuM
 tHrPnkJZnTLSepjWDOzXj/Bp+1G7XpnkL24nz9h2VgI0qeMTO5WOIqVZwjyQb84ruSrn
 X/H6actH/txu/Dzr6OqmFNcdLmiFkAs838ybCaMNVgr4UCJV1TDEX5A4Cby/sHKz9mGn
 AAY3N3CITcEDB3tTHJl8iP+s/DCwGctXvEEOYmac1GBvMwUi/uUCYPoIbsWXVk83PD/d
 ls0g==
X-Gm-Message-State: AOAM531/dkkt/0IzGI5Y5XQWyztxzTPqUXfVuD1HolrhBy79fCCcuju0
 09rhwD8mQhuxYJ88nIuY5sc=
X-Google-Smtp-Source: ABdhPJzQpGo3codJeBIAabNa/TpAvQ1K5JryDu8j3A50167Y9FFDwcfd7/ZH05WSSTvZAV/yj8Qbug==
X-Received: by 2002:a05:6402:d51:b0:425:d5e1:e9f0 with SMTP id
 ec17-20020a0564020d5100b00425d5e1e9f0mr28843980edb.125.1652275358901; 
 Wed, 11 May 2022 06:22:38 -0700 (PDT)
Received: from skbuf ([188.25.160.86]) by smtp.gmail.com with ESMTPSA id
 h1-20020aa7c941000000b0042617ba638asm1225475edt.20.2022.05.11.06.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 06:22:38 -0700 (PDT)
Date: Wed, 11 May 2022 16:22:36 +0300
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
Message-ID: <20220511132236.kkhrgzx6daeeqz6f@skbuf>
References: <20220510094014.68440-1-nbd@nbd.name>
 <20220510123724.i2xqepc56z4eouh2@skbuf>
 <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
 <20220510165233.yahsznxxb5yq6rai@skbuf>
 <bc4bde22-c2d6-1ded-884a-69465b9d1dc7@nbd.name>
 <20220510222101.od3n7gk3cofwhbks@skbuf>
 <376b13ac-d90b-24e0-37ed-a96d8e5f80da@nbd.name>
 <20220511093245.3266lqdze2b4odh5@skbuf>
 <f1aa8300-bfc9-0414-4c44-3caf384e1d06@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1aa8300-bfc9-0414-4c44-3caf384e1d06@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_062243_464234_227F0044 
X-CRM114-Status: GOOD (  49.11  )
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

On Wed, May 11, 2022 at 02:24:19PM +0200, Felix Fietkau wrote:
> 
> On 11.05.22 11:32, Vladimir Oltean wrote:
> > On Wed, May 11, 2022 at 10:50:17AM +0200, Felix Fietkau wrote:
> > > Hi Vladimir,
> > > 
> > > On 11.05.22 00:21, Vladimir Oltean wrote:
> > > > It sounds as if this is masking a problem on the receiver end, because
> > > > not only does my enetc port receive the packet, it also replies to the
> > > > ARP request.
> > > > > pc # sudo tcpreplay -i eth1 arp-broken.pcap
> > > > root@debian:~# ip addr add 192.168.42.1/24 dev eno0
> > > > root@debian:~# tcpdump -i eno0 -e -n --no-promiscuous-mode arp
> > > > tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> > > > listening on eno0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
> > > > 22:18:58.846753 f4:d4:88:5e:6f:d2 > ff:ff:ff:ff:ff:ff, ethertype ARP (0x0806), length 60: Request who-has 192.168.42.1 tell 192.168.42.173, length 46
> > > > 22:18:58.846806 00:04:9f:05:f4:ab > f4:d4:88:5e:6f:d2, ethertype ARP (0x0806), length 42: Reply 192.168.42.1 is-at 00:04:9f:05:f4:ab, length 28
> > > > ^C
> > > > 2 packets captured
> > > > 2 packets received by filter
> > > > 0 packets dropped by kernel
> > > > > What MAC/driver has trouble with these packets? Is there
> > > anything wrong
> > > > in ethtool stats? Do they even reach software? You can also use
> > > > "dropwatch -l kas" for some hints if they do.
> > > 
> > > For some reason I can't reproduce the issue of ARPs not getting replies
> > > anymore.
> > > The garbage data is still present in the ARP packets without my patch
> > > though. So regardless of whether ARP packets are processed correctly or if
> > > they just trip up on some receivers under specific conditions, I believe my
> > > patch is valid and should be applied.
> > 
> > I don't have a very strong opinion regarding whether to apply the patch or not.
> > I think we've removed it from bug fix territory now, until proven otherwise.
> 
> I strongly disagree. Without my fix we're relying on undefined behavior of
> the hardware, since the switch requires padding that accounts for the
> special tag.
> 
> > I do care about the justification (commit message, comments) being
> > correct though. If you cannot reproduce now, someone one year from now
> > surely cannot reproduce it either, and won't know why the code is there.
> 
> I think there is some misunderstanding here. I absolutely can reproduce the
> corrupted padding reliably, and it matches what I put into commit message
> and comments.
> 
> The issue that I can't reproduce reliably at the moment (ARP reception
> failure) is something that I only pointed out in a reply to this thread.
> This is what prompted me to look into the padding issue in the first place,
> and it also matches reports about connectivity issues that I got from other
> people.
> 
> > FYI, the reason why you call __skb_put_padto() is not the reason why
> > others call __skb_put_padto().
> 
> It matches the call in tag_brcm.c (because I copied it from there), it's
> just that the symptoms that I'm fixing are different (undefined behavior
> instead of hard packet drop in the switch logic).
> 
> > > Who knows, maybe the garbage padding even leaks some data from previous
> > > packets, or some other information from within the switch.
> > 
> > I mean, the padding has to come from somewhere, no? Although I'd
> > probably imagine non-scrubbed buffer cells rather than data structures...
> > 
> > Let's see what others have to say. I've been wanting to make the policy
> > of whether to call __skb_put_padto() standardized for all tagging protocol
> > drivers (similar to what is done in dsa_realloc_skb() and below it).
> > We pad for tail taggers, maybe we can always pad and this removes a
> > conditional, and simplifies taggers. Side note, I already dislike that
> > the comment in tag_brcm.c is out of sync with the code. It says that
> > padding up to ETH_ZLEN is necessary, but proceeds to pad up until
> > ETH_ZLEN + tag len, only to add the tag len once more below via skb_push().
> > It would be nice if we could use the simple eth_skb_pad().
> > 
> > But there will be a small performance degradation for small packets due
> > to the memset in __skb_pad(), which I'm not sure is worth the change.
> 
> I guess we have different views on this. In my opinion, correctness matters
> more in this case than the tiny performance degradation.

It seems that we are in disagreement about what it is that I am disputing.
I am not disputing that the switch inserts non-zero padding octets, I am
disputing the claim that this somehow violates any standard.

IEEE 802.3 clause 4.2.8 Frame transmission details this beyond any doubt.
It says:

ComputePad appends an array of arbitrary bits to the MAC client data to
pad the frame to the minimum frame size:

function ComputePad(var dataParam: DataValue): DataValue;
begin
    ComputePad := {Append an array of size padSize of arbitrary bits to the MAC client dataField}
end; {ComputePad}

Clause 4.2.9 Frame reception then proceeds to say (too long to copy it,
sorry) that the RemovePad function truncates the dataParam when possible
(which has to do with whether the FCS is passed up to software or not)
to the value represented by the lengthOrTypeParam (in octets), therefore
*not* looking at the contents of the padding (other than to validate the
FCS).

So, what correctness are we talking about?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
