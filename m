Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD694E77198
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2024 14:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbbMSaNXSeO2beydQg3jrpWcwqFx2MWW2dfl9ap7sg4=; b=jI9mXao4zITs3QAwp1PhE0NFEh
	2PVAxmeL4vrG0PxYg15le8lQrgm0WyrK6Yq8XmGLSUEwTqPYET1ea83S17oUhPwbvZcw0P2V6AtRh
	8YZyCx8I5XglEzRV3+OP7hFjpQ8YvDAez8E38rtdSOlT8wUe8mMOaQ1NeD1TLDK/K3KorRmmWm1z/
	Cm9xM5ToYNfOCz1RpKuiitpgAJLsnBIyeyFsXkpbetnerSMY7lNMvA+jLVWp4Xr5hKZaem19aWt0/
	64sZD+tCiRtLC1lVmahVGIyaoFFBu90ulQ2HENE7LjGThcBSmsJww7uPp3AyvFRftf+1yhYAsXTo9
	n/yvZ78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGal-00000005Ktn-11CK;
	Mon, 30 Dec 2024 14:17:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGa0-00000005KqN-32bX
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Dec 2024 14:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A12195C5ACF;
	Mon, 30 Dec 2024 14:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772C8C4CED0;
	Mon, 30 Dec 2024 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735568231;
	bh=zNBFk8TTTDsqJLI9KoKTTzxyLrG+qS44xVVB5xWNMNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWDaOGs12JJsZPcJhvau/68uNzgF72CHTpT9DsJDjyLetw6iJ16BWxUuJ9wg+rli+
	 Cfd6R96utNfWBmBsUOnz2hJQyzyzBQ93GrTgur7SbLwsMIK7f9aUk1AwHaH9mVbJny
	 9Yp8arKZNVIV4Yxz9wbHD3Kv1is1wpWmpeQQrfAk=
Date: Mon, 30 Dec 2024 15:17:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fedor Pchelkin <boddah8794@gmail.com>
Cc: stable@vger.kernel.org, Chris Lu <chris.lu@mediatek.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: Request to backport fixes for crash in hci_unregister_dev() to
 6.12.y
Message-ID: <2024123059-luckily-baking-e397@gregkh>
References: <ky2pwjrcwd42h24rkvlanyj3ty53orpyirm34hpo74lehhpg3n@3mnfibfr6yxm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ky2pwjrcwd42h24rkvlanyj3ty53orpyirm34hpo74lehhpg3n@3mnfibfr6yxm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_061712_813790_38A8EEF3 
X-CRM114-Status: GOOD (  11.81  )
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

On Mon, Dec 30, 2024 at 01:51:58PM +0300, Fedor Pchelkin wrote:
> On 6.12 there is a kernel crash during the release of btusb Mediatek
> device.
> 
> list_del corruption, ffff8aae1f024000->next is LIST_POISON1 (dead000000000100)
> ------------[ cut here ]------------
> kernel BUG at lib/list_debug.c:56!
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 3 UID: 0 PID: 3770 Comm: qemu-system-x86 Tainted: G        W          6.12.5-200.fc41.x86_64 #1
> Tainted: [W]=WARN
> Hardware name: ASUS System Product Name/PRIME X670E-PRO WIFI, BIOS 3035 09/05/2024
> RIP: 0010:__list_del_entry_valid_or_report.cold+0x5c/0x6f
> Call Trace:
> <TASK>
> hci_unregister_dev+0x46/0x1f0 [bluetooth]
> btusb_disconnect+0x67/0x170 [btusb]
> usb_unbind_interface+0x95/0x2d0
> device_release_driver_internal+0x19c/0x200
> proc_ioctl+0x1be/0x230
> usbdev_ioctl+0x6bd/0x1430
> __x64_sys_ioctl+0x91/0xd0
> do_syscall_64+0x82/0x160
> entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> Note: Taint is due to the amdgpu warnings, totally unrelated to the
> issue.
> 
> The bug has been fixed "silently" in upstream with the following series
> of 4 commits [1]:
> 
> ad0c6f603bb0 ("Bluetooth: btusb: mediatek: move Bluetooth power off command position")
> cea1805f165c ("Bluetooth: btusb: mediatek: add callback function in btusb_disconnect")
> 489304e67087 ("Bluetooth: btusb: mediatek: add intf release flow when usb disconnect")
> defc33b5541e ("Bluetooth: btusb: mediatek: change the conditions for ISO interface")
> 
> These commits can be cleanly cherry-picked to 6.12.y and I may confirm
> they fix the problem.
> 
> FWIW, the offending commit is ceac1cb0259d ("Bluetooth: btusb: mediatek:
> add ISO data transmission functions") and it is present in 6.11.y and
> 6.12.y.
> 
> 6.11.y is EOL, so please apply the patches to 6.12.y.

All now queued up, thanks.

greg k-h

