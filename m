Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A5FC88E5C
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2026 22:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k3ZJJYWLWAdknGD5xgQyF6oWUgV2YSWXzpw9ViLpMPo=; b=hkzS9WWSQYTduGRwi99tgdWz1v
	klMtz8F8NlprGIotFYHePtPgQ+djwL59TlHR/DuRimWl3NbSYbw0iba5k3sZipNPwWgOgr8/9MFiS
	hfSDz05UB4gHut611wgnDx3ZkEIaT/6CZAhINLLHPmzvsO5MDzRNROMP/CiJ5xVhfuDBYXhBaJn3E
	wpJ6UGdoWY0wTvw39iPklY+pX3z30KNvS6YmZWIiXG+nSC9rfIH+m93WvwrRq4Pl3EVX0LJ9F/IOF
	LjcpyPqIS7sRvkTK2Iouzam42CuU99ZIN3UvPDKDeREeOTlP6E3jLKJ99sUQ1IwTNSTQzXsEZXCMM
	j/4ipc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5sZp-000000024IC-2aYg;
	Sun, 13 Sep 2026 22:21:33 +0000
Received: from mail-oo2-x07.google.com ([2607:f8b0:4864:31::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5sZn-000000024HW-0XxL
	for linux-mediatek@lists.infradead.org;
	Sun, 13 Sep 2026 22:21:32 +0000
Received: by mail-oo2-x07.google.com with SMTP id 006d021491bc7-6b1bebb3ae8so1110685eaf.1
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2026 15:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789338090; x=1789942890; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k3ZJJYWLWAdknGD5xgQyF6oWUgV2YSWXzpw9ViLpMPo=;
        b=ms3B6d+1Sb/7qPGSY1SyaaCK3JP+SzwhjVFl/nqv0/4IZhtRixyQQ4Pu/Aw0YI+Kvi
         MSE0Sz+3HWZ6tzkjOlg7bpYAN1c4YdG+8eohF+yVp22TcQME4x8YMJvC3Y/fT3Tq15ZX
         ic4kqSOuazjsRIl6omQ/6XwHud5EyiXbqcVnLnxjND7U7gmAs5LBxwWDNpA7eD8H7PII
         gyVMgWBD6w7fjOFnuonxOJGcVt+UzEAcRqgnvEzRieEC/x0g5NlpTaMLv0Lub900bk28
         ZnI9qaEdcB29k2a8ud+E92LTnQtbGI2vNKzanqwmfCXYNtY3C5d+8F/SWJHmndZiBWJE
         JODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338090; x=1789942890;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k3ZJJYWLWAdknGD5xgQyF6oWUgV2YSWXzpw9ViLpMPo=;
        b=iH3oHMKz42esaID+dFt3xIX93RYBQOdHzE+87AA422MhSMziQnmIajsW58+HFqyubL
         OH9fnYTAjRJnGwPfnnUt8y2O27a/wnrd+FE3kJNYJ7EaVakuaj1e41H5RlVdibfrKoIE
         ZRXV2LBvvEvUh5K29hxbx97hbMpITcSVgJ+q1hUnQptOhrraH03ZWUTlJqJxquOX9/S9
         gAFV2fxTbwLYwJOeschkidvHyikrFJvRjbL/OaeVDShUhhEx+VYg3NIWnbCbnMaHPU53
         Ri3ck7gGorcjl8e5qwoxNSJSmm3xAn73Za5LtcRLcM8Y8HPftAjsr9qfPMParihA/y6y
         ol2g==
X-Forwarded-Encrypted: i=1; AKwUvBxlHAHvqiMI0HyEW0t1LySD7g0Yz5bCzYwEnkOMQYHC3MGirY6RSXtnxova/R71Ip2y7WEYahbQUMnh0+58Nw==@lists.infradead.org
X-Gm-Message-State: AFuF++nd8uALLCSEJVyemxrbX65Gxr75Co2VkkRL+FpxXq83b8c4fLiL
	P8/BLmDfGHyI+gVQS3gXfThYOZU/i4T6esHNMvtzCUsqZ+PUuGB5R1by
X-Gm-Gg: AYBFou3FlwonLDoxqarQT+r57rU5eMGcyq7NlpvMu8naqC6z1xa+Z2yHvWp6Sn9psqm
	GufAv1YzA2PsBnBOBKvqhwa2f2vpFaV5Yiv1dpAhxwS3Evd6tW+jfLa3+/xpMoL36HdC6vyZK5X
	CVXukAEeu8SR6pQrmubZwsiapM1Alb2bZangAFZkM7xAta57BB+pPjdGUHq6O2VhMc43BJAwHqX
	cdfSmhUX/QyG4X8ESDFyN5A929N1kd/kgZ4BK3AU9OaeFsD1TKYr+r7QgJsZRgSfCFMeNEwSn6S
	+Pmo/xJP/O0jLbKPTGu0uA1bNOu/usaLowyU29RwwH7AQPYI4PuEgZvso9/Ufy+bvnvCAD5dv4g
	TTfb9e58r3gnn7NlyX5w+toPFPcZs6IE+mmxHK3skq0qEvVyitxpHMLbHZyiR4+GpCNUC7lSjJs
	YgIqe9Rv7V6+vr8LSXtb8+QtYENj6jaq2MNviOFZyt2NpaAIttyhgLXkXtviV/7iSVwKg=
X-Received: by 2002:a05:6820:571c:20b0:6b6:4f90:a62a with SMTP id 006d021491bc7-6c0ba8280bbmr12189996eaf.11.1789338089833;
        Sun, 13 Sep 2026 15:21:29 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c342ec1ff5sm4343973eaf.14.2026.09.13.15.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:21:28 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 13 Sep 2026 17:21:25 -0500
Subject: [PATCH] usb: mtu3: don't run gadget completion callbacks with
 interrupts disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-usb-mtu3-gadget-completion-callback-fix-v1-1-e3480004fe23@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywrCMBBFf6XM2oGmEUv8FXGRxzRG0weZpAil/
 95Yl+fAPXcDphSI4d5skGgNHOapgrg0YF968oTBVYau7W6tEhILGxxzkei185TRzuMSKdcZWh2
 j0faDQ/iik/I69KSUFj3U2pKo6vPp8fwzF/Mmm3952PcDXmv8Q4sAAAA=
X-Change-ID: 20260913-usb-mtu3-gadget-completion-callback-fix-d334f7e99a17
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789338086; l=3820;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Tg9Kq8vx6MVWyGAb8N8rORP+uP72Obd3DRFlHL5xK4Q=;
 b=YprVcQaOfoVyeaf75GeW9nCb4J5m5vEY6QpXXbHYMQMmSn3VqJ7Ey/kLrFM279kQOjoN7ouGX
 GtYBNWkV6EVCWDGlBclQanK+2Ty+CLHAizBVeQxibpvONvTk2OdAOFk
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_152131_217183_34ABE560 
X-CRM114-Status: GOOD (  15.89  )
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


