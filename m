Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5E0C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 19:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iikzsOYsSzeSfa2OzDyyXjhmgnZLiD/9U9vu5YIGiqo=; b=UeFBpz/DiIafr81Uihs5c+N5Rl
	i41IUCmFQLMJpD4zDjkbpdr59yyfsVu7hsaRHDY8zzrDfFN0RPVJ41cdPDOEkeVNJZeNSxmhgEKEa
	CL5qvUQU1AfkByXJURXAbOFXdaeJpK4XDiJ/nPTGXXDTK4ss/0rFA1mUVqZSQhbFpZlxRrxPkpKJZ
	hx/1dJX3xu3wPFaZlj96a987vj5yBuCK4yBk/87WtL9HMpiDg4KbcM152HSJxXzyNTfoeN/SlMuoh
	QjVMaZyIenL9XAYdbWPyZbKx+KlWAkcJJ4dQbiYgu2/ny/1T1t7mdUgLw8/ftZXmZUPkUEA/er08z
	5x1EoIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olbJ6-001P51-BV; Thu, 20 Oct 2022 19:34:20 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olbIt-001OzE-BB; Thu, 20 Oct 2022 19:34:08 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 495FE18838CD;
	Thu, 20 Oct 2022 19:34:05 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 3A4F125001FA;
	Thu, 20 Oct 2022 19:34:05 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 2AE929EC0002; Thu, 20 Oct 2022 19:34:05 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 20 Oct 2022 21:34:05 +0200
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@nvidia.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt
 Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung
 Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Yuwei Wang <wangyuweihx@gmail.com>, Petr
 Machata <petrm@nvidia.com>, Florent Fourcot <florent.fourcot@wifirst.fr>,
 Hans Schultz <schultz.hans@gmail.com>, Joachim Wiberg <troglobit@gmail.com>,
 Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 02/12] net: bridge: add blackhole fdb entry
 flag
In-Reply-To: <Y1FHuXE+X/V9aRvh@shredder>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-3-netdev@kapio-technology.com>
 <Y1FHuXE+X/V9aRvh@shredder>
User-Agent: Gigahost Webmail
Message-ID: <40edb67ac71ba7eef428c8366753ae94@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_123407_568021_6EDC4021 
X-CRM114-Status: GOOD (  14.81  )
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

On 2022-10-20 15:06, Ido Schimmel wrote:
> On Tue, Oct 18, 2022 at 06:56:09PM +0200, Hans J. Schultz wrote:
>> Add a 'blackhole' fdb flag, ensuring that no forwarding from any port
>> to a destination MAC that has a FDB entry with this flag on will 
>> occur.
>> The packets will thus be dropped.
>> 
>> When the blackhole fdb flag is set, the 'local' flag will also be 
>> enabled
>> as blackhole entries are not associated with any port.
> 
> It reads as if the kernel will enable the 'local' flag automatically,
> which is not true anymore. The bridge driver enforces that
> 'NUD_PERMANENT' is set if 'NTF_EXT_BLACKHOLE' is specified.
> 
>> 
>> Thus the command will be alike to:
>> bridge fdb add MAC dev br0 local blackhole
>> 
>> Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>
> 
> Looks OK to me. See one comment below.
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> 
> [...]
> 
>> @@ -1140,7 +1148,7 @@ static int __br_fdb_add(struct ndmsg *ndm, 
>> struct net_bridge *br,
>>  		err = br_fdb_external_learn_add(br, p, addr, vid, true);
>>  	} else {
>>  		spin_lock_bh(&br->hash_lock);
>> -		err = fdb_add_entry(br, p, addr, ndm, nlh_flags, vid, nfea_tb);
>> +		err = fdb_add_entry(br, p, addr, ndm, nlh_flags, vid, ext_flags, 
>> nfea_tb);
> 
> I believe the preference is to wrap to 80 columns when possible.

Ok, I only have knowledge of 100 columns as a limit.


