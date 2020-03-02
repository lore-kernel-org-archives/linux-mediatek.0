Return-Path: <SRS0=QQ5c=4T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35835C3F2D2
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 11:22:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0939621775
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 11:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WsPWk2gQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HrqcWs/t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0939621775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QDuVBinDpoRixemrrz2bFEj88bUxrzTpQm7eYMyuwo=; b=WsPWk2gQftZTmC
	Np68X0IS1xigPAKpJWn6IiUHdoUvMkYCG2HZNOS61V2RQOmZun0Q9kGryWqJfzush6g9Sh58wIbXn
	jl/pWVhtwJl4WL4IzNaOSSNnn61+wvZTKK9m918dWVS/+GSo0IKtLUPN0kLXmuQws0+Wbo3s+SRrr
	TbceHkO2vb27wR3zwRpbBkcckKAltm5ezxu98XKi16Px4/Zl8CoiCrLmz5JI7b4gXONs7tNCPqjqS
	7CcGeNeG5kNrJvmRU8OfDBL++HgvbNM8i4L8rj4EZarJ4/L8Tpuou4tBwgSLRh2078fhEGFTjubXR
	sENiWtRtZXjYzGUFFafQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8j9g-0008Ug-Kl; Mon, 02 Mar 2020 11:22:36 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8j9R-0008FV-Vy
 for linux-mediatek@lists.infradead.org; Mon, 02 Mar 2020 11:22:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id r7so12095811wro.2
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Mar 2020 03:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4twAZzpqE7OZHthVARi42fhoM9wMIzUTa1b3XIbc4u0=;
 b=HrqcWs/tM1UMeqgqQDpvy3jpqRSAaC9KOUedVpPAAvQXG3RKGJEGAKffHVNPColesQ
 XmJC8gVr91n0yVRfBh5hJIgxN9YGBInf8dxyQV9MOR+vauyVfx/rs1trGy5WKr+ppnSY
 xPNcptl/HEFg1e2S8eAWVFv4Q5y9PVMn9NqIV3MYzpRlBTcz8yFMsOTa1HGbIGY1K7Gt
 GsFLln6giCDJ1dDj49uhcLCoEnMDB4qd9U0rI0iX9KSIwHGJNAc03zON9tAvUnNuiZdQ
 xeZEus/ihesqcBQ/4+ERXw6UkZGG0pE7kquuOyrm+1jE6cQq8pWiEkXWYx+nD0T4SWzN
 oCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4twAZzpqE7OZHthVARi42fhoM9wMIzUTa1b3XIbc4u0=;
 b=TWZLnh5xO0iD8TzI5RtSCqoBdWziZichVCTr2duB2v/Bm7ubGQ1m4QkQpGX/kl4OdB
 RKvyf1UWKnJLag2CFG8aGN/Yg8e6qg0TjUI8QBHGX7qwI018NerySgOUV3asBFXYu9xE
 XoCVhXSSs6ZBPWy+TCyzY9EDGDqq/SxZBeQ86pjYOOxZYsjFBQbNqOjNqZN8w2tR7ZZN
 z4tkTmERIoFZ18T1raes63QD3VRHVrgCOVM2BKWKRPYqNrQyJsePHiYtLOQlIxB7KUXj
 DPh1rbIeBc0rH4Tl20PCbMRSed54+zYmmFJ9tnej+pfdK5/dKkrF70AnKOZWoIuhMnIW
 jf3A==
X-Gm-Message-State: APjAAAWdkinV2bGUVrqYEiILoTUsUg+QoApWzbQfTb1a7WvsbcZedfaG
 0y8n8zCDlBYpW4EhG1JmRTTojsF3AYM=
X-Google-Smtp-Source: APXvYqwoftzxlJ69VQL0xqAKsfOX0Z+thgz1rFA+uNAT/dQGnLIN+PHomnMXJLjLb67L3CQ3sbGx9g==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr21399020wrn.209.1583148140211; 
 Mon, 02 Mar 2020 03:22:20 -0800 (PST)
Received: from localhost.localdomain ([2a01:e34:ecba:5540:6f5c:582a:cc84:32f5])
 by smtp.gmail.com with ESMTPSA id j14sm28398441wrn.32.2020.03.02.03.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 03:22:19 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org
Subject: [PATCH v2 2/3] iommu/mediatek: add pdata member for legacy ivrp paddr
Date: Mon,  2 Mar 2020 12:21:51 +0100
Message-Id: <20200302112152.2887131-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200302112152.2887131-1-fparent@baylibre.com>
References: <20200302112152.2887131-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_032222_079438_68290572 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: matthias.bgg@gmail.com, ck.hu@mediatek.com, joro@8bytes.org,
 yong.wu@mediatek.com, Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a new platform data member in order to select which IVRP_PADDR
format is used by an SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

v2: new patch

---
 drivers/iommu/mtk_iommu.c | 3 ++-
 drivers/iommu/mtk_iommu.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 95945f467c03..78cb14ab7dd0 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -569,7 +569,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
 	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
 
-	if (data->plat_data->m4u_plat == M4U_MT8173)
+	if (data->plat_data->has_legacy_ivrp_paddr)
 		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
 	else
 		regval = lower_32_bits(data->protect_base) |
@@ -786,6 +786,7 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 	.m4u_plat     = M4U_MT8173,
 	.has_4gb_mode = true,
 	.has_bclk     = true,
+	.has_legacy_ivrp_paddr = true;
 	.reset_axi    = true,
 	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
 };
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index ea949a324e33..4696ba027a71 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -42,6 +42,7 @@ struct mtk_iommu_plat_data {
 	bool                has_bclk;
 	bool                has_vld_pa_rng;
 	bool                reset_axi;
+	bool                has_legacy_ivrp_paddr;
 	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
 };
 
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
