Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8426CEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHUDF46zorJw9cWcAaRb+5uRqKuLNnsGpbvYUSI9l1g=; b=BRR5z4yIhzeLRcBpBTrAYK2X4x
	1+CCJfBbzpS8sIA280/mmU2qfEqcMDMDFMdj24Zymi5U0J/thylOKPWFnhHEtsGCiplukhFfGpNj1
	LhZNYRC5QgyZKE0fLIJ1NqPR7m1yJMZU0jJlJJoIjr6q91yBJ/+tb58lrVCzTsDpSNYWS9WKk6sD7
	bP5TvgEHjRwbzwTRSpGgqz5P9IINXlkuSWFaFlQYXKgLiVjsNf3XYYBs9IrWw99oFnU3I6520jrlh
	gGksJb4I7Epy1CohiVl15xOnweVhpHUDdLA9bGivtSS+n+XHIzrFveVBAsjIMU8OqNGWIrH9qCpPQ
	iQMmhrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzXq-005COF-0j;
	Wed, 19 Jul 2023 05:16:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzXo-005CNI-1N
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SHUDF46zorJw9cWcAaRb+5uRqKuLNnsGpbvYUSI9l1g=; b=PPOlgsXt4dpec97ipMIvrZQPF3
	SfudyKUansIBTZd8EkZQF4TrLkdmyLWOIQeca7aUdxu+fK94KQRPGi7UQG2sR2qZ2inVJZo4VdqdX
	lmhFI9o6sk7zKky82b1xjAteY1Z8Xxp4ksQXMicOFBNFy89M9Ho3T/kGr/MPn3GkoH/GeIN6uU52G
	T4+aeW9cZ6uGPRsPykL4/VD2RK3WUBI7kJBsJfuVk2A/EiMTerKry3mNEvlZ7/CQm/fqGrcapqfDa
	1TdgN4oY4kB4FEPDnI97uXCmyQ09NAESORJy5jEMEFMCmqdcaggUrbsPYTeVgcquq4kocjDX4OiP/
	sinhDG4w==;
Received: from [183.242.55.162] (helo=mail.208.org)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLg50-00BJ5Y-2b
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 08:29:15 +0000
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4sXp4Fv8zBR9sx
	for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 16:28:26 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689668906; x=1692260907; bh=D8d+MsQpIDEMC9w+5s1SwmR6S+n
	0xq3gry16gHMpo4A=; b=1DepZRv0v9ufvyClbtE831S94x/8NSMzuCe7SENuKIP
	EfTVng/v331BtBWiBJey1AhLXI9rvwvP+HrGJ6r4+71Lv2V0lvFVKh7mRNVFfbqL
	mw1FwDiTyFJbSoul/PRtusSOkx9ODuJKWIXRB8lIaDqdM1MmRY4UzL2OWPaReKwy
	AE6ygcLmUE7jRTl3NZ+bmTVEYAjWyhKhNNIIGXbhUnBc536TnD4ZbCsOQ3PhMMRW
	qos7U9zPI2lLjSHXOHCveV+V/LJJPUkmEy2KvVjQ8Ee1AYhYG3TusDma11gIFsGE
	z8OFcgJ6w9gjbZO73fAeqpPxmepmm18wiFmfZaKF1bQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0emrV3rHY8F2 for <linux-mediatek@lists.infradead.org>;
	Tue, 18 Jul 2023 16:28:26 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4sXp1ShhzBR7bp;
	Tue, 18 Jul 2023 16:28:26 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 16:28:26 +0800
From: sunran001@208suo.com
To: joro@8bytes.org, will@kernel.org, matthias.bgg@gmail.com
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] iommu/mtk_iommu_v1: add missing put_device()
In-Reply-To: <20230718082500.17066-1-xujianghui@cdjrlc.com>
References: <20230718082500.17066-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <36b3ef1e2a73f84216d9fa656f6146a6@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_092911_477874_40BAE8F2 
X-CRM114-Status: UNSURE (   7.96  )
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

The of_find_device_by_node() takes a reference to the underlying device
structure, we should release that reference.

./drivers/iommu/mtk_iommu_v1.c:669:3-9: ERROR: missing put_device; call
of_find_device_by_node on line 662, but without a corresponding object
release within this function.

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/iommu/mtk_iommu_v1.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 8a0a5e5d049f..1833d0ce7afe 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -666,6 +666,7 @@ static int mtk_iommu_v1_probe(struct platform_device 
*pdev)
          }
          if (!plarbdev->dev.driver) {
              of_node_put(larbnode);
+            put_device(&plarbdev->dev);
              return -EPROBE_DEFER;
          }
          data->larb_imu[i].dev = &plarbdev->dev;

