Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF672C79F8B
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2026 04:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7ZBJrHna+bny0ult5TJeeoJUeb0vemHipmseyBOZuE=; b=EasNwaDAnZQHlzpDMp5hyTIUQF
	u5PuHrgApcZ8HfRuVH3jNbJXVIUj6vk8k9WufyXTpIwyBMjmKFYkZus2vodqT5Lx+11GqT9JArQ/d
	jWqnPoFYfWS5zpD0rP40HMhZDGvmZlPwIC10uP4KI+XrJZRzVXerwj4eRSfDFKkgGRUShz6JhkiQD
	jYoJDMAJdwqBjY3lWKtCbfGG+hTe08534sXwv/q8+yj6OBw0KnWs0zJejbKJGX8WkRExk+xENq8bE
	fBPY4ZK+XxlXD8tUaDUowKWiJQAvcUsLOok4NDhf3hVQ9uXU0Ym3TEA4z+BQP1kEPkJozTJ+ay3dz
	qjO3P56w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x34dw-00000004gdZ-2oOQ;
	Sun, 06 Sep 2026 04:38:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x34du-00000004gcp-1efs
	for linux-mediatek@lists.infradead.org;
	Sun, 06 Sep 2026 04:38:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49b8687630fso19992495e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 05 Sep 2026 21:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788669488; x=1789274288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I7ZBJrHna+bny0ult5TJeeoJUeb0vemHipmseyBOZuE=;
        b=IpR/6pOPHRxYjS3gpPFyRVt4jIhYWmjl34t7TymdHqOGH8BMCe7CFMziBuE9hC3GdM
         WZbKxG36ZkzPkA3JD2/XpWj76aiXi3jKtZiqJ2FWe5YgK6H7aRWg+5zNUtsRb0FMDrJ4
         7tG2AWfkNBhr9fL7LxYPpBXBePp3hTtZmy/hvOs3d6ifs2lqihwyRASf/0ko/NRb7A5y
         dQUt0GRY6/ftIINKUKEPb4ravLcM98GUppF9lqwPCSh/7rBmlECQIh4FZT13uH2By6Ys
         RWyv4zzzojOZxm+fjvJTwTckIcAfn2l9QvF0uL/QVAFFDVFcwsxV23G2qZ5gAzMpvUhO
         KrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788669488; x=1789274288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I7ZBJrHna+bny0ult5TJeeoJUeb0vemHipmseyBOZuE=;
        b=nr96SLkpBCH/+gHpOrAcU4lZ00+faL1RjdolFqZpz0T4ngu6vjVkLwavbD2xZYiHMZ
         EDT8qDCYM14ClknfXH0DZTyjngGOGcVMv1ZyOfIRnGQrohaip83op7BFqvVcvhfFEr88
         rsyL2lnO0HgA0KmH6v2QAFzGlY9wJ6pu5CWfnBxVNBW1IKCDcthqwbqla/mi3qIWWJyd
         Teqimtgpoy0a0ZEtfATQPEUMo/m6jIzITI8fGhvW+C1lVKg98MbPwBoqssrGbfP457Vd
         JHS4OQ+FPFzo9+79MLiSLKSploisqK54fp02UxHV96E04gGRdg4+AXVL/uKgME5fqLrQ
         jZNA==
X-Forwarded-Encrypted: i=1; AKwUvByRYaeEutxBP2MUpp/FfIorY62DjGfQuBnixo1Fr9k7qO90ucNK6HhOg36MUiEYFhKH+G+qsTnEJpi1E+Qm6g==@lists.infradead.org
X-Gm-Message-State: AFuF++lfgScq8dlR8/jobVmbAAhh41XoFO9iuGq+tQYpzM41DQh+rXRM
	KE02SqRM2XAB0IwBOstHbH1IvveiQq3RfKyIMAuu+keyAgTSWeoIJOg=
X-Gm-Gg: AYBFou0rtcB3/u/c9H5mulDeQWohNgJNDqzIomhySLAPnW72VqbrnmtQAFCr4vc+Cvt
	CaW3YaZ9zxQE0ERObhfUXUfacEA1Y9R6X2DsSXPfTA5OnaDn1/JAWO9M7HlSnG9PFIvIftyy6WB
	12WfJR+u2em+vSO4/6UuyaYI/ZM2UAwknf091XbsLUdnw4rVBBpkbjER5jHinSIAwRNU0WHKelp
	+rUUxfs8RCyXFEpx39U9hp7IqIYeY+Qh1S7+76KNLlO6bJEzKu7n6TR1/pRUdzQNV73/oJf/4GX
	oEmR/y175EfP2dg4OFdsM4vXZhBgiHXQlqdpo4fgWPzUYl4Fps57MygUZnyEHIqkh4QwTSnMZhm
	tdU822Kd0MAustI2x61Tj/1HFUJbKtAecZX7r5ZuIXiyZ38K+Ap24uM1MGI3Nhd8a7ucjhcX3M0
	6TQPNKPBnaTB+OXqz4LOi7kJgXUxGcRL57aGo2fr9NUsuItSCXfU4Uo656zkhAVw==
X-Received: by 2002:a05:600c:1c24:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49cf824894cmr174054505e9.8.1788669487768;
        Sat, 05 Sep 2026 21:38:07 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5936a5esm145690735e9.3.2026.09.05.21.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 21:38:07 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: net: airoha: RX rings below 32 descriptors let hw DMA past the ring
Date: Sun,  6 Sep 2026 07:37:50 +0100
Message-ID: <20260906063750.719445-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788286284.git.sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com> <20260831234701.206021-1-sochnev.v.74@gmail.com> <cover.1788286284.git.sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_213810_451077_C058B193 
X-CRM114-Status: GOOD (  12.21  )
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

e84b89f17a12 ("net: airoha: grow the small RX rings") is queued for
net-next as an RX loss fix. It also stops hw from writing descriptors past
the end of the ring into unrelated kernel memory, which its commit message
does not mention. Given that, it may be worth stable.

Nokia XG-040G-MF (AN7583), 512 MiB, 6.18.44, OpenWrt snapshot. Images
below differ only in RX_DSCP_NUM(); no other patches, no instrumentation,
verified against vmlinux. RX_DSCP_NUM() is shared, so other variants with
a small ring are presumably affected too - not tested here.

Reproducer: raw UDP frames with source port 67, so REG_FE_VIP_PATN(8)
forces them to ring 4, ~900 pps to the board's MAC. With ring 4 at 16 the
box panics within a minute.

Mechanism
---------

At 16 descriptors ring 4 occupies 512 bytes; dma_alloc_coherent() rounds
to a page. After the ring stopped advancing, the remaining 3584 bytes of
that page contained 560 non-zero words repeating with a 32-byte period -
sizeof(struct airoha_qdma_desc):

  +4  ctrl  0xC0000000   QDMA_DESC_DONE_MASK | QDMA_DESC_DROP_MASK, len 0
  +16 msg0  0x00008000
  +20 msg1  0x2A5E0000
  +24 msg2  0x007F000E
  +28 msg3  0x0000FFFF

msg1 equals the value in the last descriptor the driver did see, so these
come from the same engine. REG_RX_RING_SIZE(4) reads 0x00020010 - the size
field is programmed correctly as 16. Writes staying inside the page are
invisible; past it they hit whatever follows.

Panics
------

Three on the 16-descriptor build, all garbage pointers in subsystems
unrelated to networking:

  __queue_work+0xa4 <- dbs_irq_work (cpufreq), x21 = 2d9ce5fd003cae80
  sched_balance_rq+0x84 <- sched_balance_domains, addr 0040000034124819
  Kernel panic - not syncing: corrupted stack end detected inside scheduler

The third occurred with no synthetic load: ordinary DHCP traffic after a
network restart, 4 minutes in.

Ring size is the only variable
------------------------------

  ring   frames fed   page tail after run   panic
  16     27 000       560 words, signature  yes, 3x
  32     271 909      0 of 768              no
  128    269 845      0 of 1024             no

Controls: the same scan on idle 32-descriptor rings reads 0 of 768, so the
560 words are not pre-existing content; 273 292 frames of identical traffic
on a non-VIP source port (ring 0) caused no panic.

On the shipped configuration (ring 4 = 128, default 32) the board also
completed 1623 consecutive PPPoE dial-ups, 16 VIP frames each, and ran
9 h 52 min of DHCP with renewals every minute - 1178 samples, no lease
loss, no rx errors, no panic.

The boundary is between 16 and 32. The vendor SDK default is 32, which
looks like a hardware minimum rather than a tuning choice.

Question for airoha
-------------------

Is 32 the minimum RX ring size the QDMA accepts? If so the driver should
clamp or reject smaller values rather than depend on RX_DSCP_NUM() being
large enough.

Withdrawing the NO_CPU_DSCP patch
---------------------------------

Please drop

  [PATCH net v3 1/2] net: airoha: handle RX_NO_CPU_DSCP interrupt

acked by Lorenzo, not applied. Its rationale - ring drains to zero, the
dropped NO_CPU_DSCP interrupt leaves it dead - is contradicted by
measurement:

  - NO_CPU_DSCP never fires. Instrumented builds logged zero events across
    every run; REG_INT_ENABLE(bank0,1) reads 0x839F839F, so the bit is
    unmasked for ring 4.
  - page_pool_dev_alloc_frag() never failed and q->queued never reached
    zero, so the described path is unreachable.
  - A/B images with and without the patch failed identically.

airoha_irq_handler() does drop the interrupt, so handling it may still be
correct, but not for the reason I gave.

Correction
----------

In the v3 cover letter I asked whether out-of-order completion pointed at
a constraint on RX_CPU_IDX, having seen QDMA_DESC_DONE_MASK set in the
slot fill_rx_queue() leaves unposted. airoha_qdma_rx_process() never
clears ctrl, so that bit is the residue of the last consumed frame.
Disregard it.

