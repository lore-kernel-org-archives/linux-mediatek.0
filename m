Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99771C47258
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jan 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPOWE6dN0tbw8h+v0k26X/Yxsvihhp0Jnrvh95PLbis=; b=kpLAsBdBItza/q
	FztW8oSCkDEfrzX4nlt54RRHCsxNAsUTpJGOw23HB39JP5nDvtqpXCrbhX1lhqA8qGVWLej4827SJ
	CnzwxOlKhR1iRNeel9hTRxcc1MKhWa4Xeo1sc86qJ8vfdB2xA8TMra39l7Ta7fnVnW3JXAt5yiPbi
	yz7Wd3+9T1GKsQ6DHfEVkVNby8wzuyaNyGbhNs50rnj+nmyrnaRAZXZYCQhiimmUrqYF15V06s1pj
	AS6Qe1vcBgfZHKETgtbHlwKUtBoF/IilGrbn5WoBE2mWV2wOVF2YuuCZ4g4Vw2P2Ecay4XX1THmsK
	YFyVmUPFt5hPXN7xKgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU7lH-00000009pL7-0X6j;
	Sun, 28 Jan 2024 16:11:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU7lC-00000009pIK-1FiH;
	Sun, 28 Jan 2024 16:11:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A00B760B07;
	Sun, 28 Jan 2024 16:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC0DC43399;
	Sun, 28 Jan 2024 16:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706458313;
	bh=51cvES8B4cwsZRZH2wNWrxlvRklkeZm6la8scxzeXso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tMoeY4NGzjEsGE5qX5o9Sr+1z6sFZ9ZCk82bqeSIz9PVS16ild8MvbfWqht5ruV3+
	 +4OrJMd1EMGO3HZMxUM0EoXbTBmSz8Ixzg/Yh9PHVC+bArdbsgEBp7Jdbu1jTzM++v
	 lR4MJ71OVrKKoDzVTZZqa6DBUxbiHTfN1IyvoRujQMpao5TTkr0468sfgg3G1GUbgV
	 CVl+olOnLce0Ff4d34paEj7rKDOSZGYhvUy1CdYUurV02czUrrV1RDIGV6M5i/rxIU
	 bH6TKyJCaZ6i/P3uOqRy6TD3bWfuCOXOayCDFUut8U0Lnwt3p+F7BieSSxIM/tZoXV
	 /Rt2HaitZwx0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 12/39] spmi: mediatek: Fix UAF on device remove
Date: Sun, 28 Jan 2024 11:10:32 -0500
Message-ID: <20240128161130.200783-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128161130.200783-1-sashal@kernel.org>
References: <20240128161130.200783-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_081154_483496_7742099C 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: Sasha Levin <sashal@kernel.org>, Yu-Che Cheng <giver@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yu-Che Cheng <giver@chromium.org>

[ Upstream commit e821d50ab5b956ed0effa49faaf29912fd4106d9 ]

The pmif driver data that contains the clocks is allocated along with
spmi_controller.
On device remove, spmi_controller will be freed first, and then devres
, including the clocks, will be cleanup.
This leads to UAF because putting the clocks will access the clocks in
the pmif driver data, which is already freed along with spmi_controller.

This can be reproduced by enabling DEBUG_TEST_DRIVER_REMOVE and
building the kernel with KASAN.

Fix the UAF issue by using unmanaged clk_bulk_get() and putting the
clocks before freeing spmi_controller.

Reported-by: Fei Shao <fshao@chromium.org>
Signed-off-by: Yu-Che Cheng <giver@chromium.org>
Link: https://lore.kernel.org/r/20230717173934.1.If004a6e055a189c7f2d0724fa814422c26789839@changeid
Tested-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/r/20231206231733.4031901-3-sboyd@kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spmi/spmi-mtk-pmif.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index b3c991e1ea40..74b73f9bc222 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -465,7 +465,7 @@ static int mtk_spmi_probe(struct platform_device *pdev)
 	for (i = 0; i < arb->nclks; i++)
 		arb->clks[i].id = pmif_clock_names[i];
 
-	err = devm_clk_bulk_get(&pdev->dev, arb->nclks, arb->clks);
+	err = clk_bulk_get(&pdev->dev, arb->nclks, arb->clks);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to get clocks: %d\n", err);
 		goto err_put_ctrl;
@@ -474,7 +474,7 @@ static int mtk_spmi_probe(struct platform_device *pdev)
 	err = clk_bulk_prepare_enable(arb->nclks, arb->clks);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to enable clocks: %d\n", err);
-		goto err_put_ctrl;
+		goto err_put_clks;
 	}
 
 	ctrl->cmd = pmif_arb_cmd;
@@ -498,6 +498,8 @@ static int mtk_spmi_probe(struct platform_device *pdev)
 
 err_domain_remove:
 	clk_bulk_disable_unprepare(arb->nclks, arb->clks);
+err_put_clks:
+	clk_bulk_put(arb->nclks, arb->clks);
 err_put_ctrl:
 	spmi_controller_put(ctrl);
 	return err;
@@ -509,6 +511,7 @@ static void mtk_spmi_remove(struct platform_device *pdev)
 	struct pmif *arb = spmi_controller_get_drvdata(ctrl);
 
 	clk_bulk_disable_unprepare(arb->nclks, arb->clks);
+	clk_bulk_put(arb->nclks, arb->clks);
 	spmi_controller_remove(ctrl);
 	spmi_controller_put(ctrl);
 }
-- 
2.43.0


