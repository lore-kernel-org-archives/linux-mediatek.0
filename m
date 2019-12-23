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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09FCC2D0C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 19:00:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98C1E206B7
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 19:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="osnU7150";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H87+VOrx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98C1E206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=76OvfhhzjeV7y9JFKengNWJsFxW4R0rhQXhF1apxoJE=; b=osnU7150QisP3V/ei7bPLH2ufP
	thS4PYxTCmkNKkd8NDfxDhz35NBTjMVfhgfC7hBBsUx12feLmMftma6XYZTP9cg1XFQV3hdLIUzWB
	FhCLz9tboEzo91wktTIbLS9WVojehGi5gWJo6OgIq+7wZge7nBadEU50MqEDZk049boiAQJc0zAdT
	sBUpyweyylzfO0wVWsYiEGpu+sdMLR6G+xurgzcafnMDcGXXliJrntp9yv9acAT6s9A6eQVLiwhoO
	N0F3LpM2BGlApUujYm4hIYTHLn9VKQE7tI7HCl3WueRuCgT0h0sn+T2YF5hg3q5BLh9bH80D5JjZM
	Wv63x9FQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijSwD-0004HZ-3b; Mon, 23 Dec 2019 19:00:17 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijSvL-0002Tr-Lk; Mon, 23 Dec 2019 18:59:24 +0000
Received: by mail-pj1-x1043.google.com with SMTP id s7so153623pjc.0;
 Mon, 23 Dec 2019 10:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t2pcE/zB/zRFa+D+0DGOcMCSuy9rY9vAk3qxszJwLvo=;
 b=H87+VOrxrVlOydWiSP/CZqoU2QHdFei/jyBu887pLm+G9l7owgyTBs5Yc2xPwbf+cF
 2A/Z2a957FZNCq5ePoWmbgsjUXO3HoS2RterAFvRDcnuiWFq56AITBhwSig4wDQpcjod
 4UmZ3oPM57B75+90Uv4tfswd7l2D+miZNLWKs0PV7rIN2f9huUDrTjekZev4ZwKgAUda
 6IdAK5hLSt1s2wgiIbrUOfWBdEzP2VVYq8u8Y8LmWMrBcEdnkb/nE9GJJn6AL9IGTi9Y
 9UVTNDE1xGhL2hu+PsmhLP30C51H8vCllgDS25vuLUF3UF2qxiMgSIeF5F2AfFw97/ZA
 GdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t2pcE/zB/zRFa+D+0DGOcMCSuy9rY9vAk3qxszJwLvo=;
 b=cmjVIS2e/fTMIzWAoHBP+ejIGeikGxs9TEH/qCdgvlpptLtSa7Q7NvF4Jmwl4+8WHG
 uzueEFg4OtieaPhpCyxUr08/rpp/c5wwF/WhpgTxgWRGY/5QBOmode08x0o1OTvsN0qx
 hTJOdhtKzazRD+ElHwvKFr6kCGIUl/v2WLcoh3f4HwYEmbn+DYrr7hXGHeBWTZq6xC/I
 jDKNZqufwBybijab+5b/4XpzUzlfLyeug0qB7Q0jaHR+GsGk9NIskLlv1fIvy6LnmEZe
 SnFVnKOCj8AleXSuOj6aiIavhdXwnEYdIaS+mUOLNkyfnQI0F8f8lm1Je9K0BE0/LcoD
 S4Vw==
X-Gm-Message-State: APjAAAVmr9/UBO3aWXTYTCM/UjdcAnDQlBgfjVgsKwPVHzSiSShiz5Ah
 QCToiWaxGyj0+cJI9HYdffU=
X-Google-Smtp-Source: APXvYqxwTeofmvSQXzsVzn9vv5ovtl+Qlq7vr/WZrlMMh2w/A1BzAZFQoZorn2f8/xm484BESZek6A==
X-Received: by 2002:a17:902:7b91:: with SMTP id
 w17mr31189741pll.94.1577127563256; 
 Mon, 23 Dec 2019 10:59:23 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id v8sm24823853pff.151.2019.12.23.10.59.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Dec 2019 10:59:22 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: m.szyprowski@samsung.com, joro@8bytes.org, kgene@kernel.org,
 krzk@kernel.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, robdclark@gmail.com, heiko@sntech.de,
 mst@redhat.com, jasowang@redhat.com, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH] virtio-mmio: convert to devm_platform_ioremap_resource
Date: Mon, 23 Dec 2019 18:59:13 +0000
Message-Id: <20191223185918.9877-2-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223185918.9877-1-tiny.windzz@gmail.com>
References: <20191223185918.9877-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_105923_711906_1C9A4E9C 
X-CRM114-Status: GOOD (  10.73  )
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

Use devm_platform_ioremap_resource() to simplify code, which
contains platform_get_resource, devm_request_mem_region and
devm_ioremap.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/virtio/virtio_mmio.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index e09edb5c5e06..97d5725fd9a2 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -531,18 +531,9 @@ static void virtio_mmio_release_dev(struct device *_d)
 static int virtio_mmio_probe(struct platform_device *pdev)
 {
 	struct virtio_mmio_device *vm_dev;
-	struct resource *mem;
 	unsigned long magic;
 	int rc;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem)
-		return -EINVAL;
-
-	if (!devm_request_mem_region(&pdev->dev, mem->start,
-			resource_size(mem), pdev->name))
-		return -EBUSY;
-
 	vm_dev = devm_kzalloc(&pdev->dev, sizeof(*vm_dev), GFP_KERNEL);
 	if (!vm_dev)
 		return -ENOMEM;
@@ -554,9 +545,9 @@ static int virtio_mmio_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&vm_dev->virtqueues);
 	spin_lock_init(&vm_dev->lock);
 
-	vm_dev->base = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
-	if (vm_dev->base == NULL)
-		return -EFAULT;
+	vm_dev->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vm_dev->base))
+		return PTR_ERR(vm_dev->base);
 
 	/* Check magic value */
 	magic = readl(vm_dev->base + VIRTIO_MMIO_MAGIC_VALUE);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
