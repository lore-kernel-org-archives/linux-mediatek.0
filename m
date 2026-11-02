Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A17606A923
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OEVKrEC6;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kZS8CW7y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=; b=OEVKrEC6TQP6n8i69yd+kqfrdq
	kPW+GsLZj71nbMHYx1dftci0wS0OxFEYQvJNLksm6oeg2vbtq4vhQZqH6OUFyyhE2cFJSeMz7yvFs
	/KqQRYYF76mDQo8iBn5YH1RUZ9TrcPnqErVvBIiFafA2nq7pDU23jSt38CuAMENS/gvk5CMwl6D2o
	WI9acfI5her28KkUawDRWVVo3A1cAJWI8R5PCes+YRP8pCTBTYm8ictEHKgPqxiSCGbZ0Ui+ISbSj
	lCf8idYtcceGOGefmBgSDekFS2tOeuS41/3v6ecQ2AwcDha+x0plWK3ahwH1G+NpyH47i4evnzTWK
	WVq1Lm3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuur-0000000HIoI-1ygk;
	Mon, 02 Nov 2026 16:29:49 +0000
Received: from mail-oa1-x41.google.com ([2001:4860:4864:20::41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuup-0000000HImz-2hoP
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 16:29:48 +0000
Received: by mail-oa1-x41.google.com with SMTP id 586e51a60fabf-4a89b4a59a1so3672465fac.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 08:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636986; x=1794241786; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
        b=kZS8CW7yCDuqtlqcXau66B3TjhOBJhUOpMGp7Y4d7sXw0QmzzDsfQAAnmcQHWCy3Fd
         JMBpz5HhgrivpAfOt+wGsJwJIUXcXJtNNQWxZgzar0rCtkvdmZcZa+h4glCLTg2oqEIB
         ffx5/AlXHI1/vg9gvTbZ04XMfvPZUlmSq/KSiPwo42RxLfys3+j0qzqTk2iCXVIiuYMb
         Ynhenr6zXjaX3ka+oysDtlJ6+26aquPbJDyXqIwm/m/H2/A1iYdUao1pdyN8FIxbGyWZ
         ta31wUcZSQHPrds5sMPJX5yQ+6yWT+65HMwCAQ+71bg4ScXPvi5LAzIdUpYqMJWSKyJx
         ljYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636986; x=1794241786;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
        b=JhIC6hEikSSelf227XTKkXpIAZO9jxFMSjhiX+8jOr237TaDH992vaeR+Aa0dTxb3r
         qfP8qRO4XOxQCRbLOTN2nJCewwNb5LPgLjdnq+SHjvNn/5xpP5ChwGgRo/HZEK4XK0MJ
         N/XtxCpkCTzT+k6ponwrL4W0qx+y/NH/iIA4b9L+TE+T3bJTfgSFarhbak4SoxehyAwO
         KB9I4IA/2FHJmqPRmKYXMdVrNh/vYUe24+rnsOlM2M1zKYJyFE7e+plfRYnAu32OZR0m
         MBnpcKhvXOnCN3rKPyksk6pOpE994/riig7s+81OSnDXcr4VVZ82h8zvdjmS7aAycFOH
         I7JQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSPBqwfQhAQ8I62gD0YmL6eAETbDxNkByU9uJNfD2K8FTmW1NFzblHlphcHA/eSqQkCb/l2X2g3Z7znYNFEw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8B8n+zIbfQ2JqrXw4N3VeF+l3gPwG9otWaGWftNgpR2PidcJi8
	7kH/v2Q5WeUDoRsAEg60qxzrncI5rpt4MUalQ1Cb/UlxuHAFw5iNcP+lvS3qPkwJLlY=
X-Gm-Gg: AYBFou3qyPl9xUgpGXg90A06AXHZWHL6V9AFz37f4vSf5/gX61Oh+7rWyjHoPCFhebS
	YY7zJ/y2TqAwbaBkuqInAFgZ5tchvJvzvYXtE7RyG0/vAaU67r82FBOa1PT8q4mSxRcbG23iBeD
	PtAcQxVG0VLOaW3r9YVL+n/Ke4CRCVPRMOgFFuWvwHXkxeJw5GgMeen/RNmBNz6Pz/5ticw5frd
	OqsOBYGF4cwElKQQd9AWFiJxPtZPwhPQXcJ41rrS/35lmpLNpwi4TNtSrNo0xKgVEyCJJrDSrBS
	u6PH2UKtIrIso92o+Ci0UqDn2NnACgmNIUoGj7o0E7Fcbh5P3P/CV9eb5cgAyoMzzmcCo3e4jOo
	1SzpavN5CZgC7ONJpTZqDiME3ldcqdlbhPiwFNd+sj2efyxoxId7nTweyPUQ5sJLn4QFhnq4wwR
	bTcq+KkKLlfiNEsHFF5JNlNXNZFqLEiFdNXUDLybQquFLZMfSTVg/IMHCX0a68+y1UlOtDPmOVp
	e3+X3m2a0hLWrZszZtzn8p/cz4FwKIcmAy5AwQ0Yry5NFcsnaI+k4Kondk3TpDiIkjvsI9b4oGK
	Ig81XAVlqlNDAjjr17sL7IlVTwMDiGnnT03rpY03SgxTRdGShZU/h9McTsmu9bz8edJl7KUaFng
	lWLhwkxcFEdwUyvQ+1VupXNXuvh7MwL74nMDA2bg6
X-Received: by 2002:a05:6870:169a:b0:470:e97e:8f88 with SMTP id 586e51a60fabf-4a8e099f2c1mr6622916fac.24.1793636986507;
        Mon, 02 Nov 2026 08:29:46 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167984dsm7251024fac.1.2026.11.02.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:29:46 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:29:45 -0600
Subject: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-usb-mtu3-gadget-completion-callback-fix-v1-1-93c3a6dda31f@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793636985; l=3859;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ctXSxhL8cB96oM2LlBR4kk7hbE12PJXfiPWlYJLZFo0=;
 b=S9dPlOrGvAhCl5WVQYdsJfPpa5BoiRYpZW64kvQU0m9zClp2Ht7qcVyfHxTiljy/6ZkSqDgd9
 C0E4bVjxXGFAHGsSwhRgWmeoEriZ/yCXt7Q3nhq0zbb8GwVF2AQUwWm
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_082947_699599_CAACF769 
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

mtu3_irq() is a threaded handler, so it runs in process context, but it
takes mtu->lock with spin_lock_irqsave(). mtu3_req_complete() then drops
the lock with a plain spin_unlock() around
usb_gadget_giveback_request(), which leaves hardware interrupts disabled
across the gadget function's completion callback.

That breaks any callback that reaches netif_rx(). Since the threaded
handler is in neither hardirq nor softirq context, netif_rx() takes its
local_bh_disable()/local_bh_enable() path, and enabling softirqs with
interrupts disabled is not allowed:

  WARNING: kernel/softirq.c:430 at __local_bh_enable_ip+0x17c/0x188
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

mtu->lock is never taken in hardirq context: the only handler is
threaded and has no primary handler, so disabling softirqs is enough.
Take it with spin_lock_bh() in mtu3_irq(). The completion callback then
runs with interrupts enabled and softirqs disabled, which is the context
netif_rx() expects. The other sites keep spin_lock_irqsave(), which is
strictly stronger and still correct; several of them really can be
reached from softirq context.

Both reports need lockdep to be seen, but the context violation is real:
netif_rx() wants either hardirq/softirq context or interrupts enabled,
and mtu3 gives it neither. The fallout on a PROVE_LOCKING kernel is not
cosmetic either - copying a 21 MB file over USB ethernet hung and reset
this board repeatedly before this change. Once interrupts have been
left enabled while the thread holds mtu->lock, the tx hrtimer softirq on
the same CPU spins on it forever, which is the "CPU0: lock(&mtu->lock);
<Interrupt> lock(&mtu->lock);" scenario lockdep names. The same copy is
reliable after it.

Fixes: 13118959cb1a ("usb: mtu3: register mtu3_irq by threaded irq")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/usb/mtu3/mtu3_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a40bf5bad2d5..ed0e426645fd 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -790,10 +790,9 @@ static irqreturn_t mtu3_u2_common_isr(struct mtu3 *mtu)
 static irqreturn_t mtu3_irq(int irq, void *data)
 {
 	struct mtu3 *mtu = (struct mtu3 *)data;
-	unsigned long flags;
 	u32 level1;
 
-	spin_lock_irqsave(&mtu->lock, flags);
+	spin_lock_bh(&mtu->lock);
 
 	/* U3D_LV1ISR is RU */
 	level1 = mtu3_readl(mtu->mac_base, U3D_LV1ISR);
@@ -814,7 +813,7 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 	if (level1 & QMU_INTR)
 		mtu3_qmu_isr(mtu);
 
-	spin_unlock_irqrestore(&mtu->lock, flags);
+	spin_unlock_bh(&mtu->lock);
 
 	return IRQ_HANDLED;
 }

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260913-usb-mtu3-gadget-completion-callback-fix-d334f7e99a17

Best regards,
--
Ryan Brue <ryanbrue.dev@gmail.com>
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


