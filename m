Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10274C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 10:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ehcEZ3ZqTGFKCqFJksb5S1t2k/S10rcVu5i9dkq9CY=; b=fjt0CUyu7en0CO3ZRuibV09g6r
	Z9mEML7qoQsya5UQNeRdUmNB4irBVwF4fYwWKcJlGbVBnB1/gOwmQhqZR2g3VWtMeIktgQp228d9V
	Nayw6FYoQRJIa9qBrLk0BDMeTiBxGQE4fMNznvp2U40gWsleY65OeGAKg8Z5vcbdDFLLzdORp1A+x
	BL3PRoW5dYri7JNFUlfE1298RWk69t1bv6T0yfuckGSLUS17iEXUQzp7XNF8VF0rjlUkcQEWig0Cf
	Wg05EEwtGdFOjB+DzpgbREPEobVREZ20NzXk0lgrHKJWROQmnJJajlVDlV37ti96q6+KyafBuBeox
	ApTK3kHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUOcI-0000000Gj4P-1cwi;
	Thu, 18 Jul 2024 10:44:06 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUOc5-0000000Gj3T-2QxH
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jul 2024 10:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1721299424; x=1721904224; i=spasswolf@web.de;
	bh=9ehcEZ3ZqTGFKCqFJksb5S1t2k/S10rcVu5i9dkq9CY=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hAHI4cvDUQaOeImOBhCCDEctdEodeNgb7+iEID3OJLOei0AS7Ey6IXH6VdUsJMI3
	 mMoUanCIJ0q/NIcAwXAILRPvXtWh9SPbcCvJxkl1sSNREfWx35F8Hhp8xEkkTTNgc
	 nlZ+Fqb6sy85Li0EyqgMZAo6Usw1vCM/JlRvb1S+r3NjyyfSdDgj3pPDW9xAuB1X0
	 Bzw/T5jKbuta4q9faXvQzNh958JXZnneNyORYy14S1MP0H/baVLs+ADzfr+9Jxcmr
	 FyDYU+i9OdyFzai00wtsia1Bj+TpfAlxhTGcQ3s2xionSmqnb1iqR6ab0eZDGEgfb
	 eOptZLn5itVKfnw/ow==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MV2Ka-1swLaA2BU6-00SRgt; Thu, 18
 Jul 2024 12:43:44 +0200
Message-ID: <2fee61f8c903d02a900ca3188c3742c7effd102e.camel@web.de>
Subject: Re: patch 46/47 causes NULL pointer deref on mt7921
From: Bert Karwatzki <spasswolf@web.de>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@kernel.org>
Cc: deren.wu@mediatek.com, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com, 
	mingyen.hsieh@mediatek.com, sean.wang@mediatek.com, spasswolf@web.de
Date: Thu, 18 Jul 2024 12:43:43 +0200
In-Reply-To: <308958f4c5689fd920c3915f4878850a09310b18.camel@web.de>
References: <20240711175156.4465-1-spasswolf@web.de>
	 <CAGp9LzoXMoAW6dVZjTf-JcD_wiU4yXpGwkLaVyWXTkaV2MOKwg@mail.gmail.com>
	 <adb192a59c44aa8708e80df30a6a47816a03e50f.camel@web.de>
	 <4e943a62736f955af5d9cd1aff7e2b9c084c8885.camel@web.de>
	 <2599b886-9c63-4989-a08a-7feab28f7c49@nbd.name>
	 <9fb7ac97d2ca472db469aefefbfeb94e0f886508.camel@web.de>
	 <308958f4c5689fd920c3915f4878850a09310b18.camel@web.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0TSoC0GQldjw10NePlY+xljFhTr7f/cL4xm+YTGY9RSJw+uv/nt
 Avr6ST0AF4l2w14rW6jjNu8kJUUKaZJ4s5N+hhCqcALws1xHtsMqw98NLsfqAah5fNmaNTS
 +5iNj8RAShkav2D2ZG3zIFE/0wYyxaKu7YyxHjNzQwf04yNmwjfsTny4SD5rECusIWN/TBl
 ZEt6F2TRd7P2+YSm7c0CA==
UI-OutboundReport: notjunk:1;M01:P0:7u4UlcLKQfs=;GI3AbUFi+RhUQHtInBWIYjyYqXF
 d7j24FakUCvXi2Pi6WNLSgRHXHsQbhuNvnwEx72gW4/v4LHuqclcsEJcYEhb3ANGqDXDXwxmX
 fpdy0RC0X4zEkvXJ3/lZAtt5T1SjoQY5IB9A3JdiCFemVY4pxQ12P7BpVc5XSxVfKvfuH6rv2
 iOFz7kkZXJGlvYJkR9Io4xNkuZiPXPBe+WOEx+/2vFkChLmXWXGP1fi6yVaCork/QwJDcBhzb
 eFJDrGTmXL5xDdXUkA5/pHq94HuDmGeSR2sm4BAKNBhUu5BN828nrVMvou0zgdiZ+bN7c/Y2a
 +4/kGbVr6otqbeimdednvFUXGVv9lpil47hyevMU5ZFUZOOtfcsvuLriLo727F8SWI/AKspkY
 6qO1wA7XolcSpxjcn2rwCX7kHa9c3Eq6RnT43zFTDExZw4310Fe8VcZiioZpLv1u537pOqxSF
 43cAUdunLAtZ8m+HbGPPvcaBfc4MT1NXM2tcxQTTjSjv9fqM/a93jUpxu8X7Brqa9lFMfcpYd
 Lcbq1PGwlQebw/mwpFO56Wq0jfEOivZGGWPydLn8GJ3Qk7f80rgiqBDOqCIh7DinOd7rjVRMP
 995vi+2Eavj/NlFNSwuc0y5NASN70PtcP6O63w17ya46EeGU7t2y8GlTasfxFXdiY/slYCeIg
 PE+aI/7po+yd2Jv0CA+0WmXPIJIi+TSakvvCIV2Bdu0PGbCGuNZcV4jt46Aa/O1Xv85nkRl5+
 s/Wcg/zo8PQRybLvriMvQV0KR9wINi1aQp2SSI+kFNorX9tZltVYVsix3VJ+0MD/S1pl2mbNF
 6OaziLyxVQTF82Vp6r37E3Zw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_034353_934061_0948D75F 
X-CRM114-Status: UNSURE (   3.87  )
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

I looked more close at the call trace of the warning and it seems that the
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
ch
uses mvif->phy)
and ieee80211_do_stop (which zeros the private data including mvif->phy).

Resend with fixed formatting.

Bert Karwatzki


