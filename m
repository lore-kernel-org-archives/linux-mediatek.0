Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C81CFC294
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Nov 2025 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V92ZaxEsYIhAEnnvOuayJdVoHVu1hG9baa9SziLDEo=; b=iXu+l67uhxN8wNp2dGd51vlMfm
	ITdwdys+OEhdKGrXFCN3miryM6ILXodaGBeFVIQz+DmgBovjVheMrD4GR+8Xqfq9QZ/2EzwsxIH2K
	/I4SqV9JpShGMs/cbhKXIQmKCTha3Kae3RQB155P6/BYa3Hx+5lLV362uC/fwsKVlcdy+S2+wDttP
	3p9SQLFNiwqGi3rfnVekXFqywSm4xSn8ng6I/RrTY7DGDtig14qulCEbUMoeK2IHjmEZ8a2Mt+NQd
	sNKNK5/tKQStn7IZ7spLE7T+tsRDSvY00H4xZC97oJzMr6CsD6YSNzlkWCD3ic/x9iHJfdICHWb6c
	pBwQxBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUHi-00000008kK6-2QvO;
	Fri, 21 Nov 2025 16:46:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUHh-00000008kJK-0iMc
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Nov 2025 16:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FF57602DE;
	Fri, 21 Nov 2025 16:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11331C4CEF1;
	Fri, 21 Nov 2025 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763743616;
	bh=wO5VidB/EAiJ5mwgeHjepeP6B+fU37Eas6aRn/dc7+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TvM81oRwBZs+8ChD+xZR2nlor0dXwHrqQLLJTpxNfLs3bnDuBM7cgYdbVWlDobb4B
	 gmE1d2bpmRqsrhzh6P89iYbcV5G1xg+DYuumFvaOcDqNODbb5f+Z7T3zJkuZR+ce1B
	 flETduggsY/NU/jgFADtijKayf4OVC9Qy7Aa8h1phVlK3FyeCNvoptEcRs+XlYiydK
	 hzwpJ+SWfNMVuLzmB9hrFhCfwkll1LACgVB+cFsxzAV2/oymkzSpf5FhQN/CLPTy0j
	 FBhMfUEy7U+G6WVEh56qdJW5FVtWehvRbSo6r6KaaHNmi6zBYyJekaeNOI0baWBRp4
	 PB/Ixrpyd+wbw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vMUHh-000000003ZP-1idI;
	Fri, 21 Nov 2025 17:46:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Miaoqian Lin <linmq006@gmail.com>
Subject: [PATCH 1/3] memory: mtk-smi: fix device leaks on common probe
Date: Fri, 21 Nov 2025 17:46:22 +0100
Message-ID: <20251121164624.13685-2-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121164624.13685-1-johan@kernel.org>
References: <20251121164624.13685-1-johan@kernel.org>
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

Make sure to drop the reference taken when looking up the SMI device
during common probe on late probe failure (e.g. probe deferral) and on
driver unbind.

Fixes: 47404757702e ("memory: mtk-smi: Add device link for smi-sub-common")
Fixes: 038ae37c510f ("memory: mtk-smi: add missing put_device() call in mtk_smi_device_link_common")
Cc: stable@vger.kernel.org	# 5.16: 038ae37c510f
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Miaoqian Lin <linmq006@gmail.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/memory/mtk-smi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 733e22f695ab..dd6150d200e8 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -674,6 +674,7 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 err_pm_disable:
 	pm_runtime_disable(dev);
 	device_link_remove(dev, larb->smi_common_dev);
+	put_device(larb->smi_common_dev);
 	return ret;
 }
 
@@ -917,6 +918,7 @@ static void mtk_smi_common_remove(struct platform_device *pdev)
 	if (common->plat->type == MTK_SMI_GEN2_SUB_COMM)
 		device_link_remove(&pdev->dev, common->smi_common_dev);
 	pm_runtime_disable(&pdev->dev);
+	put_device(common->smi_common_dev);
 }
 
 static int __maybe_unused mtk_smi_common_resume(struct device *dev)
-- 
2.51.2


