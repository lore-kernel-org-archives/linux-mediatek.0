Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F32CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xbodHPoIGP6K9GRbAY9o+RJc+LUWm0jEUjjl0f6K8vA=; b=G63Ys+J5tGDiBIF9jgb1+oqVPW
	kaBpNvCZ0VmWiUlnKm4xUjM7knm4fp4fPaWVzQqsdV/cf3fkZTL2aqCvNKHCMDC8nhSS2KU33Zxf9
	sSyhUJatBT5bON8j9Uw9ySb/rUVpnWZ64yGhf2+n9KjAHZXTU/srtzyKbrbjNlLEGWKOo1xfKgW1a
	25BX21TdZ3fxP+QuOL84f237kkjjUcVGTVPtHrvU2W5167BiQUAq+ZfqmNRqP9X+jEb0HhLJhMchx
	2MZslhephnjV+i62ZBFc3Mp0v614uWY1c4/R5mXGBHiFnOtG4/gr0hpHCxyye4kBACGYaykxw35fK
	mxkjyd1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZpZ-00000007lO8-42XL;
	Wed, 10 Apr 2024 15:25:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZpW-00000007lMi-1NKo;
	Wed, 10 Apr 2024 15:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0035A61C3A;
	Wed, 10 Apr 2024 15:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22978C43394;
	Wed, 10 Apr 2024 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712762740;
	bh=Nqu+9dKEhjC9kwrawShWr3dtYD9VLYMStsi3if+IvzE=;
	h=From:To:Cc:Subject:Date:From;
	b=gjZ2Bc+E4cT3wA8GAem+w6X9VRG7fkY20Q4/K0PkLiL02OIaisKhKe+Wi8eMTIJWc
	 Wr6sb3tUJxHK3ZlHalfgYtweIe4gLL8sJG7jNpvAG3/qxz8VdF12UmrLFIwrfeZyYQ
	 1K/GSM1ZAhbuHTNmM84M/+f3mx0vJXtda+mGQWuhlExj8AlmHC27xBYDrrEMI367yl
	 v3JiSCNeNP/+wAYreBOsx7442EXytLqS7mnbW4Y/QqWnu9C1lXRsGhfvQp01j7fmDw
	 UhgSCaOBwbZuc1rfWIoB9ZD99Wq8OGMIrNeNJv1sNzxgoYv1Q32/9G4sQAWnCHnsG+
	 yliVcTh1Q0JzQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] mailbox: mtk-cmdq-mailbox: fix module autoloading
Date: Wed, 10 Apr 2024 17:25:34 +0200
Message-Id: <20240410152534.190326-1-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_082542_425147_F9D3ABC6 
X-CRM114-Status: UNSURE (   9.02  )
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

Add MODULE_DEVICE_TABLE(), so this module could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index ead2200f39ba..080d091e28ac 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -765,6 +765,7 @@ static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_mt8195},
 	{}
 };
+MODULE_DEVICE_TABLE(of, cmdq_of_ids);
 
 static struct platform_driver cmdq_drv = {
 	.probe = cmdq_probe,
-- 
2.34.1


