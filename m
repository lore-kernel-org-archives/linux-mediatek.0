Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A59C32771
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 03:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGo95QrOIOS0N5UamZ0ehMKwsLyrHKoHLoOELavqTTw=; b=c+zDHJUKSVLt97VAdROn6aLUWi
	IsLxxaQrhsRaqARot51VFWssNEwFGuv702Q3SCO6lIART/G327psckgLLf8MKglouXIpT7mdDUcCA
	/u3ZGBxkV0NPGuaK421mzcJc+lgGVteSEkSFiqhHK5R95Xim+McAINtRaQMYytWuzb0ufKKRPuAA/
	D0/KzReGa/M5Tk+noPP52hzeehuqLhv2Vn9mYWT2nPw42ytzJfsNGrD57pRU8tbVTQaaOt7Pf6DBU
	FPC9/zbWI6Jct6Pcr+hTK1fr/40YQYIlHhMeuYHF8bS+bhnDt08JAPJJumEaS1aueBDYY7zRxL09v
	jo2lyHcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od17F-0083k8-Kp; Tue, 27 Sep 2022 03:18:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od17C-0083j3-II; Tue, 27 Sep 2022 03:18:35 +0000
X-UUID: 59df116f51c443eb85636aba3c3343c7-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MGo95QrOIOS0N5UamZ0ehMKwsLyrHKoHLoOELavqTTw=;
	b=TbY4t/xabIzBMj4XH3Gvx8rtusD+6LosPrIDpfbVTF31A2FmqHLvTDsGjjnYlNwqfnL5uSxGSw7K/07TCmU3pzJ9JYYVmMVRQASKwkz/w0BOAy/xAUNH/o+Htj/pAJarc0BJimpRKr0ZxEhnHqL09i2snyFqEJpULVokn3UxFOg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:59cfcd5d-6c9c-4ab2-abd1-2431796329dd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:dfe71d07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 59df116f51c443eb85636aba3c3343c7-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 270077212; Mon, 26 Sep 2022 20:18:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 27 Sep 2022 10:56:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Sep 2022 10:56:26 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, "Andrew-CT
 Chen" <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 04/11] remoteproc: mediatek: Remove redundant rproc_boot
Date: Tue, 27 Sep 2022 10:55:59 +0800
Message-ID: <20220927025606.26673-5-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220927025606.26673-1-tinghan.shen@mediatek.com>
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_201834_619124_1309EF21 
X-CRM114-Status: GOOD (  16.10  )
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

The video codec doesn't need to explicitly boot SCP in its flow
because the SCP remote processor enables auto boot.

The redundant usage of rproc_boot increases the number of rproc.power
over 1 and prevents successfully shutting down SCP by rproc_shutdown.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../mediatek/vcodec/mtk_vcodec_fw_scp.c         |  2 +-
 drivers/remoteproc/mtk_scp.c                    | 17 +++++++++++++++++
 include/linux/remoteproc/mtk_scp.h              |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
index d8e66b645bd8..c3194f88ff31 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
@@ -6,7 +6,7 @@
 
 static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
 {
-	return rproc_boot(scp_get_rproc(fw->scp));
+	return scp_boot(fw->scp);
 }
 
 static unsigned int mtk_vcodec_scp_get_vdec_capa(struct mtk_vcodec_fw *fw)
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index d421a2ccaa1e..bf68bccab78b 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -673,6 +673,23 @@ struct rproc *scp_get_rproc(struct mtk_scp *scp)
 }
 EXPORT_SYMBOL_GPL(scp_get_rproc);
 
+/**
+ * scp_boot() - Boot SCP
+ *
+ * @scp:	mtk_scp structure
+ **/
+int scp_boot(struct mtk_scp *scp)
+{
+	struct rproc *rproc = scp->rproc;
+
+	/* scp already booted when power > 0 */
+	if (atomic_read(&rproc->power) > 0)
+		return 0;
+	else
+		return rproc_boot(scp->rproc);
+}
+EXPORT_SYMBOL_GPL(scp_boot);
+
 /**
  * scp_get_vdec_hw_capa() - get video decoder hardware capability
  *
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 7c2b7cc9fe6c..e463105b351c 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -52,6 +52,7 @@ void scp_put(struct mtk_scp *scp);
 
 struct device *scp_get_device(struct mtk_scp *scp);
 struct rproc *scp_get_rproc(struct mtk_scp *scp);
+int scp_boot(struct mtk_scp *scp);
 
 int scp_ipi_register(struct mtk_scp *scp, u32 id, scp_ipi_handler_t handler,
 		     void *priv);
-- 
2.18.0


