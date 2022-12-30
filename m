Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2318C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 16:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLpu04+RbbeBI/Nbl4YEI0+hXME43XlTduDWQwUs7U0=; b=ywtfu7Ph8koNLfeP6/7XhSn3yN
	gfzgw8C9WVGNSuu/QBvL5EoSlWE7LlFu6mlv47LZEGkgFe2nu4mBZJc4a4/ZnOacGY0CnO4H0X3wU
	Z4oozmm742wW/b3SkD56vibYc6HO7FW2dPPLHsHO9gmBkBvgdTfLYXF7oPDJ9bYGvDup0PtKS2WCe
	Nnm2Ngs+ngnIdsUNau9zKbzsbJHYTL21kgCQ8eo1YJdUp8DlGkwvtaJOJVCSZ1TTdQhG9YWQHCX46
	8SNbIwD1jLbdJPhRPDRaErXsae0RUULzX2lChNayn2a0CY9N+wHtC95JWFy8g7KM5/ba3sdKsv/me
	sg124BGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBI6O-00AxV0-0A; Fri, 30 Dec 2022 16:19:24 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBI0W-00Avef-M1; Fri, 30 Dec 2022 16:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oLpu04+RbbeBI/Nbl4YEI0+hXME43XlTduDWQwUs7U0=; b=W0V4c2xmmo9qMY2lMo0UPZC2L+
	OSWUKXOVgSit6IqjGEFoC87+rhuqEG5V0O87EkI2hG1sE96HiEe5/M/1p5fXj5MFKBEBXJyfJlR9p
	bceHia7lyYICoGtrdFxhLTFGqsD0KyWAEyRaxajtmOX1BpOgbO/++ZryOAPpVBvbLbuM=;
Received: from p200300daa720fc02b9d78281b940d549.dip0.t-ipconnect.de ([2003:da:a720:fc02:b9d7:8281:b940:d549] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pBI0E-00CklB-8W; Fri, 30 Dec 2022 17:13:02 +0100
Message-ID: <904dfc35-ecae-97dc-e9d9-a7df83ff89d4@nbd.name>
Date: Fri, 30 Dec 2022 17:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Aw: Re: Re: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc: drop
 generic vlan rx offload, only use DSA untagging
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221230073145.53386-1-nbd@nbd.name>
 <20221230073145.53386-4-nbd@nbd.name>
 <trinity-a07d48f4-11cf-4a24-a797-03ad4b1150d9-1672400818371@3c-app-gmx-bap18>
 <82821d48-9259-9508-cc80-fc07f4d3ba14@nbd.name>
 <trinity-ace28b50-2929-4af3-9dd2-765f848c4d99-1672408565903@3c-app-gmx-bap18>
 <fc09b981-282e-26cd-661e-86fdc72bedf9@nbd.name>
 <trinity-01eda9f9-b989-4554-ba35-a7f7a18da786-1672414711074@3c-app-gmx-bap18>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <trinity-01eda9f9-b989-4554-ba35-a7f7a18da786-1672414711074@3c-app-gmx-bap18>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_081320_762802_147F8488 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

On 30.12.22 16:38, Frank Wunderlich wrote:
> seems only tx is affected on r3, as i see packets on the vlan from my laptop
> 
> tcpdump on R3 (e4:b9:7a:f7:c4:8b is mac from laptop):
> 
> 13:47:05.265508 e4:b9:7a:f7:c4:8b > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 577: vlan 500, p 0, ethertype IPv4 (0x0800), 192.168.50.2.59389 > 192.168.50.255.21027: UDP, length 531
> 13:47:05.265548 e4:b9:7a:f7:c4:8b > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 577: vlan 600, p 0, ethertype IPv4 (0x0800), 192.168.60.2.59389 > 192.168.60.255.21027: UDP, length 531
> 
> regards Frank
I don't have a setup to test 6.2 on my MT7986 board right now, but I did 
test latest OpenWrt with my changes and couldn't reproduce the issue there.
I checked the diff between my tree and upstream and didn't find any 
relevant differences in mtk_eth_soc.c
Not sure what's going on or how to narrow it down further.

- Felix

