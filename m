Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D47ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 08:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zHSZP1OWHazBgWQXESQByXqKm9vhBpvgdCCmwtEmCjU=; b=EUJnTA65QSdsuP13HtCvH3ZXu9
	CktZpUZyIrCYXBpK+aF77wbbjVTu2rLy29jnBqoYAo8ycrP9q69cNhjF/0pNYfEMFbtWv8jvZtE8j
	qXCUVR7jDD/N8B8y8Xrwjfj9YWTz185YICpelJdsMuSt8/JEfUQnHX7kfscLpgBxKKnc6viOnOrXL
	3qHzsdbTD9YNzQe9xoSCFwZZmWM8hXw70i6j3d4KPwphh9nwEOH4HHcKlkXWZUg/dZ9zNHiT28zhj
	yKVV0LokQEMqoFq8sROouHSr71Qs0ogBawUFuQOLzJdvcrgtPizdBM0qJI3u0gke3AhiJDqSNHBES
	7/ZtsPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTJWo-0056Ji-MZ; Wed, 31 Aug 2022 08:56:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTJWl-0056FH-CL; Wed, 31 Aug 2022 08:56:52 +0000
X-UUID: 59f123ed2936412782a6f50f38457ddd-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zHSZP1OWHazBgWQXESQByXqKm9vhBpvgdCCmwtEmCjU=;
	b=JgkDZEY7OYt/QnXipLh0PXRnpFK2jJyP4x1701TkCaYTJUIjwEKNuQJbuijcafjA7GgUYmJfFiLaucW3WjOoLe73HmgvLf/GHdfFLQDjdV8rJ0Jj3CbJqz7BZgfG42gI043V7h1OkDeTHDk8ycA2yRZKWS2ziQX54OBtTCcTj6E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:68fb85b2-de8b-4b41-9316-980baa832a8e,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:423dac20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 59f123ed2936412782a6f50f38457ddd-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 928465204; Wed, 31 Aug 2022 01:56:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 31 Aug 2022 16:56:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 31 Aug 2022 16:56:06 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [v1] media: platform: mtk-mdp3: fix smatch errors and warning
Date: Wed, 31 Aug 2022 16:56:04 +0800
Message-ID: <20220831085604.2739-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_015651_454101_931A0054 
X-CRM114-Status: GOOD (  14.83  )
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

Fix two errors reported by smatch:
    drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:292
        mdp_probe() error: we previously assumed 'mdp' could be null
    drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:460
        mdp_cmdq_send() error: we previously assumed 'cmd' could be null

Also, avoid warnings reported by smatch:
    drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:872
        mdp_comp_create() warn: passing devm_ allocated variable to kfree. 'comp'

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
--

This patch is based on hverkuil/media_tree.git tags/br-v6.1c

---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 29f6c1cd3de7..86c054600a08 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -457,7 +457,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	kfree(path);
 	atomic_dec(&mdp->job_count);
 	wake_up(&mdp->callback_wq);
-	if (cmd->pkt.buf_size > 0)
+	if (cmd && cmd->pkt.buf_size > 0)
 		mdp_cmdq_pkt_destroy(&cmd->pkt);
 	kfree(comps);
 	kfree(cmd);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index e62abf3587bf..d1064b149ef9 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -869,7 +869,7 @@ static struct mdp_comp *mdp_comp_create(struct mdp_dev *mdp,
 
 	ret = mdp_comp_init(mdp, node, comp, id);
 	if (ret) {
-		kfree(comp);
+		devm_kfree(comp);
 		return ERR_PTR(ret);
 	}
 	mdp->comp[id] = comp;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index cde59579b7ae..c413e59d4286 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -289,7 +289,8 @@ static int mdp_probe(struct platform_device *pdev)
 	mdp_comp_destroy(mdp);
 err_return:
 	for (i = 0; i < MDP_PIPE_MAX; i++)
-		mtk_mutex_put(mdp->mdp_mutex[i]);
+		if (mdp)
+			mtk_mutex_put(mdp->mdp_mutex[i]);
 	kfree(mdp);
 	dev_dbg(dev, "Errno %d\n", ret);
 	return ret;
-- 
2.18.0


