Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43288CA5FEC
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2026 15:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQEfnERRbRTbDjqr7mujmEWXwFPrE5MByZhTAUQ/Ttg=; b=CcdWRmxCiFR0jz+T8W0NOv6FCF
	w7knODtLdRxBqxpUA2tnRO1WzFHZG/fLqZRfQZpiyLQvzt6DHKeG5Uacm2O+jwgdh6y7gbVOZQhHY
	FbnO9gyMwUHmhIUtwkPM86s0uW2lix7NxnMVxaqa0FJsSk2smpymgVCnEri2/I7ZM/TlSTSC8lZti
	WdKMEezLL/i2UNq4gxG19C6WLXYE9S4hpj2U1NAHqDKsVB5BWx+HokCTtyhGUb9y2lEZfEmRLI3RS
	MuzQ6RKpmoCNNaMkAoKun7+GzzvAQUMBIBw/uDjMgw53ZsP1xP5qZ/PqdSo+tzZMO1iplhfhLvqsB
	LkzEa5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD21U-0000000Dif4-3h9Y;
	Sat, 03 Oct 2026 15:51:40 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD21S-0000000DieR-0FoG
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Oct 2026 15:51:39 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 8D9A48007F;
	Sat,  3 Oct 2026 15:51:35 +0000 (UTC)
Received: from [192.168.1.23] (unknown [98.97.37.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id BE5A813C2B0;
	Sat,  3 Oct 2026 08:51:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com BE5A813C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1791042694;
	bh=e1vKh2q2bAik4aanQLqwwfix2JTwK1OUaKj0xHiHhOY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nT0BeXRXWR7B2r5NAzyWMjCxRtExDyVDmIN+O/taY7XJDoCKoBvr84XMlctey+Xhz
	 DT6desBQG+FMI3niKyjNHnX8ShwqvM3iGNvNwwhir/pMtI/+3KbpUhArUjeYC7x+D6
	 /mrxT3/PTkvSYdJKjLCbXjb0q97fqXn7VO4QwNHU=
Message-ID: <c4286904-2a9a-41fd-93ce-be57964909f6@candelatech.com>
Date: Sat, 3 Oct 2026 08:51:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug] Triple whammy of mt7996e bugs on 7.2+
To: Ilya K <me@0upti.me>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <1767631788532094@64c4e675-cd08-4a74-816f-886742f9bfcd>
 <529a79bc-dab7-aa41-00bd-c47ecbefaa00@candelatech.com>
 <471221788538289@323ca970-5bd2-4c6b-b52d-2b863a718615>
 <3acf531c-bcc7-412b-b3bb-665069260e46@candelatech.com>
 <2028561788553569@f088f4ec-f441-47a1-b7e4-75a1052aa4df>
 <2418461788691106@84aa39c5-f501-4e64-8418-6a8b6eb88e21>
 <eb405366-6574-4e4c-a89d-363751ed848b@candelatech.com>
 <4175721788798939@f00554c7-d809-471c-9bcf-78e5d8eceab4>
 <1556871789207706@7dc9deb3-4292-4932-8568-de9b411208d8>
 <1443771789748846@4a8ec5ae-80ed-44bc-b7d3-6bc660c90136>
 <211851789913261@df1900ea-d467-4ed7-a7f1-de68a4c3e6dd>
 <143991791036721@40be7595-980b-4665-ba66-1601e10a0899>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <143991791036721@40be7595-980b-4665-ba66-1601e10a0899>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1791042696-OXx-lt94Esen
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;at1;1791042696;OXx-lt94Esen;<greearb@candelatech.com>;6f76c88c2c731de9ad886e575864f8cc
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_085138_166885_E334E3B7 
X-CRM114-Status: GOOD (  10.73  )
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

On 10/3/26 07:12, Ilya K wrote:
> OK, so another update: my current branch which is basically 7.2.8 + bpi-r4 specific stuff + any patches from Ben's tree that touch net/wireless or mt76 code (http://github.com/K900/linux/tree/bpi-r4-728-ct) survived an entire week of no crashes, which is a very good sign. Unfortunately, it's still >500 commits with a total of +20k -2k lines of diff, so I'll have to go through it again and strip it down even more before I can have any idea of what is actually helping...
> 

Hello Ilya,

Going back to your original report, your logs showed a lockup.  We have added a bunch of mac80211
patches to deal with failing hardware around this path.  This was primarily done for working
around iwlwifi issues, I have not seen mtk7996 hit this path.  Our kernel should warn pretty loudly
in this case, so if you are still hitting it you should see signs.

[59002.686052] Hardware became unavailable during restart.
[59002.692099] WARNING: net/mac80211/util.c:1959 at ieee80211_reconfig+0x254/0x1ad8 [mac80211], CPU#2: kworker/2:3/26768
[59002.702894] Modules linked in: wireguard sch_cake mt7996e mt76_connac_lib rtc_pcf8563 at24 mt76 mac80211 libarc4 cfg80211 rfkill nft_queue nft_nat 
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_masq nft_ct nft_chain_nat nf_nat nft_flow_offload nf_flow_table_inet nf_flow_table nf_tables mtk_ge_soc 
mtk_phy_lib sfp tag_mtk mtk_eth mt7530_mmio mt7530 dsa_core governor_passive hsr bridge cmdlinepart pcs_mtk_usxgmii stp llc sm4 spinand phy_mtk_xsphy reset_gpio 
rt5190a_regulator pcs_mtk_lynxi phy_mtk_xfi_tphy phylink mdio_i2c pwm_mediatek lvts_thermal pwm_fan mtk_cci_devfreq ramoops reed_solomon tcp_bbr sch_fq_codel 
amneziawg nf_conntrack libcurve25519 libchacha20poly1305 libchacha libpoly1305 nf_defrag_ipv6 ip6_udp_tunnel nf_defrag_ipv4 udp_tunnel fuse zram 842_decompress 
842_compress lz4hc_compress nvme nvme_core nvme_keyring mmc_block dm_mod nvme_auth pcie_mediatek_gen3 rpmb_core
[59002.780906] CPU: 2 UID: 0 PID: 26768 Comm: kworker/2:3 Not tainted 7.2.2 #1-NixOS PREEMPTLAZY
[59002.789512] Hardware name: Banana Pi BPI-R4 (2x SFP+) (DT)
[59002.794988] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[59002.801949] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[59002.808902] pc : ieee80211_reconfig+0x254/0x1ad8 [mac80211]
[59002.814622] lr : ieee80211_reconfig+0x254/0x1ad8 [mac80211]

And, if you can reproduce the deadlock with lockdep enabled, that may
help.  Your original logs didn't show the problem part of the lockup
as far as I could tell, just processes blocked on acquiring rtnl.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


