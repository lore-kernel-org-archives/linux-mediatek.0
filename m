Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5251BC41513
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZpY1O6ObrCWzPE53y30c4iuVMHGe0upfn5Eh4ECaOA=; b=GW5BUgKtL4af/31ljc9wgMATgj
	GOmkKl9t29Z4rZicK1awCIp4CVn7VRsnuHZdEDc/2c+gcO2ggUAiKC+2lVoaYrHjinbT9eT8KNfsM
	g5JUKHiurr1R10LCSbeuUE4r4ZMeGfswnNnT4HAiz69oir7X2Lhj3NjLjUyGQ1eBpcWlhicUUumtn
	0H36jNO5gqutQ8AOFf+0s0Pj+xCrnCQLrtWjTXjolGIIEYNl7ceWc7cBFEYVmEcdfJ3WoM1VcG7lU
	g1FPXTp9xVn58x8Xny+OTMz7riU/N3hxom+2gAhYaUvPuTkgrrshJKA4jpaWcoo2Iy+QQqg9a2X48
	H/PxkmiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEiE-00000004VNu-33jI;
	Thu, 20 Jun 2024 10:08:14 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEi8-00000004VJi-21mF;
	Thu, 20 Jun 2024 10:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718878085;
	bh=uPSc/aFYOBicJU5ByMPn/EfmfsVERpR9NIo+Kp9Kuaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FQMd+sGaS9mWBAyggmubXUNDCT5UwAkXnXEqZhteD8k10mWqw27ky2hY4eoJ6d0H3
	 X9n5Kj0sN4A2YFJywWr8RPm0r/GD5+7MJ06SxpTZc1Ndh+915udFvdVMCs+Iv6ZuQa
	 eEH5XWMa5yAyAVleCj9AvYcCZ56OEHWBavdbV6RD9/6CYSRlganxtXct8zQEJ14xLu
	 drQLdqQuDKIWh/hc3OKVXD8ecBvOV7TcGUbhlLw5jeaxGuPG2VjRPmM80VjPJGFv+a
	 rjvncXjkQj78TKTBlWYbuIAWoI5dEEty5Vks3T8H2XZod8vnYCQXce4vfbftDjSrdM
	 +bTAJ9m5QYj8g==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1DB2137821AA;
	Thu, 20 Jun 2024 10:08:05 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	houlong.wei@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/4] mailbox: mtk-cmdq: Stop requiring name for GCE clock
Date: Thu, 20 Jun 2024 12:07:47 +0200
Message-ID: <20240620100750.1075790-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620100750.1075790-1-angelogioacchino.delregno@collabora.com>
References: <20240620100750.1075790-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_030808_727972_8B708C82 
X-CRM114-Status: GOOD (  10.41  )
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

The Global Command Engine mailbox has only one clock hence
requiring clock-names is useless.

Get the first (and only) clock instead, without name checks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 4aa394e91109..66dbc8e846d8 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -629,7 +629,7 @@ static int cmdq_probe(struct platform_device *pdev)
 		}
 	} else {
 		cmdq->clocks[alias_id].id = clk_name;
-		cmdq->clocks[alias_id].clk = devm_clk_get(&pdev->dev, clk_name);
+		cmdq->clocks[alias_id].clk = devm_clk_get(&pdev->dev, NULL);
 		if (IS_ERR(cmdq->clocks[alias_id].clk)) {
 			return dev_err_probe(dev, PTR_ERR(cmdq->clocks[alias_id].clk),
 					     "failed to get gce clk\n");
-- 
2.45.2


