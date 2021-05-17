Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0847FC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 05:39:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C152A61209
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 05:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C152A61209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=drCwnUlVnhkxAISGAsi9nMR1o/0BdJ+O5ZZ2o3pMrTE=; b=i8vkaxkPPr6qRX/+tNEZKEKHXh
	T5tiuksMYDUNG8bwmMKIKzouSOaXxn32RYJcGhLR4/MqKOy64oFPnC1YtibbOW/h7BTVx1uz/lnfY
	PX5aahRfL/E4VUG4Vgwph68mzJ0vp9Qr5taAZOo6QGaPT/YZaBMWfrTlmwRHLLb3EdqkzmV3hnv4x
	/353NkEgeN5EG1Bh5qYQWg9EH0sBxDa6M4Nxgm76UaXxM6tnoeUWA4w5OrlExRR9OJMcxb3KKa1H+
	NpK7y4Z5dhjJINJK9mfWawvxyC5BmfUk7CGuxPYbzmV46IfXm5IF9It216bKzJFDLOMi1qthXSZbG
	k2xA13Jg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liVyE-00Dmp6-EW; Mon, 17 May 2021 05:39:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liVwj-00Dmgf-3P; Mon, 17 May 2021 05:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=VL+LNJ3/fhoxD/7bP0UUgHGZrNkJIAv3CKs4hRSTyl0=; b=Zg9DUapz2Y2tJZnItCSPi2raH/
 tkmqtGNo6bGgH7OH2WEe5ZUOa5qIVz6u/Wy9+nmxUf3NYAy+Z7yES9+ed61WexA69PrWFBAEOJqOe
 UG8SNMs+58qy89AvCEGgOPw3p5VejcwsdifJrgIxVKJqSqrBuxzTaO6c1+vGbnY5I9PAMC+g2tJqn
 8JC7Bo+Pm6fcdnA4k3oWkBpNpcml1Q321Jk9i8syUnEBFpRTzTJAVB2AMCp2HIRCXnBVe70C1uFfT
 UTVRASZPwRl9AR9HLmTdM9TDk1qWXqm4ix9ggmKlsjQ3uNPz0xHh4lud0k3ALEWk8VF1drkYRjXKc
 EpMFViTQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liVwc-00DUWS-UI; Mon, 17 May 2021 05:37:38 +0000
X-UUID: a8d2badb98264b88805b195f007d5136-20210516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=VL+LNJ3/fhoxD/7bP0UUgHGZrNkJIAv3CKs4hRSTyl0=; 
 b=UFe9Pd23jG/a1qZtM2Sh5LTLUqey3bdnPiSsFKpiX0Rx+yKKcfRYYpf6RHc8T+WToWd0zA6DHkFhLPalcLbNxrTO9wVDOpYoC5bHP/DHtA70TkxIQQuEVqUInwucU0mcpSIALQtGou14LyyH5ufLcIvDZAHj69PIf9PUKJwh3zc=;
X-UUID: a8d2badb98264b88805b195f007d5136-20210516
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2071188422; Sun, 16 May 2021 22:37:29 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 May 2021 22:37:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 May 2021 13:37:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 May 2021 13:37:23 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: [PATCH v2] phy: qcom-qmp: remove redundant error of clock bulk
Date: Mon, 17 May 2021 13:37:21 +0800
Message-ID: <1621229841-22984-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5CC1D6D304A0BEF7EF3422F5471F0CEC2843A0B05FCE63BE7801B45554CA7BFB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_223735_034326_709E2221 
X-CRM114-Status: GOOD (  10.47  )
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

There is error log in clk_bulk_prepare/enable()

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add reviewed-by Bjorn
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 7877f70cf86f..882b8ecae235 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3993,10 +3993,8 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 	}
 
 	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
-	if (ret) {
-		dev_err(qmp->dev, "failed to enable clks, err=%d\n", ret);
+	if (ret)
 		goto err_rst;
-	}
 
 	if (cfg->has_phy_dp_com_ctrl) {
 		qphy_setbits(dp_com, QPHY_V3_DP_COM_POWER_DOWN_CTRL,
@@ -4430,10 +4428,8 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 	}
 
 	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
-	if (ret) {
-		dev_err(qmp->dev, "failed to enable clks, err=%d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	ret = clk_prepare_enable(qphy->pipe_clk);
 	if (ret) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
