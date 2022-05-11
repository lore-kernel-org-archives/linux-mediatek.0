Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DB8C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNJgT3Y/XlWC8QBej2/rJrRSvOa8BxRKQbRKJFbnemE=; b=3V2fLwszpWsk+f
	BT05PwmWxwgmOyVEg/IOIJ5lEB9s3/80+lAczXAgzy8Wfdm2qCHaLIimiid/QoZ2ZWL1Efkketn4U
	FaOCfk0I5eiIT9Ol/uP9SRuk8Os8mJb+Ed3Oa7d03bblxdMnmkAMTfGH9LQftVX5I9IysBdqfVSmp
	lCPtEWvU6WHCJxgm/8FlOkKSG6cwu3v83jWTPlVZ8wWazi3EFs4l3cH/m/nUHuFtu9JoyQ/3pNHlZ
	UFNkX6D9SQ56J78SpHyc4pmzekNeE0h3CpgRoINuD3YLhqg749kRzXbS87XchibGzIXWEfJj8D5Ur
	/r7uHj+9bpKXPMjN4/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nolOe-006l38-4Y; Wed, 11 May 2022 12:24:52 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nolOQ-006kv7-1W; Wed, 11 May 2022 12:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=38uuIh30OKVDrR6I5jA5xPcpEkEz/56gljV2pGGRdg8=; b=tz1chwRZMqfXH7/+P85zCehy38
 6my5/nWl3mAmoc9CKiBTu3TH6XEAL915uGdPGTecmhyMzAMeUw6SJSoamOk1cA4tmg4VaaWBZiPOk
 EFYidyYUDBt92YmIkIt8Xk76l1Ps/+PjErcKEfFZFf0jB+b/blyaPi/8nPOG/KBVb4FI=;
Received: from p200300daa70ef200e12105daa054647e.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:e121:5da:a054:647e] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nolO8-00051v-Jb; Wed, 11 May 2022 14:24:20 +0200
Message-ID: <f1aa8300-bfc9-0414-4c44-3caf384e1d06@nbd.name>
Date: Wed, 11 May 2022 14:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220510094014.68440-1-nbd@nbd.name>
 <20220510123724.i2xqepc56z4eouh2@skbuf>
 <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
 <20220510165233.yahsznxxb5yq6rai@skbuf>
 <bc4bde22-c2d6-1ded-884a-69465b9d1dc7@nbd.name>
 <20220510222101.od3n7gk3cofwhbks@skbuf>
 <376b13ac-d90b-24e0-37ed-a96d8e5f80da@nbd.name>
 <20220511093245.3266lqdze2b4odh5@skbuf>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v2] net: dsa: tag_mtk: add padding for tx packets
In-Reply-To: <20220511093245.3266lqdze2b4odh5@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_052438_406687_787F68E4 
X-CRM114-Status: GOOD (  35.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 11.05.22 11:32, Vladimir Oltean wrote:
> On Wed, May 11, 2022 at 10:50:17AM +0200, Felix Fietkau wrote:
>> Hi Vladimir,
>> 
>> On 11.05.22 00:21, Vladimir Oltean wrote:
>> > It sounds as if this is masking a problem on the receiver end, because
>> > not only does my enetc port receive the packet, it also replies to the
>> > ARP request.
>> > 
>> > pc # sudo tcpreplay -i eth1 arp-broken.pcap
>> > root@debian:~# ip addr add 192.168.42.1/24 dev eno0
>> > root@debian:~# tcpdump -i eno0 -e -n --no-promiscuous-mode arp
>> > tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
>> > listening on eno0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
>> > 22:18:58.846753 f4:d4:88:5e:6f:d2 > ff:ff:ff:ff:ff:ff, ethertype ARP (0x0806), length 60: Request who-has 192.168.42.1 tell 192.168.42.173, length 46
>> > 22:18:58.846806 00:04:9f:05:f4:ab > f4:d4:88:5e:6f:d2, ethertype ARP (0x0806), length 42: Reply 192.168.42.1 is-at 00:04:9f:05:f4:ab, length 28
>> > ^C
>> > 2 packets captured
>> > 2 packets received by filter
>> > 0 packets dropped by kernel
>> > 
>> > What MAC/driver has trouble with these packets? Is there anything wrong
>> > in ethtool stats? Do they even reach software? You can also use
>> > "dropwatch -l kas" for some hints if they do.
>> 
>> For some reason I can't reproduce the issue of ARPs not getting replies
>> anymore.
>> The garbage data is still present in the ARP packets without my patch
>> though. So regardless of whether ARP packets are processed correctly or if
>> they just trip up on some receivers under specific conditions, I believe my
>> patch is valid and should be applied.
> 
> I don't have a very strong opinion regarding whether to apply the patch or not.
> I think we've removed it from bug fix territory now, until proven otherwise.
I strongly disagree. Without my fix we're relying on undefined behavior 
of the hardware, since the switch requires padding that accounts for the 
special tag.

> I do care about the justification (commit message, comments) being
> correct though. If you cannot reproduce now, someone one year from now
> surely cannot reproduce it either, and won't know why the code is there.
I think there is some misunderstanding here. I absolutely can reproduce 
the corrupted padding reliably, and it matches what I put into commit 
message and comments.

The issue that I can't reproduce reliably at the moment (ARP reception 
failure) is something that I only pointed out in a reply to this thread.
This is what prompted me to look into the padding issue in the first 
place, and it also matches reports about connectivity issues that I got 
from other people.

> FYI, the reason why you call __skb_put_padto() is not the reason why
> others call __skb_put_padto().
It matches the call in tag_brcm.c (because I copied it from there), it's 
just that the symptoms that I'm fixing are different (undefined behavior 
instead of hard packet drop in the switch logic).

>> Who knows, maybe the garbage padding even leaks some data from previous
>> packets, or some other information from within the switch.
> 
> I mean, the padding has to come from somewhere, no? Although I'd
> probably imagine non-scrubbed buffer cells rather than data structures...
> 
> Let's see what others have to say. I've been wanting to make the policy
> of whether to call __skb_put_padto() standardized for all tagging protocol
> drivers (similar to what is done in dsa_realloc_skb() and below it).
> We pad for tail taggers, maybe we can always pad and this removes a
> conditional, and simplifies taggers. Side note, I already dislike that
> the comment in tag_brcm.c is out of sync with the code. It says that
> padding up to ETH_ZLEN is necessary, but proceeds to pad up until
> ETH_ZLEN + tag len, only to add the tag len once more below via skb_push().
> It would be nice if we could use the simple eth_skb_pad().
> 
> But there will be a small performance degradation for small packets due
> to the memset in __skb_pad(), which I'm not sure is worth the change.
I guess we have different views on this. In my opinion, correctness 
matters more in this case than the tiny performance degradation.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
