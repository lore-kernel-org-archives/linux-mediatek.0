Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E8CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 06:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2bEc71FXJbkXCo6iNMd0p+14sCNs4GlS4AdXNNwE8U=; b=PDRUqwQQ5Duv4T
	mbEZ42JirEjpoa1eB2HrVMIdzi/Iaph7e9Z2Ur6q0T0zb0ZIz8Wp7aF2ZyYENWpBtqZ+n1JdWCZYM
	st27JVo3XsSToPojHnzSVUQMZt2Kgu0JV+/Skec2AZotLhQzPDsJNTe1LlxfMhGYAzwEVyR2Sq+fN
	ae9oggZR4C1I+DbY8JP+iPAtzDsoIuNkWdlmFO+aY0TuCw5cypkRN0BlucbPss+YGWmZ4u4yLxuEP
	JekJW2L6ESZr6WbwyYjYXncbwzDrUk+xE74lbO1fuoB14e98O0o4vcOjGgM5GJOs2YD4TXavr8H42
	KFCjzIecdbtMYZX/Yq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmdc-00GTKm-3p; Fri, 22 Apr 2022 06:19:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmTx-00GOrf-C4; Fri, 22 Apr 2022 06:09:31 +0000
X-UUID: 385525e890fe43fda7ca749c0374e3f2-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:0fd295e1-42c2-4436-b27d-a0f6d1c0cbe4, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:d87cbdef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 385525e890fe43fda7ca749c0374e3f2-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 694349099; Thu, 21 Apr 2022 23:09:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 23:02:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 14:01:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 14:01:58 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V3 09/17] clk: mediatek: reset: Add support for input offset
 and bit from DT
Date: Fri, 22 Apr 2022 14:01:44 +0800
Message-ID: <20220422060152.13534-10-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_230929_476926_02DF5EC7 
X-CRM114-Status: GOOD (  14.71  )
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

To use the clock reset function easier, we implement the of_xlate.
The calculation of return value is different from each reset version.

There is no impact for original use. If the argument number is not
larger than 1, it will return original id.

With this implementation if we want to set offset 0x120 and bit 16,
we can just write "resets = <&infra_rst 0x120 16>;" in the module node.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/clk/mediatek/reset.c | 31 +++++++++++++++++++++++++++++++
 drivers/clk/mediatek/reset.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index fe917b2eeab4..2a2f3dede77f 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -97,6 +97,33 @@ static const struct reset_control_ops mtk_reset_ops_set_clr = {
 	.reset = mtk_reset_set_clr,
 };
 
+static int reset_xlate(struct reset_controller_dev *rcdev,
+		       const struct of_phandle_args *reset_spec)
+{
+	struct mtk_clk_rst_data *data = to_mtk_clk_rst_data(rcdev);
+	unsigned int offset, bit, shift;
+
+	if (reset_spec->args_count <= 1)
+		return reset_spec->args[0];
+
+	switch (data->desc->version) {
+	case MTK_RST_SIMPLE:
+		shift = 2;
+		break;
+	case MTK_RST_SET_CLR:
+		shift = 4;
+		break;
+	default:
+		pr_err("Unknown reset version %d\n", data->desc->version);
+		return -EINVAL;
+	}
+
+	offset = reset_spec->args[0];
+	bit = reset_spec->args[1];
+
+	return (offset >> shift) * 32 + bit;
+}
+
 int mtk_register_reset_controller(struct device_node *np,
 				  const struct mtk_clk_rst_desc *desc)
 {
@@ -138,6 +165,8 @@ int mtk_register_reset_controller(struct device_node *np,
 	data->rcdev.nr_resets = desc->rst_set_nr * 32;
 	data->rcdev.ops = rcops;
 	data->rcdev.of_node = np;
+	data->rcdev.of_reset_n_cells = max(desc->reset_n_cells, 1);
+	data->rcdev.of_xlate = reset_xlate;
 
 	ret = reset_controller_register(&data->rcdev);
 	if (ret) {
@@ -192,6 +221,8 @@ int mtk_register_reset_controller_with_dev(struct device *dev,
 	data->rcdev.ops = rcops;
 	data->rcdev.of_node = np;
 	data->rcdev.dev = dev;
+	data->rcdev.of_reset_n_cells = max(desc->reset_n_cells, 1);
+	data->rcdev.of_xlate = reset_xlate;
 
 	ret = devm_reset_controller_register(dev, &data->rcdev);
 	if (ret) {
diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 79efbea37c9b..6838a644eaef 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -19,6 +19,7 @@ struct mtk_clk_rst_desc {
 	u8 version;
 	u32 rst_set_nr;
 	u16 reg_ofs;
+	int reset_n_cells;
 };
 
 struct mtk_clk_rst_data {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
