Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4129C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 17:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vgPzQSd0KAyLX9Hrr4/vBdM0vpbMBJOnastwLlN0TuQ=; b=CWMcsmL929vQYH
	5sfo8FXoMmjAEopfS+ZFACssMYuVl0NpdT9g235n4X9tgbyiukWl/IHZwwzcnu++j6QeuZSpUbVo+
	um750vwvnCYfxmI08iafO18iBQdi5X7fZlD7Ut/U61QzNrSuZVwzZf4kH8Qrl5oLn8qONMud6lhSJ
	jzm+BZ90zpWG8Mga/TTzSict5rybDRMsPCSfzSm792EWHcJSSezf/L6x2bFiyFlrny/KOlrTW00f0
	5kS57IBAQdqPYqNxr1abcVp9O/CBHiqvARRQiKnxcF/QhMDpzYeDh2Tcjfi1VGGy3xPGtT3GUZjpd
	GmaLK7jfTwsqgLTGmmuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYi2-00GzHS-2e; Fri, 13 May 2022 17:04:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYhq-00GzF4-Qp; Fri, 13 May 2022 17:04:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 940361F41739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652461437;
 bh=Wh5LQZ8ySmvO8IXpMu/GG9iqNwxWpEjWpdkHdKriJ+Q=;
 h=From:To:Cc:Subject:Date:From;
 b=R+V3I2Jh5vL98BYzEHGYtDZrsY0+WfwU5DEvBB6aM6vpV3PqRCu4oWmkkDdVf1Je1
 0i+HP0hGqGAW/tRKgjCP/Fw37ogEjErmonDLuPT3oA8u2xQJAhWjNNKxiQFHHxeNNe
 XXxMOUp46bTVcN7ZAthwmwzEqeTAC3xi1BsenusTQhnjYzQTO3HOS6/ZjXyv8Vy0Ok
 m5gB3atNx5oZ100UtNxr/MF8hWVDzsj9C9CST5TBFvrp8jOIpfyjTtlK/QaJHD8lqp
 m0XKj5aKTMN7e83r6itASd2qoHl/aaRdzIJRJKCEE/jZgIkT1EI9bNVreAr1DXoiUM
 Zjp7PGebW2gCQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] soc: mediatek: mtk-mmsys: Add support for MT6795 Helio X10
Date: Fri, 13 May 2022 19:03:50 +0200
Message-Id: <20220513170350.502501-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_100359_036608_C17021AE 
X-CRM114-Status: GOOD (  10.12  )
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

Add MM support for the MT6795 SoC, using the mmsys default routing
table.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

In order for this patch to have any meaning and functionality, it is
required to also have in-tree the [1] MT6795 clocks series, even
though that's not required to actually compile this code.

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=641493

 drivers/soc/mediatek/mtk-mmsys.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 06d8e83a2cb5..38b36b881a3b 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -57,6 +57,13 @@ static const struct mtk_mmsys_match_data mt6779_mmsys_match_data = {
 	},
 };
 
+static const struct mtk_mmsys_driver_data mt6795_mmsys_driver_data = {
+	.clk_driver = "clk-mt6795-mm",
+	.routes = mmsys_default_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
+	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
+};
+
 static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
 	.clk_driver = "clk-mt6797-mm",
 };
@@ -363,6 +370,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt6779-mmsys",
 		.data = &mt6779_mmsys_match_data,
 	},
+	{
+		.compatible = "mediatek,mt6795-mmsys",
+		.data = &mt6795_mmsys_driver_data,
+	},
 	{
 		.compatible = "mediatek,mt6797-mmsys",
 		.data = &mt6797_mmsys_match_data,
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
