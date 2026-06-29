Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DC0C43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JO1fCQG5PwkKtjMsyUkbYJB7JtjMw8bGs1lH/7GPTdc=; b=bwvyIH9TEyAbWjoQrnl0bftQjz
	fJ8UNZJ/NZh0it0T2ZvToDVkyi6TcKPsNA1Cf59fLfBapCaEjhaamJxyxxryE+Pves/+2UpARvS9E
	bB1Ylp2U+plVAjx8n+1ylIJIN5dM7NNJ4HqYBQfSpAGHzXzCfPt1IAnZDIhf7VBKEDvhd7FZgnETb
	M5cw0g3RRJ8NMHuk7mHzGNcb1XsCn6AfoZFMDgfzLmwIUy+hU1OrrPP9toEDBtbqfqpIb87fD3xHi
	GF1qKsWriRHjEwy/lVCkYMAi3sNO6eCGgKbJZ0UuwVlzZxp25Tn5qov2Y/BDTpfiOJEQQA+OB7RYX
	wVcN87hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDT3-0000000EzZs-1bAe;
	Mon, 29 Jun 2026 15:00:13 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDSz-0000000EzUJ-3UtV
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 15:00:11 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8471013fac2so739083b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782745209; x=1783350009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JO1fCQG5PwkKtjMsyUkbYJB7JtjMw8bGs1lH/7GPTdc=;
        b=arW2NJ9ioGFXzw7epm2V8J6YfmoekNewsZyGoV5bOq8KBcUqcLvWJtaqyKvOif6XAu
         Wy9JR5BoyrCIhgOsMQP2uQVndIeNxYO11OgXVnTVQjYV+B+8nnsa4dr7HSufGA+OdOeY
         CV2WEAkyCGEYAU21sDmjyiVhjom8vzyIFBycHVpYQu/w5JybFIt7fqivu32MqQPAStsG
         DGM6TfY6THtyej2qhSPmb3Hln0KHQ1zN4u9BS/YqkbrPm7LboZMUWvjhzXxIbiv2u/1/
         y0jNIHB5AlbxAhDHbhagZfVPC17Ja0IjDmLTLfJ7baYfYiY5j87FlDxg8bgG9KIvGlhz
         w76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745209; x=1783350009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JO1fCQG5PwkKtjMsyUkbYJB7JtjMw8bGs1lH/7GPTdc=;
        b=fDSXp7qmKqY15+IYs9p6Zq2eR5qXrMshJ2cT0An4y6RsGtyjE08SDfxiACAZKAdRdr
         LheQoC3yZN8g+vCkD7Z9RBLhuAvbq8kDSfzMLQzsdLv/sfBIvfz0bC+WAac8c6zIHW1M
         FMOg2vTnp0emMc2JiwKvp0s2OAP92uGzHLEWeVJuI4zdpsI2qteW0CaaxwOuxsq2Pm+a
         fIO1VPYp11FxMzUOujhI01cDJ78X2aIYgZZTEqgM11rsip/bzaQqMEWZMRMw4Iott9+a
         92a/mZnOsm3ozwOjHWJsI/wlq6EkV031EcHDKDYx/wUtpLm66KYD49X02i9d0bK4gKzp
         B2Mw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8AWkLERyKIleCKr596dfGqZzP5JQUf7ZlQCFs/lW24K7ZKMQDzrR4TsGMOKygO35CGgZVMeP9BPNgzSVmUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEREs0x8AoCSC68caREI3pwSVqeTl0jcYQx8OqOLl2c7d0c5qP
	z8AO+eVRqO0DMNo3dQBFJH3dg5KqTFrw5quA1EmEOiT7mY4mIV4Nqkt6
X-Gm-Gg: AfdE7cnDYgiOWyUz6VrnCwq/l4FNp7/pCoNRsY81ZwO/uQn+wg1Wfpc2Qe4H8z+VGyk
	GUB/tCQ76K4MyiIbNxHOlRADVHPX9FTWeSBPf0uN48AdgcZeB7FWcxWqzVvfuKt99iyFjBAyz76
	4gOE/3/tqHfz9L6sfPZtUVdzPK18B8Z6eAgVM4rqTjYFBakfQGcYsCBDsbuoXWDNYdkBYggxPXH
	vWGgKOzFGV0FFhVUXSVKj9+E+YSGd6sbnFg4NrJKmGzP4gMk2z0PD3CfOeMyl4dCOUVESCkwLm3
	EJ048HhBRt4sgzp1dKoORZPDRGVfBr/Su9N+z2b2pZ81ScAaCZV89PVu93LIHiJdRdBNtEg4gP4
	NlQgUs75KSlnxgwjMRB5IET2gTZqumm0GCeLh0Gsai3UVrY+uwQ65DxVNIViFcYAFS+g9+bdIO/
	Z2vT4hs+QC0MJtYEOXp0OXo+i/Hg22ZX0DHa03rHhhIMXa
X-Received: by 2002:aa7:888f:0:b0:847:8971:87bb with SMTP id d2e1a72fcca58-8479ae75cf7mr678238b3a.21.1782745208912;
        Mon, 29 Jun 2026 08:00:08 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845e9fa4601sm3572368b3a.6.2026.06.29.08.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:00:08 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Yong Wu <yong.wu@mediatek.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Joerg Roedel <jroedel@suse.de>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>,
	iommu@lists.linux.dev (open list:MEDIATEK IOMMU DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:MEDIATEK IOMMU DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] iommu/mediatek-v1: Fix off-by-one in MT2701_LARB_NR_MAX
Date: Mon, 29 Jun 2026 23:59:44 +0900
Message-ID: <20260629145946.312819-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_080009_899817_A184B7B8 
X-CRM114-Status: GOOD (  12.01  )
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

The mt2701_m4u_in_larb[] array contains 4 (for LARB0 to LARB3)
elements, meaning mt2701_m4u_to_larb() can legitimately return 3.
The current check `if (larbid >= MT2701_LARB_NR_MAX)` incorrectly
rejects valid LARB3 with -EINVAL.

Fix this off-by-one error by updating MT2701_LARB_NR_MAX to 4.

Note that this does not cause immediate issues with the current
mt2701.dtsi and mt7623n.dtsi because it only defines 3 LARBs:
    mediatek,larbs = <&larb0 &larb1 &larb2>;
Thus, larbid never reaches 3 in the existing upstream device tree.

Fixes: de78657e16f4 ("iommu/mediatek: Fix NULL pointer dereference when printing dev_name")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/iommu/mtk_iommu_v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index ac97dd2868d4..e907c9953142 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -88,7 +88,7 @@ struct dma_iommu_mapping {
 /* MTK generation one iommu HW only support 4K size mapping */
 #define MT2701_IOMMU_PAGE_SHIFT			12
 #define MT2701_IOMMU_PAGE_SIZE			(1UL << MT2701_IOMMU_PAGE_SHIFT)
-#define MT2701_LARB_NR_MAX			3
+#define MT2701_LARB_NR_MAX			4
 
 /*
  * MTK m4u support 4GB iova address space, and only support 4K page
-- 
2.54.0


