Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE06606A338
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 15:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=saZsdey9;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UD+xWoNa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Unsubscribe-Post:
	List-Owner; bh=W5VFT6r2Y6eLDidBiMP68rdRUtzolvh9ZqNnQTEK/Ro=; b=saZsdey9HhAl7d
	tTw/tla2eWbqOsI9bMcGDMbvgwx4cMGEro9EjVq6EZIOvhOFIrRednX5s4G8VSEIwCnhZcUrDhe64
	38ptGG+VPiCO5j/bxjFEMiXdnok2okXYGwAx6lFpqI+VzU8iVcx9nqRA9a5hBVh4LypqAB12VuGbd
	k5x2gk+md7WvYgx3eTi9C958DEWVPcnBAslVbCNi3aLKLiRrzpc9kXk0pYQSZhVjP4An+dKTI7LKs
	MJVq4xhSlb1SS8haRwUccs9VB3BMFB1qmWQ4Yv6GGrVv/4ejqdTACGnRtr0IuQxFSXdUzEz3vcbdk
	VZK8P2g3+gluRsnntEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQo74-00000004Rk1-14xE;
	Tue, 10 Nov 2026 15:50:22 +0000
Received: from out-110.mta1.migadu.com ([95.215.58.110] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQo70-00000004RiR-1zCz
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 15:50:20 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2Mtu3r90e3i3e1eCCswxBpmz1VV1JltP8voYP2HAqiQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794325811; v=1; x=1794930611;
 b=UD+xWoNa2Y+VN8qwc/WrLIE9ITOL+Ik2z7MzcOBudOE21frl/HXA8u58ZogsZ3jE0R07C3R4
 s8iasIpIyJctDr3Uwt/mG4X6U0gVMRVdpMdzXUlGxHInre2IhkIRt6jhQBliyMoamARTvW60tjP
 wjAd3MA3KRKUImRbxc9fm1r4=
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 66c915b9da646c84;
	Tue, 10 Nov 2026 15:50:09 +0000
X-Mizu-Trace-ID: 66c915b9da646c84
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 15:50:04 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: leitao@debian.org
CC: angelogioacchino.delregno@collabora.com, ebiederm@xmission.com,
 kernel-team@meta.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, npiggin@gmail.com, oleg@redhat.com,
 peterz@infradead.org, stable@vger.kernel.org,
 syzbot+8fdf0d8e10bdde1c2e88@syzkaller.appspotmail.com
Subject: Re: [PATCH] reboot: halt when power off fails
In-Reply-To: <20261110-reboot-make-task-dead-v1-1-af88a3f37bf7@debian.org>
Message-ID: <1DE3FCD9-C973-4B83-AD64-CB6130CDF39D@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_075018_808313_8E3CA980 
X-CRM114-Status: GOOD (  13.58  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10 November 2026 15:24:34 GMT, Breno Leitao <leitao@debian.org> wrote:
>The reboot syscall calls do_exit(0) when kernel_power_off() returns.
>That happens when no power off handler takes the machine down, since
>machine_power_off() returns to its caller on x86, arm, arm64 and sh.
>
>For example, an x86 kernel built with CONFIG_ACPI_REDUCED_HARDWARE_ONLY
>cannot power off QEMU's pc and q35 machines. Their FADT is not
>hardware-reduced, so acpi_power_off() is still registered. But the
>legacy sleep code is compiled out and the FADT has no sleep control
>register, so acpi_enter_sleep_state() returns AE_NOT_EXIST.
>
>On x86, arm and arm64, interrupts are disabled by then, and do_exit()
>warns. syzbot hit this on a GCE VM:
>
>  ACPI: PM: Preparing to enter system sleep state S5
>  kvm: exiting hardware virtualization
>  reboot: Power down
>  ------------[ cut here ]------------
>  irqs_disabled()
>  WARNING: kernel/exit.c:930 at do_exit+0x1cf7/0x2ae0 kernel/exit.c:930, CPU#0: init/6193
>  CPU: 0 UID: 0 PID: 6193 Comm: init Tainted: G             L      syzkaller #0 PREEMPT(full)
>  Call Trace:
>   <TASK>
>   __do_sys_reboot+0x36e/0x400 kernel/reboot.c:784
>   do_syscall_64+0x115/0x840 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>   </TASK>
>
>If the caller is init, do_exit() then panics. Exiting does not help
>the other callers either: the devices are already shut down, and the
>task still holds system_transition_mutex.
>
>Halt instead, as the syscall already does when no power off handler is
>registered, and as most other architectures do in machine_power_off().
>
>Use machine_halt() rather than kernel_halt(). kernel_power_off() has
>already run the shutdown sequence, and kernel_halt() would call the
>reboot notifiers again with interrupts disabled.
>
>Keep the fallback in the syscall. hw_failure_emergency_action_func()
>relies on kernel_power_off() returning, so that it can try an
>emergency restart.
>
>Fixes: 001c28e57187 ("exit: Detect and fix irq disabled state in oops")
>Reported-by: syzbot+8fdf0d8e10bdde1c2e88@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=8fdf0d8e10bdde1c2e88
>Suggested-by: Oleg Nesterov <oleg@redhat.com>
>Link: https://lore.kernel.org/all/20250404152006.GF3720@redhat.com/
>Link: https://lore.kernel.org/all/20260713062332.21131-1-include@grrlz.net/
>Cc: stable@vger.kernel.org
>Signed-off-by: Breno Leitao <leitao@debian.org>
>---
>This is my second attempt at fixing this. The first one silenced the
>warning in do_exit() pre LLMs:
>https://lore.kernel.org/all/20250403-exit-v1-1-8e9266bfc4b7@debian.org/
>
>Bradley Morgan tried twice, first enabling interrupts before do_exit(),
>then calling make_task_dead():
>https://lore.kernel.org/all/20260712125300.31501-1-include@grrlz.net/
>https://lore.kernel.org/all/20260713062332.21131-1-include@grrlz.net/
>
>Tze-nan Wu hit a related init panic during power off:
>https://lore.kernel.org/all/20250410143937.1829272-1-Tze-nan.Wu@mediatek.com/
>
>All of these still let the task exit. In those threads Oleg and
>Christian said init should not exit on power off at all, so this
>version halts instead.
>---
> kernel/reboot.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/kernel/reboot.c b/kernel/reboot.c
>index 9a84401adde5a0..bc71183d4ad870 100644
>--- a/kernel/reboot.c
>+++ b/kernel/reboot.c
>@@ -791,6 +791,9 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
> 
> 	case LINUX_REBOOT_CMD_POWER_OFF:
> 		kernel_power_off();
>+		pr_emerg("Power off failed: System halted instead\n");
>+		/* kernel_power_off() already ran the shutdown, only halt. */
>+		machine_halt();

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>

Id reckon this would fix it, go test syzbot if you'd wanna be confident :)

> 		do_exit(0);
> 		break;
> 
>
>---
>base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
>base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>change-id: 20261110-reboot-make-task-dead-8702e9b29130
>
>Best regards,
>--  
>Breno Leitao <leitao@debian.org>
>
>
>

--- Thanks!

