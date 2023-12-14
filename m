Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF1DC4167D
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 05:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aW/XsAA8hGCSog7BqSGudf9VoMOqK1HzMz+l6/m7oNo=; b=j/HvK6b2wIGTVDk+uCSAque8JM
	Or7KtXZunWGTyvHwK2Tn6eCyCBAFQwU2bNHGJXaO14X2BjmcNdDX/M0eDvgqh+/s2OZl9BGEa4jF5
	M/RuVZbUyg7NJkHqS3xkg73uZh/z51iGvQ5mrY+KW6q9NipSJVfJzHrJjR0pJpA1lcnqaCgYEKr2Y
	SooAubssV1Obn2KWMRP0f6ovsZS83Qh1lS54T+dorJ7hSWm42b9hst4FrhBHfCD8/Guby8hfxBmmf
	ZqwiOK4QF2AG7y+JL6GirBwatW1ejLxHRBk4SyQZJ49ZvW+N4ngCPU7yyBfFPFZTU3KOOz6j3cSNV
	bezEbuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDekm-00GsB7-2j;
	Thu, 14 Dec 2023 05:59:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDekT-00GrnO-00;
	Thu, 14 Dec 2023 05:59:07 +0000
X-UUID: dd04a4fe9a4511ee958cff29c719f35b-20231213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=aW/XsAA8hGCSog7BqSGudf9VoMOqK1HzMz+l6/m7oNo=;
	b=nlQ7zJL8wj9ExI+iDWe0o+9iB8oiY6IK3ROadp2BrBNAhTw33CVn+Qv7E1+dmolKaUwDnnJiABLQki+97opgTdB1cRCI2DvNJOchuCOncYdeuTAxGOZngyzMtGYFzF+MvYEVsDT2jNxMsAEXxsbK/yRQfF/wBmOHWCvU8/2YuMo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:5db3e2ce-663c-48dd-8028-dc335025170a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:78bfa7fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dd04a4fe9a4511ee958cff29c719f35b-20231213
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1984167002; Wed, 13 Dec 2023 22:58:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Dec 2023 13:58:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Dec 2023 13:58:50 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Matthias Brugger <matthias.bgg@gmail.com>, Moudy Ho <moudy.ho@mediatek.com>,
	Hsiao Chien Sung <shawn.sung@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, "Roy-CW .
 Yeh" <roy-cw.yeh@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	xinlei lee <xinlei.lee@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v12 15/23] drm/mediatek: Start/Stop components with function pointers
Date: Thu, 14 Dec 2023 13:58:39 +0800
Message-ID: <20231214055847.4936-16-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231214055847.4936-1-shawn.sung@mediatek.com>
References: <20231214055847.4936-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.542100-8.000000
X-TMASE-MatchedRID: aEd/qsqbLK4b7D0aLEL5Ob2xWbKjBfWPkos2tunL8DT/evmlVf9xZkN+
	V6ZFLcNdXQfL6gqs5OQd5e75RGwObaK176S49UNHkDpLRKO9xhSZ2scyRQcer19eTSR8I6dudjd
	NwycGaR/v5TZdm2T2Kr1Odlcux5HWHxPMjOKY7A8LbigRnpKlKZvjAepGmdoOsRunbcic21kj5J
	4TaJJuPa2i+dnS6f5T20mnMsmkbaLJzkAlfa4X5MFCRr0IKekVKIYKIq6+TbixUcgMLkVKCwwI0
	+X/rE7HSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euJ0YHKn7N1oOA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.542100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 39A1D386ECE4448F1E4203CDECE5BBB47864444C603CE240FAD4FB491F2338602000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_215905_061575_C85902FD 
X-CRM114-Status: GOOD (  12.61  )
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

By registering component related functions to the pointers,
we can easily manage them within a for-loop and simplify the
logic of component start/stop process.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index e00d8a395ca0..65c5153bdcd8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -72,6 +72,8 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
 static const struct mtk_ddp_comp_funcs ethdr = {
 	.clk_enable = mtk_ethdr_clk_enable,
 	.clk_disable = mtk_ethdr_clk_disable,
+	.start = mtk_ethdr_start,
+	.stop = mtk_ethdr_stop,
 };
 
 static const struct mtk_ddp_comp_funcs merge = {
@@ -191,16 +193,30 @@ void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
 
 void mtk_ovl_adaptor_start(struct device *dev)
 {
+	int i;
 	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
 
-	mtk_ethdr_start(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i] ||
+		    !comp_matches[i].funcs->start)
+			continue;
+
+		comp_matches[i].funcs->start(ovl_adaptor->ovl_adaptor_comp[i]);
+	}
 }
 
 void mtk_ovl_adaptor_stop(struct device *dev)
 {
+	int i;
 	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
 
-	mtk_ethdr_stop(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i] ||
+		    !comp_matches[i].funcs->stop)
+			continue;
+
+		comp_matches[i].funcs->stop(ovl_adaptor->ovl_adaptor_comp[i]);
+	}
 }
 
 /**
-- 
2.18.0


