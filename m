Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2856AC43219
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vryjbgcUfXGsrNqdaOfzvzoRa8kuYa50n6AqfpJC5Lk=; b=Ubv3W7eX5gOEO5
	sRFyyacWTv/vbxJhIIKJnU96xc5WbAtZhJA7J1gErds0mlZH5mTT2Ltdu0a2eOFK7Q3l5bZ3m+Ux2
	VHRCfLb1qX8SQQyv7H4Jy9ZjMGgHXkRiCSPAuIBDCyWl0Shsv85JWp3jqKOCH1L4Zs5+CUMFPjAO7
	e3u/7fzteuvJOx+yQT9yLKloiMhBsyhb/PtRhJm24Lp/x6Wr/oVOTVuwiZ8pIHIB+0OVLYbg9uPxc
	d5+xJFeB95mEBGBAWEyJwp4bkXDpqgHdCfayzSEEUMbjJjpbKtovQWxCbQmy+6aerMeXimwGdE5wk
	/jMHkZGoem1ndnKkycjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMQf-00Fawf-NM; Wed, 01 Jun 2022 11:22:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMQb-00FauJ-Ei; Wed, 01 Jun 2022 11:22:19 +0000
X-UUID: 94941786139b493dadd6464c5dbb5f16-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:c346ba6b-0754-45a5-9cbc-38b6648a776a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:eb648f14-f88c-475e-badf-d9ee54230b8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 94941786139b493dadd6464c5dbb5f16-20220601
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1270996758; Wed, 01 Jun 2022 04:22:07 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 04:22:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Jun 2022 19:22:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 19:22:05 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Daisuke Nojiri
	<dnojiri@chromium.org>, Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>, "Gustavo A. R. Silva"
	<gustavoars@kernel.org>, Prashant Malani <pmalani@chromium.org>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Brian Norris
	<briannorris@chromium.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Subject: [PATCH v1 07/15] remoteproc: mediatek: Add SCP core 1 reserved memory support
Date: Wed, 1 Jun 2022 19:21:53 +0800
Message-ID: <20220601112201.15510-8-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220601112201.15510-1-tinghan.shen@mediatek.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_042217_535001_66ECF579 
X-CRM114-Status: GOOD (  14.91  )
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

Reuse the SCP core 0 reserved memory API on SCP core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h   | 2 ++
 drivers/remoteproc/mtk_scp.c      | 6 ++++--
 drivers/remoteproc/mtk_scp_dual.c | 5 +++++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 2e46be605687..da3ea2243678 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -168,4 +168,6 @@ int scp_stop(struct rproc *rproc);
 int scp_load(struct rproc *rproc, const struct firmware *fw);
 void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
 int scp_parse_fw(struct rproc *rproc, const struct firmware *fw);
+int scp_map_memory_region(struct mtk_scp *scp);
+void scp_unmap_memory_region(struct mtk_scp *scp);
 #endif
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 7b9d12ec2d4f..75d161da0f59 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -747,7 +747,7 @@ void *scp_mapping_dm_addr(struct mtk_scp *scp, u32 mem_addr)
 }
 EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
 
-static int scp_map_memory_region(struct mtk_scp *scp)
+int scp_map_memory_region(struct mtk_scp *scp)
 {
 	int ret;
 
@@ -773,8 +773,9 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(scp_map_memory_region);
 
-static void scp_unmap_memory_region(struct mtk_scp *scp)
+void scp_unmap_memory_region(struct mtk_scp *scp)
 {
 	if (scp->dram_size == 0)
 		return;
@@ -783,6 +784,7 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
 			  scp->dma_addr);
 	of_reserved_mem_device_release(scp->dev);
 }
+EXPORT_SYMBOL_GPL(scp_unmap_memory_region);
 
 static int scp_register_ipi(struct platform_device *pdev, u32 id,
 			    ipi_handler_t handler, void *priv)
diff --git a/drivers/remoteproc/mtk_scp_dual.c b/drivers/remoteproc/mtk_scp_dual.c
index e4ada5696bd7..0f932d26f864 100644
--- a/drivers/remoteproc/mtk_scp_dual.c
+++ b/drivers/remoteproc/mtk_scp_dual.c
@@ -60,6 +60,10 @@ static int scp_dual_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
 				     "Failed to parse and map cfg memory\n");
 
+	ret = scp_map_memory_region(scp);
+	if (ret)
+		return ret;
+
 	mutex_init(&scp->send_lock);
 	for (i = 0; i < SCP_IPI_MAX; i++)
 		mutex_init(&scp->ipi_desc[i].lock);
@@ -75,6 +79,7 @@ static int scp_dual_remove(struct platform_device *pdev)
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
 	int i;
 
+	scp_unmap_memory_region(scp);
 	for (i = 0; i < SCP_IPI_MAX; i++)
 		mutex_destroy(&scp->ipi_desc[i].lock);
 	mutex_destroy(&scp->send_lock);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
