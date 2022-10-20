Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E30EC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 19:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=be6mp2ko4tq5Zov759PuwcaVbz1E4d/t5vyh4VlqUww=; b=o9ndSkGhHIdqBrQwLRbdBx8rHR
	74XYmmbvY9hNgEYrKnUYRvDbKXqg/94UuNRwCigUT5Zzr2esOv0wPTmZ0ErQOACc133xlwlmPdkXX
	Ip4x8yBFoUhL5Fk0igs8w/cLaFB4dU6gxsV6Y28v7Y28y+SwTUR2GxX+T1ivEy8uuyi2aP97TeQdo
	8KNt0SHnFyIQE9jk8yiATvcHEjNhXlIiaVF8F+bzZV9LU0572N+dROGwjNITwetootdZ+/7VXeUrm
	vtLv5IHqpm7/ayas7mdb1hQa8tAjJjyPj/lWcMlnNwsywyYqeqDUyFlOepOUstUrB+ur4bBDaFZb5
	m2oL5KWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olbMF-001QcU-El; Thu, 20 Oct 2022 19:37:35 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olbLz-001QVq-0F; Thu, 20 Oct 2022 19:37:20 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 6A2B11884C9D;
	Thu, 20 Oct 2022 19:37:17 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 4A5F225001FA;
	Thu, 20 Oct 2022 19:37:17 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 4377E9EC0002; Thu, 20 Oct 2022 19:37:17 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 20 Oct 2022 21:37:17 +0200
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
Subject: Re: [PATCH v8 net-next 01/12] net: bridge: add locked entry fdb flag
 to extend locked port feature
In-Reply-To: <Y1FE6WFnsH8hcFY2@shredder>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-2-netdev@kapio-technology.com>
 <Y1FE6WFnsH8hcFY2@shredder>
User-Agent: Gigahost Webmail
Message-ID: <1c71e62ee5d6c0a7fc54d3e666aca619@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_123719_217671_83B84201 
X-CRM114-Status: GOOD (  22.74  )
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

On 2022-10-20 14:54, Ido Schimmel wrote:
> On Tue, Oct 18, 2022 at 06:56:08PM +0200, Hans J. Schultz wrote:
>> Add an intermediate state for clients behind a locked port to allow 
>> for
>> possible opening of the port for said clients. The clients mac address
>> will be added with the locked flag set, denying access through the 
>> port
> 
> The entry itself is not denying the access through the port, but
> rather the fact that the port is locked and there is no matching FDB
> entry.
> 
>> for the mac address, but also creating a new FDB add event giving
>> userspace daemons the ability to unlock the mac address. This feature
>> corresponds to the Mac-Auth and MAC Authentication Bypass (MAB) named
>> features. The latter defined by Cisco.
> 
> Worth mentioning that the feature is enabled via the 'mab' bridge port
> option (BR_PORT_MAB).
> 
>> 
>> Only the kernel can set this FDB entry flag, while userspace can read
>> the flag and remove it by replacing or deleting the FDB entry.
>> 
>> Locked entries will age out with the set bridge ageing time.
>> 
>> Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>
> 
> Overall looks OK to me. See one comment below.
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> 
> [...]
> 
>> @@ -1178,6 +1192,14 @@ int br_fdb_add(struct ndmsg *ndm, struct nlattr 
>> *tb[],
>>  		vg = nbp_vlan_group(p);
>>  	}
>> 
>> +	if (tb[NDA_FLAGS_EXT])
>> +		ext_flags = nla_get_u32(tb[NDA_FLAGS_EXT]);
>> +
>> +	if (ext_flags & NTF_EXT_LOCKED) {
>> +		pr_info("bridge: RTM_NEWNEIGH has invalid extended flags\n");
> 
> I understand this function makes use of pr_info(), but it already gets
> extack and it's a matter of time until the pr_info() instances will be
> converted to extack. I would just use extack here like you are doing in
> the next patch.
> 
> Also, I find this message more helpful:
> 
> "Cannot add FDB entry with \"locked\" flag set"
> 

Okay, since Jakub says that this patch set must be resent, the question 
remains
to me if I shall make these changes and resend the patch set as v8?


