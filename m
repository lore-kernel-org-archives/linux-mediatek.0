Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBD4ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtD1jpvKvEzQUsJ83UAhC4RcKbAwU45pd0cdWSGysbE=; b=k86bOpZvCmIqY1lTDh7Y5QpePh
	KJlVEmIC1DLQ7wwt9DC6/ASPaQIJEA+JdUeJqf9E/KN1DZUT7fRw46B48gN5yYieFEw4EaVXnpeas
	MdQATmrOJF/U1ab6JwT7rM9eaYmPiCs3bk8n8HuSJUz8i8eEE1bP32wbAtprJ9K48dvN5ZxN9sG0/
	7zgKzCKVoieG7jZxTA9qoauXEFOotPcwLgP9Av9ahuIjZAFXb+Na0awsGCFG5tQ5wpJy5xz07hzT7
	fERJySaeYS7zwb7pP+41HrT3LPqmAw0p+tRq/oC6GIhhhmMaeLP4f0H00zLQqsuHdqFnx8Vthgyyu
	ZkhCuxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShpT-00Bq0Q-Cw; Mon, 29 Aug 2022 16:41:39 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShb1-00BjiM-Gg; Mon, 29 Aug 2022 16:26:45 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id C6634188488E;
	Mon, 29 Aug 2022 16:26:41 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id BD87425032B7;
	Mon, 29 Aug 2022 16:26:41 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id B1D6C9EC0002; Mon, 29 Aug 2022 16:26:41 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Mon, 29 Aug 2022 18:26:41 +0200
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@nvidia.com>
Cc: Nikolay Aleksandrov <razor@blackwall.org>, davem@davemloft.net,
 kuba@kernel.org, netdev@vger.kernel.org, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt
 Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung
 Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Shuah Khan
 <shuah@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Yuwei Wang <wangyuweihx@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bridge@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 net-next 1/6] net: bridge: add locked entry fdb flag to
 extend locked port feature
In-Reply-To: <Ywzlfzns/vDDiKB1@shredder>
References: <20220826114538.705433-1-netdev@kapio-technology.com>
 <20220826114538.705433-2-netdev@kapio-technology.com>
 <e9eb5b72-073a-f182-13b7-37fc53611d5f@blackwall.org>
 <972663825881d135d19f9e391b2b7587@kapio-technology.com>
 <Ywzlfzns/vDDiKB1@shredder>
User-Agent: Gigahost Webmail
Message-ID: <1bfb557cbae4a640b7e042d202c677cb@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_092643_758000_BBA06EF1 
X-CRM114-Status: GOOD (  16.30  )
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

On 2022-08-29 18:12, Ido Schimmel wrote:
> On Mon, Aug 29, 2022 at 04:02:46PM +0200, netdev@kapio-technology.com 
> wrote:
>> On 2022-08-27 13:30, Nikolay Aleksandrov wrote:
>> > On 26/08/2022 14:45, Hans Schultz wrote:
>> >
>> > Hi,
>> > Please add the blackhole flag in a separate patch.
>> > A few more comments and questions below..
>> >
>> 
>> Hi,
>> if userspace is to set this flag I think I need to change stuff in
>> rtnetlink.c, as I will need to extent struct ndmsg with a new u32 
>> entry as
>> the old u8 flags is full.
> 
> You cannot extend 'struct ndmsg'. That's why 'NDA_FLAGS_EXT' was
> introduced. See:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2c611ad97a82b51221bb0920cc6cac0b1d4c0e52
> 
> 'NTF_EXT_BLACKHOLE' belongs in 'NDA_FLAGS_EXT' like you have it now, 
> but
> the kernel should not reject it in br_fdb_add().
> 
>> Maybe this is straight forward, but I am not so sure as I don't know 
>> that
>> code too well. Maybe someone can give me a hint...?

Thanks! I see that I was in trouble there... :D

