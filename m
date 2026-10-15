Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E87CC6B3A
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2026 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ECSIoPsbBe7MVS/DDfDiHhRGxqZFQJYHVqA1SbJwU1E=; b=2UgWjF/MyPSVIiTAnkiSDHTeDv
	XQTa4iKRymWdnIzvurHLiB8qzBKUTAIg7UcCfUP10YK6FZsI31Od7EGAYY9ZUy8mp2j3NM77W/dRM
	bzAmWff2UM9l/QxNevlBaShQeyQh/sYsLwjqI6/oz1OZGhaiiCg9rHk1o+cI0J84Y+XygooPOpFkZ
	FIb+aRjXahVrmvrNeYawjz8J7u04FrFSBFjHmMu+P0iRcHbDXE8a42kck16sT/aJq7/Iuu96KXzrp
	rF8rhpbDnWoQ97tzqtdE5osVnc6ascsKbFukHALPNo3CyJtzSXj9ddITAHUsDUXgtNulWA3Gf8arp
	FLwUjM0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHM40-00000000Jud-0rBo;
	Thu, 15 Oct 2026 14:04:08 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHM3x-00000000JtN-0tz9
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Oct 2026 14:04:07 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5bcce71205eso468814e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Oct 2026 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792073042; x=1792677842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ECSIoPsbBe7MVS/DDfDiHhRGxqZFQJYHVqA1SbJwU1E=;
        b=h5tDw3sNa2EKjy/rQNEAmTzxQP7HEhHAlQ4YiU/TlB66VB67Iu+UhJkuHFULPn/1uG
         6QQ8fEFMIGxMr75cr90V+O5gL42FY5wG3dbQw0e4DQZgIQrHgGrAEkJg5TB2j2cP9Fig
         NyT4qfi3Pxe/Qdr2pi6jcMUpSfUUX29/3ZxiVwoepp0ZVNQ3tEGKubdVwB7PUN/1lbsw
         KC6RqRoPc9+lwbQ5cT8RAq/jjRo/cZhhyvxzD92u96QC9Qz6DzGTJPurocbCO1mXIx6X
         zoD7NmKZ3g8WMd9/UgE+ZxidK/9gGsyj/Jk0J9TI8V28WQ89WjgguJ3v8w/LkGcxE/mX
         R5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073042; x=1792677842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECSIoPsbBe7MVS/DDfDiHhRGxqZFQJYHVqA1SbJwU1E=;
        b=OBnS/JKpo6ZPwoRzo8tgCScyU2Y49PHVHC0foII1G7GdHJFX5grv9ztOcfS+40TAZ4
         DYfJnVQGFjoS70Z9Pu4SN33yanQKhmHpj2zVJU6IcIg5fH+wcO1UGdKCuHGvUtP7ke5l
         QLFuLH/XvPR17PVodN4vVTeq/eXZslWwEXW5NNeT+LCQrqw/6FWikn5FIs0j/O8oh0Vm
         XR3Kke66mH/u53yp29j62/eMq4Qu0Qs7B2cFt/plRXGB+vLB1V2Wz4jDJrBkII4bKZPh
         f2bqs8LqCzlgAzbaTicz0neOva3kzauvZEdaL0IlLG7l7ZaSNOCMPxZtO0uAvQfdHor9
         b9Ww==
X-Forwarded-Encrypted: i=1; AKwUvByJwZLmflHFJmEAR4ITtyOw1+CPQr+YJFQ2zDg3I0d0kORPipXrKwluaeJ1n40MajB3ZNGYlZ7bGDhdoUFc1Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYL3t3ylyoozrum1FSZDZeER9DzrXpSv9dP6NUbVenpOCgzvzlO/
	fO2+YGg5TmYr1VwlBnv4zv4hsy2ugcpOC1UOHwfOqpBo6UGy1EquwP0c
X-Gm-Gg: AYBFou1tZp0nPfHeyCWaOGgSc9QJPDT+Ht9kREikOYDYmBUODGhaWivJL0lYpaaivOL
	MjbtDmMf7yJ6DA2gKOybyKzhAufmmTla+LKi/g3ulZz9mV4lDYdFM2SHbenVNL/I/lClqp4MK1O
	TwLjQotzucWNNM43+iSxNZwxQL6iMqA7V0ebazvw3BFCIfVJT6H8jqLxBi8w37zuukni/xGmJg0
	ZtahLLNO6KtnpcSRLI+vxI3yLDPKQLkVL1lefMeXG87TKiggiLZuIyNm03EH1ZEwvProNiDPGpU
	OHvaAMc41djdgqWNmWTrKSaRQV2JRFFvlNLWQz/WODNwlxnTIHEE5X1mWvAldIr+VTjyyy4KXBC
	h/0BgdLb+DIbWpLBdk0uz/qIBYlXvQDVTzks++ycYWDDOWnT2u5I9HjefeP6rVpifzNU88+MXRG
	trev827lpruM1mHmM7/Mvkl2WJfihYzbHXPi4VI1OZ6bQ/0MKDQbbEihqqIUUlgx48punl3QO0U
	0Y4XftvMQaKC6AjtX8SobC0s5sjRyG9FVrDta3rbw0zGMDNIXctDSop95A5L3LVWNc=
X-Received: by 2002:a05:6512:3c9f:b0:5bc:f871:2810 with SMTP id 2adb3069b0e04-5bcf8712b1bmr4822198e87.5.1792073040655;
        Thu, 15 Oct 2026 07:04:00 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48defca3fd0sm8412267f8f.15.2026.10.15.07.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:03:59 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	netdev@vger.kernel.org (open list:MEDIATEK ETHERNET DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH net-next] net: ethernet: mtk_wed: Fix dma_unmap_single() size
Date: Thu, 15 Oct 2026 16:01:09 +0200
Message-ID: <20261015140110.41988-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_070405_269184_E5CFA69A 
X-CRM114-Status: GOOD (  10.85  )
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

In mtk_wed_wo_queue_refill(), the entry->buf is DMA mapped with length
q->buf_size which saved in entry->len. However, in mtk_wed_wo_dequeue(),
the same buffer is DMA unmapped with length buf_len which is set to
SKB_WITH_OVERHEAD(q->buf_size).

Change the size to q->buf_size.

This was discovered with static analysis and was only compile-tested.

Fixes: 799684448e3e ("net: ethernet: mtk_wed: introduce wed wo support")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed_wo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.c b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
index 7063c78bd35f..4f720ec53e20 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
@@ -99,7 +99,6 @@ static void *
 mtk_wed_wo_dequeue(struct mtk_wed_wo *wo, struct mtk_wed_wo_queue *q, u32 *len,
 		   bool flush)
 {
-	int buf_len = SKB_WITH_OVERHEAD(q->buf_size);
 	int index = (q->tail + 1) % q->n_desc;
 	struct mtk_wed_wo_queue_entry *entry;
 	struct mtk_wed_wo_queue_desc *desc;
@@ -123,7 +122,7 @@ mtk_wed_wo_dequeue(struct mtk_wed_wo *wo, struct mtk_wed_wo_queue *q, u32 *len,
 		*len = FIELD_GET(MTK_WED_WO_CTL_SD_LEN0,
 				 le32_to_cpu(READ_ONCE(desc->ctrl)));
 	if (buf)
-		dma_unmap_single(wo->hw->dev, entry->addr, buf_len,
+		dma_unmap_single(wo->hw->dev, entry->addr, q->buf_size,
 				 DMA_FROM_DEVICE);
 	entry->buf = NULL;
 
-- 
2.53.0


