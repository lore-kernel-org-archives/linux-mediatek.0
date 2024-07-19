Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DA9C3DA5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 11:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FDPWtZa5BiBTQ3GHY8kUVw1DOEUjjH3tOcbPfWdgNw=; b=ibYsO5Ibr9uPACj/f9lSqXlewO
	cyh4v4h24/cgjqkPJAwTrM7CEDu6FtirIEMJROuIBgug4lTl2ZMT8qjxnWYLWQP8zyxYRDGjVZQqC
	8IY3OkxNRB1gfs77Nky2TBt2hIaIwECigFL/tId1My+CsVdk+0bVoFLco2GXpoogDlTu/PTmlQJNm
	/Xm4iA2CF5RZEYa7bsEhp+0klrCbHG24/Op6R9ZV3Wd1c5kVD+ImLUpHiUoBIBy7uLOXE2nKVt+7Q
	tdDKsuqQKSx819shZkCk6i00YKwG0VbzUZzl0nk7FzvvDmbjOcQQAozSU8q/wE+WC3+ooeV4FISVQ
	1zvhNB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUllA-00000002VWa-1L6k;
	Fri, 19 Jul 2024 11:26:48 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUll6-00000002VVm-10XY
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jul 2024 11:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1721388392; x=1721993192; i=spasswolf@web.de;
	bh=9FDPWtZa5BiBTQ3GHY8kUVw1DOEUjjH3tOcbPfWdgNw=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bAH24AYzAcxd+AwDKTLwlHBcSse5HmcY/uZFgMzaGN/zvNYKZtqi4oqFoeUEm2X/
	 PgdSCwjAQuEKdo+PnDKyvslDFxwo5cr6n8xVGcnlaz3Fj3gkXyUdn0/ulQs3y/3Mk
	 H+PyAj+XaVBpAN84RQyrRyw77mdUxumpBitRHf0lKe6LHzt0uIsQNw9V4J7bgVLmh
	 1hOAd4P2yX11gvHaXIAbg759RSk/ScJv8sQa3zlsrAopFZuTzCLcfP4MA+r9Ees65
	 nK0TuifYFDm40v7mq/jefTknb4tYJISyO9srMXOB2k1r/LGMO1nTBAc6AAZXGOUnO
	 xuXb9AuNKmdospTDKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBjIG-1scURo05fg-0070pW; Fri, 19
 Jul 2024 13:26:32 +0200
Message-ID: <7a4db04f7088a9d818037321412f7ac968d965cd.camel@web.de>
Subject: Re: [PATCH] wifi: mt76: mt7921: fix null pointer access in
 mt792x_mac_link_bss_remove
From: Bert Karwatzki <spasswolf@web.de>
To: sean.wang@kernel.org, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com, deren.wu@mediatek.com,
 mingyen.hsieh@mediatek.com,  linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org,  spasswolf@web.de
Date: Fri, 19 Jul 2024 13:26:30 +0200
In-Reply-To: <20240718234633.12737-1-sean.wang@kernel.org>
References: <20240718234633.12737-1-sean.wang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ALX7alao3XcqIRK5g3lr4ihIgNWuUOosbfoXbMSwe9tamIny5My
 NrgORDm1xdVmF+4uUXA9N2OjXCqTM0NaHwtpomJTAKZAk09490KkyyRX6aSOEaTxRpxpspU
 whqQR4JKT401bVfhW0/VKYzFGwT1vV+6SjxVqK5MIEzRxjyH6A/zU90hoktJTMXXj2of0ZX
 sdaD2lZ/fJOksr6h41b+w==
UI-OutboundReport: notjunk:1;M01:P0:HkluRDPJt8U=;xx4jJ3QJkve//VYTaJa1uiL5lo2
 C1U6hcpR4aEQ/pJnbh9hYdFWgKIMJ5JpIibdTLPY4e/l226zfzRifzKidsH0IxsHpzM6Gg6LK
 DG4T7V8HoghaYWk3Pf3FBs/dRxk8he5iwIQ9mLOawbwm9uOaYIbWnNP6sHJT65MhrSwY7SkWe
 HneRfglHpRZ/FvIqWzlfaVYjA5fl8M4VqzJfoOdGVJ7KudzwTQv/hf4+Ht4mpTjeMmPt0msos
 VsuAG7S8PXJnNNbnQwWlnZMq+cN8P2LHGKOwotUibBJoyUfnmvOjOulOF+DrrlW4FGwg4U7/g
 DIt0JHAoaogLah9YHlI9KaosYqgF8h+FFYGxbQ5GtoEjeVFlEoAQDi2uJYYmj9ff3q2zBHgnn
 yBl/zPxzMfuFxDBIueOwfguL37o6ss+KvL00dqhmMORuykoTLDc1WBRfYPhu7F5Lao1LSmZGV
 VLKTzhU6QL4eesVhtKQogAA3krdE/dTlptvyamMCwLuBOBeRaFESSTdkCamyqligvAm++HzF3
 kgSC52fPJ8Qfe9vQR/eTXP95Fp7N86d7RNtwW5TLGIei7Q5IsOdpVEE25OyyxvdKvz1Irh/ue
 mzw0jpQenY0/Jh5F/SGZJGl0fYAzjNHbQmjZ+KRgfM/TSKgBnGUc2OvopZXHKKcPFemEol/x2
 +dbkVEeIZwShtjEejfEGLaJl1kLMk5dNW/u6tq1ppy4MJvw7Ci7O8RlAC9dYr4ui/OqaQs8hy
 3yC0PRlEcdcWuF3V+SiFGkb3jbz7LLIq3jkcK6hfBDsoD9HlxIEdZz1Esy1J6IXZltRZznU2r
 uvM3sz+wfg5028JGbSI3zryw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_042644_677776_EC7D068E 
X-CRM114-Status: GOOD (  13.28  )
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

Am Donnerstag, dem 18.07.2024 um 16:46 -0700 schrieb sean.wang@kernel.org:
> From: Sean Wang <sean.wang@mediatek.com>
>
> Fix null pointer access in mt792x_mac_link_bss_remove.
>
> To prevent null pointer access, we should assign the vif to bss_conf in
> mt7921_add_interface. This ensures that subsequent operations on the BSS
> can properly reference the correct vif.
>
> [  T843] Call Trace:
> [  T843]  <TASK>
> [  T843]  ? __die+0x1e/0x60
> [  T843]  ? page_fault_oops+0x157/0x450
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? search_bpf_extables+0x5a/0x80
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? exc_page_fault+0x2bb/0x670
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? lock_timer_base+0x71/0x90
> [  T843]  ? asm_exc_page_fault+0x26/0x30
> [  T843]  ? mt792x_mac_link_bss_remove+0x24/0x110 [mt792x_lib]
> [  T843]  ? mt792x_remove_interface+0x6e/0x90 [mt792x_lib]
> [  T843]  ? ieee80211_do_stop+0x507/0x7e0 [mac80211]
> [  T843]  ? ieee80211_stop+0x53/0x190 [mac80211]
> [  T843]  ? __dev_close_many+0xa5/0x120
> [  T843]  ? __dev_change_flags+0x18c/0x220
> [  T843]  ? dev_change_flags+0x21/0x60
> [  T843]  ? do_setlink+0xdf9/0x11d0
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? security_sock_rcv_skb+0x33/0x50
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? __nla_validate_parse+0x61/0xd10
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? genl_done+0x53/0x80
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? netlink_dump+0x357/0x410
> [  T843]  ? __rtnl_newlink+0x5d6/0x980
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? genl_family_rcv_msg_dumpit+0xdf/0xf0
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? __kmalloc_cache_noprof+0x44/0x210
> [  T843]  ? rtnl_newlink+0x42/0x60
> [  T843]  ? rtnetlink_rcv_msg+0x152/0x3f0
> [  T843]  ? mptcp_pm_nl_dump_addr+0x180/0x180
> [  T843]  ? rtnl_calcit.isra.0+0x130/0x130
> [  T843]  ? netlink_rcv_skb+0x56/0x100
> [  T843]  ? netlink_unicast+0x199/0x290
> [  T843]  ? netlink_sendmsg+0x21d/0x490
> [  T843]  ? __sock_sendmsg+0x78/0x80
> [  T843]  ? ____sys_sendmsg+0x23f/0x2e0
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? copy_msghdr_from_user+0x68/0xa0
> [  T843]  ? ___sys_sendmsg+0x81/0xd0
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? crng_fast_key_erasure+0xbc/0xf0
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? get_random_bytes_user+0x126/0x140
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? __fdget+0xb1/0xe0
> [  T843]  ? __sys_sendmsg+0x56/0xa0
> [  T843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  T843]  ? do_syscall_64+0x5f/0x170
> [  T843]  ? entry_SYSCALL_64_after_hwframe+0x55/0x5d
> [  T843]  </TASK>
>
> Fixes: 1541d63c5fe2 ("wifi: mt76: mt7925: add mt7925_mac_link_bss_remove=
 to remove per-link BSS")
> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Closes: https://lore.kernel.org/linux-wireless/2fee61f8c903d02a900ca3188=
c3742c7effd102e.camel@web.de/#b
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/main.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/=
net/wireless/mediatek/mt76/mt7921/main.c
> index 2e6268cb06c0..1bab93d049df 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -303,6 +303,7 @@ mt7921_add_interface(struct ieee80211_hw *hw, struct=
 ieee80211_vif *vif)
>
>  	mvif->bss_conf.mt76.omac_idx =3D mvif->bss_conf.mt76.idx;
>  	mvif->phy =3D phy;
> +	mvif->bss_conf.vif =3D mvif;
>  	mvif->bss_conf.mt76.band_idx =3D 0;
>  	mvif->bss_conf.mt76.wmm_idx =3D mvif->bss_conf.mt76.idx % MT76_CONNAC_=
MAX_WMM_SETS;
>
I've been testing this since you suggested it on 11.7.2024 and it works fi=
ne.

Tested-by: Bert Karwatzki <spasswolf@web.de>

Bert Karwatzki

