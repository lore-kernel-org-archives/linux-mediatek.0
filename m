Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB33C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SP5PxlFHeHI8xF23gCChfbbg2QgpYBjF1gvYuvzkJcE=; b=jbgqOBTP7k5PAFOvh22IcWFJm6
	XQMpvHLSCTytiieNzAHIjkGdJVaEymbpmejmGud8hXIUmUzighZDgiTriiSax9Tyf+u/uG1l8wEOe
	Ezr2bvL4KqZ2gEfmsbivjQW/aDg/5sPfVMWFP/IRqr4fndKxh8xBK452A7mdf6lQ69XWUCJ93//jI
	ifPB1nxcWRR7lmIbKpD/i1Zij34nk8WRKuLj5wCUXomfdCkqSeJVldSTB14OWPf8AqTQ+H7Hpr7f0
	kT2ISLUnqwccfw3S3g9feIaMrw3f+r6r9b+Nkw/wgK/DBsySMUmnDsGO9PHN8O+3zjDIuGl+euJf+
	4tLeNL1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odwBC-004541-Tz; Thu, 29 Sep 2022 16:14:30 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odwAv-0044ti-4x; Thu, 29 Sep 2022 16:14:14 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 462101884BA5;
	Thu, 29 Sep 2022 16:14:11 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 3F4F32500370;
	Thu, 29 Sep 2022 16:14:11 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 34F409EC0002; Thu, 29 Sep 2022 16:14:11 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 29 Sep 2022 18:14:11 +0200
From: netdev@kapio-technology.com
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: davem@davemloft.net, kuba@kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Kurt Kanzenbach <kurt@linutronix.de>, Eric Dumazet
 <edumazet@google.com>, linux-kselftest@vger.kernel.org, Joachim Wiberg
 <troglobit@gmail.com>, Shuah Khan <shuah@kernel.org>, Ivan Vecera
 <ivecera@redhat.com>, Florian Fainelli <f.fainelli@gmail.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Ido Schimmel <idosch@nvidia.com>,
 bridge@lists.linux-foundation.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Roopa Prabhu <roopa@nvidia.com>, Paolo
 Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>, Landen Chao
 <Landen.Chao@mediatek.com>, Jiri Pirko <jiri@resnulli.us>, Amit Cohen
 <amcohen@nvidia.com>, Christian Marangi <ansuelsmth@gmail.com>, Hauke
 Mehrtens <hauke@hauke-m.de>, Hans Schultz <schultz.hans@gmail.com>, Sean
 Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Claudiu
 Manoil <claudiu.manoil@nxp.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Yuwei Wang
 <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Vladimir Oltean <olteanv@gmail.com>, Florent
 Fourcot <florent.fourcot@wifirst.fr>
Subject: Re: [Bridge] [PATCH iproute2-next 2/2] bridge: fdb: enable FDB
 blackhole feature
In-Reply-To: <20220929084312.2a216698@hermes.local>
References: <20220929152137.167626-1-netdev@kapio-technology.com>
 <20220929152137.167626-2-netdev@kapio-technology.com>
 <20220929084312.2a216698@hermes.local>
User-Agent: Gigahost Webmail
Message-ID: <6de8a39832ebb15fc5e8c2f19e469514@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_091413_383693_FF7B7283 
X-CRM114-Status: GOOD (  12.68  )
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

On 2022-09-29 17:43, Stephen Hemminger wrote:
> On Thu, 29 Sep 2022 17:21:37 +0200
> Hans Schultz <netdev@kapio-technology.com> wrote:
> 
>> 
>> @@ -493,6 +496,8 @@ static int fdb_modify(int cmd, int flags, int 
>> argc, char **argv)
>>  			req.ndm.ndm_flags |= NTF_EXT_LEARNED;
>>  		} else if (matches(*argv, "sticky") == 0) {
>>  			req.ndm.ndm_flags |= NTF_STICKY;
>> +		} else if (matches(*argv, "blackhole") == 0) {
>> +			ext_flags |= NTF_EXT_BLACKHOLE;
>>  		} else {
>>  			if (strcmp(*argv, "to") == 0)
>>  				NEXT_ARG();
> 
> The parsing of flags is weird here, most of the flags are compared with 
> strcmp()
> but some use matches()..  I should have used strcmp() all the time; but 
> at the
> time did not realize what kind of confusion matches() can cause.

Maybe just change all of them then, and then how about using strncmp() 
and maybe also strnlen() instead?

