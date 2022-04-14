Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC01C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFb3UwrZnv1JhxIpP+Ww7OUj0FElr311zyNAH8hzC3o=; b=Hhkiqqj4y3xd3l
	wH79wUC9OgdUev1rZH163QPpJFDFxWN2y/PSgXwXlPmgzJWh7eQuGbLtPm4wTx1G/eD5e7pnX/Kyf
	qnJOebVW59dfgtf23wzGiYXld6IJPKgOUpQkFe8m7IUT10JEL30t3WrBbOfoAVmj2B7dVMVRgzW0F
	wWj1fVDKXtxp9WJVywfeRuAHblz35BYVAOmx8WSNUn8F8pyeTGcQ2Qoz1yaZ1jSf3DiAeE22y59Vn
	ysLkGaVhcvcFDQ0pS9thXRFdlrthYTNPT/1kKDoYNAFTS/JdgC3SE7TZg2LkSENdLWDTCaMFQBTsb
	nNvAGrpIEV5Bv2lybe8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neyZh-005WxR-Ie; Thu, 14 Apr 2022 12:27:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neyZb-005WwG-M7; Thu, 14 Apr 2022 12:27:47 +0000
X-UUID: aa5b57c272594de6845107ef51bd7e0e-20220414
X-UUID: aa5b57c272594de6845107ef51bd7e0e-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1835029423; Thu, 14 Apr 2022 05:27:35 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 05:21:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Apr 2022 20:21:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Apr 2022 20:21:43 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-remoteproc@vger.kernel.org>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 2/2] remoteproc: mediatek: allow reading firmware-name from
 DT
Date: Thu, 14 Apr 2022 20:21:40 +0800
Message-ID: <20220414122140.6114-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220414122140.6114-1-allen-kh.cheng@mediatek.com>
References: <20220414122140.6114-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_052743_750848_EFA287E9 
X-CRM114-Status: GOOD (  13.98  )
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

The SCP firmware blob differs between platforms and SoCs. We add
support in the SCP driver for reading the path of firmware file from
DT in order to allow these files to live in a generic file system
(or linux-firmware).

The firmware-name property is optional and the code falls back to the
old filename if the property isn't present.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index ee6c4009586e..82813d74e829 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -809,9 +809,14 @@ static int scp_probe(struct platform_device *pdev)
 	struct mtk_scp *scp;
 	struct rproc *rproc;
 	struct resource *res;
-	char *fw_name = "scp.img";
+	const char *fw_name = "scp.img";
 	int ret, i;
 
+	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
+				      &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return ret;
+
 	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
 	if (!rproc)
 		return dev_err_probe(dev, -ENOMEM, "unable to allocate remoteproc\n");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
