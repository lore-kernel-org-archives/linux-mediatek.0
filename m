Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE0DCDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 10:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jazEhUv7pYk7ELkOS345Z9dBSqJXM36LVwFcsL+Kcjk=; b=KGFOx+6r/i45H6Fxfv5i37Fqu6
	mY6qPmwIDiSyEGmajm1jacy2edv4fPhM/yOnmiXCgnIvMK/y5EYRWBOdJxQbzjTBrPiNIWa2XKdKD
	JPnfrFmA9CK/XWbDLIaf3t/4H864B4nUuAqcGKjadQGzVAbKZvDb9kgLfFhVUdBclbJzqx3BcAEgx
	eqKx7RXCyMUwE/G+xASsnhut+No9mp7FkVvpGCk1Kx7dNbn490FPdFWAcHxOm5tDKDow0mfJ8IujD
	iQktYyOkts31R6M4vOriiBwdGh8TdEaubkHvo0pj00gRDQxLpstrX/cUjHROAoyDmeSL0ZZr4hXub
	WoVPt5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsL2Y-009Mg4-1w;
	Mon, 16 Oct 2023 10:41:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsL2E-009MJd-1V;
	Mon, 16 Oct 2023 10:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jazEhUv7pYk7ELkOS345Z9dBSqJXM36LVwFcsL+Kcjk=; b=Dt+LT6jzRvzobPq2YmQiQuy8RV
	dN6lx10x7fco6QbxCZUdu3AqpLBh3kg7PXJdo+xVKXDpNpYXzveKk6hM6Hx3xd/JvyDVnYCHj638Z
	FUUnJStBhc92D3l5dCTTNTF0ZATF28b+jLEZ8/ZdTtkMi8P50b8PCyU+DAiQhbvbEAKIrqmFUVWj4
	7hP0k5taKPCLzIAvmu2U/NcHZAVefL0fodKGbc9EswTA3Ze+jMB1Uf32wPlYmMagwfDlTIYK9S3Ap
	EN2IfhBLrDIgIMm2wKIKcEoLElNoTi4UTV6mnqWswXclI0W9ktOstktV77YXYFXnaclVth2sHqqo0
	Euy19rSA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsL1v-005wMg-2b;
	Mon, 16 Oct 2023 10:41:16 +0000
X-UUID: 7b0fd4f26c1011ee86758d4a7c00f3a0-20231016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jazEhUv7pYk7ELkOS345Z9dBSqJXM36LVwFcsL+Kcjk=;
	b=JprZXp/e9habry5VjMZ4WvpfXaEiyLVjoPJ68/949/VlLjT3/oNg7OAsrkFZhLdCEvagLT+zTrqljcXjPwmMMLxQTGFGMVYUDyTy8JpWwuChXAf4/kTo9EhpdVQbGbS9V2IAKZkztx6xuVlbsrcvGz1Tfd0qpAr8PXrtzmn8qXM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:bf517dc6-25c6-4daa-b3ae-37f91b9db9bc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:aa00d9f0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7b0fd4f26c1011ee86758d4a7c00f3a0-20231016
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1164696155; Mon, 16 Oct 2023 03:40:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Oct 2023 18:40:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Oct 2023 18:40:16 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v8 21/23] drm/mediatek: Fix underrun in VDO1 when switches off the layer
Date: Mon, 16 Oct 2023 18:40:08 +0800
Message-ID: <20231016104010.3270-22-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231016104010.3270-1-shawn.sung@mediatek.com>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.397400-8.000000
X-TMASE-MatchedRID: r15/GZU7YAxQlz7zzALRPqKa0xB73sAA7yWPaQc4INS0rcU5V/oSe8Ht
	HEmxq9+Y8G/bfvdFXyUnOAFYLaUTjVm72EsAF82QA9lly13c/gGSiza26cvwNH5h6y4KCSJcje0
	jgce+svLi8zVgXoAltsYlDcGKIsCCC24oEZ6SpSmb4wHqRpnaDgJ0NZa541ShIMMv3nu0FR7vL/
	Me6q+LqIIf1er328qAW+rJOEwM3lTXjUznCVHjXyDlQ9He3r7bOiByN1tT5LKZNgCSnJjJ6Ema3
	zYT97IFAYfQIAUhBayZvmCbKVb49sZL6x5U/HridGByp+zdaDg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.397400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6E4C40E13989B5778236BCEE6F1F013B95C7DEF1CCAAFB672A6713BB061D127D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_114104_054444_3E7C5232 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hsiao Chien
 Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Do not reset Merge while using CMDQ because reset API doesn't
wait for frame done event as CMDQ does and could lead to
underrun when the layer is switching off.

Fixes: aaf94f7c3ae6 ("drm/mediatek: Add display merge async reset control")

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index fd14a59bc951..c19fb1836034 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -104,7 +104,7 @@ void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CTRL);
 
-	if (priv->async_clk)
+	if (!cmdq_pkt && priv->async_clk)
 		reset_control_reset(priv->reset_ctl);
 }
 
-- 
2.18.0


