Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83954C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXCi2krvz5iV3RG6Br/eDWamgQsHstCKOav7b8DNz3k=; b=BpX9jgi8KVHjhozbYPyJReMRFK
	TOpLB7cSqG0Ju30zDAxNHex1CjvpYSgp8VMNNL2qNDxfkg8vAfyrJlzIH1Dxy6/NfBNiLX9PJ1Ujy
	pk32hpuW/V2AdqvGhEnv//W/nu7dn3hO7DrMwID1ZywBeiIhW8WudcYguNIAkmRLKJHJVCDHULhST
	/xhkhcL59M0qHVaKk/SfCwNl6SpgPzpEjspYTYwaiNuSWC5JmMQBTWUMFE3/iLZSdY/c5rnv+VHIp
	/YaS7vxD68izGkMJMgRKQ+pgW55UItNnMulgFFhhqGYELTKv0o6b+9w5/zTKVUHsAgVPx9c9okAx+
	SUzepFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE5Yk-002x8K-Ol; Wed, 20 Jul 2022 08:59:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE5Xm-002vsN-I2
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 08:59:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id h9so87408wrm.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 01:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UXCi2krvz5iV3RG6Br/eDWamgQsHstCKOav7b8DNz3k=;
        b=Lqqzbdkwfyi+vtGc9522INJrc1XedLAUHcf868Tzcx5CjEZZg0Zk7Fxxu3MTfxmGdo
         8roZB/SVYpiaTfAu2U5Vzcjn/+ZiNTRi5RznX0BRN8JfaeIg/tFvEIcQKfL92nLUmVpv
         q03r5K3015d578CfB1iKuU6mx4F8DAlPrNwlYbeh+kcIauy64sDXfEcdsKJEkgfoCxaK
         7zlWgmh7/lkUl40pHVULUbgPE3SMN19ylEbFw6i8g8HK9HEupedtKVy13/x6rdrny0u4
         9pqbRsPjDGSUoOIydm/FspUh6NFGVybxlKJ6jQkYH1u5Jx2QNnEBO7lqnD8swkX1lolz
         VRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UXCi2krvz5iV3RG6Br/eDWamgQsHstCKOav7b8DNz3k=;
        b=GrYyLydhdXfWixWAW3TyMiU4u/os4ziiOV6HNuhH5/yc7Fr+GH+E1DL2TSywRIiL8t
         SDvhbT9BIqHinx/rTLDxtMZQStoiEXp7FHCXEsgdLvTi+xmhWKg8Asl1bJdoxUlyb9bI
         +LGNmwrDAbtzfDoIMystWkN+U+uBNAE4dFKTIkmz9TrUZmQ2I1QyWXQg0G/iM8R3teWp
         WuXt5NpOhqncSEnsKQRN7wCYKv+zK+j0q0quhFMrjVa2TRDsok9bcgaDNXnpi6oigEZY
         O8Iqc5qUazf7MG6lJ+uMWnjfw0QOzn3jR5FFJPDzr4gTXIPkgm7fiWDYbwFAI8pBuxtn
         VPVg==
X-Gm-Message-State: AJIora9h2pIUgKivKg70p6UXnJdppMYjS2iM1zigdf+bBER5jI07EpgS
	ZdijpfejJOYv+pAHGJrSLV1U/Q==
X-Google-Smtp-Source: AGRyM1tpaC1pFfFaqkpKdkHi8zMKoU/eQiYQk69VtUESjQWualgkCNfDkjo/qmF4kT3kLruIfHYiBQ==
X-Received: by 2002:adf:e283:0:b0:21e:26fe:14f3 with SMTP id v3-20020adfe283000000b0021e26fe14f3mr8874954wri.98.1658307535476;
        Wed, 20 Jul 2022 01:58:55 -0700 (PDT)
Received: from amjad-ThinkPad-T490.home (2a01cb040613180084408ac44a1fa242.ipv6.abo.wanadoo.fr. [2a01:cb04:613:1800:8440:8ac4:4a1f:a242])
        by smtp.googlemail.com with ESMTPSA id f4-20020a5d58e4000000b0021d6dad334bsm340571wrd.4.2022.07.20.01.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:58:55 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: fparent@baylibre.com
Cc: iommu@lists.linux-foundation.org,
	joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	will@kernel.org,
	yong.wu@mediatek.com,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>
Subject: Re: [PATCH 3/3] iommu: mtk_iommu: add support for MT8365 SoC
Date: Wed, 20 Jul 2022 10:52:13 +0200
Message-Id: <20220720085213.3803-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220530180328.845692-3-fparent@baylibre.com>
References: <20220530180328.845692-3-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_015858_890714_0847C641 
X-CRM114-Status: UNSURE (   8.39  )
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

Hi Fabien,

Thank you for the fix.

The kernel would panic if you boot with this patchset because
bank_nr and bank_enable are not set in mt8365_data.

Please add this change:

--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1538,6 +1538,8 @@ static const struct mtk_iommu_plat_data mt8365_data = {
 	.m4u_plat     = M4U_MT8365,
 	.flags	      = RESET_AXI,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
+	.banks_num    = 1,
+	.banks_enable = {true},
 	.iova_region  = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
 	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */

With this change, please add my:
Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Tested-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>

Regards,
Amjad

