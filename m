Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69025C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 19:31:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDA25613FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 19:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDA25613FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WopqJ++mGcEuquoLehUl390vHm8jvuWIOzqbYGABEGE=; b=FkifV5mw0jHDQKvR5wh4VVMFT
	0BwqGexPP/ELGwiX/RSi/kLgXd2xiJPrCvUkZXhWUQA5nzgZ7B1iy8FDiJ3gTCg4lXZf4hbbCeZcS
	QkSsn/l4RkkmQDh3X+QQKQ37bmEOk1ZqNLNTVYCxFWwSaJysLhSbXeM4JbTKOhuSfkZ0UltQcGP3l
	oNIGsu99KFyLbph1KAAmEtS5Unk89zqU0Ni+8dEisRCiS1RjBGDXIXyS54Bwr+GZQzeisIqRYgO+j
	QIeTARO9k0Ki5CjbEf1cSYRrFc6IcZ0msKZ//N4hnPTwjG4/5022QPUOpAtxmZjtcc9OI8KX/tQeT
	93G6tgMSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhH2z-006GrO-Pq; Thu, 13 May 2021 19:31:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhGzF-006GVb-VT
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 19:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=eRxz/pWXTALO6H3I0wjEAHHa6qtt4usgfqtoKz5U3Bw=; b=J/nSNykdlPmLSs2d31Ng9LgxcU
 yYCDV06i0SRljli5h6BpNTF+W7ups6Pn71NYlpzeVPZni1QwhQqaN5t3oH618zCTvCzGv5APlWYku
 o9GmssXME3BBrQlGCqG2mMMWrAMcwkPXgrM9zsXTqiVIx+f/0Gg+vmKqp/AFzqK3tYnduTWHpGkFm
 9rDkT4IzSuckDFPsyNJNuSP7lZjKoa9hESc0XeTbD1u4iqCzkt6cUpBu4b+OX5GybdDfwhfYnmGYU
 acDWTEkufyut49VUHnOQIdQRI5vrsfxPI8NfkQq4fPVtmFy5f9Z59NhQqzX3qlufJq6ZyJhYkxKdS
 UBLK1ndQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhGzB-00BTXl-Qo
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 19:27:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so373158wmb.3
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 12:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eRxz/pWXTALO6H3I0wjEAHHa6qtt4usgfqtoKz5U3Bw=;
 b=SDoVIViQbUjjhanbrPpBJslUuhhXuGOUixKLM4aM/Xni8UB3PfZUwBqSdnqyXcHmOE
 QWegUOH0EPxlW+QrYpS4iyzpXPEZoGmDQzlxAglfvi6Y1N6q4Dn67gbq7WZQRM5drQXL
 rmrjV3vScos/2VteiR6GuJdaSi0YT8btL3MaVof9zulzqm7UOk9M+9IIDdkkAcm2BlQ7
 5M1mJ8U+FCQyn8PDVJwjITjPifC5lD21oM5IVKdHUghZ6Dt/gM+NI029xI4uAJDlae5F
 QHLJODjN4XMl7VO4eNkJxB/yi/CjBPnHCwWn4qymufqvhK+nWYB9o8ueMSXS3ZdbfrPz
 s8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eRxz/pWXTALO6H3I0wjEAHHa6qtt4usgfqtoKz5U3Bw=;
 b=cSalyO9uo6sdWA4bFu4q07hiYoz5TYgSDhCK5zzkBKcYHudymIPwHcXGVGf3aEtVpv
 2BM51KifkYVJMcj8iuQ8crkzpol2ZAytavE+q2fPRy+vx5zdETuK5nUboqV9dwsAsXLk
 KpGca8XQq1GOojQ8eSazAqal67yQX6wBLglraRVHwPATugaceAcqjlc+0uDLdOGF8f8j
 2ykZyLWv+KI3zCjNVbSfASrQvdkbBHe8ldgug8oZ3A5F8427TywZ7B+VGng69G9ZOB6m
 eYkplBgSby2Q8Dj2sL12AHi4SozJWLslfTqI93W109EccK2rL6cC/cRnA/iwHPB5DK1s
 iawQ==
X-Gm-Message-State: AOAM532nH7Dw6W4YNoyl39wiljxT+GrCZo/5CtbSDW3YK/w95Fm3pXCi
 66JqGuOox2Cpl4bp7rHTbcxmZQ==
X-Google-Smtp-Source: ABdhPJzyMLZTPcPNKyhY5TxDvljyGM7Bn/ftFSKMJZJ7ETtYuncFkrWBVj7udx7AfFFx7pB9Mel9Nw==
X-Received: by 2002:a05:600c:4f04:: with SMTP id
 l4mr45170585wmq.18.1620934024035; 
 Thu, 13 May 2021 12:27:04 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-d842-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:d842:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id h9sm3053621wmb.35.2021.05.13.12.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 12:27:03 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: 
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dmaengine: mediatek: free the proper desc in desc_free
 handler
Date: Thu, 13 May 2021 21:26:40 +0200
Message-Id: <20210513192642.29446-2-granquet@baylibre.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513192642.29446-1-granquet@baylibre.com>
References: <20210513192642.29446-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_122705_892056_F883468C 
X-CRM114-Status: UNSURE (   8.51  )
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
  page:fffffe00016d8180 refcount:1 mapcount:0 mapping:ffff00000302f600 index:0x0 compound_mapcount: 0
  flags: 0xffff00000010200(slab|head)
  raw: 0ffff00000010200 dead000000000100 dead000000000122 ffff00000302f600
  raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
  page dumped because: kasan: bad access detected

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index 27c07350971d..e38b67fc0c0c 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -131,10 +131,7 @@ static unsigned int mtk_uart_apdma_read(struct mtk_chan *c, unsigned int reg)
 
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
