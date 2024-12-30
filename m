Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DC8E7718F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2024 12:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q3+RJRivGMZfM8jB3C8pcPW0/7/xzowBnKz9QGfAazI=; b=o2ULGWKiOSXfHVwXBvIxiHL/WH
	HWKq76pa4QmUyw2zzv6SGWQE8H+oKlK2hl3shxpW/1hZa++tXnZCqdU80PCc1+p1k5cS1hABabHyq
	CQCkXBzmEreRHR4yjiFSc9+gVU5a2mLy8eXEZuUL1bc38BbqQBTJ+0VALgHpB9+/5HI0Ne1xo/Cnk
	tyyYHU4Km7Blvcyj6hvbCTt80NldoO+VsQETudKzjc4vMhYT4+L+8u2f7kSjedHmfx36Fn1maxuZf
	A+LVJU7+5PdTJ9adELbF+p6DqQXdEIwd6xbSpwvlWSFgeIAEvITjJHyqXAOv8UXS+Zwq7+eUSjyyf
	XgyMWbYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSFJS-00000005EbG-188X;
	Mon, 30 Dec 2024 12:56:02 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSDNS-000000054hb-2RG0
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Dec 2024 10:52:03 +0000
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so9407648e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Dec 2024 02:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735555920; x=1736160720; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3+RJRivGMZfM8jB3C8pcPW0/7/xzowBnKz9QGfAazI=;
        b=K26LbY50Yb958ywrIa0732/AL/BBSntVNh8nY8kReHr6YUqTc5hPOG3fkGJj60ujm4
         KNWt1IIOHrbQNH4lwEJcmsnlK1spvLalCzmq6KrErsN2cY8VsxzVg81uecIUXxUB3M1P
         f3cbrm3BZ87yQy+ME6o4JZv80nTEt8FbdmX/wXLovOb9JFqTOUvbUCLOeoJFMu1P++mP
         C4sf4YX+0WL6QfGhSjMGD3TEqyacUYclsgHsD6z/0lPL8yb8NQz0mptEI+jrq7866H7J
         rY9gF35kYzNuUJ0CFwOgdsiJt1sAMNLrwg/tqLwUMCjpCe/pnKg9aVHkDkZ6NOUF8QPe
         NBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735555920; x=1736160720;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3+RJRivGMZfM8jB3C8pcPW0/7/xzowBnKz9QGfAazI=;
        b=O0qEdd17coM/F6GoqVw3gRh9SEoiv9HyhYWlKyn/7BGqhyGmcY7FQdYXC4njwN5zqO
         QutC06jjODUifbDssqD0xLehc93s6fOtpm/9R69F3zPOTzmHnXOBNtKHmBk8ZyC7ksV0
         vDLPa94e+9FICBRtisKhq8Eublulep5hrmralb6yOajaK1GFo6oy3rjdZQfX5kYaIyuH
         6/Ye2Pvd9vZYgp4bK+oMO6HWVqt2uHFPWfuAahuT5PmcyKdrMIsa1bHMgOdm9S6iPT40
         /IRx5+rZzSJK2zWf7dSW6eBS5w4rX/dXqS/jQy5fZG6gw1eQE1h7Z4irbghQlGrVwTBe
         6akQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIRQJF5uOesWfLI2jAZVlgAK81lYGVofZq4F+hPPVqFkVsWavHCcjMF7XHHBK5+fekby6CCIv6utzx4dryHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiusXllGtqdbY9JOs6TTZwt4Ke960EhbQ+MC4VO42KZrASmrji
	mw7+bZStHwyKYNVZeId20Gmn34/wsO2thMnBrntL0sP86f1K1hfR
X-Gm-Gg: ASbGnctU4ZlZprTr7jBHgvJuJVKNvBn0MEqosf5/eAsVRCH6tyS+jkfAZfccA3JdwbX
	eHjo33ckqHZDEWTIJ57Y0uSN3A0Da2evr+DD0UHuzznWpVv9MbK+NiJeFmNx1gOFGvM3IRz4mN3
	zmzoHPRR5IkVitwMRrVrWFFNy+SIr6vAq/7K5TW50w9OogpVUjhcu4vSOqNnxFXjcat/bYbNwEh
	/g8z4IOxlwPbgQT7EQfT0s+PmVNCIDyaoi9DqlIvhDvGqc8hgWUcz/yQ4AfJWnhLA6ZUbP46P0x
	1bZtd/d7vf2zRCfUxXOk
X-Google-Smtp-Source: AGHT+IF2V/AQHJ4sC1r4bukuTr+sQoV3QZYo/fZSo+S9RxR5O0N/R86h9CtUv9IEL3uDWMWDcoUuTw==
X-Received: by 2002:a05:6512:6d3:b0:542:28b4:23ad with SMTP id 2adb3069b0e04-54229530096mr12288185e87.16.1735555919380;
        Mon, 30 Dec 2024 02:51:59 -0800 (PST)
Received: from localhost (broadband-5-228-116-177.ip.moscow.rt.ru. [5.228.116.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6019sm3028523e87.5.2024.12.30.02.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 02:51:59 -0800 (PST)
Date: Mon, 30 Dec 2024 13:51:58 +0300
From: Fedor Pchelkin <boddah8794@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	stable@vger.kernel.org
Cc: Chris Lu <chris.lu@mediatek.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, linux-mediatek@lists.infradead.org
Subject: Request to backport fixes for crash in hci_unregister_dev() to 6.12.y
Message-ID: <ky2pwjrcwd42h24rkvlanyj3ty53orpyirm34hpo74lehhpg3n@3mnfibfr6yxm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_025202_618904_AED75029 
X-CRM114-Status: UNSURE (   7.52  )
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

On 6.12 there is a kernel crash during the release of btusb Mediatek
device.

list_del corruption, ffff8aae1f024000->next is LIST_POISON1 (dead000000000100)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:56!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
CPU: 3 UID: 0 PID: 3770 Comm: qemu-system-x86 Tainted: G        W          6.12.5-200.fc41.x86_64 #1
Tainted: [W]=WARN
Hardware name: ASUS System Product Name/PRIME X670E-PRO WIFI, BIOS 3035 09/05/2024
RIP: 0010:__list_del_entry_valid_or_report.cold+0x5c/0x6f
Call Trace:
<TASK>
hci_unregister_dev+0x46/0x1f0 [bluetooth]
btusb_disconnect+0x67/0x170 [btusb]
usb_unbind_interface+0x95/0x2d0
device_release_driver_internal+0x19c/0x200
proc_ioctl+0x1be/0x230
usbdev_ioctl+0x6bd/0x1430
__x64_sys_ioctl+0x91/0xd0
do_syscall_64+0x82/0x160
entry_SYSCALL_64_after_hwframe+0x76/0x7e

Note: Taint is due to the amdgpu warnings, totally unrelated to the
issue.

The bug has been fixed "silently" in upstream with the following series
of 4 commits [1]:

ad0c6f603bb0 ("Bluetooth: btusb: mediatek: move Bluetooth power off command position")
cea1805f165c ("Bluetooth: btusb: mediatek: add callback function in btusb_disconnect")
489304e67087 ("Bluetooth: btusb: mediatek: add intf release flow when usb disconnect")
defc33b5541e ("Bluetooth: btusb: mediatek: change the conditions for ISO interface")

These commits can be cleanly cherry-picked to 6.12.y and I may confirm
they fix the problem.

FWIW, the offending commit is ceac1cb0259d ("Bluetooth: btusb: mediatek:
add ISO data transmission functions") and it is present in 6.11.y and
6.12.y.

6.11.y is EOL, so please apply the patches to 6.12.y.

[1]: https://lore.kernel.org/linux-bluetooth/20240923084705.14123-1-chris.lu@mediatek.com/

--
Thanks,
Fedor

