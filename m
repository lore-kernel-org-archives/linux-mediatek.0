Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21181C77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 06:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1DzBxETsAAtn/WkXHPbWWEDwRESy0yoELlXkiZv6Fr8=; b=gPCvPvabErbbmggX+F7WzgAlJx
	XEt5rzCDkcwq0SZiH4p/4ZnsdSaU98t1iEWL3NMEFaH6aJuguvnobHfZ48Pc2VthOwxKWelnlqcFh
	3EhT2/9vMbauIyKWXkc8Ibgp5MOXWxv7N7nZc9sgJy0FoUN9LFK+J1Gdcd/WV9Lsb+p+K6RmTMBS8
	rd2/77/HJmIf3T1JnYcCWsq0ARwJjHnLZZjKWexAa7PoG22Ekxn9WbvcJuL3xIhaGClPFUWPU7ovh
	pK2Xokf8DfuOoVT+3yasVQWYrmzompchbjISpb47tqcKBEWaIVd2ymqwTj+JcE5FXAhdGe+m1C9v8
	NrFI19XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRY2-0016RC-1o;
	Mon, 15 May 2023 06:19:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRXz-0016Q1-29;
	Mon, 15 May 2023 06:19:04 +0000
X-UUID: 601f8fd0f2e811ed912e1518a6540028-20230514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1DzBxETsAAtn/WkXHPbWWEDwRESy0yoELlXkiZv6Fr8=;
	b=PjwgAdJ39n1Tj1JRb7ywvJgjWrMWQoGgmXxfa8IxkPc/fhGVs2oFN2YoEAfK94SMD1bJJw74tx6my3Vvdzr4SOjcZzN2eQiDvfLiOOIBY28r/M5O6cEDYwCSXQyTjF4g5vLrp4kxxWG4duyK0h2rpUwdJ5QLKDZfIYe01EDc0To=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:b562a725-3176-4584-b8e1-b42d37ea6756,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:178d4d4,CLOUDID:77a62c3b-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 601f8fd0f2e811ed912e1518a6540028-20230514
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1990825369; Sun, 14 May 2023 23:18:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 May 2023 14:18:22 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 May 2023 14:18:22 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <thierry.reding@gmail.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jitao.shi@mediatek.com>, Shuijing Li <shuijing.li@mediatek.com>
Subject: [PATCH] pwm: mtk_disp: Fix the disable flow of disp_pwm
Date: Mon, 15 May 2023 14:18:45 +0800
Message-ID: <20230515061845.10241-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_231903_707378_4158F357 
X-CRM114-Status: GOOD (  10.30  )
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

There is a flow error in the original mtk_disp_pwm_apply() function.
If this function is called when the clock is disabled, there will be a
chance to operate the disp_pwm register, resulting in disp_pwm exception.
Fix this accordingly.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 79e321e96f56..cb699fa9a5ae 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -80,10 +80,9 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return -EINVAL;
 
 	if (!state->enabled) {
-		mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
-					 0x0);
-
 		if (mdp->enabled) {
+			mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN,
+						 mdp->data->enable_mask, 0x0);
 			clk_disable_unprepare(mdp->clk_mm);
 			clk_disable_unprepare(mdp->clk_main);
 		}
-- 
2.40.1


