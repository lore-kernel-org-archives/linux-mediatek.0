Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01256C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Mar 2023 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2XoXtByKh4UOZY04ttKfG8wCst6NLl0jJEghljzhdfk=; b=bBkwctLsVcELUk0V9Jr12QNaow
	I6g0IdVQQoCu+9mbrkDLsDaOxus3OBmP1vZzSouX3GfycYKsm0Fmu4U/u7KkfiYvSGWI29OEPFgE0
	dSuMiMaLrZh0Ey40ehpYVOE9h53hWEKpTVSVfP5tgLEmtBsPTUUMIyhvQ/BsjQgIc+NnvMbZE1J97
	7dlGLyMA32vEX4sEispczPnbeuG+gYCrl6Tgk9+DYMaa5/1u6LV66u/1xKDQB4/cDnZW1+xKSXC0k
	l92oqxMqtLZiP45NtWjOkqZlKEr64+XaWQ5Fb9VDC8WqYEKFShA+J2LIEWjUr30bxL3WpxdW2qfFC
	R5rEklXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg1kp-006Zqe-2x;
	Sat, 25 Mar 2023 11:08:11 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg1kn-006ZqA-05
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Mar 2023 11:08:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id eg48so17240831edb.13
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Mar 2023 04:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679742486;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2XoXtByKh4UOZY04ttKfG8wCst6NLl0jJEghljzhdfk=;
        b=IEXMfmb9swizo0XNpd06KviT6M9g+vLRiVoOXMWKRNd8j2dzefDIaXkpzRucL9Loov
         b+tz39NKvbJErPQ6lUD7hEA0Yd78X4mPY7N44k75VFIizHqjRrwwJ35vkDxhmrM+p55W
         T4IZMvQSAkhpLXTQbsW/bXy/p7Laf21h2e7Cu2Tgm++yr4WxzBSfjdvilDZqJWFK2cCi
         Aa6ITeJDdpjmG8KTGXCa90WBJw/nQxTZyaWj+ADmCW+sKaJWAY0igmT+Pfk8KlgnMqR9
         SerTQOUqK4CizeTHHGctjhKvfhmTROetto4HkkGlV9Z41omJXbEBqNKijmOlfdhi8sbx
         S72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742486;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XoXtByKh4UOZY04ttKfG8wCst6NLl0jJEghljzhdfk=;
        b=BiwK12M84bsgVpA5bYmWT/YyLgx03bN4fOWXbNPVAgMx/7zfG4iD+wwjFiN6hUQa8S
         aNmno0lU5k1wdbnfDlR/gJmE1U24jh3YJ32vuAGFOzNoCF8XDVmOtDnt5/Riq6RgiH+Z
         9u3gLbQPcnTfDLsxmJ4gUtR4aQzGt+uBi/Qis6fiSjitkZo+9FWzqwsk5GlF2TYd+cxn
         Ly8rGgWhpWcqULjFrbhPTP6ORNnLelMVNolwYe8h13qHBKkJ8hiLf7VapubKhmuBCdmC
         BhRYdquDdWQefI7oBoUu7DjLuofn3CzbyY6GOUHPOC0aOygxofg05ElFEU2Dbyy6RXNC
         g3bw==
X-Gm-Message-State: AAQBX9dvQ2uXc6KBQieD3KPieHt4jGVwH9Wgc9vxQq4U1d1qHwfKaHDM
	z3oOe4O1quocyQyheCyAMSw=
X-Google-Smtp-Source: AKy350blMy+1lSMZfdLLVnHMMW+4npnrGgrb4s+FBpAEMxX72hJtPuTS6wqpGrPl8qCVLeTm6BR8TQ==
X-Received: by 2002:a05:6402:10d7:b0:4fd:2675:3783 with SMTP id p23-20020a05640210d700b004fd26753783mr6216664edu.1.1679742486271;
        Sat, 25 Mar 2023 04:08:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b44-20020a509f2f000000b004c09527d62dsm12077001edf.30.2023.03.25.04.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 04:08:05 -0700 (PDT)
Date: Sat, 25 Mar 2023 14:07:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chengci.Xu" <chengci.xu@mediatek.com>, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] iommu/mediatek: fix a reversed test in probe
Message-ID: <88c83ce7-5d1a-44a8-b9bf-0d01cfea24db@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_040809_087898_AA2D9609 
X-CRM114-Status: GOOD (  12.19  )
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

The dma_set_mask() function returns negative error codes on failure but
this code is testing for zero instead.

Fixes: f4b49c7c5e67 ("iommu/mediatek: Set dma_mask for PGTABLE_PA_35_EN")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/iommu/mtk_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 1a75b4382a92..6a00ce208dc2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1260,7 +1260,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN)) {
 		ret = dma_set_mask(dev, DMA_BIT_MASK(35));
-		if (!ret) {
+		if (ret) {
 			dev_err(dev, "Failed to set dma_mask 35.\n");
 			return ret;
 		}
-- 
2.39.1


