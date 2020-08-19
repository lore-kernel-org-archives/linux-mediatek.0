Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64563C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 17:54:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2628E207DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 17:54:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d+dMFXoW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2PuGwS5f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2628E207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNHe1hpj3DEPuEcV/6gK/SEXjy5stXnlvYmPf7Hlhgo=; b=d+dMFXoWIhJr271y9IfOz4X50U
	Svo3decmmPMGpD9E4ssoSQsYXk03cJWO2VRNy9GeQ8d1Y4qgPm+LuPFPZu5U75kxaptmD/iJ+1lF9
	0ChQ+JNoLIpYelcqErZPwuG5nXmCOamEXJrKYe6Do5plP4h3/yYP6X0soIhP2JwXRv3m4Gg69goxG
	wNDnP2krqFInSg8O8tbcwY0OoY6S0k3IhTxss1OkPutBAWI6svVWib9rITC6UUBKsptd9MqZYXEqj
	jkaPaVZFKH6NAcNyOzVPiIuNJc11BcA7pyettGHqtYPCrXB4kNu8a6esIJ0bhmIY0+khUYFSnuPHB
	GxIvJeeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8SI2-0003io-Ax; Wed, 19 Aug 2020 17:54:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8SHm-0003b7-47; Wed, 19 Aug 2020 17:54:07 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D26E2083B;
 Wed, 19 Aug 2020 17:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597859645;
 bh=UqJi1Cd1ki/EcIWIXcChXTjP/XpNmsjxdc58Fdu+XQ0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=2PuGwS5fXKVd5jpwUh/5G4RDYZ2R5x7mF3gWTBtroFGLxQHozuzGk6fiUz5Etlp0e
 TxJSqYfHslmNzJ49zPShY1o5ARuGD5xrYeNgzbwGDX4X5Le92BXBx5uJfzsDmVF55z
 TcZ1ugfXcjeJxBnMx6CnklhUsStzEooej4ZN+GMg=
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
Subject: [RESEND PATCH 4/5] iommu: intel: Drop kerneldoc marker from regular
 comment
Date: Wed, 19 Aug 2020 19:53:44 +0200
Message-Id: <20200819175345.20833-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819175345.20833-1-krzk@kernel.org>
References: <20200819175345.20833-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_135406_619545_0C3E66E2 
X-CRM114-Status: GOOD (  14.63  )
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

Fix W=1 compile warnings (invalid kerneldoc):

    drivers/iommu/intel/dmar.c:389: warning: Function parameter or member 'header' not described in 'dmar_parse_one_drhd'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iommu/intel/dmar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index 93e6345f3414..ba47edf03941 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -380,7 +380,7 @@ dmar_find_dmaru(struct acpi_dmar_hardware_unit *drhd)
 	return NULL;
 }
 
-/**
+/*
  * dmar_parse_one_drhd - parses exactly one DMA remapping hardware definition
  * structure which uniquely represent one DMA remapping hardware unit
  * present in the platform
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
