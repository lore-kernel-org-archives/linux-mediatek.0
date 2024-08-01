Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23781C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 12:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbYBU0g1PDFZ6+yRzVBM4s7sIwBVy5IXaPrCJ87cuSc=; b=mB/ZDU2VvSCnKSerTUDmWPKHMq
	6S3aovNxTcHncKgXV/1vHo7qWCH3hhEcUpZTUDvc2HkJSki9bCEF0+Nsbd/uCBRTlDS7NGoZW3QZ3
	dfMY69hhYzHk8VVyEno0h7sANvxqDDvfVIYj32pQS4HN3nabtIf5VXKqDjjcOxbTPoUEFzZHo9wYP
	1EiYnaHoAqAnXtF4GJY6QYe0e6IGxyH+D435Tauc5k3w/SYs4p3fRvlNh0ijoTJ7aZr2+zNZJfnh0
	hlAa4cgIMOPR9q6M1lrjBv1Pb4LXEvpIJ/Lm5MJIlKKRAdtBQ6ziWWSQXpVHGvN5kx6CMIib890hG
	49Csd6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZV5M-00000005EhW-1AuF;
	Thu, 01 Aug 2024 12:39:12 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZV5J-00000005Egi-15c8
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Aug 2024 12:39:10 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2cfec641429so355845a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Aug 2024 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1722515948; x=1723120748; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MbYBU0g1PDFZ6+yRzVBM4s7sIwBVy5IXaPrCJ87cuSc=;
        b=IPyx9xB67r/+5QhvOcYCdXIWoHWf3UFM0GQwIwZTTh0wzUyf5I+ruld0f1uuLxe7G6
         gAhwqMa86fuZNfjkuc7qmdk9tN+vAse44REiaGr2cKpjJEWvH2TIx921KKCnTXhwVAL0
         t+t2MdnJEjAAi7dW4YBc5thI1CcDk7sfZPRjOidFcTsZ5irg7nW9nkIF6l4nUhBcgEOm
         wkIXuP6hBgKPef4/DmR7CNrKKPWeywyyqnkwgiJHL0IzFfvuHYeRITQovi5mjox96ReX
         9JJwutRnBJZsVMYGsJqhhN+3tznSdmZy7GLID0eLkMo4y3+Z/2sAJY6wZ+HlIJbGg1x+
         ekFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722515948; x=1723120748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbYBU0g1PDFZ6+yRzVBM4s7sIwBVy5IXaPrCJ87cuSc=;
        b=ohlNQgAg3Qwcjw8niyWJygN2f/J5KeAAOnDV3/7W757GbNCFnCOZWVroh8jC0MsrwO
         JZjAzumukmlpjtUMB2XGvqu+TJektvLfGTlJUdghMYJXUzuJp98roV2Lts6EEUnrsvfa
         IAz4R8mLoCKM8jwglm/t9N563e3xNWvm89p6z+RTH5mne+5dcg3/+LlnK+DqCiQSpTgV
         hRK44hGHU2c/qXS8vDinjTSarWIEx6EekA52Ipg0VHL6NSgwSFWkpPFvHPnr7agmpbHg
         xinmyy4p3uniZND/HxYIwMuYIBrztmAvR8KEUaz4pvuCIonyq2PjW4GUgnV0N+v55Bjd
         chLA==
X-Forwarded-Encrypted: i=1; AJvYcCX1/hrvxtGWUHEN8DtBlKZY9gDnPEu7+hFMhKU0/MkCa5pUf417wVYRWL/UmauY1H2gzezPl1JaNpdsvi8h/wW4aUNGr97iyF1z7vfX/Xmbrt6q
X-Gm-Message-State: AOJu0YzMw5mYhDQwLVifWxuyub9F7gSQVCKuVHwKl1bpXJv/gCHJmMIX
	C444QluuM5JLAkjutYcOjFRfVo0zpJZWN49gy5TNe6toAkqrTp24+6e7V10Gvz+qlc3LLX7mJ8s
	lwWCp/Ob2XfVi4mYmunz9/CJvN2tbUN4SdTBW
X-Google-Smtp-Source: AGHT+IFcAwRba/Wnq/d/tsC7gPw09U1eIez2hkzSdTwIOETKZUMnFEIqS0htBpssgcfUtPxxzgLZRtMlHGNpzqbH+Wg=
X-Received: by 2002:a17:90a:6282:b0:2c9:a015:ac2e with SMTP id
 98e67ed59e1d1-2cff940e47fmr31681a91.14.1722515947772; Thu, 01 Aug 2024
 05:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240718234633.12737-1-sean.wang@kernel.org> <0124ff39-7d63-49f8-bacd-3a40ce37ec4d@leemhuis.info>
In-Reply-To: <0124ff39-7d63-49f8-bacd-3a40ce37ec4d@leemhuis.info>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Thu, 1 Aug 2024 13:38:56 +0100
Message-ID: <CAHbf0-Hn=ZyYpk7bS1yLK7K3ZpfWKgt3-t=c9Nhdj3Ov3H84mQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7921: fix null pointer access in mt792x_mac_link_bss_remove
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: sean.wang@kernel.org, nbd@nbd.name, lorenzo.bianconi@redhat.com, 
	sean.wang@mediatek.com, deren.wu@mediatek.com, mingyen.hsieh@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Bert Karwatzki <spasswolf@web.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_053909_489683_70C9FC76 
X-CRM114-Status: GOOD (  17.27  )
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

I also saw the following after I restarted my router on two machines -
they both have this fix applied already:

Aug 01 08:59:33 quark kernel: BUG: kernel NULL pointer dereference,
address: 0000000000000008
Aug 01 08:59:33 quark kernel: #PF: supervisor read access in kernel mode
Aug 01 08:59:33 quark kernel: #PF: error_code(0x0000) - not-present page
Aug 01 08:59:33 quark kernel: PGD 0 P4D 0
Aug 01 08:59:33 quark kernel: Oops: Oops: 0000 [#1] PREEMPT SMP
Aug 01 08:59:33 quark kernel: CPU: 13 UID: 0 PID: 468 Comm:
NetworkManager Not tainted 6.11.0-rc1-tip+ #3200
9c927d6f3c59d826d15d8e39c195392d1d16b8a8
Aug 01 08:59:33 quark kernel: Hardware name: Micro Computer (HK) Tech
Limited EliteMini Series/HPBSD, BIOS 1.02 03/28/2024
Aug 01 08:59:33 quark kernel: RIP: 0010:mt7921_ipv6_addr_change
Aug 01 08:59:33 quark kernel: Code: 41 57 41 56 41 54 53 48 83 e4 f0
48 83 ec 50 48 8b 86 70 09 00 00 0f b6 8e 90 04 00 00 4c 8d ba 68 02
00 00 49 89 d6 4c 89 ff <48> 8b 58 08 88 4c 24 04 66 c7 44 24 05 00 00
c6 44 24 07 00 66 c7
Aug 01 08:59:33 quark kernel: RSP: 0018:ffffc900069373b0 EFLAGS: 00010282
Aug 01 08:59:33 quark kernel: RAX: 0000000000000000 RBX:
ffff888106740920 RCX: 0000000000000000
Aug 01 08:59:33 quark kernel: RDX: ffff888106854800 RSI:
ffff88810bb35ca0 RDI: ffff888106854a68
Aug 01 08:59:33 quark kernel: RBP: ffffc90006937420 R08:
0000000000000000 R09: ffff888104c98200
Aug 01 08:59:33 quark kernel: R10: ffffffff7fff0000 R11:
0000000000000020 R12: 0000000000000002
Aug 01 08:59:33 quark kernel: R13: 0000000000000000 R14:
ffff888106854800 R15: ffff888106854a68
Aug 01 08:59:33 quark kernel: FS:  00007f4265049400(0000)
GS:ffff888c2df40000(0000) knlGS:0000000000000000
Aug 01 08:59:33 quark kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Aug 01 08:59:33 quark kernel: CR2: 0000000000000008 CR3:
0000000117250000 CR4: 0000000000350ef0
Aug 01 08:59:33 quark kernel: Call Trace:
Aug 01 08:59:33 quark kernel:  <TASK>
Aug 01 08:59:33 quark kernel:  ? __die_body+0x66/0xb0
Aug 01 08:59:33 quark kernel:  ? page_fault_oops+0x39a/0x410
Aug 01 08:59:33 quark kernel:  ? exc_page_fault+0x59/0xa0
Aug 01 08:59:33 quark kernel:  ? asm_exc_page_fault+0x22/0x30
Aug 01 08:59:33 quark kernel:  ? mt7921_ipv6_addr_change
Aug 01 08:59:33 quark kernel:  ? __try_to_del_timer_sync
Aug 01 08:59:33 quark kernel:  ieee80211_ifa6_changed+0x68/0x120
Aug 01 08:59:33 quark kernel:  atomic_notifier_call_chain+0x45/0xc0
Aug 01 08:59:33 quark kernel:  addrconf_ifdown+0x521/0x7d0
Aug 01 08:59:33 quark kernel:  addrconf_notify+0x1ed/0x4a0
Aug 01 08:59:33 quark kernel:  raw_notifier_call_chain+0x45/0xb0
Aug 01 08:59:33 quark kernel:  __dev_notify_flags+0xf4/0x200
Aug 01 08:59:33 quark kernel:  dev_change_flags+0x49/0x50
Aug 01 08:59:33 quark kernel:  do_setlink+0x49b/0x1300
Aug 01 08:59:33 quark kernel:  ? terminate_walk+0x6b/0x100
Aug 01 08:59:33 quark kernel:  ? __nla_validate_parse
Aug 01 08:59:33 quark kernel:  ? filename_lookup+0xc7/0x1b0
Aug 01 08:59:33 quark kernel:  rtnl_newlink+0xb6a/0xde0
Aug 01 08:59:33 quark kernel:  ? __wake_up_sync_key+0x51/0x80
Aug 01 08:59:33 quark kernel:  ? scm_destroy+0xc/0x30
Aug 01 08:59:33 quark kernel:  ? security_capable+0x38/0x50
Aug 01 08:59:33 quark kernel:  rtnetlink_rcv_msg+0x2dd/0x330
Aug 01 08:59:33 quark kernel:  ? select_task_rq_fair
Aug 01 08:59:33 quark kernel:  ? rtnetlink_bind+0x30/0x30
Aug 01 08:59:33 quark kernel:  netlink_rcv_skb+0xb5/0xf0
Aug 01 08:59:33 quark kernel:  netlink_unicast+0x230/0x330
Aug 01 08:59:33 quark kernel:  netlink_sendmsg+0x3b1/0x460
Aug 01 08:59:33 quark kernel:  ____sys_sendmsg
Aug 01 08:59:33 quark kernel:  ? chacha_block_generic+0x6a/0x130
Aug 01 08:59:33 quark kernel:  ___sys_sendmsg+0x282/0x2a0
Aug 01 08:59:33 quark kernel:  ? __fget_files+0x95/0xb0
Aug 01 08:59:33 quark kernel:  __se_sys_sendmsg+0xf4/0x120
Aug 01 08:59:33 quark kernel:  do_syscall_64+0x7e/0x130
Aug 01 08:59:33 quark kernel:  ? pollwake+0x52/0x60
Aug 01 08:59:33 quark kernel:  ? do_task_dead+0x50/0x50
Aug 01 08:59:33 quark kernel:  ? __wake_up_locked_key+0x48/0x70
Aug 01 08:59:33 quark kernel:  ? eventfd_write+0x193/0x1b0
Aug 01 08:59:33 quark kernel:  ? syscall_exit_to_user_mode+0x93/0xc0
Aug 01 08:59:33 quark kernel:  ? vfs_write+0xfa/0x3d0
Aug 01 08:59:33 quark kernel:  ? __fget_files+0x95/0xb0
Aug 01 08:59:33 quark kernel:  ? __fget_files+0x95/0xb0
Aug 01 08:59:33 quark kernel:  ? ksys_write+0x8f/0xb0
Aug 01 08:59:33 quark kernel:  ? arch_exit_to_user_mode_prepare+0x11/0x50
Aug 01 08:59:33 quark kernel:  ? syscall_exit_to_user_mode+0x93/0xc0
Aug 01 08:59:33 quark kernel:  ? do_syscall_64+0x8a/0x130
Aug 01 08:59:33 quark kernel:  ? syscall_exit_to_user_mode+0x93/0xc0
Aug 01 08:59:33 quark kernel:  ? do_syscall_64+0x8a/0x130
Aug 01 08:59:33 quark kernel:  ? do_syscall_64+0x8a/0x130
Aug 01 08:59:33 quark kernel:  ? do_syscall_64+0x8a/0x130
Aug 01 08:59:33 quark kernel:  ? arch_exit_to_user_mode_prepare+0x11/0x50
Aug 01 08:59:33 quark kernel:  entry_SYSCALL_64_after_hwframe+0x4b/0x53
Aug 01 08:59:33 quark kernel: RIP: 0033:0x7f4264d31fae
Aug 01 08:59:33 quark kernel: Code: 20 89 54 24 1c 48 89 74 24 10 89
7c 24 08 e8 a9 75 f7 ff 41 89 c0 8b 54 24 1c 48 8b 74 24 10 b8 2e 00
00 00 8b 7c 24 08 0f 05 <48> 3d 00 f0 ff ff 77 3a 44 89 c7 48 89 44 24
08 e8 fd 75 f7 ff 48
Aug 01 08:59:33 quark kernel: RSP: 002b:00007ffff4b1afa0 EFLAGS:
00000293 ORIG_RAX: 000000000000002e
Aug 01 08:59:33 quark kernel: RAX: ffffffffffffffda RBX:
000055c35260c570 RCX: 00007f4264d31fae
Aug 01 08:59:33 quark kernel: RDX: 0000000000000000 RSI:
00007ffff4b1afe0 RDI: 000000000000000d
Aug 01 08:59:33 quark kernel: RBP: 00007ffff4b1b050 R08:
0000000000000000 R09: 0000000000000000
Aug 01 08:59:33 quark kernel: R10: 000000000000009d R11:
0000000000000293 R12: 0000000000000004
Aug 01 08:59:33 quark kernel: R13: 0000000000000000 R14:
0000000000000000 R15: 0000000000000000
Aug 01 08:59:33 quark kernel:  </TASK>
Aug 01 08:59:33 quark kernel: Modules linked in:
Aug 01 08:59:33 quark kernel: CR2: 0000000000000008
Aug 01 08:59:33 quark kernel: ---[ end trace 0000000000000000 ]---
Aug 01 08:59:33 quark kernel: RIP: 0010:mt7921_ipv6_addr_change
Aug 01 08:59:33 quark kernel: Code: 41 57 41 56 41 54 53 48 83 e4 f0
48 83 ec 50 48 8b 86 70 09 00 00 0f b6 8e 90 04 00 00 4c 8d ba 68 02
00 00 49 89 d6 4c 89 ff <48> 8b 58 08 88 4c 24 04 66 c7 44 24 05 00 00
c6 44 24 07 00 66 c7
Aug 01 08:59:33 quark kernel: RSP: 0018:ffffc900069373b0 EFLAGS: 00010282
Aug 01 08:59:33 quark kernel: RAX: 0000000000000000 RBX:
ffff888106740920 RCX: 0000000000000000
Aug 01 08:59:33 quark kernel: RDX: ffff888106854800 RSI:
ffff88810bb35ca0 RDI: ffff888106854a68
Aug 01 08:59:33 quark kernel: RBP: ffffc90006937420 R08:
0000000000000000 R09: ffff888104c98200
Aug 01 08:59:33 quark kernel: R10: ffffffff7fff0000 R11:
0000000000000020 R12: 0000000000000002
Aug 01 08:59:33 quark kernel: R13: 0000000000000000 R14:
ffff888106854800 R15: ffff888106854a68
Aug 01 08:59:33 quark kernel: FS:  00007f4265049400(0000)
GS:ffff888c2df40000(0000) knlGS:0000000000000000
Aug 01 08:59:33 quark kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Aug 01 08:59:33 quark kernel: CR2: 0000000000000008 CR3:
0000000117250000 CR4: 0000000000350ef0

On Wed, 24 Jul 2024 at 10:36, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
>
>
> On 19.07.24 01:46, sean.wang@kernel.org wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > Fix null pointer access in mt792x_mac_link_bss_remove.
> >
> > To prevent null pointer access, we should assign the vif to bss_conf in
> > mt7921_add_interface. This ensures that subsequent operations on the BSS
> > can properly reference the correct vif.
> >
> > [...]
> >> Fixes: 1541d63c5fe2 ("wifi: mt76: mt7925: add
> mt7925_mac_link_bss_remove to remove per-link BSS")
> > Reported-by: Bert Karwatzki <spasswolf@web.de>
> > Closes: https://lore.kernel.org/linux-wireless/2fee61f8c903d02a900ca3188c3742c7effd102e.camel@web.de/#b
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>
> TWIMC, Mike (now CCed) ran into the problem and on bugzilla confirmed
> that this fixes the problem:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=219084
> https://lore.kernel.org/all/CAHbf0-HOS-jdRGvJOBmEgaaox3PDbDSTgnnZkZF9pz37Bmh2iw@mail.gmail.com/
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.

