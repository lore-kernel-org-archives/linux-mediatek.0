Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADADEC07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 12:47:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81AC16135B
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 12:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81AC16135B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HvswNDKb4ykFGaVHVhHKVFNsmD9ZwEebszf5dw9dX3Y=; b=fCxahdMPLgVi+1
	8KbD1qycNCqWgKtNv7+j0hTRX5SgHiBbpLoXsGfysUsuNnKBX0laoPUjzpxcn4Y+mZHbK5OsizPJs
	1yukQH/pwZRuMZcmIXPtFSukCumkw2NvhtMATjRcZ80pRwdKR8N5lvivcQjA5T9osjXqZCKa9ua3o
	8M9X5wgfGXxbiE6hKw9dxErYD0zojskJvfjNYwjnQERysIILONnWREUT++/A2XencT5iXFq257pbi
	1OIGWlS7J7DWM5Gpcwm80RAbup2kzRzP6QGUc/aaKyzMH0ZK+NgvrVp4nqxEOS56CN2k8oMjqEaLm
	mPlBEowJJbm62W4nFr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1puw-001mzv-Hp; Fri, 09 Jul 2021 12:47:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1pun-001mwl-Ie; Fri, 09 Jul 2021 12:47:34 +0000
X-UUID: b599e83cc2a946cd99db11cdfefe3fe4-20210709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gPTSbuF/u38xMX2QgkIPPRYCWQmkV09yUMEOf+dYMBI=; 
 b=OyNYPsQlADBcmBtdAjF7/v5dsZr2ysQpc2OUlicAHJN2E/E1JdnrpH1Cwv6czVTVqQmdBNmOXHnj+e1ojbXMA0JYYi8ZoGXRTbNQykrjAMHGJ6D85S8uAlnCNCAqZ+FfRT1xadKI7gJIbIWTa5ym0f/+AtWZ8YDaZllpw0Q0k7g=;
X-UUID: b599e83cc2a946cd99db11cdfefe3fe4-20210709
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 623566195; Fri, 09 Jul 2021 05:47:28 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Jul 2021 05:47:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Jul 2021 20:47:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 9 Jul 2021 20:47:24 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
 <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <tzungbi@google.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH 2/2] remoteproc: mediatek: Support mt8195 scp
Date: Fri, 9 Jul 2021 20:46:31 +0800
Message-ID: <20210709124631.28312-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210709124631.28312-1-tinghan.shen@mediatek.com>
References: <20210709124631.28312-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_054733_682056_A39C531A 
X-CRM114-Status: GOOD (  13.19  )
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

The SCP clock design is changed on mt8195 that doesn't need to control
SCP clock on kernel side.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9679cc26895e..c31af75f947a 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -785,11 +785,13 @@ static int scp_probe(struct platform_device *pdev)
 	if (ret)
 		goto destroy_mutex;
 
-	scp->clk = devm_clk_get(dev, "main");
-	if (IS_ERR(scp->clk)) {
-		dev_err(dev, "Failed to get clock\n");
-		ret = PTR_ERR(scp->clk);
-		goto release_dev_mem;
+	if (of_get_property(np, "clocks", NULL)) {
+		scp->clk = devm_clk_get(dev, "main");
+		if (IS_ERR(scp->clk)) {
+			dev_err(dev, "Failed to get clock\n");
+			ret = PTR_ERR(scp->clk);
+			goto release_dev_mem;
+		}
 	}
 
 	/* register SCP initialization IPI */
@@ -877,6 +879,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
+	{ .compatible = "mediatek,mt8195-scp", .data = &mt8192_of_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
