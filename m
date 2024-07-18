Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B58AC3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 10:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvWyHxZ99IvPwim7yGGnEO3wJiVr3+x4a+CYEj2uDtI=; b=my0tUaiG3hlZ18Mnt9Ky1hxMQ5
	Il8XGl6zmC2nlupnf0Ivm/jgDD9FLw/6t5Gs4zvej+/GBsX5NK6vLxRdhjmVlgNubVgdNSVQyeHy3
	wM1OckLUyEjvAKbmft5LAREwQwbmCaozGUhTbvu6ucME1vgNBVey4D6ICM7IcDEP1IzCVndduaq7q
	dLSlFvaH9+GMOV/E9UZ7FVnjLSQ0qXV9l4Xg3ahU9i3w2FtI8aOSTHRSpF3m2SXiEt46iVQsc9B43
	9GoFIOZlX/Cp2V3elMzQKQnv3KAzZuyhi9A+nxftGtuQXHrZ0Jp0dc5FzbqIv9cemjZx8Ljg7gqjH
	xD5dPMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUOb2-0000000Givn-0gAL;
	Thu, 18 Jul 2024 10:42:48 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUOao-0000000GiuF-1ooy
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jul 2024 10:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1721299343; x=1721904143; i=spasswolf@web.de;
	bh=CvWyHxZ99IvPwim7yGGnEO3wJiVr3+x4a+CYEj2uDtI=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hFpl5k1qKfIX/68XJJkBtdCFXX7tsWgZUdSafQE/k/yDQcz6KL6ABic0XU+krB9W
	 28v60kw9+bwkSkP+XwXo1pEkhKnJg2kGBakfE/HgNdVJFiAxn+m6vyaHKojt0nUZa
	 WpzNba+i6n8jLiah5+8IjXu+bNhRPewYvmNWqTKuWhlC/fcc43zYZaekZ32su73TL
	 AWovSfoqQlFJgq8ilowmpfc14NnOeIQf61W2iNtAdHcB1HqH9nM1Xl7a/SBaYkKY1
	 XTYOsvMp7d2LltzXKhO6EtZgjxJtbEcZjVpwN61P7DiCw/TTCxAoIKrubhWmVx8dI
	 H3MiOkp4rBjLpDgjdw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MMp8Y-1sn1w30MrM-00J4CV; Thu, 18
 Jul 2024 12:42:23 +0200
Message-ID: <e2e95f9e69c9cd30af267bc980026e6194742464.camel@web.de>
Subject: Re: patch 46/47 causes NULL pointer deref on mt7921
From: Bert Karwatzki <spasswolf@web.de>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@kernel.org>
Cc: deren.wu@mediatek.com, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com, 
	mingyen.hsieh@mediatek.com, sean.wang@mediatek.com, spasswolf@web.de
Date: Thu, 18 Jul 2024 12:42:20 +0200
In-Reply-To: <308958f4c5689fd920c3915f4878850a09310b18.camel@web.de>
References: <20240711175156.4465-1-spasswolf@web.de>
	 <CAGp9LzoXMoAW6dVZjTf-JcD_wiU4yXpGwkLaVyWXTkaV2MOKwg@mail.gmail.com>
	 <adb192a59c44aa8708e80df30a6a47816a03e50f.camel@web.de>
	 <4e943a62736f955af5d9cd1aff7e2b9c084c8885.camel@web.de>
	 <2599b886-9c63-4989-a08a-7feab28f7c49@nbd.name>
	 <9fb7ac97d2ca472db469aefefbfeb94e0f886508.camel@web.de>
	 <308958f4c5689fd920c3915f4878850a09310b18.camel@web.de>
Content-Type: text/markdown; charset="UTF-8"
User-Agent: Evolution 3.52.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J25o4Q0oMig9NQWETK90TuC4zCnVcNsPH74hXDl6SroiuiOSpxS
 6pA6eZrTbdrIx+MfEFQfFbPTxlQj5KP2gHn9lHfxgoUQcZ+8um/RF+2XNs8cYRf+CkSHy9J
 xhTeCO+g7JVW1JGiAlUUKh9oybkE6Y0/LkaX0Yc6/xCG5Qqk5yFYOg2j+FQGaFOy2LnVpXP
 rnNxPmIFlEAtFga0ONNJw==
UI-OutboundReport: notjunk:1;M01:P0:LfX2v8KSRYo=;bisTn+IPouirnVge06mK6CJi3NY
 2QCyD7bMhvBYsaufkuw3ae3Ul53R2uYq/VCZsrnIMEr9EmaZYSNIY361kjQSzrIiZakWeC1oy
 EjpG0RqFs9R9rWRwcuKLVfcLKvNnCjSstwIUVH2oviW4zjvtGh/3kRzP94XXA6E9BTIaeHPXC
 OJTO7sCPup4wNB8jyEHz56g3KClQKyYVLEFz9BaOe1pyaDdG6b/+xJnJgXrEhzhibbPhIg7Em
 Fkq/eOoRI8gOX4wQXLQ9BaiV7Q9vrzNI5tDxjqCQVKaS32wps1FpNJgAqMW0gZzDzm7p9NdwK
 /IpC9rXwHUAVHSZmK1OkHnnHFD+hIXKBs3sKApe9I2Juxu9TN59VCdbKV10lQceJ9y6XDA9k/
 uckBRrsNvt9kSXUsfDnrlu56ZTUN61jnuXtauyDIY9r1kNaCiZqBi3Awqj1JzWKgPXcWTALfZ
 hgAiMb/On7NHy2conzqfBQu1CE8S9UxO7wleTZcIXu0XG+quNf2HRRozx7sz1/Ux7SzQGTROO
 88ohKbLKt9wd2/k54uluGut1upw5kC9T+QqxGZS39dEAvBWG+IB9LwCZu8eCecYlcMyoXZiM2
 jAD1K6X7ed11tl7cfH3fFlE2Nqsk9dluLWLKLgpoHefwU0C4rdDGOHXJr/0KFXkDH/YXS+d/L
 lHzYbRmqDFB8Wi4BHQjWCRv1+JZR+lmRNWygPnWOvEyItToE5Rb22P8nvL+1+mruAEm0rZxl6
 uMkA1ZeZWDg0CZOk4LQIoLTOGybKtrrN24V8ea+q6U3Wk6zvWUmIPzEykwYo99QjSVH1d2hb3
 iMXaSQ0+mgTXPYeO0xD6IH+w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_034234_865968_A72CBC33 
X-CRM114-Status: UNSURE (   3.71  )
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

I looked more close at the call trace of the warning and it seems that the=
 problems=C2=A0
occur when shutting down the interface:
[  T847] Call Trace:
[  T847]  <TASK>
[  T847]  ? __warn+0x6a/0xc0
[  T847]  ? mt7921_ipv6_addr_change+0x1d0/0x1f0 [mt7921_common]
[  T847]  ? report_bug+0x142/0x180
[  T847]  ? handle_bug+0x3a/0x70
[  T847]  ? exc_invalid_op+0x17/0x70
[  T847]  ? asm_exc_invalid_op+0x1a/0x20
[  T847]  ? mt7921_ipv6_addr_change+0x1d0/0x1f0 [mt7921_common]
[  T847]  ? srso_alias_return_thunk+0x5/0xfbef5
[  T847]  ? __ipv6_ifa_notify+0x16f/0x4d0
[  T847]  ? ieee80211_ifa6_changed+0x5e/0x70 [mac80211]
[  T847]  ? atomic_notifier_call_chain+0x51/0x80
[  T847]  ? addrconf_ifdown.isra.0+0x43f/0x810
[  T847]  ? srso_alias_return_thunk+0x5/0xfbef5
[  T847]  ? addrconf_notify+0x15d/0x760
[  T847]  ? __timer_delete_sync+0x70/0xd0
[  T847]  ? raw_notifier_call_chain+0x43/0x60
[  T847]  ? dev_close_many+0xea/0x160
[  T847]  ? dev_close+0x65/0x80
[  T847]  ? cfg80211_shutdown_all_interfaces+0x48/0xe0 [cfg80211]
[  T847]  ? cfg80211_rfkill_set_block+0x25/0x40 [cfg80211]
[  T847]  ? rfkill_set_block+0x8f/0x160 [rfkill]
[  T847]  ? rfkill_fop_write+0x14e/0x1e0 [rfkill]
[  T847]  ? vfs_write+0xf3/0x420
[  T847]  ? srso_alias_return_thunk+0x5/0xfbef5
[  T847]  ? ksys_write+0xae/0xe0
[  T847]  ? do_syscall_64+0x5f/0x170
[  T847]  ? entry_SYSCALL_64_after_hwframe+0x55/0x5d
[  T847]  </TASK>
[  T847] ---[ end trace 0000000000000000 ]---

I think there's a race happening on shutdown between ipv6_addr_change (whi=
ch uses mvif->phy)
and ieee80211_do_stop (which zeros the private data including mvif->phy).

Bert Karwatzki

