Return-Path: <SRS0=Yz5u=2N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9733EC2D0C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 19:01:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C90E2075B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 19:01:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V/D0piiB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIrbocA7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C90E2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JuS0IqtvZJ9q0OVcLt930oksEFduV8dfIbAy2y2DZy8=; b=V/D0piiBI5eIcTJiGwVq6Qr1qm
	h+24cbGBy73P+tge1nWjGO5lcMR1fuKT16Exe6kMwHPd0B7OB1PKIJaASdiFgkCWR1ODQ8LurFSoG
	GM8IMBknFio+TT6iANRTRXMkhZ9ZFmZPO3ouTqgrCp0qICC8Pq57MgPbj+sXYCL39jwxt4/Tcj0XF
	3/20IZ6bIBtus+0EfPv/BWnbmPD+hBrWAx55+MCycob4DMWAhAyqtDzEJPldBIA+vmwahCnaZJFVK
	epj8EbqAtzxBxGGDP8m9Ybny9syh7eC7ze22uMDqwwwgRGMt3ECuPgmm4aHIHVZka1ZuEqeRkr5iL
	aQogdFrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijSxX-0005fN-8K; Mon, 23 Dec 2019 19:01:39 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijSvS-0002Ym-Tv; Mon, 23 Dec 2019 18:59:32 +0000
Received: by mail-pg1-x544.google.com with SMTP id r11so9265242pgf.1;
 Mon, 23 Dec 2019 10:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yYuhXbk2VYWkJUHqsC8Dp7ziko2oh3QWGKXaw3BKzKQ=;
 b=bIrbocA75GjiXkwSJP3C51ubVyAnSLI/fBMTmh6962W79PT4Tqv+1+Mjw3cq7AGKFU
 jHYIhsxDoH7RHVORa6yJexdhOgetkpm/PkZ6ybiEGu0rEOpFeiagFzU/A8ajKUUkgukz
 3AsjKYBf3/aZo2PMmRXKMgxEkfrblyUVI3V0AYfA5DshVaGFTRxoepTY4p6RKBua5+RC
 hwdBV6ESUTN2NcyHSsnNvmOAqmENn4PYY7sviRlsrgrPKRl79k7z6YX1VvUkJpHwbF8l
 d6ihCxrqxgEDPq21x1NWyz3OWGl9kB/2yiUVsYw2xw4mEWhcBS8hcPRUPF2UdAVwvS+g
 6lSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yYuhXbk2VYWkJUHqsC8Dp7ziko2oh3QWGKXaw3BKzKQ=;
 b=MwisN3diWcdKQUiN2jIFgHeKg/uANvilh5x4eULkEZz8zuyCqApLgqXtSS90coQ7H2
 PsghhIDZolP3SW3VBWbJ3XJPWgosvhmgtF6PyMo6gTWYXnj7WwmIXcVpXHrcfMutnZPT
 /FJ1Af6nVY8Lz3VBHsWvW4qnwO7DNn+2ccQTasEIBmg5zA5VbcswBEzYTjzu969L0Wh6
 nw6/585w/I7188b7fwNRwSVhJ+23Xd1DTRXoRi0sb4GszU9+Bf2zmRzqhsmPNGNdgIxE
 vxLHKUFSA4nBahAzvxyGlp1/91unpuHWc+NFxH+rrwoJWeqQYqZptxHlWiBJmbTZAK7v
 jbYw==
X-Gm-Message-State: APjAAAWiYVdGm+451eMgEk2ibFpR3VzQ5rkaZETSjGqUBQOpXaE4wZm9
 rcwuWuKOmegO4r72dqRJtmg=
X-Google-Smtp-Source: APXvYqxUB7sZmq8y8VINmqjxcxw1nx5P7rd/13e79L+vtzHV6ANBCs8nm6SgxE2CIKPWmst9f3sWdw==
X-Received: by 2002:aa7:9ab6:: with SMTP id x22mr33198806pfi.260.1577127569760; 
 Mon, 23 Dec 2019 10:59:29 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id e1sm26283596pfl.98.2019.12.23.10.59.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Dec 2019 10:59:29 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: m.szyprowski@samsung.com, joro@8bytes.org, kgene@kernel.org,
 krzk@kernel.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, robdclark@gmail.com, heiko@sntech.de,
 mst@redhat.com, jasowang@redhat.com, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 4/6] iommu/ipmmu-vmsa: convert to
 devm_platform_ioremap_resource
Date: Mon, 23 Dec 2019 18:59:16 +0000
Message-Id: <20191223185918.9877-5-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223185918.9877-1-tiny.windzz@gmail.com>
References: <20191223185918.9877-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_105930_990018_5748675D 
X-CRM114-Status: GOOD (  10.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Yangtao Li <tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/iommu/ipmmu-vmsa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index d02edd2751f3..3124e28fee85 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -1015,7 +1015,6 @@ static const struct of_device_id ipmmu_of_ids[] = {
 static int ipmmu_probe(struct platform_device *pdev)
 {
 	struct ipmmu_vmsa_device *mmu;
-	struct resource *res;
 	int irq;
 	int ret;
 
@@ -1033,8 +1032,7 @@ static int ipmmu_probe(struct platform_device *pdev)
 	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
 
 	/* Map I/O memory and request IRQ. */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mmu->base = devm_ioremap_resource(&pdev->dev, res);
+	mmu->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mmu->base))
 		return PTR_ERR(mmu->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
