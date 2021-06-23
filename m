Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1675DC4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:36:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D522F6128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D522F6128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEiRLQvMsFmnIbjtmQKkkuvlNEbMdx9dQhGZKHHGThQ=; b=4Np/zr9BTfzrHQ
	v9Im98mzpZ35MJOkjOwMfBnenUZeZ7e0E/eJbZ0UDqlSCtUMYzYTu8YRdELe/NsFldmwFS1iv/e1Q
	VMuyUiDhjnRcONovTl14hVSk0dhih1wH7HVLEUZKev8PVu6IlpiNMzqiC11L0ZBy5S2q1dEQ47t5l
	LoTYZW6wD0m1LcMi/zBOsJu3IFBkcD5YK1jkpxCWqkhqDROeATypMzDf0SeeNN5843nOQCeWkc+oF
	H0jOrPD7N2kvnaPUBkmrUKxFdKh4nIkoz4AUb/DrjcIn2ycf4KVh7Sd6ew4O7tykqaHyWXHkvaO46
	KXtPOTyR+N5Vlx0ZNI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvxQq-009nHo-Lw; Wed, 23 Jun 2021 07:36:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvxQc-009n8l-06; Wed, 23 Jun 2021 07:36:07 +0000
X-UUID: 2a89b0587c4747b1979ea2dc42ce2802-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SD88f/nDxBn/6u02bBJBFVNz6T8v96xqsm8RNit5wOU=; 
 b=PRqBH0efk0T5maoOAl2YOiYzRR5I4AA5SvgesoZFgqFLR++djUnX1lJ7rztfHWlLn6hGzMX7hiw59XHcffkOwRWlWrUYWIEbySoejECOsPJOtv2P5gOAUo3lJywei79vSkCwk6TLanPJ0tQBLsJ0/UJOWU1z2+npmMFaVUGqbeY=;
X-UUID: 2a89b0587c4747b1979ea2dc42ce2802-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 435597603; Wed, 23 Jun 2021 00:35:59 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 00:35:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:35:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Jun 2021 15:35:57 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, daoyuan huang <daoyuan.huang@mediatek.com>, Ping-Hsun Wu
 <ping-hsun.wu@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <tfiga@chromium.org>, <drinkcat@chromium.org>, <acourbot@chromium.org>,
 <pihsun@chromium.org>, <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <ben.lok@mediatek.com>, <randy.wu@mediatek.com>, <moudy.ho@mediatek.com>,
 <srv_heupstream@mediatek.com>, <frederic.chen@mediatek.com>
Subject: [RFC PATCH V0 06/10] media: mtk-mdp3: move clock on to precise place
Date: Wed, 23 Jun 2021 15:35:45 +0800
Message-ID: <20210623073549.24170-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_003606_088022_6D88F47F 
X-CRM114-Status: GOOD (  13.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: daoyuan huang <daoyuan.huang@mediatek.com>

Move clock on to the previous line of cmdq_pkt_flush.

Due to there're two ways(sync/async) to submit CMDQ task,
and for async case we need to prepare callback param struct along
with error checks and error handlings before submit,
if we move clock on after these error check steps,
we can save some clock off code in error handling.

Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index df956ca3685c..a1bdf92d45f7 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -445,11 +445,9 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		return ret;
 	}
 
-	// TODO: engine conflict dispatch
-	for (i = 0; i < param->config->num_components; i++)
-		mdp_comp_clock_on(&mdp->pdev->dev, path.comps[i].comp);
-
 	if (param->wait) {
+		for (i = 0; i < param->config->num_components; i++)
+			mdp_comp_clock_on(&mdp->pdev->dev, path.comps[i].comp);
 		ret = cmdq_pkt_flush(cmd.pkt);
 #ifdef MDP_DEBUG
 		if (ret) {
@@ -495,6 +493,9 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		cb_param->num_comps = param->config->num_components;
 		cb_param->mdp_ctx = param->mdp_ctx;
 
+		mdp_comp_clocks_on(&mdp->pdev->dev, cb_param->comps,
+				   cb_param->num_comps);
+
 		ret = cmdq_pkt_flush_async(cmd.pkt,
 					   mdp_handle_cmdq_callback,
 					   (void *)cb_param);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
