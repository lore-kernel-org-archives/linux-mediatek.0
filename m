Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E3EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 10:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g3x9st1cLckpQozblUmO+23e1Rs2Ez5xAw9Nt8F6aEo=; b=K7XbB9bhxQswa2RrvuJRsv7tOL
	i41PnNdxeHwKAhOxHECgc+9h+1HV9H4ODFYjcDXrqLb3Z8A4C9pwB4DYpWIGbl6OKURrLUkmiKu0E
	OHs5BGw+RGVYdvkZHPykhxQ6He7vMVUwIFV0Goj8TlRBIyRtEJvdFuIX7D0AFbqYWTKCYi8qTRdcV
	xdY21C8GbsJ3v79HlgPWwjfAdz6tq4GhojEcaeoxmEC1Ds6hvWb+nMfwzu1WBE6qjolTU0xL5Twjq
	PeFN/TkYYZ0Y5W8yWAPbWtO1j/8eqdNDnlJaHKjVTsUollE3uO7zqxqG854e6UIdr2XXu0VAOzHUq
	7FMGJE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWye-00FO4s-LD; Thu, 02 Feb 2023 10:38:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWyU-00FO3e-VA; Thu, 02 Feb 2023 10:37:52 +0000
X-UUID: a0101662a2e511eda08d4d6090ec5a5c-20230202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=g3x9st1cLckpQozblUmO+23e1Rs2Ez5xAw9Nt8F6aEo=;
	b=pQ0gRocQzNTuHVw8JytTA+emifsmsjXq8AivScr1yZRwlkoJ/p4sNkGVVsOutxWwtljjapHx4i5P134px9r7+MmMGFqTj+Wxg3vy0VRGXlLXmMDXM5deQjNJdj2R5zLOh+u9j2JEUHOP2ZGlKYSvaFqMnF6MGUz8t14tXuolGlA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:933b5ca7-470f-43d2-a9bc-3cb36ae97f69,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:919443f7-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: a0101662a2e511eda08d4d6090ec5a5c-20230202
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1862191422; Thu, 02 Feb 2023 03:37:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 2 Feb 2023 18:37:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 2 Feb 2023 18:37:09 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <error27@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8188: remove etdm dead code
Date: Thu, 2 Feb 2023 18:37:04 +0800
Message-ID: <20230202103704.15626-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_023751_029722_34AECF0D 
X-CRM114-Status: GOOD (  11.68  )
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

Some Smatch static checker warning like below was found.

sound/soc/mediatek/mt8188/mt8188-dai-etdm.c:2487
mt8188_dai_etdm_parse_of()
warn: 'ret' returned from snprintf() might be larger than 48

    2479         for (i = 0; i < MT8188_AFE_IO_ETDM_NUM; i++) {
    2480                 dai_id = ETDM_TO_DAI_ID(i);
    2481                 etdm_data = afe_priv->dai_priv[dai_id];
    2482
    2483                 ret = snprintf(prop, sizeof(prop),
    2484                                "mediatek,%s-multi-pin-mode",
    2485                                of_afe_etdms[i].name);
    2486                 if (ret < 0) {
--> 2487                         dev_err(afe->dev, "%s snprintf
err=%d\n",
    2488

In linux kernel, snprintf() never returns negatives. On the other hand,
the format string like "mediatek,%s-multi-pin-mode" must be smaller
than sizeof(prop)=48.

After discussing in the mail thread[1], I remove the dead code to fix
the Smatch warnings.

[1]: https://lore.kernel.org/all/Y9EdBg641tJDDrt%2F@kili/

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 33 ++++++---------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 0b79c1cc293b..071841903c62 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -2480,24 +2480,14 @@ static void mt8188_dai_etdm_parse_of(struct mtk_base_afe *afe)
 		dai_id = ETDM_TO_DAI_ID(i);
 		etdm_data = afe_priv->dai_priv[dai_id];
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-multi-pin-mode",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_err(afe->dev, "%s snprintf err=%d\n",
-				__func__, ret);
-			return;
-		}
+		snprintf(prop, sizeof(prop), "mediatek,%s-multi-pin-mode",
+			 of_afe_etdms[i].name);
+
 		etdm_data->data_mode = of_property_read_bool(of_node, prop);
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-cowork-source",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_err(afe->dev, "%s snprintf err=%d\n",
-				__func__, ret);
-			return;
-		}
+		snprintf(prop, sizeof(prop), "mediatek,%s-cowork-source",
+			 of_afe_etdms[i].name);
+
 		ret = of_property_read_u32(of_node, prop, &sel);
 		if (ret == 0) {
 			if (sel >= MT8188_AFE_IO_ETDM_NUM) {
@@ -2516,14 +2506,9 @@ static void mt8188_dai_etdm_parse_of(struct mtk_base_afe *afe)
 
 	/* etdm in only */
 	for (i = 0; i < 2; i++) {
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-chn-disabled",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_err(afe->dev, "%s snprintf err=%d\n",
-				__func__, ret);
-			return;
-		}
+		snprintf(prop, sizeof(prop), "mediatek,%s-chn-disabled",
+			 of_afe_etdms[i].name);
+
 		ret = of_property_read_variable_u8_array(of_node, prop,
 							 disable_chn,
 							 1, max_chn);
-- 
2.18.0


