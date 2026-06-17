Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1751FCD98E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 02:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ynVgrV1BKxZf8bSSqKXL4ymJEj5mSIOpHynliU6D9pI=; b=2U+MEOXA89E/LfBSAW8HFXoSPu
	5vUXUX660+2eqVc+Tw5jmp2MgS0Yev3mAVGEhhVllo6t80TUshpYLx2yUR6NpCfXgZG5zIUbGOxSb
	fV9GLd8sMeRj/O6viKIa9pQ0mz83NgstmYcopsEWd8JcR7fn1QzFAWfegodCLjLddtY/tWouylZQw
	MBRqhU/sSB9HaCk+BMOAHA88u48l5D77O4+i3He+8FjK5zKZniMczCafjwsGOpPunGjNdA3BBjdXT
	LNkm1AJ22eQCLo/aQrggf1PNCoIzD/23cVVxSwrhBJqGEhra4Qat6GCDDkrqCoOlApQ0ViTJXTkkn
	GoJCxKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgPh-0000000GWkl-3S9K;
	Wed, 17 Jun 2026 02:54:01 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgPe-0000000GWjX-47yp
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 02:54:00 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36da151a152so3761437a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 19:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781664837; x=1782269637; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ynVgrV1BKxZf8bSSqKXL4ymJEj5mSIOpHynliU6D9pI=;
        b=CdFWr9PyB89OIZBJtPZ2JroBTHakruEv5EQB0qE3xR/1ShUedfpgbLfNBAjbQRbW1X
         YpHBaShibQpJqA+GgnqiLhQV9WqtfyomxMoBvo1ohWmYF17tCwTtn4ViHDpHNNQZV1+W
         cGrPuQBgbMLmLvpLBqpTmqLiwB6AgC3+HB5kgvoENIhpgf50t8VGG/jCWJpcmamu1qPm
         6HPl4zdBcoRv6RGnMKQ+6dqIx1emGZJeGxaVhay7SlTld9C6wouZE42C1Q1uM3hDD6so
         cm2Iop5D3UKAIARiTEivXfdHCLd+5/WfLPMFwL4I0gxGMxSc2OG8uSSDdinEqGe0nVW2
         2vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781664837; x=1782269637;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynVgrV1BKxZf8bSSqKXL4ymJEj5mSIOpHynliU6D9pI=;
        b=WoVXfk517oh09gEguKsqJvvhLs0I7cWS+Y3ZlPZ2gg106ymS/ebk7ijGUNUTQvtU0s
         wlUeGbvJmOXDR0ohmkrY9D5MKs1ozns+qT7yTRa+/mffgIbW/mi68SHnTUyFQq4nbhQF
         a4iZ9MYhy+olPf0RlT9iWYutU7Oe5ds7cWp9Nq5m4hDmrKVJEo8PvsqkojrzTrXBC8Bz
         uzOstefGJ8t2EiDxexfgzyvL8dAsJgI8f8pU44ZIW8F3bU5tARb82y8TT4AeLsQC7AN9
         fdDf8Fv2SydnmNVHdL3DLnsmhueNhObAa/aJFxLBY9E1MKJYNHKFakfYjty/xgH2WcVj
         /s+w==
X-Forwarded-Encrypted: i=1; AFNElJ8D/vmEmy8GaqoWoyzmQkoGb9vec+nBVqVhGJ8lbnsjRlnOilKr99rX9b/+qeIUbGDsca0cD6JbZfKap3L6pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLKpHp81tovNWYyL9ll/9A0VzLIHl0CODsVMVDBCP0qJyCevRN
	k7rL+2uU5WCOJZenhN36ovttgUxXrz6cULkqFNZHE2PBZN54WCw0tQ9I
X-Gm-Gg: AfdE7cmKk1JIi+uGiEcCDLuMfcGiutuPXU/kpKkc3F/xudjnrdY0WDsbKPSfrT9tw5X
	Y2kq0ZQEYCAW2Jm+yyIVCU4x4ZodElUP1v4tKXI4Ps5mPvLx17P6VzOxkpR7/tTshG2JkTGiNDv
	TyAC6wANo7P5JwIpdHVB+FKCul7cZrhhqeGSmbOuG/sPWZnz78dkkU1tpM2C+hq8DuLerRqB7Ln
	ars6J5rXrre8oMZcFwmxCWsHALWBvxO3fTv3kIe7DPfQKU1UA54JY684QH5GSjZdjBAySmRk3Pk
	N4Eg2vtTxJDcTiadlNXOP7auiAt7TFrFb0v4unYewLOSx7hX5Y+0sbi+oryOa7Z2B4bNs2gu240
	bJmE8o9lUlhI9NBg42I7pG7Z6eKm58JnOywKElWdQQWS4X8G6Svj1w1+H+E5IGKHkp5PNRBjBN5
	K7rpz/MA==
X-Received: by 2002:a17:90b:224d:b0:36d:d8fd:4578 with SMTP id 98e67ed59e1d1-37c93437f61mr2004429a91.11.1781664837535;
        Tue, 16 Jun 2026 19:53:57 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ae039sm4334909a91.1.2026.06.16.19.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:53:57 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] net: airoha: Fix off-by-one error in HTB rate-limit channel removal
Date: Wed, 17 Jun 2026 10:51:40 +0800
Message-ID: <178166483303.2209640.10761097847073356089@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_195359_023261_F5757542 
X-CRM114-Status: UNSURE (   9.55  )
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

In airoha_tc_remove_htb_queue(), the rate-limit was being cleared
using (queue + 1) instead of queue, causing:
- The original channel rate-limit configuration to remain active
- The next channel to be incorrectly disabled
- Potential out-of-bounds access when queue == 3 (channel 4)

The alloc path (airoha_tc_htb_alloc_leaf_queue) correctly uses
channel (0..3), but the remove path incorrectly added 1.

Fix by using queue directly to match the alloc and rollback paths.

Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..02807b3967 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2805,7 +2805,7 @@ static void airoha_tc_remove_htb_queue(struct net_device *dev, int queue)
 	struct airoha_gdm_port *port = netdev_priv(dev);
 
 	netif_set_real_num_tx_queues(dev, dev->real_num_tx_queues - 1);
-	airoha_qdma_set_tx_rate_limit(dev, queue + 1, 0, 0);
+	airoha_qdma_set_tx_rate_limit(dev, queue, 0, 0);
 	clear_bit(queue, port->qos_sq_bmap);
 }
 
-- 
2.51.0



