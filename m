Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF4FCAC583
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/hLTuhM3+3t3qPSIDZp4pi9mhVSRcxWEspBd7du8Us=; b=HlqPCftdAEbqirfitUfBfZp2Rh
	5s/Z6p4LDB2nyvJ4ZDYW0801ve7OHGqllN7ba2ZfpvNKzLBWyf90iR2t1wZem1+mPN+GXSfdbq73Q
	mwhpwbb2b18xJ0+bJsyQHVpE8aFHTCkyQZxYen5vUqSTZrhRNhspC7O8cprzK/MlwVFcNSZ+2QVXe
	2lmnyfTbfrR4AR1QO+khunVpfJ9+dkVkwuKoFU4B7Ai/yU7w8Vh1wFN9nEBXUv+FBJt2FKtmHeAdH
	2LC0dkmqrxBlu6/KUITCV9tBwl3mhg4v13gMEw3mgKMX+sLeocYjy69BZ855DLBe2HHrH3iO+ruEB
	/HmaIpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0TE-00000008BfL-48nb;
	Tue, 09 Sep 2025 15:41:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv73-00000006BgM-03zX
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:58:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BB51601EA;
	Tue,  9 Sep 2025 09:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15189C4CEFB;
	Tue,  9 Sep 2025 09:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757411888;
	bh=3okEo1Cju8Ss53Gs44RL0YJvO36IzhAVTGSex/5UecU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GhHz5MJhCTw0gJNKx5By+cAl3hNw3O0jf1qRXjXWNpSGm1W3E6Agtn3Vzh0x+I16+
	 DnwdLsC1UJ385LSZ1nJP/f66+GZ1y/4dOM4+TCIXLfcy1rR2BuOVXrgnL3QbcaCI3W
	 h2JmOegWVjPOFT4kzTiXxlY84fb687vahI1wKKu9vbxqK/DKE93A1HjS05YK1uK08w
	 9OMGQGSZ1ML9QGGU/udWdP91cebY7s4TWb0s29TQ9nFcPvbfo27fB3024/PHMaSJZ4
	 sulacZjjNz9wAYAuljNw4IpIoaEDuJJqZ8YOjgoXXrLR0WzRWh38sNC0Zt8LhE4kjx
	 06L5bPKKAEo3A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uvv70-000000001Sy-03c4;
	Tue, 09 Sep 2025 11:58:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Roger Lu <roger.lu@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/2] soc: mediatek: mtk-svs: fix device leaks on mt8192 probe failure
Date: Tue,  9 Sep 2025 11:56:51 +0200
Message-ID: <20250909095651.5530-3-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250909095651.5530-1-johan@kernel.org>
References: <20250909095651.5530-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Make sure to drop the references taken by of_find_device_by_node() when
looking up the thermal sensor and opp devices during probe on probe
failure (e.g. probe deferral) and on driver unbind.

Fixes: 0bbb09b2af9d ("soc: mediatek: SVS: add mt8192 SVS GPU driver")
Cc: Roger Lu <roger.lu@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/soc/mediatek/mtk-svs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 48804e1e5a6c..f45537546553 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2176,6 +2176,7 @@ static int svs_mt8192_platform_probe(struct svs_platform *svsp)
 {
 	struct device *dev;
 	u32 idx;
+	int ret;
 
 	svsp->rst = devm_reset_control_get_optional(svsp->dev, "svs_rst");
 	if (IS_ERR(svsp->rst))
@@ -2186,6 +2187,7 @@ static int svs_mt8192_platform_probe(struct svs_platform *svsp)
 	if (IS_ERR(dev))
 		return dev_err_probe(svsp->dev, PTR_ERR(dev),
 				     "failed to get lvts device\n");
+	put_device(dev);
 
 	for (idx = 0; idx < svsp->bank_max; idx++) {
 		struct svs_bank *svsb = &svsp->banks[idx];
@@ -2195,6 +2197,7 @@ static int svs_mt8192_platform_probe(struct svs_platform *svsp)
 		case SVSB_SWID_CPU_LITTLE:
 		case SVSB_SWID_CPU_BIG:
 			svsb->opp_dev = get_cpu_device(bdata->cpu_id);
+			get_device(svsb->opp_dev);
 			break;
 		case SVSB_SWID_CCI:
 			svsb->opp_dev = svs_add_device_link(svsp, "cci");
@@ -2214,6 +2217,11 @@ static int svs_mt8192_platform_probe(struct svs_platform *svsp)
 			return dev_err_probe(svsp->dev, PTR_ERR(svsb->opp_dev),
 					     "failed to get OPP device for bank %d\n",
 					     idx);
+
+		ret = devm_add_action_or_reset(svsp->dev, svs_put_device,
+					       svsb->opp_dev);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
-- 
2.49.1


