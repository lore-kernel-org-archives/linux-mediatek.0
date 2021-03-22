Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0651DC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 06:05:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A4F61927
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 06:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9A4F61927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qBJrNpBW+QQ0DMMcx/tIjV5L5k8WfhVKMYmQthrAg8A=; b=p8s9zbEEVnDnzRvYBZNZnO25a
	/G+hlSO+vij7TYrB6VTk/Y60RVgOSPXy6HaAAQDYu0hhRPWwd2LxGIKnsXwzv1tBkq0SaOXhYlmG0
	L4wHRn6jiatD3W7WjxrVycsLoZlqUOjctjGLsC+qYQBOVHND4L0yfJpokWzZlRi3jHucgEUtY39SF
	DuP87CgbJaQlCpCnuWT1ABB4ttG/rP3iI30dmzhZK+jV2iDLbyZmwg7UUslpT1hRYp++gUoCGXAZK
	zITBg9M6vHNhd2cnsfhV9NCjOj4lQrtgBUXibyb2cDjWG2nCNX2g3e1K0obAImLYxSZHndi0S9vob
	DGFovZgOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lODgK-00AybM-9w; Mon, 22 Mar 2021 06:04:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lODes-00Ay4m-Kb; Mon, 22 Mar 2021 06:03:24 +0000
X-UUID: 14bc75c1613b43e790b234e8ce482379-20210321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xFm2PB9tWmB7j4znqor7I6l0wxTRPSztnH4Dcx3dB+c=; 
 b=r0q4WeO3CfrgPl6Gg/KUBm/zrt3rWQrk2LP2769NhZHAtsN10O05V/Y2SpfqYWbyOj+9inLILgp5MZpjbCv9SsddgXhFkMrDBC0DN2tpdDQqyBUbYJbYQIx49dUjrpj4hQvg6P3Bza3eWoqDMGtb+lH1mtPgYiskY+iW5d4dnPk=;
X-UUID: 14bc75c1613b43e790b234e8ce482379-20210321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1982307289; Sun, 21 Mar 2021 22:03:12 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Mar 2021 22:53:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 13:53:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Mar 2021 13:53:07 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <fparent@baylibre.com>, Leilk Liu <leilk.liu@mediatek.com>
Subject: [PATCH 4/4] spi: mediatek: add mt8195 spi slave support
Date: Mon, 22 Mar 2021 13:52:44 +0800
Message-ID: <20210322055244.30179-5-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210322055244.30179-1-leilk.liu@mediatek.com>
References: <20210322055244.30179-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3597F3A5F9E48644A278F10701EA652FB15E6B1057F2215D5892DC25101ABE122000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_060323_395702_0097DDA6 
X-CRM114-Status: GOOD (  10.43  )
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

this patch adds mt8195 spi slave compatible support.

Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
---
 drivers/spi/spi-slave-mt27xx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-slave-mt27xx.c b/drivers/spi/spi-slave-mt27xx.c
index 7e6fadc88cef..f199a6c4738a 100644
--- a/drivers/spi/spi-slave-mt27xx.c
+++ b/drivers/spi/spi-slave-mt27xx.c
@@ -77,12 +77,20 @@ struct mtk_spi_compatible {
 	const u32 max_fifo_size;
 	bool must_rx;
 };
+
 static const struct mtk_spi_compatible mt2712_compat = {
 	.max_fifo_size = 512,
 };
+static const struct mtk_spi_compatible mt8195_compat = {
+	.max_fifo_size = 128,
+	.must_rx = true,
+};
+
 static const struct of_device_id mtk_spi_slave_of_match[] = {
 	{ .compatible = "mediatek,mt2712-spi-slave",
 	  .data = (void *)&mt2712_compat,},
+	{ .compatible = "mediatek,mt8195-spi-slave",
+	  .data = (void *)&mt8195_compat,},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_spi_slave_of_match);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
