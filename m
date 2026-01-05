Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906CEC79F8C
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 13:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCGKWrqTbf+V7zMbQXTrS8bdrbfkz6WTW7AhYSNd6N8=; b=l9ePVvNAKgBzgZkZ/IEGReBy9z
	BBjbzpbkFrMb64a1FM2QoE1LJRDP/duPjeGte/tqRazDEaxqr5gLDJxNji/HbFmC54H4oNaM10OJl
	vzf52deESmZ7Bh4TtHkAW0S8EvmtZqzgXUUtfyvpxH3QNucYiGXC67Iscx718WGCrRisyGQlpKr22
	y/vf6Y0UkTrzkPzV3PnfKSkCGm/RWrzFi0jFDV3CsGIppU+trD6SV8Mxkmma9evDxyAXuuoF6Pm5W
	up3hxWjjF3AzfR47BciaEavgFATsqQBBWXUaGNi/ZgfaKXHFub1QQ8N47ATnfsVy0tsRZqPz35ORp
	cwHnwzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcksz-0000000BUco-0Ksk;
	Mon, 05 Jan 2026 13:44:41 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcksw-0000000BUcU-3a36
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 13:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=nCGKWrqTbf+V7zMbQXTrS8bdrbfkz6WTW7AhYSNd6N8=; t=1767620678;
	x=1768052678; b=MgA683qfoxndswz/f+PdzTuij+x/yC85k42wV0X0Q2eX8CXvwr+UhDGUa7HdR
	HBDW5J61GStZHMLKjZXcKi77K5uEOuvvUcDRQtZAAipx+Kutrofn8u8ur9tuvI3qWTPBlYYQyK7mA
	FZaAzAxxRX1fv2oK60gNTNHWoi+O2nSCFodnBZEeLdBzhv8ML8wkPxaCXYw7LC57cZyPzkl4Zb2Kr
	XOoemKeMKaZ60g3S/3593zy8qHcUpIT/Jwoluo3hVZsKyj4WB+S7XHXNp8sQfvxQKTz2DrQXAuY6T
	/trPpvIXTEJ8/TCUjFLNKhYGMG1LHeNMibZ+Yr8JVSR3Aeg2aA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vcksn-001d5i-0y;
	Mon, 05 Jan 2026 14:44:29 +0100
Message-ID: <6beab0bb-ed51-491a-bd64-15f3455ea628@leemhuis.info>
Date: Mon, 5 Jan 2026 14:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: strnlen buffer overflow in mt76_connac2_load_patch - 6.19-rc2
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Cc: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, regressions@lists.linux.dev
References: <aVBCFKub6vCFsFVB@mail-itl>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <aVBCFKub6vCFsFVB@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1767620678;73f161e0;
X-HE-SMSGID: 1vcksn-001d5i-0y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_054439_050848_B4381148 
X-CRM114-Status: UNSURE (   9.95  )
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

On 12/27/25 21:31, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> After updating to 6.19-rc2 I'm hitting the following panic on boot. It
> worked in 6.18.2. It is a Xen HVM domU with PCI device attached, this
> one specifically:
> 
> 02:00.0 Network controller [0280]: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E 80MHz [14c3:0608]
>
> And the crash is:

This looks somewhat similar to a report from Shuah Khan and likely was
fixed with af7809f037e6e5 ("Revert "wifi: mt76: Strip whitespace from
build ddate"") in v6.19-rc4. Please let us known if that is not the case.

Ciao, Thorsten

>     ------------[ cut here ]------------
>     strnlen: detected buffer overflow: 17 byte read of buffer size 16
>     WARNING: lib/string_helpers.c:1035 at __fortify_report+0x4f/0x90, CPU#1: kworker/1:1/51
>     Modules linked in: mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 intel_rapl_msr intel_rapl_common mac80211 ghash_clmulni_intel cfg80211 rfkill ehci_pci libarc4 pcspkr ehci_hcd igc ata_generic i2c_piix4 pata_acpi i2c_smbus serio_raw xen_scsiback target_core_mod xen_netback xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn i2c_dev fuse loop nfnetlink overlay xen_blkfront
>     CPU: 1 UID: 0 PID: 51 Comm: kworker/1:1 Not tainted 6.19.0-0.rc2.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full) 
>     Hardware name: Xen HVM domU, BIOS 4.19.4 12/21/2025
>     Workqueue: events mt7921_init_work [mt7921_common]
>     RIP: 0010:__fortify_report+0x4f/0x90
>     Code: 48 83 fb 11 73 34 40 84 ed 48 c7 c0 02 62 d4 86 48 c7 c1 0c 62 d4 86 48 8b 34 dd 40 3d 54 86 48 0f 44 c8 48 8d 3d e1 af a5 01 <67> 48 0f b9 3a 48 83 c4 10 5b 5d e9 1c fb 4d ff 48 89 34 24 48 c7
>     RSP: 0018:ffffd1b3801bbd38 EFLAGS: 00010246
>     RAX: ffffffff86d46202 RBX: 0000000000000001 RCX: ffffffff86d46202
>     RDX: 0000000000000011 RSI: ffffffff86d15c86 RDI: ffffffff8747f5c0
>     RBP: 0000000000000000 R08: 0000000000000010 R09: ffffd1b380389000
>     R10: ffffd1b3801bbc40 R11: 00000000ffffffff R12: 0000000000000000
>     R13: ffffd1b380389000 R14: 0000000000001000 R15: 0000000000000000
>     FS:  0000000000000000(0000) GS:ffff8d0ac8c52000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 000076de8e89f001 CR3: 000000000f4bb000 CR4: 0000000000750ef0
>     PKRU: 55555554
>     Call Trace:
>      <TASK>
>      ? request_firmware+0x3e/0x50
>      __fortify_panic+0xd/0xf
>      mt76_connac2_load_patch.cold+0x2b/0xe4 [mt76_connac_lib]
>      mt792x_load_firmware+0x36/0x150 [mt792x_lib]
>      mt7921_run_firmware+0x23/0xd0 [mt7921_common]
>      mt7921e_mcu_init+0x4c/0x7a [mt7921e]
>      mt7921_init_work+0x51/0x190 [mt7921_common]
>      process_one_work+0x18d/0x340
>      worker_thread+0x256/0x3a0
>      ? __pfx_worker_thread+0x10/0x10
>      kthread+0xfc/0x240
>      ? __pfx_kthread+0x10/0x10
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork+0x126/0x190
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork_asm+0x1a/0x30
>      </TASK>
>     ---[ end trace 0000000000000000 ]---
>     ------------[ cut here ]------------
>     kernel BUG at lib/string_helpers.c:1043!
>     Oops: invalid opcode: 0000 [#1] SMP NOPTI
>     CPU: 1 UID: 0 PID: 51 Comm: kworker/1:1 Tainted: G        W           6.19.0-0.rc2.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full) 
>     Tainted: [W]=WARN
>     Hardware name: Xen HVM domU, BIOS 4.19.4 12/21/2025
>     Workqueue: events mt7921_init_work [mt7921_common]
>     RIP: 0010:__fortify_panic+0xd/0xf
>     Code: 44 8b 14 24 e9 12 dc 9c 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 40 0f b6 ff e8 e3 f3 9c 00 <0f> 0b 48 8b 54 24 10 48 8b 74 24 08 4c 89 e9 48 c7 c7 16 5d d1 86
>     RSP: 0018:ffffd1b3801bbd60 EFLAGS: 00010286
>     RAX: ffffffff86d46202 RBX: 0000000000000000 RCX: ffffffff86d46202
>     RDX: 0000000000000011 RSI: ffffffff86d15c86 RDI: ffffffff8747f5c0
>     RBP: ffff8d0a4b752060 R08: 0000000000000010 R09: ffffd1b380389000
>     R10: ffffd1b3801bbc40 R11: 00000000ffffffff R12: 0000000000000000
>     R13: ffffd1b380389000 R14: 0000000000001000 R15: 0000000000000000
>     FS:  0000000000000000(0000) GS:ffff8d0ac8c52000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 000076de8e89f001 CR3: 000000000f4bb000 CR4: 0000000000750ef0
>     PKRU: 55555554
>     Call Trace:
>      <TASK>
>      mt76_connac2_load_patch.cold+0x2b/0xe4 [mt76_connac_lib]
>      mt792x_load_firmware+0x36/0x150 [mt792x_lib]
>      mt7921_run_firmware+0x23/0xd0 [mt7921_common]
>      mt7921e_mcu_init+0x4c/0x7a [mt7921e]
>      mt7921_init_work+0x51/0x190 [mt7921_common]
>      process_one_work+0x18d/0x340
>      worker_thread+0x256/0x3a0
>      ? __pfx_worker_thread+0x10/0x10
>      kthread+0xfc/0x240
>      ? __pfx_kthread+0x10/0x10
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork+0x126/0x190
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork_asm+0x1a/0x30
>      </TASK>
>     Modules linked in: mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 intel_rapl_msr intel_rapl_common mac80211 ghash_clmulni_intel cfg80211 rfkill ehci_pci libarc4 pcspkr ehci_hcd igc ata_generic i2c_piix4 pata_acpi i2c_smbus serio_raw xen_scsiback target_core_mod xen_netback xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn i2c_dev fuse loop nfnetlink overlay xen_blkfront
>     ---[ end trace 0000000000000000 ]---
>     RIP: 0010:__fortify_panic+0xd/0xf
>     Code: 44 8b 14 24 e9 12 dc 9c 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 40 0f b6 ff e8 e3 f3 9c 00 <0f> 0b 48 8b 54 24 10 48 8b 74 24 08 4c 89 e9 48 c7 c7 16 5d d1 86
>     RSP: 0018:ffffd1b3801bbd60 EFLAGS: 00010286
>     RAX: ffffffff86d46202 RBX: 0000000000000000 RCX: ffffffff86d46202
>     RDX: 0000000000000011 RSI: ffffffff86d15c86 RDI: ffffffff8747f5c0
>     RBP: ffff8d0a4b752060 R08: 0000000000000010 R09: ffffd1b380389000
>     R10: ffffd1b3801bbc40 R11: 00000000ffffffff R12: 0000000000000000
>     R13: ffffd1b380389000 R14: 0000000000001000 R15: 0000000000000000
>     FS:  0000000000000000(0000) GS:ffff8d0ac8c52000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 00006225eb492548 CR3: 000000000e1b3000 CR4: 0000000000750ef0
>     PKRU: 55555554
>     Kernel panic - not syncing: Fatal exception
>     Kernel Offset: 0x4c00000 from 0xffffffff80200000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> 


