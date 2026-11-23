Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407AF606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 02:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yyOP7kr/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=De1Qm5wq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FuesKcfc1Js7WUTyCvTWz4Cz4pgickMp1cfQzWbE2CY=; b=yyOP7kr/Vp2MvBY2WXK8Avrtb9
	gIKSiF3rRsH3UyBj0lau/Z9J0ouezqX7OT6sxlwBnZLZZx1FOZQ3M9MDr6NHZOXal2ctZ8H3OSZBW
	alqSz4vk9C6v65UhHOLTp1x1sQ7tqZqGNl63cyr4PUY1+bnJydthQ5R+Bfiq3Z34/8SfjoOrzLQw8
	TIOrbDAWJQbUWZN9K8nAHv61ZGYeprv799olIrJVmHbwOeS/L7J7vB4RpbtKEQHHO4g+8fLvtvy6w
	/HOSPWgCWrWdV6mn4/PZs+c3tLwqT7GuZNExrTmTLapDgvJOg8sz1O90G9xBuJg20nrtSEbTE5vKf
	ePxVWRbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJmy-000000028Bq-2IKc;
	Mon, 23 Nov 2026 02:28:16 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJmu-000000028Ak-1dxc
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 02:28:13 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 006d021491bc7-71ad9f62e49so346614eaf.0
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Nov 2026 18:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400891; x=1796005691; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FuesKcfc1Js7WUTyCvTWz4Cz4pgickMp1cfQzWbE2CY=;
        b=De1Qm5wqguPZ15fZXyyUMJZCMKbuPm90M4g/UOx1u7/Uu7lBlO84VsYVS2ZofiUC8N
         EbfynRm+2c3SnzKC3hR01IwryxPbyTAPkKa6gi/N+cwbucqE3qZ1L5M4RPOz/D/dQWOL
         DOKKGn6ryAeCGASlJK2kQpR+oh3RfmE0NF0DxMPq27/+cuBzqh1jecW2JZ0RLs7oGOPM
         lY/ccnk+ICo8+bTxihBHcXtbSzG8mAo6gsbx0kIScKz0e6zplcDgIcNA4KlfttWZ59+o
         l7RKAYahoiDebWtn66E5V1AMqM62DLTyA63Ax1Vinw+U9vQiuBpVO1QZFsNUBOxEoaAJ
         hkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400891; x=1796005691;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FuesKcfc1Js7WUTyCvTWz4Cz4pgickMp1cfQzWbE2CY=;
        b=fxGfGbTenT3Eq3Uii1kGtuozLZbiX8Vf24SSIoY38KJXHAbi9VdIIuBn3FAxTvcc6c
         FDeDOEopCY5kjAyvQFxe2EOmoP/GJ7ewULWCTbA/fnSltuPXRVLv71WbbyeNK2zUqBVm
         M1rfEGTFDxOrNGENG308Cs4wNK7RtFujeFi++TC6Bwvkz5Q2hD33bNTsLJbg+oPVoraQ
         o8aASKlpo7Og6wPu6bbbk0Jxws9TJ4BKZd5/kZw6jlwW0dhtTBr/8+gdbH7Hlq7oAIuu
         8EGV4Wt+KGmHOYiUZX0fBc/+oOpnu3YunU9210HP0kA4SIfrUgplw7RGxoLkQ5OCJbqM
         iwyA==
X-Forwarded-Encrypted: i=1; AL+hErGbh+VuXKe/dYe1YDohFEnTBeRDrYR/nD1JcDfSXcWxPT7l7Am2niiOkrgqSqy7xDbPJogah5M3KuxlX8MiEQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9NQOxsSXf3hm25QKAFA2UoHYQk5o4fX+8Be3PVa+RvD3B1f597
	R+X1YuWGBtLUGeTlYgFHLBIWybdLoVIAZ5OJfVO14YlRGbzNpbfZpfLv
X-Gm-Gg: AZFdTZdW+obagCj1zqcNE/rENUdSPG0l9PcjlTfddy3A9hmz8uLtCX3RLSQnVe1ZZEL
	MVpz5UKLiDkybSCvbQCC+tCU3zqq4JwIZGWRU62/3WX2t/G5fOqSgMEi5lxx9CqCp1l+bY6ektg
	f517Nge/p7QwkHBXTpwJPxsb/TnkgwTNDL1o2j2O2Xv6q/w5gh4b1OOdhngoU3Y8cXs7KSQbk6a
	V60QUq0iFr+pGyQyvwQo/+hOBBY6gu7knV/gF9PsUxkcXuSmVg6Adc4+KKYW9m9uM6iEfKeIN2n
	d/Iv+TDeAXpiTYfwZpWEHyFNsDX6qluVXtI6p7wKWPVQCzKuwawfDAREZiSRA9r9wb4HfQmub6f
	n1hVUSOs80li7AqhvcsX0JllzaZ3/4aPPXy/OhMsCywjq7saUbW6EMYF/455eYuwS6eOCj8SMFG
	RF9+/Uu0DoXRNKfEL9r8u7484KcAw8/hWCD166dLtr+qhNLyfd77Jy1qmyKhnfYNaGW4o1s3p4D
	CFUq6Z33aaJDwSjxyJl767MCSZ4nsRMkdzo8E06Nun/7HlG8dnP0xxiErZ07bNiFS5CnY/inuBi
	CG6LNlUz6J5Mjk1Jwv1puPxH
X-Received: by 2002:a05:6808:10d0:b0:579:7ac6:3a80 with SMTP id 5614622812f47-57a06b2355amr11438197b6e.1.1795400890686;
        Sun, 22 Nov 2026 18:28:10 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3575f5bfsm7953975b6e.14.2026.11.22.18.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:28:09 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 22 Nov 2026 20:28:06 -0600
Subject: [PATCH] usb: mtu3: keep interrupts disabled in gadget completion
 callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-usb-mtu3-callbacks-irqs-off-v1-1-27733bb678c4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQrCMAwA0KuEfC9g41DoVcSPpks0ODdtnAhjd
 x/4DvBWDG2ugRlWbPr18HnCDKkDrPcy3ZR8wAzIBz6lxExLCD0/y5FqGUcp9RHk7R00m9E5iYm
 wDr1V7ABfTc1///1y3bYdQaxVlG0AAAA=
X-Change-ID: 20261122-usb-mtu3-callbacks-irqs-off-71bfbb2ed4fc
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795400888; l=3240;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Aex+y+91dtK8aIQ4sNmRyr8JQGY1Dd909+lkCK2MTzs=;
 b=M4YvQXt6noE/enwV80nd/23sRWZ6NXQcoF6/XGBBX6Drd8EoP1lXTTqbtd4nE9h11U0CS9Zz7
 YYjFJu75V3fBozGGwwgkXnSJ6bvpw58SqaekR/st0+fYeKjcOwSuAW5
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_182812_458490_98D0510D 
X-CRM114-Status: GOOD (  14.38  )
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

Commit 625dd9076e35 ("usb: mtu3: don't run gadget completion callbacks
with interrupts disabled") made the threaded mtu3_irq() take mtu->lock
with spin_lock_bh(). mtu3_req_complete() drops the lock with a plain
spin_unlock() around usb_gadget_giveback_request(), so the gadget
function's completion callback now runs with interrupts enabled.

That breaks the gadget API, struct usb_request's @complete "will always
be called with interrupts disabled". u_serial's console relies on it:
gs_console_complete_out() takes cons->lock with spin_lock(), and
gs_console_write() takes the same lock with spin_lock_irqsave() from
printk, which can then interrupt the callback on the same CPU while it
holds the lock.

Keep spin_lock_irqsave() in mtu3_irq() and disable bottom halves around
it instead, as dwc3 does in commit 84918a89d6ef ("usb: dwc3: gadget: Let
the interrupt handler disable bottom halves."). netif_rx() then finds
softirqs disabled and leaves them alone, the completion callbacks run
with interrupts disabled again, and the softirq netif_rx() raises runs
at local_bh_enable(), once the lock is dropped and interrupts are on.

Tested on an MT8173 tablet with PROVE_LOCKING, copying a 21 MB file over
USB ethernet three times per arm: with spin_lock_bh(), all 8,333 completion
callbacks ran with interrupts enabled; with this change, none of about
16,000 did, with no lockdep report and every copy intact.

Fixes: 625dd9076e35 ("usb: mtu3: don't run gadget completion callbacks with interrupts disabled")
Cc: stable@kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Greg, commit 625dd9076e35 in usb-linus is v1 of my mtu3 callbacks fix,
the one I asked you on 2026-11-03 not to apply. With spin_lock_bh() the
gadget completion callbacks run with interrupts enabled, which the
gadget API rules out. v2 [1] got no reply, so here is v2's change as a
fix on top of 625dd9076e35; the resulting mtu3_irq() is the same as v2's.

My bad for the original error in v1.

[1] https://lore.kernel.org/all/20261104-usb-mtu3-gadget-completion-callback-fix-v2-1-2769533a39cb@gmail.com/
---
 drivers/usb/mtu3/mtu3_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index fc274646fcde..f6677f58dd1f 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -790,9 +790,11 @@ static irqreturn_t mtu3_u2_common_isr(struct mtu3 *mtu)
 static irqreturn_t mtu3_irq(int irq, void *data)
 {
 	struct mtu3 *mtu = (struct mtu3 *)data;
+	unsigned long flags;
 	u32 level1;
 
-	spin_lock_bh(&mtu->lock);
+	local_bh_disable();
+	spin_lock_irqsave(&mtu->lock, flags);
 
 	/* U3D_LV1ISR is RU */
 	level1 = mtu3_readl(mtu->mac_base, U3D_LV1ISR);
@@ -813,7 +815,8 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 	if (level1 & QMU_INTR)
 		mtu3_qmu_isr(mtu);
 
-	spin_unlock_bh(&mtu->lock);
+	spin_unlock_irqrestore(&mtu->lock, flags);
+	local_bh_enable();
 
 	return IRQ_HANDLED;
 }

---
base-commit: b0baaf6cbb16bc773d0c76916aac17c44a6cd557
change-id: 20261122-usb-mtu3-callbacks-irqs-off-71bfbb2ed4fc

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


