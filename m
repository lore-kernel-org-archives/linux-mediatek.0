Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFF8C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 15:27:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E86261040
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 15:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E86261040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z7yMs/XbhaZuWt91PbKDfRIgy08La7szW735TwP3uas=; b=Y36S//pM8ytN/j
	yokFkKVrLApnvwjb3NUtMXn4yRChe9HbyE1lqLWrNAwxBJnrjKX8+NyU2H614R3cp7Q0w8WqHMVJp
	iDm/EGL+rtqdUlRV8cXR1S5EKrXo3UDiKHUWyNGpKCwrW56Q6OVxphIM9YPraVZvQNDiA2mvx2kus
	y3kK40nK7sMKMhDT6AUGX9YplsR7ePM+/3K/NFtBUjK5XmtDQ+f4yskqY4v51gklP2VszaR9owUU9
	lUOoadT0DUfcpkpekLNercQpUVeSPmq2VZhoNfkp2499n+JmQVeoQ0g37tsktiiStcwR1cGzX17eE
	jNgUb3mdNVNA4zUtVHIw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldaTW-00EEBr-Ul; Mon, 03 May 2021 15:27:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaSx-00EE6V-UR
 for linux-mediatek@desiato.infradead.org; Mon, 03 May 2021 15:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:Subject:Message-ID:
 Date:From:MIME-Version:Sender:Reply-To:To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=DsCC9gqqI3YCW9ovP0n+UcVOJC+7xZwxFoiL/RkkmZQ=; b=yCoZTzwrj4reFuch2HO01cYoPL
 dIgKgUJigAs2mLBYa1bIHihpI1CudSmJFC7wveJcsMIv+zElw+43sRsOtwqSo7xKsbI9222yfiRXo
 V/xkaCQgH052T9WrnA9rCr6Z6VPVYxKSuEHdiEhqGEjGQ0YmmuttgdUJHSbyQ0lYuJIqm1YeiOqKX
 QZa+UwE21zPvEsh/9Ne09nb/6JtBfRXJX86P0o18oMBKeCBzFuPn/fAlgROoeaEHo3yhs7OD1Y8GF
 upWwLjbsbyXd3NJXJgXywFqB2kjIAIHApZGA1pdoMpJbMrqYirgpFqq7GNpbJ1+E2HAq8b2fPIOxs
 RMZ+ETlA==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaSu-003Auj-B7
 for linux-mediatek@lists.infradead.org; Mon, 03 May 2021 15:26:34 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 g7-20020a9d5f870000b02902a5831ad705so5375716oti.10
 for <linux-mediatek@lists.infradead.org>; Mon, 03 May 2021 08:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:cc;
 bh=DsCC9gqqI3YCW9ovP0n+UcVOJC+7xZwxFoiL/RkkmZQ=;
 b=dTvWlgasNphbykbaGHMLyLlxm27D+XIBOlYNgL84vlKQzIt2kjc4Kpa53LEJlK56fH
 CfhhR/nv/DMZ2I5AUGXMjc4GWmsxBfA0tdkAV2H3leyucCOxjQHnq7nh3uGC8MLPG01f
 waYCxbw9lruqFE0t9nb6eIhAr0jK8vdtTLpyf8Smyux4w3GaYaegAA8OqvMev6QDvrsZ
 4pRtlb4cXCcLWcnEVOL/Gr5Xf/XZM+GLQDWWPFsg6cKOSOdNiwgC8uV4kjIZeNNQIgJy
 Q+awveaVeyz4b4ewr4Iy8AariywFauLqvXNBeUKB5aSNAn51R5lMo3k/com9ahoxXTWE
 fm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:cc;
 bh=DsCC9gqqI3YCW9ovP0n+UcVOJC+7xZwxFoiL/RkkmZQ=;
 b=Zm6f0JcSS/KHlQGPv8ykoa21smGNfAkxIcrQ9VKWkGMRd6wPWKImcPwWy3Aaz/KjAN
 I+haix3pfrsg/I28he4dcQr+Ilb7eRT/oxvALrU29JjYT5A6Rfv7Xx1vi9sZnHK2tjvv
 SBmZSZ2Sz8jN9cgQtJ2NxHIcFmnW+wY1TMeM5wb4qjMzM/mWhpr5XtAzsTml0+CdZQtS
 +LnVf2sdOdYetzNAaSraQDOIwQa/Ei3N5TN0sMcbagj0NUtg7SdPVvPCpw9QLvdk4yh9
 C75jSu0uRruP0j/qqsoN6H8SWdGS/g3+3kOkut3prhnmB80gdfa6BkC4rpLbVrr2Zxor
 qBoQ==
X-Gm-Message-State: AOAM530P30GSTSbRwqxYvqrPi++yKRo/sA1Zsbn0ar1GVHHv1hgJLjY7
 Exu1FAeu/SCu3hGH2vt2Bqn1tMjUfVtbpm2ExFIz3w==
MIME-Version: 1.0
X-Received: by 2002:a9d:2de3:: with SMTP id g90mt12928708otb.274.1620055588708; 
 Mon, 03 May 2021 08:26:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 08:26:27 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 3 May 2021 08:26:27 -0700
Message-ID: <CABnWg9sHzqZ-fYpe3cc8iQDBYm9=5yXEYV2Qiaa0Eoqt8UOG6w@mail.gmail.com>
Subject: [PATCH 1/4] dmaengine: mediatek: free the proper desc in desc_free
 handler
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_082632_404467_89A3C7D9 
X-CRM114-Status: UNSURE (   4.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The desc_free handler assumed that the desc we want to free was always
 the current one associated with the channel.

This is seldom the case and this is causing use after free crashes in
 multiple places (tx/rx/terminate...).

  BUG: KASAN: use-after-free in mtk_uart_apdma_rx_handler+0x120/0x304

  Hardware name: GEA MT8167 ManeFaces (DT)
  Call trace:
   dump_backtrace+0x0/0x1b0
   show_stack+0x24/0x34
   dump_stack+0xe0/0x150
   print_address_description+0x8c/0x55c
   __kasan_report+0x1b8/0x218
   kasan_report+0x14/0x20
   __asan_load4+0x98/0x9c
   mtk_uart_apdma_rx_handler+0x120/0x304
   mtk_uart_apdma_irq_handler+0x50/0x80
   __handle_irq_event_percpu+0xe0/0x210
   handle_irq_event+0x8c/0x184
   handle_fasteoi_irq+0x1d8/0x3ac
   __handle_domain_irq+0xb0/0x110
   gic_handle_irq+0x50/0xb8
   el0_irq_naked+0x60/0x6c

  Allocated by task 3541:
   __kasan_kmalloc+0xf0/0x1b0
   kasan_kmalloc+0x10/0x1c
   kmem_cache_alloc_trace+0x90/0x2dc
   mtk_uart_apdma_prep_slave_sg+0x6c/0x1a0
   mtk8250_dma_rx_complete+0x220/0x2e4
   vchan_complete+0x290/0x340
   tasklet_action_common+0x220/0x298
   tasklet_action+0x28/0x34
   __do_softirq+0x158/0x35c

  Freed by task 3541:
   __kasan_slab_free+0x154/0x224
   kasan_slab_free+0x14/0x24
   slab_free_freelist_hook+0xf8/0x15c
   kfree+0xb4/0x278
   mtk_uart_apdma_desc_free+0x34/0x44
   vchan_complete+0x1bc/0x340
   tasklet_action_common+0x220/0x298
   tasklet_action+0x28/0x34
   __do_softirq+0x158/0x35c

  The buggy address belongs to the object at ffff000063606800
   which belongs to the cache kmalloc-256 of size 256
  The buggy address is located 176 bytes inside of
   256-byte region [ffff000063606800, ffff000063606900)
  The buggy address belongs to the page:
  page:fffffe00016d8180 refcount:1 mapcount:0 mapping:ffff00000302f600
index:0x0 compound_mapcount: 0
  flags: 0xffff00000010200(slab|head)
  raw: 0ffff00000010200 dead000000000100 dead000000000122 ffff00000302f600
  raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
  page dumped because: kasan: bad access detected

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c
b/drivers/dma/mediatek/mtk-uart-apdma.c
index 6bef40f0c9dc..4610dbdde75e 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -131,10 +131,7 @@ static unsigned int mtk_uart_apdma_read(struct
mtk_chan *c, unsigned int reg)

 static void mtk_uart_apdma_desc_free(struct virt_dma_desc *vd)
 {
-	struct dma_chan *chan = vd->tx.chan;
-	struct mtk_chan *c = to_mtk_uart_apdma_chan(chan);
-
-	kfree(c->desc);
+	kfree(container_of(vd, struct mtk_uart_apdma_desc, vd));
 }

 static void mtk_uart_apdma_start_tx(struct mtk_chan *c)
-- 
2.26.3

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
