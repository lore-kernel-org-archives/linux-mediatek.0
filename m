Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CADC61DD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 21:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4N2Z9Nu76llWCIDOn2i9yQBrPhlyiZyTva3R2V2uoo=; b=fQqkkWR1DTKkRPVtDHVsRIudbq
	FEVa0XsotJJJEETYUCQ8zDau5VPVAfu4jL4RmYcd5ala0J3rQfLT/OF/VonLhtnY+5ELXTbY4R+wy
	tAWkJOckylcyjB78wTDs/W3Nrkbank8YZfwWPjLE2dDM+Egw0mqj4eDU/zeg4BbM+KByAL1762CNv
	JleS/FvrmgU3IusvNRNVvYzJq5JmKFTBoisHuhi7ZlGmTz7e9EZhbVu5TrjBrToh+5/FBxwSIkcgL
	+ylMxjQkObdJJFWlxBE7pMdJU7nvVWIw7/voE62ye04laW/jqXbRF2JpWb0AkOvtmYM4OSgY61a3E
	ccfrNZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19qm-0000000AYYn-09qu;
	Mon, 31 Aug 2026 21:47:32 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19qj-0000000AYXo-1Z1V
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Aug 2026 21:47:30 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-39c74c469e8so23986581fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2026 14:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788212847; x=1788817647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4N2Z9Nu76llWCIDOn2i9yQBrPhlyiZyTva3R2V2uoo=;
        b=YbnM32K+Ba3v+G09T/Ptp0K+GGT9ysV9HhYfzq4uEDrcp+cHRFzNvOPXJ4U5qJ0Dq5
         f9IV6PWrsqFv7mnt512c8e/LMLeDzJZEqVAUah8rSWKVrPjHKpljONviABhUaAv/e1jM
         MlwZDgxrOTP0CYaU1hYMs4d/CQjV5K/1T5e5M3P/tcAmb3FJYksfMLCrT/MixRfBZSuN
         2TR7m5xlmaPXhZc1WS5k3058z8/FTp6eOUcsfCSxRUesiI4+Ypwv9bsor95+Af9X7zgP
         3EuxQ7ePZDRPs+5IwnYJFh3akiZj9wZUVuUUt2RKLaPHICp2aNrs2oKn9qacvqOLWTWO
         9szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788212847; x=1788817647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E4N2Z9Nu76llWCIDOn2i9yQBrPhlyiZyTva3R2V2uoo=;
        b=CvDa3I4a2RW+Qh/TQ6nk+9GXlleguaOF8mJC/7uEEcuqJGHKVn6r2XsSOH+fDDX9LS
         PqVqvvg1AIBTQaoGrI87T7QHL/SgJgH3rtPsid0JTvT7qeMNJKvHGnIXEco0z5upvotb
         Bxu81JSOijJngpa6Iak6P3RR595LS6HqZXbdUWLlNfEjO2K6TNRGGckvDGNZaLSCQSTZ
         XjjKyueG36D10U2p/9p76F4Fh+wDRASxgFPqfmn3YWVAyZDLuJQZJi2kLbqRQJ8RcFMY
         SPSkecN/MTu5j0jDoLq9QLNakEhwHIza87DacR8VP307FjXfTffkaTigBx5qfH7TWBye
         2znQ==
X-Forwarded-Encrypted: i=1; AKwUvByk+kyYLBhuqNvOBZky2juLBVSjSJk+opdipbRxmTWmwZEpBluroljHFQb+nWTwUK7rZFMFVx9S5MFYIZDYvw==@lists.infradead.org
X-Gm-Message-State: AFuF++lPPVcGo4yEYpiiGq3rSoNa4vbXnTPclwIXtmjL37LwTKaBnfPk
	kkAQLaUxTlSS49h2mPVUV5HfjEIpvMBB7gMFqINgj0/L+qc+XA365Dk=
X-Gm-Gg: AYBFou2PZCTCpY2pnW/PNHJTGRRYNU7oIEmvzlhkt4PB6WCxuz4Mc+qqXVNRegNQZUD
	YPi9niNXdxZqS5tgFAs2B7RAUcFAZrt+QQP3fMb/yLFmocCWzChqeGHqNAj32X6j9Mv0pQEQnlp
	1q1UUS6etd4PJnmJo5AiCSidiUcw2qv4tpExAmxGBurdvVFry0uC8Cv3SkEjl02fDc/Bd2dNG06
	CfqSwS5BsadcXTD8Uzw2oZYs2MbIf4Okv2H0cao7k7sWvijpvQxJk1cQGShsB7BwM1yMTkmrEEF
	Cenmr5vL05ju5Yyjz7sMKoKpUg0e5Qe+5E6fT8Oa5KqYWIjvfTWD81iLmjA6VgyGYwne8UYuIP+
	YQrLAPK/O/WVWAQ0eSqaVy0d8HhU1ELGYz5xzSr5XJ22Ey2vHjGBZh3Vl7fsJYp5tx+Ius32Nmw
	aZpmhVkxkanuMPbk7s7p8RnMCWvZYa2lpvr3H2yTB61KLdrTwUTogLjPXSvHSi
X-Received: by 2002:a05:651c:b23:b0:3a3:314:8c8a with SMTP id 38308e7fff4ca-3a3031499camr62394581fa.14.1788212846426;
        Mon, 31 Aug 2026 14:47:26 -0700 (PDT)
Received: from fedora ([92.36.9.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31550cefbsm18299201fa.9.2026.08.31.14.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:47:26 -0700 (PDT)
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
Subject: [PATCH net v2 0/3] net: airoha: fix silent RX loss on the shared CPU ring
Date: Tue,  1 Sep 2026 00:46:58 +0100
Message-ID: <20260831234701.206021-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830095717.37218-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_144729_445566_45647599 
X-CRM114-Status: GOOD (  14.30  )
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

All three target net. v1 split them across net/net-next; with the ring
size now shown to be load bearing, they belong together.

Answers to the v1 review:

- "fill_rx_queue() overwrites the DONE bit written by hw" - no. I
  implemented that check anyway (bail out in fill_rx_queue(), clear the
  bit in rx_process()) and it never fired once, while the ring was
  demonstrably stalled: the descriptor at q->head never had
  QDMA_DESC_DONE_MASK set, so there was nothing to catch. Worse,
  clearing desc->ctrl outright also wipes QDMA_DESC_LEN_MASK, which
  fill_rx_queue() writes as the buffer size and hw reads back - RX then
  delivers poisoned pages. That version is dropped.

- "have you tried to just increase the queue size" - yes, and that is
  the fix. Ring 4 at 16 stalls roughly every 35 s under repeated PPPoE
  dial-up and negotiation never completes; at 128 nothing triggered
  across 500 forced reconnects over 20 h. Patch 3.

- "is QDMA_DESC_DROP_MASK set when the issue occurs" - no, never, for
  the whole duration of the stall.

- default RX_DSCP_NUM raised 16 -> 32 per the vendor SDK, as asked.

- recovery pause measured at 986-1131 us over 13 events, against the
  50 ms read_poll_timeout() ceiling.

- style: RCT, verbose comments gone, and the !q->ndesc check dropped -
  the bit is only set from rx_process(), which cannot run on a ring
  without descriptors.

One cost worth flagging: the detector adds an uncached REG_RX_DMA_IDX
read to every rx_process() call that ends on a non-DONE descriptor. airoha_qdma_rx_napi_poll() loops while the last
pass reaped anything, so that is once or twice per NAPI poll, on every
ring, not just the one that can stall. Gating it on the previous poll
having reaped nothing would keep it off busy rings and only delays
detection by about one poll, since q->tail is frozen from the moment
the stall begins. I left it ungated as I have no profiling either way -
happy to add the gate if you prefer it.

A question for the airoha folks: during the stall REG_RX_DMA_IDX keeps advancing while
REG_RX_CPU_IDX stays put and the consumer never sees another DONE. Is
there a documented condition under which hw stops writing completions
back to a ring, or a constraint on RX_CPU_IDX that the driver is
violating by leaving one descriptor unposted?

The rx_stall_recover ethtool counter from v1 is dropped here - new ABI
does not belong in a fix - and will follow for net-next.

Tested on Nokia XG-040G-MF (AN7583) on a live PPPoE line, in both
configurations: as sent, and with stock ring sizes so the recovery path
actually executes.

Vitaliy Sochnev (3):
  net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
  net: airoha: recover RX ring after hw completion stall
  net: airoha: grow the small RX rings

 drivers/net/ethernet/airoha/airoha_eth.c  | 114 ++++++++++++++++++++--
 drivers/net/ethernet/airoha/airoha_eth.h  |  11 ++-
 drivers/net/ethernet/airoha/airoha_regs.h |   2 +
 3 files changed, 120 insertions(+), 7 deletions(-)

-- 
2.55.0


