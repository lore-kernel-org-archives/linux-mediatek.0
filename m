Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3517C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 13:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMyUb+I1/+wlPnKAQqk9Hk7PUzOLui9QEcQHmxoTK8o=; b=E+wSooW1MtS8wG
	nMkZpcP39hlv8KPKHgTwV0LplRQuwvqup7T2vF4JQ4Lmeuv3CsPNz+7QOTs6U7IRMbjiuQmWnfFhJ
	iI3OK3QNNZC3EUr5GFYGYbRu8/WXQN/7Q0fOl58LFSayXIu3SA0LgE/L7pRksakGeVj36qdfT5c1T
	+d3ND8zgYHlWCnh8jiVNmNUlLriVx0gOb8iRGwNca027Ia0k3HCuxt53QGNIDk5sawQwqg8W/NIBh
	EdOEvZfYhhlHYg+xgMmjtrbB672VfAxFdXnzSrAL4hEUVrbjxM7Laq3ysVL2tI8F7q4uq1m5bV5Yz
	c8o9lPVLabMBtGbvY2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrfx5-006vle-N9; Thu, 19 May 2022 13:12:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrfqX-006syW-SO; Thu, 19 May 2022 13:05:44 +0000
X-UUID: e4575f6db7e3427d99729fe2344525f2-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:9f52ad03-8a8f-4fee-9750-cb19dc731ded, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:65c9cfe2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: e4575f6db7e3427d99729fe2344525f2-20220519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1094896946; Thu, 19 May 2022 06:05:34 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 05:55:32 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 20:55:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 May 2022 20:55:29 +0800
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
Subject: [PATCH v7 08/19] clk: mediatek: reset: Support inuput argument index
 mode
Date: Thu, 19 May 2022 20:55:16 +0800
Message-ID: <20220519125527.18544-9-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_060541_955548_11AF8F80 
X-CRM114-Status: GOOD (  18.55  )
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

There is a large number of mediatek infra reset bits, but we do not use
all of them. In addition, the proper input argement of reset controller
soulde be index.
Therefore, to be compatible with previous drivers and usage, we add
description variables to store the ids which can mapping to index.

To use this mode, we need to put the id in rst_idx_map to map from
index to ids. For example, if we want to input index 1 (this index
is used to set bank 1 bit 14) for svs, we need to declare the reset
controller like this:

In drivers:
static u16 rst_ofs[] = {
        0x120, 0x130, 0x140, 0x150, 0x730,
};

static u16 rst_idx_map[] = {
        0 * 32 + 0,
        1 * 32 + 14,
        ....
};

static const struct mtk_clk_rst_desc clk_rst_desc = {
        .version = MTK_RST_SET_CLR,
        .rst_bank_ofs = rst_ofs,
        .rst_bank_nr = ARRAY_SIZE(rst_ofs),
        .rst_idx_map = rst_idx_map,
        .rst_idx_map_nr = ARRAY_SIZE(rst_idx_map),
};

In dts:
svs: {
        ...
        resets = <&infra 1>;
        ...
};

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/reset.c | 21 ++++++++++++++++++++-
 drivers/clk/mediatek/reset.h |  5 +++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 11b2f74f121d..89e617ea6393 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -98,6 +98,18 @@ static const struct reset_control_ops mtk_reset_ops_set_clr = {
 	.reset = mtk_reset_set_clr,
 };
 
+static int reset_xlate(struct reset_controller_dev *rcdev,
+		       const struct of_phandle_args *reset_spec)
+{
+	struct mtk_clk_rst_data *data = to_mtk_clk_rst_data(rcdev);
+
+	if (reset_spec->args[0] >= rcdev->nr_resets ||
+	    reset_spec->args[0] >= data->desc->rst_idx_map_nr)
+		return -EINVAL;
+
+	return data->desc->rst_idx_map[reset_spec->args[0]];
+}
+
 void mtk_register_reset_controller(struct device_node *np,
 				   const struct mtk_clk_rst_desc *desc)
 {
@@ -136,10 +148,17 @@ void mtk_register_reset_controller(struct device_node *np,
 	data->desc = desc;
 	data->regmap = regmap;
 	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = desc->rst_bank_nr * RST_NR_PER_BANK;
 	data->rcdev.ops = rcops;
 	data->rcdev.of_node = np;
 
+	if (data->desc->rst_idx_map_nr > 0) {
+		data->rcdev.of_reset_n_cells = 1;
+		data->rcdev.nr_resets = desc->rst_idx_map_nr;
+		data->rcdev.of_xlate = reset_xlate;
+	} else {
+		data->rcdev.nr_resets = desc->rst_bank_nr * RST_NR_PER_BANK;
+	}
+
 	ret = reset_controller_register(&data->rcdev);
 	if (ret) {
 		pr_err("could not register reset controller: %d\n", ret);
diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 482df8012c5c..47635d964c69 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -28,11 +28,16 @@ enum mtk_reset_version {
  * @version: Reset version which is defined in enum mtk_reset_version.
  * @rst_bank_ofs: Pointer to an array containing base offsets of the reset register.
  * @rst_bank_nr: Quantity of reset bank.
+ * @rst_idx_map:Pointer to an array containing ids if input argument is index.
+ *		This array is not necessary if our input argument does not mean index.
+ * @rst_idx_map_nr: Quantity of reset index map.
  */
 struct mtk_clk_rst_desc {
 	u8 version;
 	u16 *rst_bank_ofs;
 	u32 rst_bank_nr;
+	u16 *rst_idx_map;
+	u32 rst_idx_map_nr;
 };
 
 /**
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
