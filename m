Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A338C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 11:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3JttQTXX1TsEmRng9H/gO/D6XVALCMUPbglkrEvN3A=; b=HoZuJSoWJ6IgkM
	fdLei8kgcM3DBFVIHvYLWyNFaH5RUOEBx2OP6v/b38iokaOfbyPamrsYRtmd7GgAbPGy4hjkHZPLG
	XsJ4n3bVeaSKOWztJ/VHcR9TPh5xfg7i30XltUu16IAP2/okwQNvH+xl4sRZCP/dg1DecN1sQna7A
	aLlXoBq78fsOp/5XfhVLbDAOGN5yACuvS+VoiZN7hHUIGAq/HImDYyOuBgkn9iSPmLAW9YRPLy09y
	tpBfD3IeO5ilAfnr2xJ1bN0YrqZSLzi7XuhkTbvhzyVn2JgxBmSdtVwgh1Nx27w4Gq9RJOZRgoWa+
	Tf0Sl/b5s5v26McGrk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZWy2-00FUVn-V6; Wed, 30 Mar 2022 11:58:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZWol-00FPju-HI; Wed, 30 Mar 2022 11:48:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDD6C61656;
 Wed, 30 Mar 2022 11:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BE3C36AE2;
 Wed, 30 Mar 2022 11:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640930;
 bh=or7vMsAJ5qPVBHGYQ8AZJOSb3BRjqMrEX/v6pBzhP1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jS/AzIAt8uZVMw/JSjOYzrxQIk074ZtSYTVr1qHd2g06qb1vdRenqbdSHofy3zahD
 DK0ly6txaxNd/6ymfu+f4QVMm9t8BeydDEY3td8VVGjJSwu6U1M8sMCB5Ju8y0eO3A
 TF3msroFpTLLgVniJUjP4h6W2Mx0r8VGgEF7uLElXDIZQJh/DnIvbF3E3AXzDavEfE
 Ah/3O2m52PEcsloOgVbPfjMf/ywpZsCF+uGN8wJ0kgpfJ2yxvqDi5yUlkPZAat3Lnl
 rEzKvjiYwUBtlP/ANJhuedQKu+inVVx5Hl8y/TWEq8mbEqhHqZFaThZaY+6S0yBmCB
 Ui1EnrPQsTYuQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 11/59] media: iommu/mediatek-v1: Free the existed
 fwspec if the master dev already has
Date: Wed, 30 Mar 2022 07:47:43 -0400
Message-Id: <20220330114831.1670235-11-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_044851_744224_C32CE673 
X-CRM114-Status: GOOD (  16.15  )
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
Cc: Sasha Levin <sashal@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 joro@8bytes.org, matthias.bgg@gmail.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yong Wu <yong.wu@mediatek.com>

[ Upstream commit 822a2ed8c606caf6a11b1a180b8e46292bd77d71 ]

When the iommu master device enters of_iommu_xlate, the ops may be
NULL(iommu dev is defered), then it will initialize the fwspec here:

[<c0c9c5bc>] (dev_iommu_fwspec_set) from [<c06bda80>]
(iommu_fwspec_init+0xbc/0xd4)
[<c06bd9c4>] (iommu_fwspec_init) from [<c06c0db4>]
(of_iommu_xlate+0x7c/0x12c)
[<c06c0d38>] (of_iommu_xlate) from [<c06c10e8>]
(of_iommu_configure+0x144/0x1e8)

BUT the mtk_iommu_v1.c only supports arm32, the probing flow still is a bit
weird. We always expect create the fwspec internally. otherwise it will
enter here and return fail.

static int mtk_iommu_create_mapping(struct device *dev,
				    struct of_phandle_args *args)
{
        ...
	if (!fwspec) {
	        ....
	} else if (dev_iommu_fwspec_get(dev)->ops != &mtk_iommu_ops) {
                >>>>>>>>>>Enter here. return fail.<<<<<<<<<<<<
		return -EINVAL;
	}
	...
}

Thus, Free the existed fwspec if the master device already has fwspec.

This issue is reported at:
https://lore.kernel.org/linux-mediatek/trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01/

Reported-by: Frank Wunderlich <frank-w@public-files.de>
Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Joerg Roedel <jroedel@suse.de>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/mtk_iommu_v1.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index be22fcf988ce..1467ba1e4417 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -425,6 +425,15 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 	struct mtk_iommu_data *data;
 	int err, idx = 0;
 
+	/*
+	 * In the deferred case, free the existed fwspec.
+	 * Always initialize the fwspec internally.
+	 */
+	if (fwspec) {
+		iommu_fwspec_free(dev);
+		fwspec = dev_iommu_fwspec_get(dev);
+	}
+
 	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
 					   "#iommu-cells",
 					   idx, &iommu_spec)) {
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
