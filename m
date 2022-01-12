Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00xovyObKZJg4FBCbZ35MrqkbBiutZ+/GMcH6l2gtnE=; b=Jg/cL30EyGRKux
	mlQCYoj5CLauITCScX4/5x4No4lFz7fRTA8UarJVKLLWfJKjKEI9HzN5GHll60ZuWg+PnQedKUKTE
	ux4l10lBTemDAjeBV+adLF0cuzMbrwdivKtk7x7RmPn72V1Yz82avg8WN4es7DpojxoqLZR10Qhx8
	fWlEaEZqOxpMxYFxFwfY9WpZIBTIQbv8+zfmel6sdQbm1GrRYBGQzFizcrqzXqJaGFSlrkK8JHllV
	h+k4OTCuFyEH3wnX8h5Izh49JseaZvtKPc+fSjFiTC0ANXYSCUT82dHpw4tQTtSJmsUJiHFV3sTF8
	4cVDN9KR7QfLUZYkxaLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7aVk-001xQm-8s; Wed, 12 Jan 2022 10:05:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7aPs-001unz-58; Wed, 12 Jan 2022 09:59:41 +0000
X-UUID: 6ac03815e6e64f248104d021f71f7e13-20220112
X-UUID: 6ac03815e6e64f248104d021f71f7e13-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1834435631; Wed, 12 Jan 2022 02:59:36 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 01:49:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 17:49:32 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Jan 2022 17:49:30 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Steve Cho <stevecho@chromium.org>, 
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v18, 04/19] media: mtk-vcodec: export decoder pm functions
Date: Wed, 12 Jan 2022 17:49:08 +0800
Message-ID: <20220112094923.16839-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112094923.16839-1-yunfei.dong@mediatek.com>
References: <20220112094923.16839-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_015940_232717_2F8983BA 
X-CRM114-Status: GOOD (  11.51  )
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

When mtk vcodec decoder is build as a module, we need to export
mtk-vcodec-dec pm functions to make them visible by the other components.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index ba96e62c6bb1..1fc2a4b2a137 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -77,12 +77,14 @@ int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
 	put_device(pm->larbvdec);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_pm);
 
 void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
 {
 	pm_runtime_disable(pm->dev);
 	put_device(pm->larbvdec);
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_release_dec_pm);
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 {
@@ -94,6 +96,7 @@ int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_on);
 
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
 {
@@ -103,6 +106,7 @@ void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
 	if (ret)
 		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_off);
 
 void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
 {
@@ -129,6 +133,7 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
 	for (i -= 1; i >= 0; i--)
 		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_on);
 
 void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
 {
@@ -139,3 +144,4 @@ void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
 	for (i = dec_clk->clk_num - 1; i >= 0; i--)
 		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_off);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
