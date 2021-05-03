Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DC0C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 15:28:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7DCE60C3E
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 15:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7DCE60C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=em4Q03K+rZorVc0/ttJDOAaqUS/wku4gnScU1HcyDXU=; b=Yzdgm/9ZOGz/GL
	EMJPojyjQ9OIeBSNLTmXz1uK1fu9GK18lxYV07aCNssG7vjNa1tlnT9GqyDFYxVdgOTtykwCPj+lc
	R5HO8TgMsUPUUh2khvd0Kp96kv5CLvyd+qNo+WUqxt4oKVlE7zWsOJkszB1fOgQvvnIXRT5D4p2bI
	byQXmDKR6FcZM1AUQOmBjRBcBNTPFQxaZGbr6aTb0IUCFRocBToX1BspzhD4rnqb1W30vzlbo7BCI
	i1rZIshXFguofylURX3CPdbhMTb8UHa13PdPp8N/teviNwQdmG/UDuLo1UvoJS42Y1WxBqbSoS1Ja
	MrcNFuaPOFLOzZ/TT31A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldaUI-00EELr-P2; Mon, 03 May 2021 15:27:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaT0-00EE75-Ae
 for linux-mediatek@desiato.infradead.org; Mon, 03 May 2021 15:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:Subject:Message-ID:
 Date:From:MIME-Version:Sender:Reply-To:To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=KYXKPtE2VZh6dALBmahX3Lb0HQq8HVq0AUpkoo7GpCQ=; b=vnRw/PeVv4lBAn6d3uNFt7nNcr
 OT94Wcqw4SnuA5AGR+eFxjyCigW01HGPWi0/vYMSr+u17XIO/Q5eHDYJ0rBX+BN4I9Cp9wmgh7V32
 uAdNMwqCRU8dH3xenjboYYBJnV59I9GFE965JrxQRn8IN1TQKAT1fUIOXZ9xpgrczYTY+BDzAb8Oh
 SQpqSfG3gozPjAfKx03PYJyKkorZKBHCgFM9MpaNPhJLitm6WoAY8bj79B+u+68XRxzhUbMyP5lJC
 NlDlF5ZvAQ6fy98YHF6gjczlqy2o0Wey/yTT4QH1X1uotF2ZXfIXEHk6VckFb2kCA4eEflQsLKaVk
 ZWWXUpNQ==;
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaSx-003AwG-22
 for linux-mediatek@lists.infradead.org; Mon, 03 May 2021 15:26:36 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso5409464otn.3
 for <linux-mediatek@lists.infradead.org>; Mon, 03 May 2021 08:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:cc;
 bh=KYXKPtE2VZh6dALBmahX3Lb0HQq8HVq0AUpkoo7GpCQ=;
 b=xmbEQhxke5pWHBfmJSrThVbWD6yNloeA2luzWWZqnzEUacHlBE9+p5BdJi3ay7KHeM
 EuMcX5IaisYJBmG+magxxmg5YuD04Gmwg7zkDBgqouHeuxxIcMUOnP8AYfGwVW3DMeNz
 RsXqNHfeYCEYU4hJolnlkGJ72xZ+yP8N1Kv5W96RED8BM5BQucoNaDhHjUMwLQZC24wl
 ZVBvPEqsjSvYY4Ic+mnHQs4tgU0zinx9OPGvC9YH2wQzKGCs+fkp7h5Mh2BpLTxXdXBu
 RYgOmbb+6IJE9/Eyo2w/veS83rXtUE5tF3PnuxfyHB+uJGQkLVMfY+DoCXkit+rXY+mH
 tPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:cc;
 bh=KYXKPtE2VZh6dALBmahX3Lb0HQq8HVq0AUpkoo7GpCQ=;
 b=HN5ZDXtDErEyUMSKQ2VznlzT/PCSxEfcAxgxROioXy5TdH38TUbDSEaauOCMkVd+qE
 QOijxyhF3rLKhYGQIw8ubDhsEl8UzvWhRwW/XOMo8w1AYQxsiqZntk9Yz2sAUId9bb6P
 lICiy709OSPwLclbqWaWcvCCBhb+HO0Y4QIMceXJ1a1xM7thnzdAmgDlyqUvA9ynSl84
 txS8p9R79w1CY4X7t7XtwWIiti4DqqQNr5LYUd5nITfN4gPVGFbFLz5BeZSi5rNXoV2X
 +uCoXYmzxUcSIFyGThzuNvwC92OOWDjKoXtz3bd2g3YPGlI0FksrJRwl6iuuK9lkEEfb
 /Feg==
X-Gm-Message-State: AOAM533EY/26kLMJlunkrZ0CeDUUCwLvirIKb5XBIIaVqnQYZcwDR0Kd
 yrwCdGQdHJKlP8BAK7jAS096kbVTCfI5QyiaLGogZw==
MIME-Version: 1.0
X-Received: by 2002:a9d:4703:: with SMTP id a3mt12624906otf.136.1620055593857; 
 Mon, 03 May 2021 08:26:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 08:26:33 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 3 May 2021 08:26:33 -0700
Message-ID: <CABnWg9s9nbqm3bMv7oWgDw2zvaB3tcHttk9n9Jia4aZ_tdvK=g@mail.gmail.com>
Subject: [PATCH 4/4] dmaengine: mediatek: do not hold the spinlock for
 vchan_dma_desc_free_list
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_082635_106591_D2137F59 
X-CRM114-Status: UNSURE (   4.44  )
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

As there is no need to hold the spinlock for dma_desc_free_list,
Move it oustide the spinlock section.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c
b/drivers/dma/mediatek/mtk-uart-apdma.c
index 4711bec04b98..ba43708f2a93 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -431,8 +431,8 @@ static int mtk_uart_apdma_terminate_all(struct
dma_chan *chan)

 	spin_lock_irqsave(&c->vc.lock, flags);
 	vchan_get_all_descriptors(&c->vc, &head);
-	vchan_dma_desc_free_list(&c->vc, &head);
 	spin_unlock_irqrestore(&c->vc.lock, flags);
+	vchan_dma_desc_free_list(&c->vc, &head);

 	return 0;
 }
-- 
2.26.3

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
