Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E434CCD98DA
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 10:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JsNwyh+KeC3nDRQIncNAKnYy51JDR11+Uff9rlShFdQ=; b=sntcTDB5FWykq2UNltqsE4HU9n
	hC39eh/HvtU1JvaktvDxsgeYzhtf9OVvYzKpRNGw9aqqSDauJoAdrcbffC2H8Typrqynts0P5Q4Lv
	WDbxMroD4g7E5WyV9z2cjMEELNY3mf10yTIu7eM+lW9Dp1u5nYR7/fzFMuNYxJz9tqynqVw8/JuyY
	mfP/KhLCh4ziWF8wVKdQDoxrJSmw8a8HbHetoZvzAJZQoAcmip0xgF8k8EaVx4Q08JpnJ96EE+DCQ
	2B5io+xEnEYh6EgLaxXWo8qTpD6KpVWshbV4A/d/bwKfxDrA+alTWGulWCFWR8K/wj3Z41t/OC/RN
	SxGa2BdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZROz-0000000Fd1T-0ANX;
	Tue, 16 Jun 2026 10:52:17 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZROw-0000000Fd0r-38sw
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 10:52:15 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bf30d530bdso43180905ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607134; x=1782211934; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JsNwyh+KeC3nDRQIncNAKnYy51JDR11+Uff9rlShFdQ=;
        b=n0NKBeuiBo770cJJdqHYeJgLVTa/qrXNuAyghy+gR7L4fjW1yjUyaCutz1pBB7Bhlv
         BLoS82ogmeg1G3agBb6ipqyyzBSxZcOnr3fpSxXO59TEfWRQY2ij6AYqt2Th1JPRxTUK
         ON6rxN5ISA0yiqrVTWOMh0kbobsWNbhGeUbUEH0aEA4guSmhUxBdT5AbaIX9g5gzople
         rDd22qASZXHm20DRUOL5nvru0aoMMTJNxMHBfdERwVw3vKsu6VAUQfwhPm4me85FHyn+
         7ShZtt99RvIz9dyq+UwDd5yME0PIqPf6HCQyRvW2yQfb8osjv42NLCnLOf8kWQWZaOt9
         4RBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607134; x=1782211934;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsNwyh+KeC3nDRQIncNAKnYy51JDR11+Uff9rlShFdQ=;
        b=pE0PEyGvH4YRgeXoSWRkGfR+oEt+hgMuoobfDFMWX64qA3arydohtsOb5njIJA8+wA
         W64GSZ5bgM1AMsV0aBfjmRya7QoMB5xV4NwoGfPi+CTimFQ8olKiaYAlhvpQaJPmz36F
         +38H5Lx7DmWc0hxk1odqrIysnkBvUrgEbEvGC1E5CADlxeR+9UH0z4D9aOlZkxD7DZgB
         FbLrEJP0Ov0v+DEpRwlG1CdPASAVOfhiF9++AUKniPF7ac6eC5gm8VtUOr5tSLLOGPFB
         ZsjpBMEK82G1Rph9Tou9WQQ6vrXfzXcGRu9qvAtLItp4FnsvEsp+ehz9DCFjsDE6zmHR
         3ffQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MffHzRUGL5xb3q45RbKw2JYlOLCANkNZhT3eDPuMD5ehBPl9zp8ILWRqIRs5EjgoUQfTp5Q+2TpFh2iocMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywns/DGKn4eTL77rbccsBHuj9X/zHIbKTmyJ8tgsEI3AKqPCu0h
	h+M2nNGCACGoS7eoSFbQxFOC5Zp6FXyZOaAkNPnsdGLna3OsacXvSr7l
X-Gm-Gg: Acq92OFFAT188XAeM+CN+JlEY05ptck0Bz87Dtk6lts01WCjA54if5RsRoTxR5z2xcU
	6nDNJqGGbieNTBhFm8LiEqfEQkIF1nDXoIy9EYQE89eJ9FvUbFRg6irRRFvAuwOtEBmaVOUvdpI
	48hcwePTn7OzcCOcrfxxhKRUHe2j79HT5BWe8E0CYoI6XOSFrc6Gn5ADdGKpTyR1ibXHxXOoHBJ
	qy897iqK3tIUBT5bhz3jy/IZJH1YqXh0yolk7K/lHjA5h6bLMHqI8dHgf1R65l7CHqhj2hgOb+S
	fRWUJVZzc2byedCJi58m969CzMNGLvWQRzIM4DvgdCYvKUrpnJ2B4aevW3+eHA/aDZ5lKG2hmuP
	rLcNEFOeYqspa5XkYrSrrB7TyHnLrS8SLiKqTm54I2Ol+mV5xjMQasOM7ZA7BRq5sEeOqduwCoj
	LixovdWRt8/rzlW1Wo0rE+IqDGHuU=
X-Received: by 2002:a17:902:e790:b0:2c0:b4f5:41ea with SMTP id d9443c01a7336-2c66424305emr154961485ad.17.1781607133919;
        Tue, 16 Jun 2026 03:52:13 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c5535sm130371465ad.18.2026.06.16.03.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:52:13 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] net: airoha: Fix QoS counter configuration for Tx-fwd channels
Date: Tue, 16 Jun 2026 18:50:29 +0800
Message-ID: <178160712947.2156222.3765685889775458986@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_035214_790301_52D3CFE1 
X-CRM114-Status: UNSURE (   9.13  )
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

In airoha_qdma_init_qos_stats(), the Tx-fwd counter was incorrectly
using register index (i << 1) instead of ((i << 1) + 1). This caused
the Tx-fwd configuration to overwrite the Tx-cpu configuration for
each QoS channel, resulting in incorrect QoS statistics.

Fix by using the correct register index ((i << 1) + 1) for Tx-fwd
counter configuration.

Fixes: 20bf7d07c956 ("net: airoha: add QDMA support for Airoha EN7581 Ethernet")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..329988a840 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1256,7 +1256,7 @@ static void airoha_qdma_init_qos_stats(struct airoha_qdma *qdma)
 			       FIELD_PREP(CNTR_CHAN_MASK, i));
 		/* Tx-fwd transferred count */
 		airoha_qdma_wr(qdma, REG_CNTR_VAL((i << 1) + 1), 0);
-		airoha_qdma_wr(qdma, REG_CNTR_CFG(i << 1),
+		airoha_qdma_wr(qdma, REG_CNTR_CFG((i << 1) + 1),
 			       CNTR_EN_MASK | CNTR_ALL_QUEUE_EN_MASK |
 			       CNTR_ALL_DSCP_RING_EN_MASK |
 			       FIELD_PREP(CNTR_SRC_MASK, 1) |
-- 
2.51.0



