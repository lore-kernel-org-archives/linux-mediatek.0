Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88850C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 01:52:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29FB064DF0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 01:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29FB064DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fl4e15bcizQjQT37uRRF4C0sE2I4j+YLdYDv4q/2q6A=; b=PoIb2Cj5E/4+TIreas4dC3qDY
	zb3a7CNfotmR/qxm2UZY0E0snh6nwgnsSFSQxFLDwb8Z2rK+qnGO9YgrX8ppqCkCWffdXRJXeGNnL
	TDAlNgRHthyBj15c2eFn2snzjSTXv8am6dZlITqyrkrP7V4Tg7CDwCv0iUdgsdOmLB1xT47iQLQyp
	jZACZ6NTvolLwhJszVmDttvBRsA5lLfF94lXlLMnJo3dA7do8YcT8/nZPENnCnvKClj+s11ud2WN8
	SLze/3IeBhLDtG9AwbFGXYebClh5PA49pn5FkNNQ7t/LlOwPnKyVldxX5LVq6SaBQFKfPVblZ647y
	TuaNhrY+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8vjF-0007tp-Sl; Mon, 08 Feb 2021 01:52:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8vjA-0007sk-CC; Mon, 08 Feb 2021 01:52:37 +0000
X-UUID: 505505dc21f944b2b2db4145ddb4a466-20210207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JdQDlO+T4DbZd6v3vMyj8+I0/Y1thi8lltwrLzqd7hQ=; 
 b=cwUnloHEMESQz11Myzg+u3OtsDzT7NeO1bpv9uHZqX2qWhbj0wrE9wSsb0cWHHpCtbLCIPs2LkhoOO86vtfegQ5J6AE+BqR4nUK8ZkYff8woVHTb+E9VqD75WITPNB5IiJpnK1ZS7rl7zKR2I5IcAtLMSMCOoPPiZOitF+cWB1M=;
X-UUID: 505505dc21f944b2b2db4145ddb4a466-20210207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 917302118; Sun, 07 Feb 2021 17:52:32 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Feb 2021 17:42:31 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 8 Feb 2021 09:42:26 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 8 Feb 2021 09:42:25 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
Subject: [PATCH v3 2/3] drm/mediatek: mtk_dpi: Add dpi config for mt8192
Date: Mon, 8 Feb 2021 09:42:20 +0800
Message-ID: <20210208014221.196584-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208014221.196584-1-jitao.shi@mediatek.com>
References: <20210208014221.196584-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2F7BBF8CCE035861BD1B1E650CD1D1B7EA895AD24B21F1F246F2E645EB5AD7242000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_205236_659046_6F394897 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, shuijing.li@mediatek.com, airlied@linux.ie,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index ffa4a0f1989f..f6f71eb67ff1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -703,6 +703,12 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.max_clock_khz = 100000,
 };
 
+static const struct mtk_dpi_conf mt8192_conf = {
+	.cal_factor = mt8183_calculate_factor,
+	.reg_h_fre_con = 0xe0,
+	.max_clock_khz = 150000,
+};
+
 static int mtk_dpi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -837,6 +843,9 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt8183-dpi",
 	  .data = &mt8183_conf,
 	},
+	{ .compatible = "mediatek,mt8192-dpi",
+	  .data = &mt8192_conf,
+	},
 	{ },
 };
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
