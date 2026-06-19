Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E602CD98F2
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 13:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yHv7U02AjGCdC10QhmFKNYOGrXRPq55x+46nkeHZEeg=; b=P67TNSDNQaOKXwkZZL8nyTLVCJ
	GZe5kTNlBoI+EIhWWGCtSCvcoBpgvjHRFuvxBVrR3R7Z5/Wd5b13UoWSNMdYa8WQsgNjRTHso85n6
	LOMBCoowdb6yCREMLrgYcnyb7w5/8zqSLxRZfegZem0tmNAcRG6stInOrID7Nj7IGCL34fcxFF00T
	c98QwtPk0WS0gmUTa0pPW7nzWQG0RS5sPHg7oAqMR0YOKJJpymbapCkpPhDip3cKT4Iuu1LAZ+P66
	ep8TfdRSIgLnC3ZyOf//y7+3C/7sE5LW6D0+ysPTqTCGxMedv23rUXuofKBarde/9VdZKaSb/Y9RC
	P7uPWnAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZ2B-00000002SrF-3pQ5;
	Fri, 19 Jun 2026 13:13:23 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZ28-00000002Sox-255L
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jun 2026 13:13:22 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8453a67659fso1244097b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jun 2026 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781874799; x=1782479599; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yHv7U02AjGCdC10QhmFKNYOGrXRPq55x+46nkeHZEeg=;
        b=aZ9hAGQse10fVqd4+k2tiOnu8roIKxy9EBXGvMh+0wiaBcP0KeMyZp61RqGxrR17oj
         yuKqFImACE/agPoxuW1t2jbr/ggmDkGsLr7K2t5agmoMOAxGsZ+TCGxdTTjLlYjjXlR5
         tFwO07juMgVLeGCqY53HdHtXqcLuFWcjR6YPu5JZRoRPNOkx1UbGgSZVWHK9JUnDx6Yg
         k9AkMrMn00x7iRZZorkDv3yF96dGi9RXqHAXqAe1Ome51S0IvZPI6BslVgMUr/MpuGKJ
         qTKyR3+w8PA4MizIJjKr2TEHbssflIXFLEaBDgzd+r2zr3p3BEVsI8DO3ZJeoZV2Vcfk
         jgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874799; x=1782479599;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yHv7U02AjGCdC10QhmFKNYOGrXRPq55x+46nkeHZEeg=;
        b=GuZq0qqSog/7At0/2USSJsTZf14AD9xW7ud1cDHZRiT4lUtW6iEe7mjEIcIbNIgScu
         Xa844MDWwVhrYgMrcywSG1hOYFlteSQv362SsdkggBBBaG5kDEbyTm5tjjyLqy1abfca
         u91meTTw5Rbo5yjZSCW2o4HrKDRVuEl1t0ROqAsfB8lOAYcDLbnCIYJlrOGyKRH2Eag+
         3I0sz85sAmwT0axpDNIUCelpYHrj0oCLo1jbfu0yQyS7gOnCxEs4tzGcEp2A6+640QU4
         jOcOKicgRR7s8ads9KbgfrD5KrhmLOX+/kXHDfz7ytofn3yU7odFsupaBVwr3DUbmQWI
         CByw==
X-Forwarded-Encrypted: i=1; AFNElJ/EnZ7nbF6xqIH/CoC2HxpRjou9Cs+8o7PXB/ZvFTg3+/TNjfsoU3Pf8e9QQcFreYz0XZ4HBF9AgnY7ODPJnA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5REcw4GJvAmk7T3tVlTPTEFIXDbuYScPcjfwmWFnwfahXcMk9
	wJmlGlCMnFMiIAC+cNGHyPbOMFjHa3KoT4UPDjN5Sf8Z/RUnpXix+jCz
X-Gm-Gg: AfdE7clVvrF1L17pcAz+lr/72OvicPsZotv7FHoNpAdSKJjEttjkev6jk/MfYzVGjSx
	FcxBJPcDh3o4skOollEuC0NGQJWFBgtfHPXx/oVimXaEvPZ+3kjGus43QYv7SmJWwCzIvNOPcN2
	xZjJNk6e7nIW+zW3aj2N2k/HvzkHAK+NidddiFUnXDgPFQ/f6nejnmSLMfBWY8Zm+NRrjLJOsXI
	Zbdn3Ygobd9gCSIvQ7/VJpve1muwh5M8MMfUMjBdlrUulp7FIqtatAwfdQI2ve+hoWFDCP3VyoM
	0tbDlnkEDDXxTBr3QgW/LIs7vE+cVyRhPZbSIGao32leqdI2SxePowSpphKOaKGCLKB+2ipUGee
	gFleMPKOvPPxqX6Vy4FffWz2KVech3oog1NvVEHVbfaY7Twzo8kR3riw7yj27G00/tFO43WbQeP
	jTF9uoOA==
X-Received: by 2002:a05:6a00:124f:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-84550870aacmr4566062b3a.23.1781874799141;
        Fri, 19 Jun 2026 06:13:19 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455364b25asm2490504b3a.7.2026.06.19.06.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:13:18 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 net] net: airoha: Fix TX scheduler queue mask loop upper bound
Date: Fri, 19 Jun 2026 21:12:06 +0800
Message-ID: <178187479434.2400840.1312143943526335838@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_061320_566848_65F3377D 
X-CRM114-Status: GOOD (  12.25  )
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

In airoha_qdma_set_chan_tx_sched(), the loop clearing queue mask was
using AIROHA_NUM_TX_RING (32) instead of AIROHA_NUM_QOS_QUEUES (8).

Each channel has 8 queues, and TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i)
computes BIT(i + (channel * 8)). With i ranging 0..31, this causes:
- channel 0: clears bit 0..31 (all 4 channels) instead of 0..7
- channel 1: clears bit 8..31 (channels 1-3) instead of 8..15
- channel 2: clears bit 16..31 (channels 2-3) instead of 16..23
- channel 3: clears bit 24..31 (channel 3 only) - correct by accident

While BIT(32+) on arm64 produces 64-bit values truncated to 0 in u32
mask parameter, the loop still incorrectly clears queues within the
same channel beyond queue 7.

Even though this is functionally harmless (the register resets to 0
and is only ever cleared, never set — so clearing extra bits is a
no-op), the loop bound is semantically wrong and should be fixed for
correctness and clarity.

Fix by using AIROHA_NUM_QOS_QUEUES (8) as the loop upper bound.

Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Wayen Yan <win847@gmail.com>
---
Changes in v3:
- Rebase on top of current net tree (Lorenzo pointed out v2 was
  not based on latest net HEAD).
- No code changes from v2.

 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 64dde6464f..47fb32517a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2395,7 +2395,7 @@ static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	int i;
 
-	for (i = 0; i < AIROHA_NUM_TX_RING; i++)
+	for (i = 0; i < AIROHA_NUM_QOS_QUEUES; i++)
 		airoha_qdma_clear(dev->qdma, REG_QUEUE_CLOSE_CFG(channel),
 				  TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i));
 
-- 
2.51.0



