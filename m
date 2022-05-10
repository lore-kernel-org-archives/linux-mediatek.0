Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F3EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 22:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZhYr039bk8eD+RqCPNPbi+enkWvul3Ba11qd4rytGs=; b=2E+Ech060Fe6Zp
	ZFLRHvYuTulp/ka/w8DKnXImBKiPUJZDF/LwM+5GEMUv4DEDgSxUWVfmJnV5WDu8i6aJC99UoR36b
	z31Uwq1VQ0zTw/OV6hlRYaBOEfSSphltma/CRhYC4VLXMYKYmqaT/IeyA3pkwEIF+YQrRDCIc/wNi
	GoXdnv9xS5PhNw1NpdQiTZfpvRHKiN/7jUN/5tnGJYT9NT8/tPehP6MYMHK9uwWiF6/2U+PRmShJg
	Y3lhlparN6BwGC75PjAP9tKDEC7UTwhG4PETSMbzr/cW1VjVHLaqgirIYvzFNAQ7T4SKM2mCS3rpO
	VXh9VcftB+ofdC7+TRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noY0M-004B3G-N6; Tue, 10 May 2022 22:06:54 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noY0A-004B0x-Sy; Tue, 10 May 2022 22:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=BhPDuCZhU013enU/ezL39tFkaksHmV+NLwg0WAYz1Ww=; b=KOt0bgXFpEGiFG29hcGikLWsBW
 kCtuR/Jf4HUtRukiWGZZ1fBe+6W/yhShGpA69RR/Y72BX/9p/jbPkkuYkMJpxrcEXQ3SA/KurEZnb
 vuhmwEz1Tmy5Qm5pElBsb3TqqpBXYHmILip3WOveBFZhHS7IAQSoX8W7oAiPasydoDkQ=;
Received: from p200300daa70ef200adfdb724d8b39c56.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:adfd:b724:d8b3:9c56] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1noXzv-0001pa-2S; Wed, 11 May 2022 00:06:27 +0200
Message-ID: <bc4bde22-c2d6-1ded-884a-69465b9d1dc7@nbd.name>
Date: Wed, 11 May 2022 00:06:25 +0200
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
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v2] net: dsa: tag_mtk: add padding for tx packets
In-Reply-To: <20220510165233.yahsznxxb5yq6rai@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_150643_154555_AAB4FDAE 
X-CRM114-Status: GOOD (  19.48  )
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


On 10.05.22 18:52, Vladimir Oltean wrote:
> On Tue, May 10, 2022 at 04:52:16PM +0200, Felix Fietkau wrote:
>> 
>> On 10.05.22 14:37, Vladimir Oltean wrote:
>> > On Tue, May 10, 2022 at 11:40:13AM +0200, Felix Fietkau wrote:
>> > > Padding for transmitted packets needs to account for the special tag.
>> > > With not enough padding, garbage bytes are inserted by the switch at the
>> > > end of small packets.
>> > 
>> > I don't think padding bytes are guaranteed to be zeroes. Aren't they
>> > discarded? What is the issue?
>> With the broken padding, ARP requests are silently discarded on the receiver
>> side in my test. Adding the padding explicitly fixes the issue.
>> 
>> - Felix
> 
> Ok, I'm not going to complain too much about the patch, but I'm still
> curious where are the so-called "broken" packets discarded.
> I think the receiving MAC should be passing up to software a buffer
> without the extra padding beyond the L2 payload length (at least that's
> the behavior I'm familiar with).

I don't know where exactly these packets are discarded.
After digging through the devices I used during the tests, I just found 
some leftover pcap files that show the differences in the received 
packets. Since the packets are bigger after my patch, I can't rule out 
that packet size instead of the padding may have made a difference here 
in getting the ARP requests accepted by the receiver.

I've extracted the ARP requests and you can find them here:
http://nbd.name/arp-broken.pcap
http://nbd.name/arp-working.pcap

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
