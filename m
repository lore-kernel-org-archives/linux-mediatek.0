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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6468C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 19:01:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85637206B7
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 19:01:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EKx/NHjU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqLoU5Ov"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85637206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=os2wQYyXiQWvK5rAdo6S79DLpnS4xOQOLSHLccH8IOE=; b=EKx/NHjUnYdzAq62MtOKOhI/S0
	YA7R/4IJzOAOTAQf1DQcJNB5lpCSCJXBfOzbHLcS0BYAAjyobrDl9W5qt7pafWrkWUQe2+WMQTtfI
	T1k1aSOWl/mmig/Vay8nl54bOJYW8Un0SJy0pQsvRDakghu7oOTYN7Vfq0BmYeghpr1NxySKB8+bT
	/RfiV0g7wPzqpPq3Nt1cLRmQ7SiEgqAxSf2FwRIq330e2mUTm/qmFUnd16obwU/s7V+GpgsW1cY9B
	Vk+CcKH9yHr0UjJJuba2e1PmXMUdXet1Mk6OdOU/qWRshXnvGlMPsCfeVa7Q760OWMMIRqQlG98GI
	jK9fHxmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijSwp-0004rd-O5; Mon, 23 Dec 2019 19:00:55 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijSvP-0002UX-6P; Mon, 23 Dec 2019 18:59:28 +0000
Received: by mail-pg1-x541.google.com with SMTP id z124so9226133pgb.13;
 Mon, 23 Dec 2019 10:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dMVf+vh+cYX5uqjs+l++BphNgREG8uxW+2Ovm+/JNJw=;
 b=HqLoU5OvR8ugzzxNAKVEVtBkjiqSufaKIUZEDpKdXp94Y/bUt4KrKLTKl5UQqNAl44
 KA1fNRoJ6aNwieatce2GqNLQOnq3UaqeJtl909ctqCyPbdF0LXDmaJcS432q9CSkhn4B
 dtiCTNvUBMjcOk0W2u3xT65sebwLH0CmduWcb75OfItc8DLFy4cAVoitzIDAMhzcNtfg
 Io5nLgK9BvT4faeoz5v59U2R5s86MLJT3XvGKf64+RHwRrSqizeESPFrxInRHcYca0GM
 6LqgvwaDt95S1xY3LDJ6L2k9xpIofsqFoI/ZRs3ID25B6iWoEeKIDGA52xAh1bQzdw9z
 aAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dMVf+vh+cYX5uqjs+l++BphNgREG8uxW+2Ovm+/JNJw=;
 b=uCJMxVepdSFlA/Y377MfGqT9okg/2hAzCH53Y3lJVzPknqFjepqwverveB6XBvsEkE
 zrmwSqBBQIhGIsIXuRpSgsxACFa/amnI9gCOMnVEwau0vZYF4VFzEpVK49E4n5V3kN0X
 iRYSSdRAIt7Tv/JiGiCFT7l0vLU8j8uk29M7xBnwgtn/NHLMe0RnpMgXLfDKPPYIsfBl
 sg0TmIdwgP35p+sSTux5H9pvbGJtysEOgdEqXBGhCW3RqVUN125pjwD18TczuDxg2eTN
 M4PD0yVlsoyuw00YVTTw5pSqdAUoh+xae6fm/W8qGCxD3p/xhA9uahIeo4W32qjIhrFc
 xkvg==
X-Gm-Message-State: APjAAAX185gfGRV+e3Y9+bRmlrlO30q9i7pWaZzGT9gxX+sBnFdjLGDb
 qoo8i9Pvea6trfPADxYbhn4=
X-Google-Smtp-Source: APXvYqzDhJWagEWSF5CD+5+GERxPnQgzx1vAVm8NgEcWmvblC2Ftuyzdp3PuA5nDZwdfH/7PhfYRpw==
X-Received: by 2002:a62:3343:: with SMTP id z64mr32628043pfz.150.1577127565404; 
 Mon, 23 Dec 2019 10:59:25 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id u12sm3892956pfm.165.2019.12.23.10.59.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Dec 2019 10:59:25 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: m.szyprowski@samsung.com, joro@8bytes.org, kgene@kernel.org,
 krzk@kernel.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, robdclark@gmail.com, heiko@sntech.de,
 mst@redhat.com, jasowang@redhat.com, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 2/6] iommu/exynos: convert to devm_platform_ioremap_resource
Date: Mon, 23 Dec 2019 18:59:14 +0000
Message-Id: <20191223185918.9877-3-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223185918.9877-1-tiny.windzz@gmail.com>
References: <20191223185918.9877-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_105927_302185_D4C877E3 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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
 drivers/iommu/exynos-iommu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 186ff5cc975c..42d8407267ef 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -571,14 +571,12 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	int irq, ret;
 	struct device *dev = &pdev->dev;
 	struct sysmmu_drvdata *data;
-	struct resource *res;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	data->sfrbase = devm_ioremap_resource(dev, res);
+	data->sfrbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->sfrbase))
 		return PTR_ERR(data->sfrbase);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
