Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDA0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 22:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VueRfIBIjmKsUnLp30xzt4+IcQLopPhZHCaC0u9JpCQ=; b=ak1USi3xKcH4uG
	SOI2gHQaZ+ua+8ktWJ27mrc9ZDwsbOtVyGrPQT24QiN/VbMKA322t4KcXgKuZCMMpXvLJtT+/URKT
	+QF6InD/vaK+Lb2oZLk4F690n1klBZ6cuYyxeG8I86XkbJFZbwKU3VgzceexU9DJ4dmgJdjvu3n2a
	Hh+VQbUa4Dfnj9XKQJZtHOiTho6a6p4Z2pKA6CTA6LOVDtlQGTssEoKQe50HRbhJrz7wgc775j9qN
	by8Pc37T5BKmAmzYl3vFuJ8AL0O/XsneiLwuU0UY2jfEmTLCyjBWVPDkfrjEMUa74BRIfjhgjmMkG
	NO7Sb9qBnEXdvanbVANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noYEH-004CLF-Rp; Tue, 10 May 2022 22:21:17 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noYE7-004CJt-LQ; Tue, 10 May 2022 22:21:09 +0000
Received: by mail-ed1-x531.google.com with SMTP id k27so447553edk.4;
 Tue, 10 May 2022 15:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bvOJEKEeTYGez3WYVMGA06O7z2nPgT8wUayrfQSacqo=;
 b=Xu6VPNk9lS6SHNbPoG0KD70TMmfwpkx73eO6c+4JBRTPJYX8D4zo+zfH9+NY6Ed3UW
 feQ7pGUXMgliDUim8/ry6bDBQH13HgnwB5zLTmTDxn6MB2CLPVzIEvlNzDDnJKEYJFRn
 s9azdkkGBys/sbeNfnasr0Pl40P3dILNYM72nI3LykjZisuEU94UHdHBt6NPvgkvVpbF
 c3FKAe6b9DOInAxTizW8WTwmFd7/MsdB6YIVLD+J88IQ/5Qc4pvEtrnHyPEb87YIehBk
 v0cUoaucn0wLvrNh0xdm41LmFuuOIm13760kNkl6Hvd8gdBVmd2iyeIauT/lV8fzslLh
 djTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bvOJEKEeTYGez3WYVMGA06O7z2nPgT8wUayrfQSacqo=;
 b=l9NbZ50nIoMFOISoQD0FP9gvjMG+LHZVzapHdvG3+sWYJu/+nrN7BpdzR1Sllbq7Kw
 uiRPcZ4WQ/bfLoSXpiqV672CesLrrLYkL9SCAloR5Dad8Y8ylFCuof5s0//W0izp7Hcz
 93X/6gMZfcr/9xJu5t06VIyBCYH8XPA8uQ07mYpdhj3ZDl7ku95yAeHH5FA9lIOpZedY
 c7sxU6TRqss16fR82oom/9c6HxYFj8JcUae6j9WR6vhYGLMmW8oIbh/8fA5F3l8T6hu7
 i6vhpFQGzRupbLlaebYIiU1wo+lye6sAZbQLeUXYqBJCBoQAzXOiYxrjjHZ2bVDUL+5d
 VnZw==
X-Gm-Message-State: AOAM533paW5JRhqIacNqLmpse1r15mnJGstII6Bk6G0vfGRarDML6KjW
 JISi6DHMyT+C4OR3vCZfULU=
X-Google-Smtp-Source: ABdhPJw4b0VxaMRGyqDttCMe2xNkxjWyC41rv+9eFQoaX2UiZZnHkDcccfnwH7w2aY6jsjvKgmuk7w==
X-Received: by 2002:aa7:c31a:0:b0:425:df3c:de8e with SMTP id
 l26-20020aa7c31a000000b00425df3cde8emr25141265edq.83.1652221263892; 
 Tue, 10 May 2022 15:21:03 -0700 (PDT)
Received: from skbuf ([188.25.160.86]) by smtp.gmail.com with ESMTPSA id
 r9-20020aa7c149000000b0042617ba63a8sm174281edp.50.2022.05.10.15.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 15:21:03 -0700 (PDT)
Date: Wed, 11 May 2022 01:21:01 +0300
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
Message-ID: <20220510222101.od3n7gk3cofwhbks@skbuf>
References: <20220510094014.68440-1-nbd@nbd.name>
 <20220510123724.i2xqepc56z4eouh2@skbuf>
 <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
 <20220510165233.yahsznxxb5yq6rai@skbuf>
 <bc4bde22-c2d6-1ded-884a-69465b9d1dc7@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc4bde22-c2d6-1ded-884a-69465b9d1dc7@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_152107_756652_DCCD39FC 
X-CRM114-Status: GOOD (  26.71  )
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

On Wed, May 11, 2022 at 12:06:25AM +0200, Felix Fietkau wrote:
>
> On 10.05.22 18:52, Vladimir Oltean wrote:
> > On Tue, May 10, 2022 at 04:52:16PM +0200, Felix Fietkau wrote:
> > >
> > > On 10.05.22 14:37, Vladimir Oltean wrote:
> > > > On Tue, May 10, 2022 at 11:40:13AM +0200, Felix Fietkau wrote:
> > > > > Padding for transmitted packets needs to account for the special tag.
> > > > > With not enough padding, garbage bytes are inserted by the switch at the
> > > > > end of small packets.
> > > > > I don't think padding bytes are guaranteed to be zeroes. Aren't
> > > they
> > > > discarded? What is the issue?
> > > With the broken padding, ARP requests are silently discarded on the receiver
> > > side in my test. Adding the padding explicitly fixes the issue.
> > >
> > > - Felix
> >
> > Ok, I'm not going to complain too much about the patch, but I'm still
> > curious where are the so-called "broken" packets discarded.
> > I think the receiving MAC should be passing up to software a buffer
> > without the extra padding beyond the L2 payload length (at least that's
> > the behavior I'm familiar with).
>
> I don't know where exactly these packets are discarded.
> After digging through the devices I used during the tests, I just found some
> leftover pcap files that show the differences in the received packets. Since
> the packets are bigger after my patch, I can't rule out that packet size
> instead of the padding may have made a difference here in getting the ARP
> requests accepted by the receiver.
>
> I've extracted the ARP requests and you can find them here:
> http://nbd.name/arp-broken.pcap

arp-broken.pcap was collected at the receiver MAC, right? So the packets
actually exited the switch?

> http://nbd.name/arp-working.pcap
>
> - Felix

It sounds as if this is masking a problem on the receiver end, because
not only does my enetc port receive the packet, it also replies to the
ARP request.

pc # sudo tcpreplay -i eth1 arp-broken.pcap
root@debian:~# ip addr add 192.168.42.1/24 dev eno0
root@debian:~# tcpdump -i eno0 -e -n --no-promiscuous-mode arp
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on eno0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
22:18:58.846753 f4:d4:88:5e:6f:d2 > ff:ff:ff:ff:ff:ff, ethertype ARP (0x0806), length 60: Request who-has 192.168.42.1 tell 192.168.42.173, length 46
22:18:58.846806 00:04:9f:05:f4:ab > f4:d4:88:5e:6f:d2, ethertype ARP (0x0806), length 42: Reply 192.168.42.1 is-at 00:04:9f:05:f4:ab, length 28
^C
2 packets captured
2 packets received by filter
0 packets dropped by kernel

What MAC/driver has trouble with these packets? Is there anything wrong
in ethtool stats? Do they even reach software? You can also use
"dropwatch -l kas" for some hints if they do.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
