Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733FBC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 06:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DScu2F9GlencqsVQe1ntWCrOn9yiVKDV5LAVRAHfOFk=; b=yyt95Lyu4DknVLuLwKdn3mUbQo
	PEomgeRNY42fqgXHC2waLQppM50jjwzCHiV79mKkFqp132mPKH0pGWpO93KuK133aJVkVcH/z5qvm
	dvAxYNVoPSkvQ5WXOoJ1cd1CQSBTwHnb7waMaU2ObafIi742RNBVlc3oTgneeD70TEJW1V5rOnqnV
	9BKZ+/FrqAfPJz0SYY8LqE6mzTJxkPaarztn5dZ1cBe5LDh+EmBAnLHG+o/UQ0quS6rC/O45Sju45
	DKgeOzEXtlfVmIkIIaShh4mb+LDJvCc2ppU5Mgc7Er2xwavJ7wr1YFupF4YRZ9NDDd780mCRYVuuy
	g81mnQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBF4-00000003fmZ-3Zaf;
	Thu, 02 Jul 2026 06:49:46 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBF0-00000003fm9-3PUy
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 06:49:45 +0000
Received: from [192.168.0.150] (ip5f5af106.dynamic.kabel-deutschland.de [95.90.241.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5C8004C2C37D69;
	Thu, 02 Jul 2026 08:49:34 +0200 (CEST)
Message-ID: <e36d0e98-db4b-43b8-b1bd-98687ed946c3@molgen.mpg.de>
Date: Thu, 2 Jul 2026 08:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 220564] hci0: ACL packet for unknown connection handle 3837
 and sound interruption
To: =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>,
 Sean Wang <Sean.Wang@mediatek.com>
Cc: luiz.dentz@gmail.com, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>,
 linux-bluetooth@vger.kernel.org, =?UTF-8?B?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?=
 <Will-CY.Lee@mediatek.com>
References: <bug-220564-62941@https.bugzilla.kernel.org/>
 <bug-220564-62941-11iNnkhOy2@https.bugzilla.kernel.org/>
 <90dc98dd-dcee-49ac-8050-abfe6b93775b@molgen.mpg.de>
 <e697d97e072b9211687fe15e5e28022faec35d0a.camel@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <e697d97e072b9211687fe15e5e28022faec35d0a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_234943_200373_DBC5E2EC 
X-CRM114-Status: GOOD (  25.56  )
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

[To: -mark-yw.chen@mediatek.com (bounced)]

Dear Chris,


Thank you for your instant reply.

Am 02.07.26 um 04:48 schrieb Chris Lu (陸稚泓):

> On Wed, 2026-07-01 at 18:32 +0200, Paul Menzel wrote:

>> Unfortunately, you do not have an account in the Linux Kernel Bugzilla,
>> so I am replying to this notification.
>>
>> Am 01.07.26 um 17:09 schrieb bugzilla-daemon@kernel.org:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=220564
>>>
>>> --- Comment #13 from Rob Hogan (robhogan@gmail.com) ---
>>> I'm pretty sure it's the same issue. Extract from syslog below:

[…]

>>> The full btmon log is too large to attach I think. Let me know if there's
>>> something else I should be turning on to help debug.
 >>
>> Claude Opus 4.8 analyzed:
>>
>> The decisive detail: the handle is byte-for-byte 3837 across three
>> unrelated reporters — different laptop, different speaker
>> (F0:EF:86:C3:50:D8 here vs. the Lenovo in comment #1), different
>> kernel.
>> Random corruption wouldn't land on the same handle every time. A fixed
>> value is a firmware sentinel. This is the ACL twin of the ISO
>> misbehaviour Pauli Virtanen already documented ("MT7925 continuously
>> sends invalid ISO packets")—related [1][2]—, and it's the same shape
>> as
>> the handles the MediaTek driver already intercepts:
>>
>>       // drivers/bluetooth/btmtk.c  btmtk_usb_recv_acl()
>>       case 0xfc6f: /* Firmware dump from device */ ...
>>       case 0x05ff: /* Firmware debug logging 1 */
>>       case 0x05fe: /* Firmware debug logging 2 */
>>           return hci_recv_diag(hdev, skb);   // routed to diag, NOT into L2CAP
>>
>> 0x2EFD isn't in that list, so it falls through to hci_recv_frame() →
>> hci_acldata_packet() → no matching connection → the error. So the
>> disconnect in Rob's syslog is likely a coincident A2DP timeout, not
>> caused by the log line — the spurious packet just shares the
>> timeline.
>>
>> Should the kernel ignore handle 3837?
>>
>> Two different places, two different answers:
>>
>> - In generic hci_core.c — no. HCI_CONN_HANDLE_MAX = 0x0eff, and 3837 =
>> 0x0EFD is inside the spec-valid range (just below the max). A
>> non-MediaTek controller could legitimately assign it. Dropping it
>> generically would silently break other hardware. So my rate-limit patch
>> is the right vendor-neutral change: it stops the flood without dropping
>> anyone's data.
>>
>> - In btmtk_usb_recv_acl() — probably yes, and that's the real fix,
>> routing these to hci_recv_diag() exactly like 0x05fe/0x05ff. That both
>> kills the spam and stops feeding garbage into L2CAP.
>>
>> But I won't add that magic number on inference alone, and here's the
>> honest gap:
>>
>> 1. I have no MediaTek doc confirming 0x2EFD/0x0EFD is a firmware-log
>> handle. The existing constants came from the vendor.
>> 2. The existing cases match the raw 16-bit value with a non-flag high
>> nibble (0x05ff, 0xfc6f). Ours has high nibble 0x2, which looks like a
>> real PB=start flag — so matching semantics (raw 0x2EFD? masked
>> 0x0EFD?
>> do fragments arrive as 0x1EFD?) aren't obvious, and a wrong mask
>> could drop real ACL fragments.
>>
>> To close that gap before touching the driver, the bug needs the full
>> btmon (Rob offered it), to confirm:
>>
>> - no HCI Connection Complete / LE Enhanced Connection Complete ever
>> assigns handle 0x0EFD, and
>> - the 0x?EFD packets always carry this same non-L2CAP payload and
>> never a real ACL fragment.
>>
>> @Mediatek, can you please confirm, that this handle should be
>> ignored.

>> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6dc22ab9f085ae165e4ce89d61fb426f94e8a969
>> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=edef6576853e51faa11bb286884c362ff7fc83a0

> From my initial look, ACL data with 0x2EFD is a diag event sent from
> Firmware layer. The reason why the data is being reported still needs
> further investigation. At least, I don't think it should be appearing.
> 
> Regarding your suggestion, adding it to the recv_acl function is one
> solution, but I'll bring this back for internal discussion to see
> whether disabling it from firmware would be more appropriate. If that
> turns out to be difficult, we'll then consider addressing it from
> driver side.

Understood. Keep in mind, as the firmware sending the diag event has 
been published and you cannot expect everybody updating the Linux kernel 
also updating the firmware, the Linux kernel driver should also be 
“fixed” to deal with the older firmware.

Also, I believe the reporters/commenters are annoyed by the audio 
interruptions. Please feel free to comment in the Linux Kernel Bugzilla 
issue, what diagnostics you need, and if this should be handled 
separately, like via email lists or a separate bug report.


Kind regards,

Paul

