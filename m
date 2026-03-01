Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7FEFD0048
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Mar 2026 01:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=srY2Jx6hSaGRrflJ5jRSv67mqxbtLeyztg4TQwY/Dh8=; b=pfaHq0lb3Qq1Gz57qAfedAe+0F
	L7Qkfvm7DWeLJ8F6fG7JeWn+SK6mqiqsPNx7d5B4+SpBrsh2iVmgRo7zymcVh7FqLJLm66ZVblbWR
	ZzQVfuEtYC003HwSPLMKhLGELlm4rtTb9BgMNmMbPw0fRnZMDv1Y7G6cpR2FTiUcoMfG7w0Lh034c
	PfviW/enH0Brdr93gN8lWb9ACyHkfn60+MwhKwv2t8/TTk1iUtNN2icNVLz47rPqOyLxVX2RngIHv
	FY77SUa7cDmPUMYV2NIYJ6iaWu/CJvlsOa870JGTJxoaN+yL6f4rY3B3Am+lQ6eA+vZLwo/OshlR2
	U7SvjzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVdC-0000000AXOC-2E4L;
	Sun, 01 Mar 2026 01:30:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVdA-0000000AXKk-1s9z;
	Sun, 01 Mar 2026 01:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAE6460126;
	Sun,  1 Mar 2026 01:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE8EC19421;
	Sun,  1 Mar 2026 01:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328599;
	bh=6OR9vPrXWE6EVDBv340VN0TlWD/U8HQ9gmAqjLmNcrI=;
	h=From:To:Cc:Subject:Date:From;
	b=MvNI7TDbCDLYmFZGiOh5ukr6+w2bNsUw4V9w5yXBcEdXVOIDhkW+pXzP2/lqJMeXx
	 UEu4Oii/gC3AkPhjojjjdH52oDsN2v5Z2hKKvtYB9Nb8nqsv+a/ISW8GGF0VVzhbVd
	 Fxwr9h+uQsTfeQHHSlS+J8fKmy0GOQIGZY1UjkODE0Q63sempX7ONI15A6vTp8FgJi
	 qjt5D0Jk5IBxJ5del8O/qqpzhGSJFcGWwTiVlJovWS2xhpbW+S5RHxAvq82iwjrVek
	 O262aYDt4JC4jGElUd1zbjVqs5bi3X7ir3dNntV6Ie6aqs2+t9anfT/KossFXZFzWt
	 +INK/WA3/2pgw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan@kernel.org
Cc: Yong Wu <yong.wu@mediatek.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "memory: mtk-smi: fix device leaks on common probe" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:29:57 -0500
Message-ID: <20260301012957.1687866-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 6cfa038bddd710f544076ea2ef7792fc82fbedd6 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Fri, 21 Nov 2025 17:46:22 +0100
Subject: [PATCH] memory: mtk-smi: fix device leaks on common probe

Make sure to drop the reference taken when looking up the SMI device
during common probe on late probe failure (e.g. probe deferral) and on
driver unbind.

Fixes: 47404757702e ("memory: mtk-smi: Add device link for smi-sub-common")
Fixes: 038ae37c510f ("memory: mtk-smi: add missing put_device() call in mtk_smi_device_link_common")
Cc: stable@vger.kernel.org	# 5.16: 038ae37c510f
Cc: stable@vger.kernel.org	# 5.16
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Miaoqian Lin <linmq006@gmail.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
Link: https://patch.msgid.link/20251121164624.13685-2-johan@kernel.org
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/mtk-smi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 733e22f695ab7..dd6150d200e89 100644
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
2.51.0





