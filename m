Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AF2C54ED0
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 May 2025 16:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qVA1Wq02RwkJ8tKlxk+KwgWL1KTqqPjG9SMiOazJCzY=; b=QNXM2z7Z/gdYWkiqtvh8TuTLP7
	FwF2wePaCBjYkvcimXB8DZOeMz9E2Ha5URzenz3KMgHqYD8v+B6+yMyUih0Umth3mf44p/rpxlhiC
	y1Nusrkugi19LKx0+q44y2x0J3QwJ4m3A4655uW2cDaAE46TNruUEZII8EFIySjAIOG00lqwy+tqQ
	1ygRJhAkjkMT0+Vk0JR19cE2siWD/1MNN7k/1QdiaFHvd81gjLABI+45yoK3E784jsM+DCoblQEOh
	XcTb00eygSMihWWzfZ+yB5RjjCNoqRjZXx3cJwc2qVbplFfuDmfF+DP2lNkd+bhI98nv29xduD026
	OTGwH4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVDn-00000004Oet-3HDo;
	Fri, 23 May 2025 16:26:11 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUvD-00000004LQ1-1bNu
	for linux-mediatek@lists.infradead.org;
	Fri, 23 May 2025 16:07:01 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a36e090102so46987f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 23 May 2025 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016418; x=1748621218; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVA1Wq02RwkJ8tKlxk+KwgWL1KTqqPjG9SMiOazJCzY=;
        b=HVxB0Z7cGLXznn1fucStNVy5NKPK06UQow4kxUHRBKZ4+lCQfI6OtQ3HtJ+UIq4pxw
         wx/8H+xRsI3ArzgugofS4mI+wS5V8S9ix2Vo5dGkigp38CZd7bD+9YchEg250fs3AGhH
         A+UqzcNpbaiUOO2UubBYBfgy/iu4x1hcQpvO8m0xY0YgLLChwGvgzrEKmlU3+ufxAkry
         3p0SmXMacTXb1pOWPp4wT1E691IUY4qdXssJ9mkNC7iR6VzlKf8YoR5SIttW4NzI01vK
         ZxF0UotI6cCJOxUUHb3/Q3j/HxkBEeONlPVdanY0XhSHvBNZQt2JO+AVerAFdAHqseD9
         ApaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016418; x=1748621218;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVA1Wq02RwkJ8tKlxk+KwgWL1KTqqPjG9SMiOazJCzY=;
        b=SHhpOWDPr53d2ggCmJsdaTp6Qu9+97+guvCJd49aIVKCH251ixf6jCXMZkuKu+SzVq
         pg3QQ1cDbnkzaI9uZ2Nem5unpv6KHdoz7Bazm5bHDzixIztirNdG+MkZullh/4OHYYXZ
         zRfUk3bntOrVEA2Q8CugluBI3EtUT2gXmNLcCAwXAFXXeRbuxs8mTBvk3Wzk3GDA9Nno
         ze4yVnO5Z1m/3BLicwyLWiyFIhPOpPpyGOPnNah07UZfPLUfkmrXyveWbFYu9ZkW8PpV
         3Dj6vZW3gVUJuErMyvYGfuNSOlst5TiAtAJbQzPR6fScJ6uC8Bu5DbXqaG5WGC6mZUEN
         1Zaw==
X-Forwarded-Encrypted: i=1; AJvYcCWSrU7abUGpdfuWk+UxiRamRvtRdxJvYj+GHHqYcCzfdRmQbT5qc2U/yBeTiX5KVxJYFWgeDFyS5fg4ecOIFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuIPDxc7ic8R8LANp7MSOohjQosYYftaiiyg+OvQlrek9a4O1c
	7ISbIYdaIIHJlNU0/aiWSDA9upJ0YeWYoxhFMjDXc8Yslu7yQoMBV5kb57jFSDUmyow=
X-Gm-Gg: ASbGncsE8y8LZcMCfB5SfxoNYLyLcxC6FOuB1F54hls66+jgHDse+hT6vVjxr08gB4Y
	7+zQZ953nMIA1O9ewF6wfjx2WkXwfGCS9zE20Qp81JfazumGjyO1PGvIyCFiYbb3dsJDinAjTbs
	6SJQREU+Q8nn3lnUQrhbkpk5XmEMgvw09HPocjvLC/pBDDG4jR4ZqAbOHGRkuOcUVrNq1VBp2A2
	4qYxyFFJceIt+2NnE6Tee5duvreyXcuNTo7tDSA4VMUtEtD2A0z3oBNDk6YE5zgYZgfXAanVzGO
	nbrQNZEOHF9L8pPA5gQr5PY6C6C1qHWOTeC12F5tyD3VVvYf06wB2RaBEFAkVMGPTsE=
X-Google-Smtp-Source: AGHT+IF56UQSCz5q5QoQKyBHSndYLKMFyKvT78EcNJOHgSCsSRrkaKawUqXQh0qLd3vhveIRpS1mOQ==
X-Received: by 2002:a05:6000:2011:b0:3a3:6f1a:b8f9 with SMTP id ffacd0b85a97d-3a36f1aba52mr19442998f8f.15.1748016417661;
        Fri, 23 May 2025 09:06:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca5a8cfsm27334537f8f.37.2025.05.23.09.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:06:57 -0700 (PDT)
Date: Fri, 23 May 2025 19:06:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] dmaengine: mediatek: Re-enable IRQs in mtk_cqdma_tx_status()
Message-ID: <aDCdHh-G2ShU6uid@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_090659_423708_E4CAB01B 
X-CRM114-Status: GOOD (  10.25  )
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

This code calls spin_lock_irqsave() twice but obviously we can't store
two sets of flags in the same "flags" variable.  The result is that we
never re-enable IRQs in mtk_cqdma_tx_status().

Fixes: 157ae5ffd76a ("dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma/mediatek/mtk-cqdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 47c8adfdc155..9f0c41ca7770 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -449,9 +449,9 @@ static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
 		return ret;
 
 	spin_lock_irqsave(&cvc->pc->lock, flags);
-	spin_lock_irqsave(&cvc->vc.lock, flags);
+	spin_lock(&cvc->vc.lock);
 	vd = mtk_cqdma_find_active_desc(c, cookie);
-	spin_unlock_irqrestore(&cvc->vc.lock, flags);
+	spin_unlock(&cvc->vc.lock);
 	spin_unlock_irqrestore(&cvc->pc->lock, flags);
 
 	if (vd) {
-- 
2.47.2


