Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2D3E92FF5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csULzFllOM4TetJVur8dMwONuhpyRUT3dkDgVktGYR0=; b=euxdBTEH4dwwmSuA+mMxwuAAtH
	1UtW848Nt3rcH+I+kEicDlfK3pxooJELybE9PZZYmh/t9mP1yDlzs8SXdpfXXARMwkZP2zv0gkTi/
	ZzJY0U3ij0PMF61J+aczqATQ+0Ft9iZXJ9pgD/a+GvqUrZ8q/bvtgKfaUv5Jw2F2aPLNfnYvchk8b
	ou0zWcDJ2mzwQLlOiTHUQGx3Iens4LsWuEZfrorkV4YhTAxRkn7BwK15hpFoioRe2wEQls7no3H+h
	/h/72uQC6t28adSCRhxVxSIr0TnuttRIvu5oCQtVD7PdpZ2aYd5ASpmcgXNnm+RI/4Gk+VrwxdGm+
	I+c+9MIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qofRV-005BPj-2A;
	Fri, 06 Oct 2023 07:40:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qofR8-005B4s-1T;
	Fri, 06 Oct 2023 07:39:52 +0000
X-UUID: 862ce610641b11ee86758d4a7c00f3a0-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=csULzFllOM4TetJVur8dMwONuhpyRUT3dkDgVktGYR0=;
	b=L/pKKU+NqCX6kIJeVS0M2bdZNaRvS/brEOLlOFttX7UvgkO5Occhw/yTGLxiCIOAUsFC70OdwcBHBlMHv3jBIf8zHRBAsSsAmi1NDgiHfDHMTN8M9zpUlQVNLnmix21S1kqQNDZ8zE+jxDvwLUJHWMYnrWS2m1UrWwNV6rw4dh4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:b76bbbfc-5447-4413-af71-d22efa3d4643,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:1b6ea6bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 862ce610641b11ee86758d4a7c00f3a0-20231006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 818992542; Fri, 06 Oct 2023 00:39:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:38:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:38:39 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Singo Chang <singo.chang@mediatek.com>, "Nancy . Lin"
	<nancy.lin@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	"Hsiao Chien Sung" <shawn.sung@mediatek.com>
Subject: [PATCH v7 16/23] drm/mediatek: Start/Stop components with function pointers
Date: Fri, 6 Oct 2023 15:38:24 +0800
Message-ID: <20231006073831.10402-17-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231006073831.10402-1-shawn.sung@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.509900-8.000000
X-TMASE-MatchedRID: Fx2QhdRtN3gb7D0aLEL5Ob2xWbKjBfWPeL05i8GXPoAIgSDinsA6bPDR
	cRAxsuj7tVKtZME67h5q7k1NHAqvKwTsy5Ctk/ajDko+EYiDQxG5+1figft3LiS30GKAkBxWWP6
	BnnaU6Kji8zVgXoAltsIJ+4gwXrEtWBd6ltyXuvvKw7XAQdv9BdKzeQAXIybU6E0yODFYJFy4bZ
	xtB062qtgeYH8o1G69vf6/7twa2RV8jBBK0biDbsGfImu98AUW6afx0vH21weAhOcaQrQ0U1GyR
	coeF18qmKP0zzpTAeGwod8xOMKmvMCBO+zxAW5pftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.509900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DC877514C351E19A7940FACFA601F280EF15F2FA89800BFEC41F9C543200F95E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_003950_509551_735CEDD7 
X-CRM114-Status: GOOD (  12.51  )
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

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 84133303a6ec..812a1df9732f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -72,6 +72,8 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
 static const struct mtk_ddp_comp_funcs _ethdr = {
 	.clk_enable = mtk_ethdr_clk_enable,
 	.clk_disable = mtk_ethdr_clk_disable,
+	.start = mtk_ethdr_start,
+	.stop = mtk_ethdr_stop,
 };
 
 static const struct mtk_ddp_comp_funcs _merge = {
@@ -189,16 +191,30 @@ void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
 
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
 
 int mtk_ovl_adaptor_clk_enable(struct device *dev)
-- 
2.18.0


