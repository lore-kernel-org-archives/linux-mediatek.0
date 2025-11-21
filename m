Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C97CFC297
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Nov 2025 16:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUSxtoyAHwx/xueC8rkGvUpDUfhbVYOPPZRP4cqymzM=; b=cuq9GpnjhRID0P25iA9HcJ0Gk2
	4i2szhC1r+nMiHUUXJxpDKNjGPrlzvxi2hUsvLRB0FfbkfDMO/DSELmnN/lXEonJo7hnt3kPQgB5m
	TGi3iuU1nUkANbaU05VNwXu0rQgcCNxKVxweFnRjWDxf+rUEj62nEguJ2pE7V1Z4PZ23/XdjKm2nx
	74Ov0I2dhLeSvPEQHbMM7kFjXX4ZL/Vm0+NRUPQNJJDS2f7SRn6RKI3g8wN/pBi6f6lOCNk8E9XhT
	J0fkQVDTs1zEDiR3o13MO5ImF5VOCnESjZ5rAO1JhTm5SNZ6fZdrocHNnNhBa5baAHuKEB6Hy8vpp
	9/6KB5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUHl-00000008kLQ-1g6E;
	Fri, 21 Nov 2025 16:47:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUHh-00000008kJJ-1g18
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Nov 2025 16:46:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63513441D7;
	Fri, 21 Nov 2025 16:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDD0C19423;
	Fri, 21 Nov 2025 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763743616;
	bh=aVXKgdTVNhP4i1JEeKXE3HxQU0vhsNU0tGwaDb1blrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qr8pjvgbJKyX+UYd1vALWtKcUgng2r7Ve+VX31NpsgJabslvrLauyETtqlG0UyCa5
	 jxvsmL0VuOkP2BygUIdUNZd5fTsUNOdY6yflBydRC6jPbw7989NQAtjEylSWS/azR3
	 2Hj1IWc5XolMGho93lE4u2ylW59JttAhOl9+P/RyctCbO/bnwA0E3+a3I3KuDfAoaa
	 631aTYoWsQ9IvLZrBa5A+hwLFpBn4l+rpOgo5rWEHd3SSRDApE1jK6rwreiBbTCpmZ
	 QirtBglGPAqF5fi+jb4NRoqPdpNLbSIr+KAmRGm44rsZ/OgvcCMq9DPDosPCWBIG7T
	 wsxIou3k6L9Mw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vMUHh-000000003ZR-28Kr;
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
Subject: [PATCH 2/3] memory: mtk-smi: fix device leak on larb probe
Date: Fri, 21 Nov 2025 17:46:23 +0100
Message-ID: <20251121164624.13685-3-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121164624.13685-1-johan@kernel.org>
References: <20251121164624.13685-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_084657_476244_2CB8F303 
X-CRM114-Status: UNSURE (   9.22  )
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

Make sure to drop the reference taken when looking up the SMI device
during larb probe on late probe failure (e.g. probe deferral) and on
driver unbind.

Fixes: cc8bbe1a8312 ("memory: mediatek: Add SMI driver")
Fixes: 038ae37c510f ("memory: mtk-smi: add missing put_device() call in mtk_smi_device_link_common")
Cc: stable@vger.kernel.org	# 4.6: 038ae37c510f
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Miaoqian Lin <linmq006@gmail.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/memory/mtk-smi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index dd6150d200e8..3609bfd3c64b 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -685,6 +685,7 @@ static void mtk_smi_larb_remove(struct platform_device *pdev)
 	device_link_remove(&pdev->dev, larb->smi_common_dev);
 	pm_runtime_disable(&pdev->dev);
 	component_del(&pdev->dev, &mtk_smi_larb_component_ops);
+	put_device(larb->smi_common_dev);
 }
 
 static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
-- 
2.51.2


