Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ACEC982D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 01:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQ1vqCiYyinbzAJglQK3AA19n9BUGKxeEFgjB2l0094=; b=Dm9ByNhOGkPcY7XlHwmgKoDR/S
	nICslossV7gM1p1NjXIrtICdzezIbFJBNtlu1vV5NDMXZ+VPTa1F/ntiiTrs9vRrOfMVtXV4+XsFp
	g0qdmnbQT0qh2nYYF/7BMeY8nBqo+Y1KFXZKmOwkVQFWagB4gFWE+Ydf43M2di5ujU6GQrWkwe8ed
	go/GVjvTwdO4jqMq/8pfE+ErdQ5Ax8nbMHb6j7yLS2yrSPG1W+iCLOzyNZTrLflR3lQ3Ill+olVoL
	SRN1AZDwgCH8n7h8m+CMSbH6zD4rrd4IEWVxiwgQXAVXyMLNYVp4QFEXTGNSAVy2E0vUcpspT9/b5
	QniuHbkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NkO-0000000DDDZ-3VSz;
	Fri, 18 Sep 2026 01:50:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NkJ-0000000DD99-0E4I
	for linux-mediatek@bombadil.infradead.org;
	Fri, 18 Sep 2026 01:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hQ1vqCiYyinbzAJglQK3AA19n9BUGKxeEFgjB2l0094=; b=NuLR9wUxKzojNuNM0Q+stABtI+
	g/rb/7Y/gvZk3eLzmBjODtIdRTPkhG8evL96pSEF5m7vGAnlFz7NFCDuRL7sBDnwMnXg+P/daXcqx
	MlA9L5cnwIDkF8VWnadoKtKb8znVMGjd6choRPrpDDerw690wgkH5KzeIQHqTOwEA+O8zNr1pInBY
	noGyXzM7FbHHR6Y4K2ick747t0+2r2Gj/MVUFS9udPGpcVFn1awt7Vffs6ZELFZx71kXkCjOgF092
	lxiR4i9ZJmWL8LBFaPkMK6I+OB5nQLFyBr0bJkh/crGefmkcsCLagN3CrDFfwtVC1lBYHbhGo072L
	FDDh9FvQ==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7NkE-00000009Urg-3tEr
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 01:50:33 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so1094065e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 18:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789696229; x=1790301029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQ1vqCiYyinbzAJglQK3AA19n9BUGKxeEFgjB2l0094=;
        b=Hvms/B4Tu48WXCIK8n9kihY0yHr4WcAfsVUbkocUtEAqiQTujGEqS6ykM5EX+FbKcL
         exKCTqyS5bqvCAX9tCMWDeLc/PODdN2EtBCuUnDeAL39n4SRA67XdiLPxl6udeBYjdyP
         GGKKp97q5hWV7TzemjOmZS6ULJlNQRdOBT3ra/Q9+tfIefxdxuf2ds9DiHzip24azDSF
         pCuPPPBbtrR1rs/pioiXmLbjGqBvw2MHaLEZ8be2GFpw71+aBxYTcYIS0iu+ACmUk17z
         1W0tcNrqv9bQaBQllm/tYywl5Oij7n1PyVZJEB9OQtPyzGScX3czwhS6pSJj9vnmIo+b
         jJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696229; x=1790301029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hQ1vqCiYyinbzAJglQK3AA19n9BUGKxeEFgjB2l0094=;
        b=v4ak2vEMDs2f6TA+Y9qDEj1tsJzAxsT96bZ0ulWh24KVTUpoBeqs3IT7HAXEKB+S8F
         Jj34Jgi+TfZUmpptnmRWi8Ta4Khh1sFi+bbZJpuKC3S3BPN4b2LI2IpP+3kUKrW8fve3
         f7943/WBpOnfbcGq3sKgsB5gZAp6ZBqtGm7cXH81Z+pGxlAXAvAP7rxpG9ZeQWVHHuF+
         9kN6OL8a5AmybaFgadK3LBxCudS5a6arP8aEWfkeIpd1dVCxcHNFVjaQo2zVGSwIpp8W
         ZlgXnBVuaoYGbPsNtYirWhclUeBvqqrqWc9Ga1h1cmcBBGi8utfNuK8lQYpRbUiK56+R
         VzIA==
X-Forwarded-Encrypted: i=1; AKwUvBzr2bMmffikoiBquwYkhgVRDzgA9XjYMGiEYfMqynwGV3m3VlBcEKfJojaZfqHQQddzLmlHAJCYhaEVtZe4bQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nh+0IXWmHldFQhXWTBgd2RTpRHH/XcaaOrsF87Y7ptTkZzofJa
	4FqcYrdiis6UXyBSAkQSOuL0Q9FkvECRaZ2ZAXnKCFnaUuZAyd3zNhDPNlEfG9oj7+c=
X-Gm-Gg: AYBFou3KIOCv78YYpG16ogwjABJR/T1UAXOrht1p9IcQbreeX2bKZ+pPClnK8uXvAIx
	ZrIcANHYuNyAXRqt2W9A86939MH1W2ZOSm4UNQcgyfnB8tk/IjQbIws32SJCogA3eOvYfMXYes5
	mha4GsMMBJNAGujEys7p2SRNLeUmzY9l2Isws28wolMRV/41WEC+A1sLhDWPRnFxspkZGsUhz2u
	6qy8vHOLg3HuY+ZlUv8cPwq4Tyf5C1b2aTKaHgk/v5ItQ1Lx7yx8SCfpwZVDycZqN5+0MSlmLGG
	PTVhaEBn912tTgUCw2w0PXy+MSSttAb61VOcUVpZQP8IQ5K4gm2fDfIMnmcqWI1rM8iuPe7WnBE
	VECmfRcTT+RWh976CnAbcfU/eAurgDm7WO+tBREeOaFbYYhf6QqT+jdrCbd0LnSIoM7ZEE0erE6
	eNEbay3SKL44IG2EOQPbBuuis8YbsgWFffm/OLuHbYcYHsqqbN6w==
X-Received: by 2002:a05:600c:4e46:b0:49e:642a:4f6f with SMTP id 5b1f17b1804b1-49fc585e9edmr7361175e9.33.1789696229219;
        Thu, 17 Sep 2026 18:50:29 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff57926sm70569f8f.14.2026.09.17.18.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:50:28 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	gerg@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v2 2/2] net: dsa: mt7530: leave the MDIO IRQ mappings to regmap-irq
Date: Fri, 18 Sep 2026 04:50:20 +0300
Message-ID: <20260918015020.2518315-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918015020.2518315-1-f@lex.la>
References: <20260918015020.2518315-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_025031_227792_266C494D 
X-CRM114-Status: GOOD (  27.87  )
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

mt7530_remove_common() disposes the per-PHY interrupt mappings from
.remove, but the regmap-irq chip that owns the domain is devm-registered,
so its parent interrupt is only freed once .remove has returned. The
switch's own regmap-irq thread can therefore still dispatch on a mapping
that is already gone: irq_find_mapping() returns 0, irq_to_desc() returns
NULL and handle_nested_irq() locks desc->lock without checking it. The
attached PHYs have not given those interrupts back yet either, which the
kernel warns about a moment before the fault.

regmap_del_irq_chip() disposes the same mappings itself, after freeing the
parent interrupt and before removing the domain, so there is nothing left
for the driver to do here. Until it runs the descriptors stay alive, and a
late dispatch on one of them is harmless: dsa_unregister_switch() has freed
the PHY handlers by then, so handle_nested_irq() finds no action and
returns.

Fixes: 254f6b272e3b ("dsa: mt7530: Utilize REGMAP_IRQ for interrupt handling")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Found on a Netcraze NC-1012 (MT7981B + MT7531, 6.18.44) directly behind the
regulator fix in patch 1: with that one applied the unbind stops faulting
in mt7530_remove() and reaches the teardown, where the kernel says what is
wrong in words before it dies.

  # echo mdio-bus:1f > /sys/bus/mdio_bus/drivers/mt7530-mdio/unbind
  remove_proc_entry: removing non-empty directory 'irq/81', leaking at least
    'mt7530-0:02'
  WARNING: CPU: 0 PID: 4629 at remove_proc_entry+0x1d0/0x1f0
  ...
  Call trace:
   remove_proc_entry+0x1d0/0x1f0 (P)
   unregister_irq_proc+0xd0/0x104
   free_desc+0x38/0xa0
   irq_free_descs+0x64/0x98
   irq_dispose_mapping+0x70/0x14c
   mt7530_free_mdio_irq+0x5c/0x60
   mt7530_remove_common+0x1c/0x30
   mt7530_remove+0x24/0x90
   mdio_remove+0x20/0x40
   device_remove+0x68/0x80
   device_release_driver_internal+0x1cc/0x220
   device_driver_detach+0x14/0x20
   unbind_store+0xac/0xb0
   ...

  Unable to handle kernel read from unreadable memory at virtual address
    00000000000000ac
  pc : handle_nested_irq+0x28/0x168
  ...
  Call trace:
   handle_nested_irq+0x28/0x168 (P)
   regmap_irq_thread+0x19c/0x2e8
   irq_thread_fn+0x28/0x88
   irq_thread+0x18c/0x28c
   kthread+0xe4/0x1ac
   ret_from_fork+0x10/0x20
  Kernel panic - not syncing: Oops: Fatal exception

The WARN comes from unregister_irq_proc() under irq_free_descs(), fired for
a mapping a PHY still holds. The captured record shows one, for
mt7530-0:02, and already carries the W taint bit, so at least one earlier
WARN fell outside the ramoops window. Later in the same teardown, and in
the same ramoops record, the switch's own regmap-irq thread - PID 627, Comm
irq/53-mt7530 - dispatches for a mapping that is already gone:
irq_find_mapping() returns 0, irq_to_desc() returns NULL and
handle_nested_irq() takes desc->lock on it, which is the read at virtual
address 0xac in the trace.

The mappings regmap-irq disposes are a superset of the driver's.
mt7530_setup_mdio_irq() maps hwirq p for each user port p below
MT7530_NUM_PHYS - at most 0 to 4, and 0 to 2 on the board below, since the
loop tests ds->phys_mii_mask. regmap_del_irq_chip() walks hwirq 0 to
chip->num_irqs and skips only entries whose mask is zero; mt7530_irqs[] is
written with designated initialisers up to [31], so num_irqs is 32 with 12
zero-mask holes, none of them below 5 - hwirq 0 to 4 carry masks 0x1 to
0x10. A devicetree that gives the PHYs their own interrupts lands on the
same hwirqs, since regmap_domain_ops uses irq_domain_xlate_onetwocell;
today the driver disposes those too without ever having created them, and
after this patch the remove path no longer does. mt7530_free_mdio_irq()
does nothing but dispose - it neither removes the domain nor clears
bus->irq[] - so the call is the whole of what goes away.

The devres order is the right way round as well: mt7530_setup_irq()
registers the chip before mt7530_setup_mdio() registers the bus, so the bus
is released first and the chip after, and regmap_del_irq_chip() frees the
parent interrupt before it disposes anything.

Fixes names the regmap-irq conversion rather than the 2021 commit that put
this call in .remove. Before 254f6b272e3b the driver created the domain
with irq_domain_add_linear() and tore it down in mt7530_free_irq_common(),
where irq_domain_remove() disposes nothing, so mt7530_free_mdio_irq() was
required there. The conversion handed both the parent interrupt and the
domain to regmap-irq and left the call behind.

The two remaining callers are error paths in mt7530_setup_mdio() and
mt753x_setup(), reached before probe completes, and only one of them can
run in a given probe: a failing mt7530_setup_mdio() returns from
mt753x_setup() before the second is reached. An early dispose there costs
nothing anyway, because regmap_del_irq_chip() looks each hwirq up again and
only disposes the ones that still map. Dropping those calls is a cleanup,
not a fix, so they stay.

Tested on the board above with both patches applied, on a kernel identified
by the sha256 of its ELF notes section - read from /sys/kernel/notes on the
running board and computed in advance from the flashed image. Three
unbind/bind cycles. In the two whose dmesg was captured, each unbind
dropped mdio-bus:1f from the driver directory and took lan1 to lan4 with
it, each bind brought them back, lan1 relinked at 1Gbps/full after both and
lan4 after the second; the third logged interrupt descriptors instead, as
below. uptime rose from 58 to 202 seconds across the three cycles without
resetting and pstore gained no record. At the end of the two logged cycles
dmesg carried no handle_nested_irq, no Oops and no remove_proc_entry line,
against 82 lines mentioning mt7530 in that same dmesg, so those zeros are
absences and not a broken grep; the third cycle re-read the first two
counters, still zero, against 91. One unrelated WARN remains, on the first
unbind only: sysfs_remove_link() under dsa_user_destroy(), a separate DSA
teardown-ordering defect.

The third cycle was left unbound for a moment to look at the descriptors.
/proc/interrupts then had no mt7530 line at all - the parent 53 gone along
with the per-PHY 79, 80 and 81 - and /proc/irq had lost those three
directories; the next bind came back on the same three numbers. That is
regmap_del_irq_chip() doing both the free and the dispose once the driver
stopped doing half of it by hand. Had it not, the directories would have
stayed behind and the rebind would have taken the next free virqs.

What this board cannot show is the race itself. The window is narrow, and
reordering the two calls instead of removing one ran just as clean here.
The panic quoted above is what the unfixed path does, captured on the same
board and the same base with only patch 1 applied. Both kernels also
carried a local debug msleep() in phy_remove(), left over from unrelated
work in the same tree. It only widens the window this patch closes:
phy_remove() runs after .remove has returned and before
regmap_del_irq_chip() frees the parent interrupt, which is exactly the span
an early dispose leaves open. The clean runs, the WARN and the descriptor
readings do not depend on it; the panic quoted above was captured with it
in place.

Not tested: any MMIO part - there is no MT7988, EN7581, AN7583 or EN7528
hardware here. The object file was read instead: mt7530_remove_common() now
compiles to a single call to dsa_unregister_switch(), and
mt7530_free_mdio_irq() keeps its two remaining callers. Built with W=1, no
warnings; checkpatch --strict clean.

 drivers/net/dsa/mt7530.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3e61eb3c2b1e..96832852c65a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3593,9 +3593,6 @@ EXPORT_SYMBOL_GPL(mt7530_probe_common);
 void
 mt7530_remove_common(struct mt7530_priv *priv)
 {
-	if (priv->irq_domain)
-		mt7530_free_mdio_irq(priv);
-
 	dsa_unregister_switch(priv->ds);
 
 	mutex_destroy(&priv->reg_mutex);
-- 
2.53.0


