Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF366C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 08:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/+0jDYgKjr47etpDOmvBmSLnoNRX2APwFSsCevtWsI=; b=2uEgLKSroeyOmq
	hQy6sLfa13nAbP/z5uMJcMewxxksgQ+nahrypf1OcutAPHi9oQhaw4PCuDIVjtkJHBvfIqSqq6yFa
	T5V7z6KkcqrLpeVZXYmpxQ0ebPlGE50set0JCQbqLF+3If9M4waJNMy5ZWWVXwPEGyTEmmWmKfefT
	KiPdKwYQpawG8qWwzjG4UyJB+pwUfX8nBNY7TYux3+UeEjzGgWRsuioUoyLI11bMOrILz9M735XcI
	EdgXhkxqWpqicBpPVqP0RwgaxoiMAgINUn7AI6qb3ClJ9HQpAsxxs6iH6NdUeEkZZe1si+xDvnh+P
	3GNTXkwM3ETMlUnTCKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrBT-00C0ZM-Fo; Wed, 08 Jun 2022 08:36:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrBO-00C0VT-ER; Wed, 08 Jun 2022 08:36:56 +0000
X-UUID: 41878f6f4aaf4436b785de62ea824a2c-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:75b2afef-c5bf-4ab6-845c-89023ed55aab,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:833015e5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 41878f6f4aaf4436b785de62ea824a2c-20220608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2009779752; Wed, 08 Jun 2022 01:36:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 01:36:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 8 Jun 2022 16:36:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 8 Jun 2022 16:36:02 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>, Benson Leung <bleung@chromium.org>, Guenter
 Roeck <groeck@chromium.org>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, Daisuke Nojiri <dnojiri@chromium.org>,
	Kees Cook <keescook@chromium.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Prashant Malani
	<pmalani@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Subject: [PATCH v2 4/9] remoteproc: mediatek: Support probing for the 2nd core of dual-core SCP
Date: Wed, 8 Jun 2022 16:35:48 +0800
Message-ID: <20220608083553.8697-5-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220608083553.8697-1-tinghan.shen@mediatek.com>
References: <20220608083553.8697-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_013654_552650_B57C8A71 
X-CRM114-Status: GOOD (  16.04  )
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

The mtk_scp.c driver only supports the single core SCP and the
1st core of a dual-core SCP. This patch extends it for the 2nd core.

MT8195 SCP is a dual-core MCU. Both cores are housed in the same subsys.
They have the same viewpoint of registers and memory.

Core 1 of the SCP features its own set of core configuration registers,
interrupt controller, timers, and DMAs. The rest of the peripherals
in this subsystem are shared by core 0 and core 1.

As for memory, core 1 has its own cache memory. the SCP SRAM is shared
by core 0 and core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 3510c6d0bbc8..91b4aefde4ac 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -23,6 +23,10 @@
 #define MAX_CODE_SIZE 0x500000
 #define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
 
+#define SCP_CORE_0 0
+#define SCP_CORE_1 1
+#define SCP_CORE_SINGLE 0xF
+
 /**
  * scp_get() - get a reference to SCP.
  *
@@ -836,6 +840,7 @@ static int scp_probe(struct platform_device *pdev)
 	struct resource *res;
 	const char *fw_name = "scp.img";
 	int ret, i;
+	u32 core_id = SCP_CORE_SINGLE;
 
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
 	if (ret < 0 && ret != -EINVAL)
@@ -851,8 +856,16 @@ static int scp_probe(struct platform_device *pdev)
 	scp->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, scp);
 
+	ret = of_property_read_u32_index(dev->of_node, "mediatek,scp-core", 1, &core_id);
+	if (ret == 0)
+		dev_info(dev, "Boot SCP dual core %u\n", core_id);
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
-	scp->sram_base = devm_ioremap_resource(dev, res);
+	if (core_id == SCP_CORE_1)
+		scp->sram_base = devm_ioremap(dev, res->start, resource_size(res));
+	else
+		scp->sram_base = devm_ioremap_resource(dev, res);
+
 	if (IS_ERR(scp->sram_base))
 		return dev_err_probe(dev, PTR_ERR(scp->sram_base),
 				     "Failed to parse and map sram memory\n");
@@ -873,7 +886,12 @@ static int scp_probe(struct platform_device *pdev)
 		scp->l1tcm_phys = res->start;
 	}
 
-	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
+	if (core_id == SCP_CORE_1)
+		scp->reg_base = devm_ioremap(dev, res->start, resource_size(res));
+	else
+		scp->reg_base = devm_ioremap_resource(dev, res);
+
 	if (IS_ERR(scp->reg_base))
 		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
 				     "Failed to parse and map cfg memory\n");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
