Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51036CD98CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 23:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=32LA4oVKRlobt0c3JKXFPxQfDW1KytgL05KrQQdvsrs=; b=i9FXa430yBIRtTb/SQM04Sm3Qj
	G9DTuBK0NTRkWG/mg0YQWOSli1VydkEhYgKdELp/sff1BiSbFE/H5cPFmammkqHlX/y/8JcYL5Zsg
	OjeRcyI5xf2yBqP/ZsAH4NVv4vhY6JtHAi2IfMW/ao/uvDK5/TD7PjZj7MGbpJ40gQcnl+Vm+CV31
	4Uv92+wWBCuCf7wSHNDr08koryenfVAN9hGb8aNxFc2s0/SI/Yf28SzO62MO5udzm7b187Pk2UaNd
	T2yjSp+smthv+ewAX6eTdRhxYjywuO0gEWMjCPy++QiV4c5wizB+o9RZP05tMQaGuuGA/So0QMXSz
	5O9T3Trg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoZn-0000000AA6S-1dxA;
	Thu, 11 Jun 2026 23:12:43 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoZk-0000000AA4x-3T5N
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 23:12:41 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-842848fd613so391339b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 16:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781219560; x=1781824360; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32LA4oVKRlobt0c3JKXFPxQfDW1KytgL05KrQQdvsrs=;
        b=opV4sKUBbmoGI9Lzk4LhJTEdVpMSGPPZe9yO9Iq858M+m+x+FsUE6Qj703AAjwAm2O
         zEynsl4YzTKw/vBH9/EbqY+czim9WOggYzOHHmzwbfnbBQpmTKWrhztHc65jxilDtue0
         NuJ7nJBHH2tIfL4/bIzza8wTUBLb2fFs7rGukaSPjcAwvft48R6/emNZX7J40MNIUblg
         A+ef7q4H2nUlnL/ZtK/hKlpAXuZ8oYAo/pPuXFoPavgSBTA1ngXhSfROTUuPh2QRcT0s
         rxrLw9N+ZPjlXO6qPzZUVGUjgWzDEImGtD2SGFIQQTBiyIRDFiRftGh/JnjD82oerszG
         oqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219560; x=1781824360;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=32LA4oVKRlobt0c3JKXFPxQfDW1KytgL05KrQQdvsrs=;
        b=Ka9aMBOZCoJV2afHs9kZAKGhqTUDwrmbJO1FKz0ey99eyRcbKngZ0KbAsXo0PcHdqI
         QlSeqD5BQx3S+aVHzqjW0e2JFYBPzypTmBLxbEDviQ5MD5KXY9MlhcNEOMFJ5YckQXwy
         9PKPU8nWtZFLvTFu/InAlUzsgze66BnYcNGHQOmQ3OGsn3LExmRROOuy080wNcsVdmMV
         GX7KfbE/bT3Ur+/eHNGbycWHFVW/ROOq7Gf2Xp+JzFPll/FdPpF1yW4uR2rblqIq8DMe
         jh4EVJxBzPCCuIHUQOkYkQ5UGB3k372Vt8HAa6/nsd23HS6SlAqTWto+bfAn40PGR2V3
         lYvA==
X-Forwarded-Encrypted: i=1; AFNElJ+u12NCWkPQMrxp5KIM0BgJzFnXEDpVRtzzWCKteI9GlZMdV1DHtUl+OEY33AEUS24TwWFa2I2hKZcWN8rr/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrn8a4cffmJC9aYOeWOZQC505t5zq+rasF+aF8+q/8t/qSBPO+
	VjrnqK78NEdg1jY4bZ3rklFV/oiRIn3SL9kBXBgM+zg/2bzaU4zhkkug
X-Gm-Gg: Acq92OFsy/Dh4ALOjH/E309yJalIsB6ZKE2GcGYadaiq38PiPNYsqRy7g/FC3nBgSyY
	IAJbQ9kjkKHYxi3A9xzqwt6u3eYMQmVCQNRxsGeLE9PeU+iA8QWx7gm/dCykbGth0+kyhl4QXuc
	WnYzDX1Edl35h+fVmM8IS1u0nZmJYCyqi7Dpgf3oQsoIGF1HNOPXgH2L1GRRGdQc9mlC6CUggBu
	dKG5EllRkXL2807WO8fSggFR6o2+twsdWM/VBFYmuhe12qULL1MOTjeV9BZLVH2AvcMGLqvfBa2
	rzhdJxvtB4IjSVWQm+EG8ZfbFCljCatQTo6kEU1zi6QsUZydnxrUekwkIHXvQEOSTXXe04FjkG8
	4YuBGafOaFYWUOUGybHRV3RzOSyHw42TKBKoZUHS1z6u9LG1ghwr3WHaEBc0vT7swNkxlKZHDeK
	nvpzvNuzls8cqFkOkv
X-Received: by 2002:a05:6a00:4f8e:b0:842:6a97:52f7 with SMTP id d2e1a72fcca58-8434ceddc63mr106827b3a.19.1781219559923;
        Thu, 11 Jun 2026 16:12:39 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd100esm199571b3a.34.2026.06.11.16.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 16:12:39 -0700 (PDT)
Message-ID: <6a2b40e7.4dd82583.3a5c46.e566@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Fri, 12 Jun 2026 07:09:13 +0800
Subject: [PATCH] net: airoha: Fix register index for Tx-fwd counter
 configuration
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_161240_865377_F780F658 
X-CRM114-Status: UNSURE (   9.40  )
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

In airoha_qdma_init_qos_stats(), the Tx-fwd counter configuration
register uses the same index (i << 1) as the Tx-cpu counter, which
overwrites the Tx-cpu configuration. The Tx-fwd counter value register
correctly uses (i << 1) + 1, so the configuration register should use
the same index.

Fix the REG_CNTR_CFG index from (i << 1) to ((i << 1) + 1) so that
the Tx-fwd counter is properly configured instead of clobbering the
Tx-cpu counter config.

Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11..329988a 100644
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



