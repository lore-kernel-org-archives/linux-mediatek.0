Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFFBC3DA78
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 03:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5C2D2S86cb16nMfLO4Diw2Eh4jJ4yT3vi26gK/otEzg=; b=u9Rb2ZZbSj7uBFEft2T4ScuMYN
	Rn5lQm28lLdTOuXD8qKGIgO4RM+2wC1YRd3de+GqMjn0igR31VpaAPECwVEBJFQ6BaiVOcQcXF0D/
	Wu9Q3M81PbL7IVVEjrPx8AnfiMn5rqhFEqM6Gh5bkEtApv93SrG6fWv9JxSqc19WYfStnFGhrHl9r
	oJQRvWB8/VT/Jo+jiaV3oj5ne6+UQlqNVgqW3bUD8pIoAOdWDkLw3LP9NAfH4fi12Ye4TO/SCoA/4
	qbBXoQhrGEX7tXOLv4g3U1nlv+zqlrhWFisd3sYdU5AndPJqeFexmLAnImTcai4FzoykPx5Jf3koh
	FbGMNpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHccx-00CjDX-VV; Tue, 17 Jan 2023 03:27:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHccv-00CjCB-No; Tue, 17 Jan 2023 03:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5C2D2S86cb16nMfLO4Diw2Eh4jJ4yT3vi26gK/otEzg=; b=Z/POQNVo9kTlGYwPa5IsiwEQu/
	PBug8Z8UMUWJyUZS6iYx8t+ygZFjf4Pu4citRMsHS09/BzpOJnmcoEW0tOSEt9EgYZmWivSUWEYSe
	SjJufP9DReswcpi19VQ3XI4c7AuTcRK9yq/zBSKfD/Q0Z/tsdp9r2h7NWqwkZz02y7Avn/JIRYgT/
	EqikIqxrRZDeQ0mba8zWQvdzb9GQ15fkXebiXhdV9I6OzpI1i8UcJLGDY5QYLrt7cbtJS1ugqvDAj
	jfP73PfcRBHYjwVmeezbKOF9aH/vgAjhbTn89hG0Uw2Keq/0RwmEyCOuSwgLFUZc62hwH8Gez23Z+
	YQiQbD0w==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHccg-005occ-2M;
	Tue, 17 Jan 2023 03:26:58 +0000
X-UUID: c7c5d9ca961611eda08d4d6090ec5a5c-20230116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5C2D2S86cb16nMfLO4Diw2Eh4jJ4yT3vi26gK/otEzg=;
	b=rV/yfyKU1u0fbaNhI0vN2X0ivRrqnQbb89mKpiXsFZWC0W4LiVSJ/ZbPG/QAIPhr6SJ8fLL5rd9uPjTF90sgdtNtwRsWY9BcgFFvtSSNIUmbkgQnXs23rY1Rnf0+EjVUo3oDZ/OWh4vfD3oe9z0Nns82IXbUlI0sC+5e1VYrZps=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:53aa20ac-6447-4355-9d3f-2168af5571f1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:1d76d854-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: c7c5d9ca961611eda08d4d6090ec5a5c-20230116
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 242494292; Mon, 16 Jan 2023 20:26:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 17 Jan 2023 11:26:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 17 Jan 2023 11:26:47 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo i Serra
	<enric.balletbo@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH 2/2] soc: mediatek: pm-domains: Add buck isolation setting in power domain
Date: Tue, 17 Jan 2023 11:26:40 +0800
Message-ID: <20230117032640.13504-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230117032640.13504-1-allen-kh.cheng@mediatek.com>
References: <20230117032640.13504-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_032655_746879_5E40D9D1 
X-CRM114-Status: GOOD (  13.91  )
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

In some chipsets, we need to disable EXT_BUCK_ISO before turning on the
specific power pm-domains (mtcmos), such as ADSP in MT8192 and CAM_VCORE
in MT8188.

Add the MTK_SCPD_EXT_BUCK_ISO flag to control the buck isolation setting
in the mediatek power domain driver.

Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 8 ++++++++
 drivers/soc/mediatek/mtk-pm-domains.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 474b272f9b02..be972e35b26e 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -218,6 +218,10 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret)
 		goto err_reg;
 
+	if (pd->data->ext_buck_iso_offs && MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_ISO))
+		regmap_clear_bits(scpsys->base, pd->data->ext_buck_iso_offs,
+				  pd->data->ext_buck_iso_mask);
+
 	/* subsys power on */
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
@@ -272,6 +276,10 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		return ret;
 
+	if (pd->data->ext_buck_iso_offs && MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_ISO))
+		regmap_set_bits(scpsys->base, pd->data->ext_buck_iso_offs,
+				pd->data->ext_buck_iso_mask);
+
 	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 
 	/* subsys power off */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index a5f24c58e35a..5ec53ee073c4 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -10,6 +10,7 @@
 #define MTK_SCPD_DOMAIN_SUPPLY		BIT(4)
 /* can't set MTK_SCPD_KEEP_DEFAULT_OFF at the same time */
 #define MTK_SCPD_ALWAYS_ON		BIT(5)
+#define MTK_SCPD_EXT_BUCK_ISO		BIT(6)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
-- 
2.18.0


