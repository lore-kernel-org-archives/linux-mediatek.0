Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8869C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 17:54:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF5520758
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 17:54:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zsfeIBL7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMUT8j46"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDF5520758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWzx3M3b8RuLQEABNhMQAod5rvOtjKJYKwT2CRfmOBE=; b=zsfeIBL7iB3PMJWXz3dLUR6ytc
	ZJSe5ZzrZV2QITtl2nHCK5ArLqrI7up5PTC/jZKSbyYBvQwgYQ/JjGh7kUxHB5FWyf/VbvwmQTR+t
	UpaNYlsUYjCYXFoL+1x20EmIKRu4x/dlvlUk8xCmhaUz1wcfcwRFob38Mdv1szhYVvzI4usYAGmC5
	kLiP3J7F9oomYkptQi3xa47nQ/MgubuCLw+kFohjdgbQ6mf4NGWjfD0N4RnGGaGT3HlhfqXf4/f0v
	AmZDTkxH5rsyzOgw1yKwM8w0qj24nvAvJ3L+W39p91lv7G2xb4ybVxM+Tu0vL004gpyhAUTwAqQNM
	hsyHuhFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8SI6-0003l8-Ib; Wed, 19 Aug 2020 17:54:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8SHp-0003dK-VQ; Wed, 19 Aug 2020 17:54:11 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDB942067C;
 Wed, 19 Aug 2020 17:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597859649;
 bh=+lMEGCp5k/4W2mojZvtyfBE+r5nQiIYYlfpn6vSb4ZE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MMUT8j46k7Uvd2tGhO09R/5TjMjgqPb8V52uNie6ncFfyWFg4q6jAlr5u2QVuLI8z
 KTTJuWjKIrEexR1GUkhlZ5mhEGM2Qk5YXHRqMcEQC0hRDXBTgKW+vLtcih3Xnm23KB
 qP8zrLdz4w4hOwFaC8ECEnfV5fkXmP/2tsQnPCLo=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [RESEND PATCH 5/5] iommu: qcom: Drop of_match_ptr to fix
 -Wunused-const-variable
Date: Wed, 19 Aug 2020 19:53:45 +0200
Message-Id: <20200819175345.20833-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819175345.20833-1-krzk@kernel.org>
References: <20200819175345.20833-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_135410_226000_8C20BA2D 
X-CRM114-Status: GOOD (  17.76  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The of_device_id is included unconditionally by of.h header and used
in the driver as well.  Remove of_match_ptr to fix W=1 compile test
warning with !CONFIG_OF:

    drivers/iommu/qcom_iommu.c:910:34: warning: 'qcom_iommu_of_match' defined but not used [-Wunused-const-variable=]
      910 | static const struct of_device_id qcom_iommu_of_match[] = {

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index af6bec3ace00..9535a6af7553 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -752,7 +752,7 @@ static const struct of_device_id ctx_of_match[] = {
 static struct platform_driver qcom_iommu_ctx_driver = {
 	.driver	= {
 		.name		= "qcom-iommu-ctx",
-		.of_match_table	= of_match_ptr(ctx_of_match),
+		.of_match_table	= ctx_of_match,
 	},
 	.probe	= qcom_iommu_ctx_probe,
 	.remove = qcom_iommu_ctx_remove,
@@ -915,7 +915,7 @@ static const struct of_device_id qcom_iommu_of_match[] = {
 static struct platform_driver qcom_iommu_driver = {
 	.driver	= {
 		.name		= "qcom-iommu",
-		.of_match_table	= of_match_ptr(qcom_iommu_of_match),
+		.of_match_table	= qcom_iommu_of_match,
 		.pm		= &qcom_iommu_pm_ops,
 	},
 	.probe	= qcom_iommu_device_probe,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
