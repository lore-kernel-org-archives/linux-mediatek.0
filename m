Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A724ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eEFFPWPurfnTLCuJ6XvA8r7eaX08wfQ5CFFfzRlVtVw=; b=Q8olOTik9L/dnlOH+srwe2A6lF
	8mdkJkVTjptauddMq8JV9jmnBNIlCRnIaNu1+yaO8v8yxdIUUVttdVWc/eKPzIkZWH2xwy6rS1Msx
	uWOl2SpLUmPec104ek2UqBss3TYRT+anWKXp214KBmiTtz1PdUmnMyP4d2EgQKDJFVvHKog24HQiA
	TYFgxOg/GD6M4/7JU7F06hq2/Gc7KWhtVJ3TLFr9Q/vPjXaeTdebwghmT/9Ovd2tkcxkaY+4rMoUf
	NM18NNM059GLJjslHi7ZjVjoYAr2GKlR86VugFNqtmEOVXvZsurXa7G+rEdvCY1uX/+tmYGYFurT4
	ytJPslRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTKy4-005frt-DD; Wed, 31 Aug 2022 10:29:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTKy1-005fqP-V7; Wed, 31 Aug 2022 10:29:07 +0000
X-UUID: d53c81cad870427a89bc87dd298cf917-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=eEFFPWPurfnTLCuJ6XvA8r7eaX08wfQ5CFFfzRlVtVw=;
	b=EsnLn4s1jNt/LxvFq6yTre7tE5IBwTL8uV+7vKu4tdkP92JG/KDqd+PbRtXFFyYufqcrR/zC4blrg1ikHRlwRJp5z7bRl2ceCNtBuMib3aiAp10nRcUJKfnxmskhzDDPTK06ROqdfcMJre5XMg69VWMRraF12a9VNAi/ATsFdxA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:6c37c6bc-6fab-4fbf-91e0-7821e0906440,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:bfeeae20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d53c81cad870427a89bc87dd298cf917-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1150027755; Wed, 31 Aug 2022 03:28:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 31 Aug 2022 18:28:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 31 Aug 2022 18:28:54 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [v2] media: platform: mtk-mdp3: fix smatch errors and warning
Date: Wed, 31 Aug 2022 18:28:53 +0800
Message-ID: <20220831102853.6843-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_032906_030176_F389A24D 
X-CRM114-Status: GOOD (  14.97  )
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

Changes in v2:
  Fix compilation fail caused by too few arguments to function call
  in mtk-mdp3-comp.c

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
index e62abf3587bf..43455755a5ac 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -869,7 +869,7 @@ static struct mdp_comp *mdp_comp_create(struct mdp_dev *mdp,
 
 	ret = mdp_comp_init(mdp, node, comp, id);
 	if (ret) {
-		kfree(comp);
+		devm_kfree(dev, comp);
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


