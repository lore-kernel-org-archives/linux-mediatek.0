Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1673F606A326
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=myTrR69f;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GHRn4TLT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ntkvK9vArmmau6WntPJJCQysHHMrqtIZmeCGFS6XyDs=; b=myTrR69fe3VaxXU7efUqFhKqw+
	65M+RcYg9bmVPEZ7FtFjgJJDmfeSux4qLBf/UZmS4JAoaMMk00YHpO+zmurZpyj87qI6KYV2vIkUT
	4UNzLj4F4/WPMn+vuA24q9LsxgFqnsJpTAl4Ar8v+glXs6o8htdlR2hBFWBSYZ4hDJAh5scAm6O2B
	y8kjpGxWXoZc/MEKOv+co8LcHxxEZ0moBf6ilz9l4IIflz+dIO479aE2uO9P3EYlKwy6LwpkzVLeQ
	Mg1omgWYpAUl2k20uSUATtkMbNg3JZ7yavha9OTKffzDerBxQSNeyxNh1cdI5zqG229I4zWAFvDDs
	jIsju8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZOI-00000005DBA-35sf;
	Wed, 04 Nov 2026 11:42:54 +0000
Received: from mail-oo2-x09.google.com ([2607:f8b0:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZOE-00000005D9r-09yF
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Nov 2026 11:42:53 +0000
Received: by mail-oo2-x09.google.com with SMTP id 006d021491bc7-6de19ccd89bso131974eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Nov 2026 03:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792569; x=1794397369; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ntkvK9vArmmau6WntPJJCQysHHMrqtIZmeCGFS6XyDs=;
        b=GHRn4TLTtMJO7Z4vcGKavpgtmpwgnqMZq/pngVDwmYrxEU7OdT/QPWBNqQJWLuAuGv
         U9Gmi/HcFPJV/GY+9sn5AOpV6wB+YlSqAETGZeVduSBdMKLptdZ9ACg4r4rbpQWPTVbO
         +YYQOU9VvKHfKikpZaqgVmEIcHWyK/k3IwhFGNH0h7iLTY9oi3Dz40o0UwYPpZ8beVhB
         MXMv7VtRgTEPBuQajlwZKV/VwMSfhVgrT8PoxJ8kzlAxPoWzPdBdVkW1Ienapu+OC1cN
         cnuivuwey9zRNQFCSCikqjM8itG6rr6Ua3WGjjurZ3y7gjWbamfIa8HnTzvWwPr0rh/9
         22CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792569; x=1794397369;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ntkvK9vArmmau6WntPJJCQysHHMrqtIZmeCGFS6XyDs=;
        b=xohofGYD4JO32sD3rTJtIV341cpBDmmVMFuURjM1G1X3KifM1cGyDhrqRE9FjvvRWv
         e6NRIAgkoCL3jwFF20ZNgJsM5YFSxdPObg2DaiovHvKGN7im5t5kpcV00iTV2kOC8KkB
         7k0cgoW65ktZidi5TWaGKMQIrGCdlNRPAcoZb8IIRh5iSysk3uK9srhay4nzCJ+YAuqo
         b5WoS4qyFreyv3TumlUhsmMY12Ud+L/JptkIXD800o8S4oBU5viwpIbMElAvv5X5ADuE
         BCtXb32gRN5WeS1F3KeM0bLHNlj4LgLi4pulmuXB0Ur1bzZNHD7UlW3MKl+iWy0b3fHg
         RK9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxIOm44RFIl0uIYO7Bkqqxm6EFYNjSmWlS4OJvyLSmoDDU/x8jYekyYtHKidOHCCofyaf0n7+/tExy8pT74xQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9u4m6rs80VdOiR8R/ULrrgpgp3FMFxlMdTNN9WsUgBKcIt3696
	Ay9e+t7sJgZmF17+qW4DvFCRYYbDQOsaJqafltG5+J4w6JL/X5FvaBgWeob8lyXJN6w=
X-Gm-Gg: AYBFou3tDZ3xuu6jQ0pXd7BXShbsmh/Zo7p3/D+J9lBEn551EsD6Kza8cF1ZqEsC/UT
	3Oxss2yJZPPAz8JRWzGYC0HsZWqgqfZOJCJj2Y0jVxG1BmC43Tf1d32yecf1155ZABcoxKLy9Dz
	eSXkGiENQc/NuEzq3j9b295CbyZb/2AYzz+JSXYIprMk6NTRKtilwWL7SuxlOllevU4uPtf09Vf
	gqpRYJhO9Lxs644uSc+5huPjhimXlC+MGM73d9JZYcgqeQy3P6vHmc1j8314E9/OpfbcErmH1tf
	4usgDtWZ16UHF2uBwduw3uAhge1ptTy2ugqbWI8e0BOgzBsp5kXpY5NodfFs+/pHvHEfv8+N1ZC
	di4WkOZayF2wyTKbSm7nssQSzPOucno1AXk57vkpGmmcdaImsLBgR8y9Q2d9NmoFm9dClL9Sr4R
	9z6ymZh7SHy+VXJqUdjAMi9BE0jBrMpnrkBgtTwjO1hGbRFHSvrnbFbOc+74nefQCPPsqu/yqaO
	dnWHcTu7NWvvm8Snt7O2cK+9drC/7OUloooc+1kkDpDelFgVENbxamElWx4iT1PdacGB97zBU13
	hTDjjl0fQMx14uSvoBadDTPBDQ==
X-Received: by 2002:a05:6808:1806:b0:4b9:a88b:888e with SMTP id 5614622812f47-5640dd023c6mr10688054b6e.36.1793792568941;
        Wed, 04 Nov 2026 03:42:48 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9fdc42dsm1443858b6e.14.2026.11.04.03.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:42:47 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 04 Nov 2026 05:42:37 -0600
Subject: [PATCH v2] usb: mtu3: disable bottom halves in the threaded
 interrupt handler
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-usb-mtu3-gadget-completion-callback-fix-v2-1-2769533a39cb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5WOQQ6CMBBFr9LM2jEtJSKsvIdhUcoAo0BJWwiGc
 HcDnsDlT17+exsE8kwBCrGBp4UDuxEKkVwE2M6MLSHXUAhIZHKTudI4hwqHOGtsTd1SROuGqaf
 IbkRr+r4y9o0Nr1hrnTYZ5blRGVwETJ4aXk/Ts/ztMFcvsvG4P4iOQ3T+c6Ys6uD+ty4KFZJO7
 1LKtKFEP9rBcH+1boBy3/cvTtkLYfAAAAA=
X-Change-ID: 20260913-usb-mtu3-gadget-completion-callback-fix-d334f7e99a17
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793792565; l=4420;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=YKrWQc6X594nxsi6j6O7RkIqP4KUVuw16YHFth6q4aA=;
 b=kplKluc55m0ByUTEidjz+o5BPLPKs32RJFwusMLDnxrxB+Jj6Dr9y/he45mi/xR8jzpbfVMHO
 U0XTYhmgwiZAXt6/F6OextvdklivIZ3FMwQGkfV8KeBC0kS0DFH/xVd
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_034252_009255_A0AF3E3D 
X-CRM114-Status: GOOD (  16.75  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtu3_irq() is a threaded handler, so it runs in process context, and it
takes mtu->lock with spin_lock_irqsave(). mtu3_req_complete() drops the
lock with a plain spin_unlock() around usb_gadget_giveback_request(), so
the gadget function's completion callback runs with interrupts disabled,
as the gadget API promises, but in neither hardirq nor softirq context.

That breaks any callback that reaches netif_rx(). netif_rx() disables
bottom halves itself when it is called outside hardirq and softirq
context, and enabling them again with interrupts disabled is not
allowed:

  WARNING: kernel/softirq.c:453 at __local_bh_enable_ip+0x128/0x134
    __local_bh_enable_ip
    netif_rx
    rx_complete [u_ether]
    usb_gadget_giveback_request
    mtu3_req_complete
    mtu3_qmu_isr
    mtu3_irq
    irq_thread_fn

With CONFIG_TRACE_IRQFLAGS, __local_bh_enable_ip() ends with an
unconditional local_irq_enable(), so the plain spin_lock() re-taking
mtu->lock afterwards runs with interrupts on and is recorded
SOFTIRQ-ON-W, while mtu3_gadget_queue() takes the same lock from a
softirq (ncm's tx hrtimer), and lockdep follows up with an inconsistent
lock state report naming mtu->lock.

The locking was right when mtu3_irq() was a hardirq handler. It stopped
being right when the handler became threaded without a primary handler;
dwc3 hit the same thing the same way and fixed it in the controller
driver, in commit 84918a89d6ef ("usb: dwc3: gadget: Let the interrupt
handler disable bottom halves.").

Do the same: disable bottom halves around the lock in mtu3_irq().
netif_rx() then finds softirqs disabled and leaves them alone, the
completion callbacks keep running with interrupts disabled, and the
softirq it raises runs at local_bh_enable(), once the lock is dropped
and interrupts are on again.

Both reports need lockdep to be seen, but the context violation is real.
The fallout on a PROVE_LOCKING kernel is not cosmetic either - copying a
21 MB file over USB ethernet hung and reset this board repeatedly. Once
interrupts have been left enabled while the thread holds mtu->lock, the
tx hrtimer softirq on the same CPU spins on it forever, which is the
"CPU0: lock(&mtu->lock); <Interrupt> lock(&mtu->lock);" scenario lockdep
names. The same copy is reliable with this change applied.

Fixes: 13118959cb1a ("usb: mtu3: register mtu3_irq by threaded irq")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
v1 took mtu->lock with spin_lock_bh() in mtu3_irq(), which left
interrupts enabled across the gadget completion callbacks. Sashiko
pointed out that struct usb_request's @complete must run with them
disabled, and that u_serial's console relies on it [1]. v2 keeps
spin_lock_irqsave() and disables bottom halves around it, as dwc3 does.

This patch was developed with the help of an LLM.

[1] https://lore.kernel.org/all/sashiko-outbox-193807@kernel.org/
---
Changes in v2:
- Keep interrupts disabled across the completion callbacks: disable
  bottom halves around the existing spin_lock_irqsave() instead of
  taking the lock with spin_lock_bh() (Sashiko)
- New subject; v1 was "usb: mtu3: don't run gadget completion callbacks
  with interrupts disabled"
- Rebased onto v7.4-rc1
- v1 was resent on 2026-09-29 and 2026-11-02:
  https://lore.kernel.org/all/20261102-usb-mtu3-gadget-completion-callback-fix-v1-1-93c3a6dda31f@gmail.com/
- Link to v1: https://patch.msgid.link/20260913-usb-mtu3-gadget-completion-callback-fix-v1-1-e3480004fe23@gmail.com
---
 drivers/usb/mtu3/mtu3_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 990e2e8e6bc2..3127709acc22 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -793,6 +793,7 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 	unsigned long flags;
 	u32 level1;
 
+	local_bh_disable();
 	spin_lock_irqsave(&mtu->lock, flags);
 
 	/* U3D_LV1ISR is RU */
@@ -815,6 +816,7 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 		mtu3_qmu_isr(mtu);
 
 	spin_unlock_irqrestore(&mtu->lock, flags);
+	local_bh_enable();
 
 	return IRQ_HANDLED;
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260913-usb-mtu3-gadget-completion-callback-fix-d334f7e99a17

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


