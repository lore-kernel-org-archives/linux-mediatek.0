Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4478C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvg4aCiyWw1VzxOrEJk07xqkVY906QHloJRYSRWJyrE=; b=k9L3QKJSB8/h5CEdu+trguOvWf
	6pqc4XVtXV8JCxJk1K60vkgCtyijL/rWAbjC7bM8sRYtGnBNGhnWzTA7mUWbKwyiOde16ovNGNYAW
	gjqS26mCusvxUcaAV4EwtAUy6BrLsap4WAnw8rie9kdcth42psD7P5lAd4v7oaRO5UcwIHtSa2pwM
	c/CTmiDkHFoJnx3BOYUuJkTpKNOgmGNQth/MEMXRe2u1cE5G9F9jR3pCtyfkghbfz13ufPDgDr/NK
	GpVJkOmJ8egWYm3ksqc/OAHL2iJIYtcl8OBXPL+Tj2a7DsVCLeUg7NGvxSP4Xj9qZ0yIsuhKsQocN
	8ovwSCgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofG2l-004Rap-ES; Mon, 03 Oct 2022 07:39:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofG2j-004RZA-63
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 07:39:14 +0000
X-UUID: 0046b4a67195409f886d0198879a8502-20221003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jvg4aCiyWw1VzxOrEJk07xqkVY906QHloJRYSRWJyrE=;
	b=AnRuNSOoetn++VTQ0jhhCz4pxnTN4o7T06yi1p/bSdPUJu2h7flGvwGVnWAh/n633k/k1F89yupCwJ0OJ22f3ZGVviHB44xysorZEMsRWYCbKejJ5kjSy1C1jevVnmkUr9rR/ZFjM2NRZatS1V6upqc2FEZtp2cHrG3HwDGRg4s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:32144eb5-af4c-4c2e-9344-c947de1f932e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:d2b1c907-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0046b4a67195409f886d0198879a8502-20221003
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 76471027; Mon, 03 Oct 2022 00:39:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 3 Oct 2022 15:08:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 3 Oct 2022 15:08:32 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v2 2/2] media: platform: mtk-mdp3: fix error handling about components clock_on
Date: Mon, 3 Oct 2022 15:08:30 +0800
Message-ID: <20221003070830.23697-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221003070830.23697-1-moudy.ho@mediatek.com>
References: <20221003070830.23697-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_003913_241832_3A06B057 
X-CRM114-Status: GOOD (  14.99  )
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

Add goto statement in mdp_comp_clock_on() to avoid error code not being
propagated or returning positive values.
This change also performs a well-timed clock_off when an error occurs, and
reduces unnecessary error logging in mdp_cmdq_send().

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  4 +---
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 24 ++++++++++++++-----
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index e194dec8050a..124c1b96e96b 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -433,10 +433,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	cmd->mdp_ctx = param->mdp_ctx;
 
 	ret = mdp_comp_clocks_on(&mdp->pdev->dev, cmd->comps, cmd->num_comps);
-	if (ret) {
-		dev_err(dev, "comp %d failed to enable clock!\n", ret);
+	if (ret)
 		goto err_free_path;
-	}
 
 	dma_sync_single_for_device(mdp->cmdq_clt->chan->mbox->dev,
 				   cmd->pkt.pa_base, cmd->pkt.cmd_buf_size,
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index d3eaf8884412..7bc05f42a23c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -699,12 +699,22 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 			dev_err(dev,
 				"Failed to enable clk %d. type:%d id:%d\n",
 				i, comp->type, comp->id);
-			pm_runtime_put(comp->comp_dev);
-			return ret;
+			goto err_revert;
 		}
 	}
 
 	return 0;
+
+err_revert:
+	while (--i >= 0) {
+		if (IS_ERR_OR_NULL(comp->clks[i]))
+			continue;
+		clk_disable_unprepare(comp->clks[i]);
+	}
+	if (comp->comp_dev)
+		pm_runtime_put_sync(comp->comp_dev);
+
+	return ret;
 }
 
 void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
@@ -723,11 +733,13 @@ void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
 
 int mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num)
 {
-	int i;
+	int i, ret;
 
-	for (i = 0; i < num; i++)
-		if (mdp_comp_clock_on(dev, &comps[i]) != 0)
-			return ++i;
+	for (i = 0; i < num; i++) {
+		ret = mdp_comp_clock_on(dev, &comps[i]);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.18.0


