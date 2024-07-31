Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4328C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2uOUZ1AzVCrg2ZMRbNSITGFegDXjXEfYnn71c55fzk=; b=lZBwyG0nechpSUb6UZbYMz5Od4
	J9OWw2ni+9LGUrTCcfshiYUuJ0ekjMvvCFY/MSBk4W3FOGjk6xgi6BNOnQw0nk6MP/qFPz0SaZBPD
	7+82HbyM2fyTn6DKxeuY/4NLPsQKGxt2sPcOWa3hKe0PhdcZkZfRswWfYN+i0ggls/fuj4a8olFcL
	z2S0bWS6ZBjHyfHKrOj6BddYI2BK4DChLnEpLy6wBXGRrtxfLNmLQsdh1PhCS9RSdkBXi20h0CyZr
	PtlXGlhIXPRKh6zcx1E57EwzmMnF6A/WYRccRPWtft9quYUgSAtyhYd0SRtmXhVa3PYeUF1t+3v8b
	pwq+CWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ6ZG-00000000imW-3XOR;
	Wed, 31 Jul 2024 10:28:26 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ6YW-00000000ia7-081f
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 10:28:23 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10da:6900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 46VAQv4k1356631
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 31 Jul 2024 11:26:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1722421617; bh=K2uOUZ1AzVCrg2ZMRbNSITGFegDXjXEfYnn71c55fzk=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=WY+bwLT1pVl7HGu+SkSKZyBNiVTSjKgyctettW1bGv+NpX8CCW0wLMBswCJh1fhVK
	 XucYnlSHfcPwdqBm4UP9jHtV6Czm2QY47FM4nbQPE9hSXtRCLdrbrEmIDF9FZtZY9L
	 pa2PuxsWs6LowVHpV9LN8hdtK8N0r1tv/8WG0XAY=
Received: from miraculix.mork.no ([IPv6:2a01:799:10da:690a:d43d:737:5289:b66f])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 46VAQvUq183259
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 31 Jul 2024 12:26:57 +0200
Received: (nullmailer pid 482712 invoked by uid 1000);
	Wed, 31 Jul 2024 10:26:57 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] wifi: mt76: fix oops on non-dbdc mt7986
Organization: m
References: <20240713130010.516037-1-bjorn@mork.no>
	<877cd1lxlx.fsf@kernel.org>
Date: Wed, 31 Jul 2024 12:26:57 +0200
In-Reply-To: <877cd1lxlx.fsf@kernel.org> (Kalle Valo's message of "Wed, 31 Jul
	2024 12:27:54 +0300")
Message-ID: <871q39kgb2.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.0.5 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_032740_776945_F8A3D68B 
X-CRM114-Status: GOOD (  10.85  )
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

Kalle Valo <kvalo@kernel.org> writes:
> Bj=C3=B8rn Mork <bjorn@mork.no> writes:
>
>> mt7915_band_config() sets band_idx =3D 1 on the main phy for mt7986
>> with MT7975_ONE_ADIE or MT7976_ONE_ADIE.
>>
>> Commit 0335c034e726 ("wifi: mt76: fix race condition related to
>> checking tx queue fill status") introduced a dereference of the
>> phys array indirectly indexed by band_idx via wcid->phy_idx in
>> mt76_wcid_cleanup(). This caused the following Oops on affected
>> mt7986 devices:
>>
>>  Unable to handle kernel read from unreadable memory at virtual address =
0000000000000024
>>  Mem abort info:
>>    ESR =3D 0x0000000096000005
>>    EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>>    SET =3D 0, FnV =3D 0
>>    EA =3D 0, S1PTW =3D 0
>>    FSC =3D 0x05: level 1 translation fault
>>  Data abort info:
>>    ISV =3D 0, ISS =3D 0x00000005
>>    CM =3D 0, WnR =3D 0
>>  user pgtable: 4k pages, 39-bit VAs, pgdp=3D0000000042545000
>>  [0000000000000024] pgd=3D0000000000000000, p4d=3D0000000000000000, pud=
=3D0000000000000000
>>  Internal error: Oops: 0000000096000005 [#1] SMP
>>  Modules linked in: ... mt7915e mt76_connac_lib mt76 mac80211 cfg80211 .=
..
>>  CPU: 2 PID: 1631 Comm: hostapd Not tainted 5.15.150 #0
>>  Hardware name: ZyXEL EX5700 (Telenor) (DT)
>>  pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>>  pc : mt76_wcid_cleanup+0x84/0x22c [mt76]
>>  lr : mt76_wcid_cleanup+0x64/0x22c [mt76]
>>  sp : ffffffc00a803700
>>  x29: ffffffc00a803700 x28: ffffff80008f7300 x27: ffffff80003f3c00
>>  x26: ffffff80000a7880 x25: ffffffc008c26e00 x24: 0000000000000001
>>  x23: ffffffc000a68114 x22: 0000000000000000 x21: ffffff8004172cc8
>>  x20: ffffffc00a803748 x19: ffffff8004152020 x18: 0000000000000000
>>  x17: 00000000000017c0 x16: ffffffc008ef5000 x15: 0000000000000be0
>>  x14: ffffff8004172e28 x13: ffffff8004172e28 x12: 0000000000000000
>>  x11: 0000000000000000 x10: ffffff8004172e30 x9 : ffffff8004172e28
>>  x8 : 0000000000000000 x7 : ffffff8004156020 x6 : 0000000000000000
>>  x5 : 0000000000000031 x4 : 0000000000000000 x3 : 0000000000000001
>>  x2 : 0000000000000000 x1 : ffffff80008f7300 x0 : 0000000000000024
>>  Call trace:
>>   mt76_wcid_cleanup+0x84/0x22c [mt76]
>>   __mt76_sta_remove+0x70/0xbc [mt76]
>>   mt76_sta_state+0x8c/0x1a4 [mt76]
>>   mt7915_eeprom_get_power_delta+0x11e4/0x23a0 [mt7915e]
>>   drv_sta_state+0x144/0x274 [mac80211]
>>   sta_info_move_state+0x1cc/0x2a4 [mac80211]
>>   sta_set_sinfo+0xaf8/0xc24 [mac80211]
>>   sta_info_destroy_addr_bss+0x4c/0x6c [mac80211]
>>
>>   ieee80211_color_change_finish+0x1c08/0x1e70 [mac80211]
>>   cfg80211_check_station_change+0x1360/0x4710 [cfg80211]
>>   genl_family_rcv_msg_doit+0xb4/0x110
>>   genl_rcv_msg+0xd0/0x1bc
>>   netlink_rcv_skb+0x58/0x120
>>   genl_rcv+0x34/0x50
>>   netlink_unicast+0x1f0/0x2ec
>>   netlink_sendmsg+0x198/0x3d0
>>   ____sys_sendmsg+0x1b0/0x210
>>   ___sys_sendmsg+0x80/0xf0
>>   __sys_sendmsg+0x44/0xa0
>>   __arm64_sys_sendmsg+0x20/0x30
>>   invoke_syscall.constprop.0+0x4c/0xe0
>>   do_el0_svc+0x40/0xd0
>>   el0_svc+0x14/0x4c
>>   el0t_64_sync_handler+0x100/0x110
>>   el0t_64_sync+0x15c/0x160
>>  Code: d2800002 910092c0 52800023 f9800011 (885f7c01)
>>  ---[ end trace 7e42dd9a39ed2281 ]---
>>
>> Fix by using mt76_dev_phy() which will map band_idx to the correct phy
>> for all hardware combinations.
>>
>> Fixes: 0335c034e726 ("wifi: mt76: fix race condition related to checking=
 tx queue fill status")
>> Link: https://github.com/openwrt/openwrt/issues/14548
>> Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>
>
> Should this go to wireless tree?

I believe it should. If fixes a regression on the affected hardware,
introduced by commit 0335c034e726.

It should also go into any still maintained v6.7, v6.8, v6.9, v6.10
stable trees.  But I assume they will pick it up automatically based on
the Fixes tag.



Bj=C3=B8rn

