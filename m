Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE93EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 12:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3JttQTXX1TsEmRng9H/gO/D6XVALCMUPbglkrEvN3A=; b=Py5cYi4GtZQdJg
	5ILsdx3/33N3/cMu1KzfHccI/1VZqYmIKjg/LXLbr6xBkAEy5w22sAuKLxbGA7x3YFf4Ycm+cZ+xt
	HIjXPqo7GeBcGMidXjm9fmlnEQ2WdeP8vHnRIMHVrZxtBWRYDj2vk7dDpJDDM4fhB7dkaK1XxyB5b
	At327vdjjxD5+3BgpqlXOrayATxLIN7kvNOQehLbwJc2tuXRhKNxqe7H0SO3Qcf2gC//OTP/83zBp
	BX+0+CyTOIUX+NFnZhUCyM9PNDYIBPPuMDLNeqMUegSrAT6rgxftptGcD1FnYqcV2hX2aEGIczMnt
	N23t1Tjk6+kHH763pPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZXDX-00FboV-6E; Wed, 30 Mar 2022 12:14:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZWqG-00FQj8-VT; Wed, 30 Mar 2022 11:50:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84CB7B81C29;
 Wed, 30 Mar 2022 11:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BF1C36AE2;
 Wed, 30 Mar 2022 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648641022;
 bh=or7vMsAJ5qPVBHGYQ8AZJOSb3BRjqMrEX/v6pBzhP1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=esKtna+noARAgO5RhQvid+YEx+d5DnIVfJwyJzYrR2rAGXv2isuDmkn1+8n3cM2xH
 ZV+1ELyy/4ihaPLslds3dpRwx3VAjRYfnUWpj0iPoVMxSLU9X5fj1DfmAqLOLOxHyD
 +1KHWhBypl9ZZswLPligJVO27CoPomTDfW8Rn/3jECKtWXKbN00bHXYX6xhM7+6Hmr
 gFbmisW3Gxda4J5wJ7eX7Ik7f46cdegN4Uee9efXld8X21XwkJJjok8MKY0hbQRcvP
 pi+nKI0fAQlcJ4670mHghonoDazpRmgIjRzdys4NNke81WvyGR52sUTEAaXYa4TGSW
 yjQ+9Brl+vOpg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 10/50] media: iommu/mediatek-v1: Free the existed
 fwspec if the master dev already has
Date: Wed, 30 Mar 2022 07:49:24 -0400
Message-Id: <20220330115005.1671090-10-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330115005.1671090-1-sashal@kernel.org>
References: <20220330115005.1671090-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_045025_356147_8CA0BACE 
X-CRM114-Status: GOOD (  15.85  )
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
