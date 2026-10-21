Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172C606A31A
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=atjp/ycc;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BvdSkBr2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/7ngeHbVYERGvM2jFGnKfOGGvB7UaeEskne35/Ksbe4=; b=atjp/yccvnTAmyNl/IKseIUpNm
	AG9Fao01PvALtbY1AoYndaCLJbHO0MfhQMWu/wEqsmu56uxtvSYUJGNhgJevCd38NoFs6UgrJPKLk
	SSc4b8lc9RiucLnqUJ2IYcawzihSlXhp/2EIVvXlmfsIkcb9Su/q8qhBM9k8byX3xqXhQtvGn/Y6/
	7XLRp6v4lXUDjvsLmcvlKwe3Xq3I1M/kzY9k3c/lqTT5wCej/4eGap+/7lmNjkEBt6PAf6HK181nV
	Go5ndmRXeAhZ5tAOotAMNqUuAuJqt9RbxkWq5oxBi4VuS+G/6ZgbhGzm6ZrmXUhcetFN1lDWV0XeB
	OYANQQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdco-0000000CuQw-0oJg;
	Wed, 21 Oct 2026 21:13:30 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdcl-0000000CuPi-0Oqb
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 21:13:28 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-8451a619da7so793842a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 14:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617206; x=1793222006; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/7ngeHbVYERGvM2jFGnKfOGGvB7UaeEskne35/Ksbe4=;
        b=BvdSkBr23U4XfKaAmsWFtOR2QK+WPXhc4zElp3mf2HdobNMlreOT4oBlxkWTjZ0Eex
         09bAA07dd6nHfcupVORO/vD505/jfIvisQSZh2wABZIe4T7CUUkkUHiTnumJ2ZCcejbh
         9aSV0MITxZI4V4W7UKP0wZQf5EB61q3Q89byR4L8fDPxNPRSP+VUDpLCtzlHbQWT0Zbq
         nCGUdT4QWpkikPqag4xZ2gQwV5TK1m/oaRE6oEkI2w4xoKYKvA0LLMuerOyPdUcsBqaF
         SP2ics74PsnOAgmimdSyrNXCbqlFWKFrTpgBZnu6MZB4iYBwKjN9ot0ybVAMiy2pRQfo
         3KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617206; x=1793222006;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/7ngeHbVYERGvM2jFGnKfOGGvB7UaeEskne35/Ksbe4=;
        b=Y9W0rDPeR8tQcXMwRezULh3zkhYEIapF12vikFO900KcrZwxH2OILj8nnqTwk2wwfE
         xCfuP1CVQKxONAnR7b+wk+dUMsIXr0kpC4HxEYvd2ePYBjBykWnuSEU8oyHruyXtVPgf
         sSfOovIQotu+4VW9H8R/MENth6CEYvGZwy9i8i0dHjn19ae/xo4q40u5k7ZbqeSQC/rL
         tT4SZSmIYCDenX8AVUkJ3KbRGV2OCbduTIncwpe6KfhkOTYaOJxTO2jkM+lwaTlVAxLh
         JEw3vDBVdZJxzMfeh/SYMikgBuRXMq73SYplpzsvjlSexLjndUUzX/QyMWsWPrhpMOOS
         dDWg==
X-Forwarded-Encrypted: i=1; AKwUvBxCVP5+HyGFNvFDYIYqAJmSJM8ug2tK8PSQqu5GJBfKRiwEf5DM9NFRjPpGVQ7TyIgD7KCi0jKXCpdMhf9v8g==@lists.infradead.org
X-Gm-Message-State: AFq9FYJcdX3tTB4pOgQdsyLLqh+R8DI998lncFxzjXbVS1sB+w3BOa2b
	w3zZsrxwkBwoZHyAPLkmPRI7pxwVdz8D4hFsCPyjM++Z3pMSCenbIV3cgStaHA==
X-Gm-Gg: AYBFou1JkhFSCDhENa1TvDLtmCxfet7bDNXJEZKJbfH+2fxo8FxHVNpByjqxF+0aUoo
	Cj4qhDj84IPiav18lhu5RYeG46j8yrI5htBfpub5fGLFeOcMozEy8iDnfBB36GAFzH+kihso7cw
	e2wyfs3aywRxrCLWRCn4ukebZvOqVK7VVwgt3zRFz0MSmN83Qev1vjzIrpB9T2xaLA4CinKX6Vs
	5Vtq7M7ZMh4IMQ+ZZP74ITixtJnzxEtIVm7Gu3VX7aOIHUYwrUx86RNJ3Ak+VXEzloGKG40ojHO
	keBT6RUJFOINqYVHKcd9egrXUhUbzxqr045hIgJR+3stQzj7oP2IKcpjoKtwhJB79FPWYJ7b6Fb
	RfVPQgY+LjmYRLuzwPMFy1qK2uCjP3rqKTBsnh+lfMzkwK2IRVDdp7ZZBO9SgMuIeyZlvRNxU0W
	9Eiwm7BXET9e50HjQfVyKy2F0NG81B2i2o8yWX7QBi3JBPx7Kjr9ueKUkvT45rabHIh7RlhwBjA
	X1phyNdB0yOTHyMcVSiqlOCaVGZnfH0dw4hb2cxJcBkH64hbzAu8mkVByUwZLDSYkpVKH1pm3ut
	5prixcZ0uAIr2ax5pvT40cm2PZzkkljMiLVrq0wQCr9A4BJVsWYuhS8XnZCPId+/gf0ecWR13Ir
	2zUyer1WhYotBL3ssEuNebhoGzcl9Tjm4tuLOfbfM4h3c3spoyjt2wLt67fqXzPdjpqU4fV7oth
	U+CDM=
X-Received: by 2002:a05:6830:3495:b0:806:9a8d:4b9b with SMTP id 46e09a7af769-84d0890bfcemr2646685a34.15.1792617206105;
        Wed, 21 Oct 2026 14:13:26 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbcdd9d82sm3219421a34.10.2026.10.21.14.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:13:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:13:24 -0600
Subject: [PATCH] dmaengine: mediatek: uart: synchronize completion
 callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMAyA4VchO9u4DVHiqxgP26hQzQrZBlEJ7
 +4mx79pv64iYiCM4lqtIuBCkUbOoQ6VcIPhHoG63EJLfVZSK4iz9ZTApxfMJiTovIH4YTeEkem
 LsChQTevaWta2uZxEhqaAD3r/n9zue2fliS4VuWxYExFsMJkpo2wi98R43O+27QdSLGkzqAAAA
 A==
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_141327_134571_F879F62B 
X-CRM114-Status: GOOD (  10.71  )
X-Spam-Score: -1.9 (-)
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

Terminating a UART APDMA channel waits for its interrupt handler, but
completion callbacks run in the virt-dma tasklet. A callback already
removed from desc_completed can still be running after termination
returns. With no device_synchronize hook, dmaengine_synchronize() does
not wait for that callback either.

Implement the hook using vchan_synchronize(). This lets clients finish
asynchronous cancellation before reusing callback state or freeing DMA
buffers. Keep the callback wait out of device_terminate_all so it can be
performed without locks acquired by the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..7583c287da5d 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -440,6 +440,13 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void mtk_uart_apdma_synchronize(struct dma_chan *chan)
+{
+	struct mtk_chan *c = to_mtk_uart_apdma_chan(chan);
+
+	vchan_synchronize(&c->vc);
+}
+
 static int mtk_uart_apdma_device_pause(struct dma_chan *chan)
 {
 	struct mtk_chan *c = to_mtk_uart_apdma_chan(chan);
@@ -514,6 +521,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = mtk_uart_apdma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


