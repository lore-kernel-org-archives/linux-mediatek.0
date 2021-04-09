Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B528C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 03:09:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99F5F600D1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 03:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99F5F600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EEHinZQePRIgJNZvfOSQVuVaspm+UyXpHS6hEtMFsuU=; b=Qm1Jqry6r8YmpFx/aiqEY6bL1p
	+Okrw1sEw7wF1KZmC50T3SqGavJcC4rB78S+9QpxTBo8Tt+sabN901suEv/pFsvwm/DEeJFsmEXyg
	IozD4CtjOU1aVcBMYPBMe29oyfx+8pxFsEi/y1uDPI6E++WKNOk8P3V7lBhBYN+COvVvbB0n7lLck
	3VW4koPiK2nZUbEN4nzJr3F6nYfXHZNgJu4P0ErweqQNPPOQ2mvMGy3tPVVHbiX+REwv1TeAYdx+Y
	aoUxvCduycj9KQcDqfvhUdXzKhOv99GHJ4gAxpjmWkjGWO8lnUX6oLQUn9luOGKWXr1x42hO4j4Fg
	bni34DsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUhVR-009nLl-C8; Fri, 09 Apr 2021 03:08:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUhUQ-009nGe-Ry; Fri, 09 Apr 2021 03:07:31 +0000
X-UUID: 62824fa89efe45df9aca15e9ed29f23f-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=j7HHbOemwpZlkBdJAH707O1luQmSrjsEvXogKKVprmk=; 
 b=Mo8vNbkm4srtIb49t4OShV0P4PYtX5cF0TFRjkGf3D83BvG0Y5xZeslak7Huo9jn0mTZ4qO6Cf2K3bBl3U9ZBHtIJsDaVKNglahS2eUTRC+2VQG0qjVrPQk8CRvlqDCwi/0aAEB5uumkgP1sQEnknzDk5VD36qNikvqCrCVhaSw=;
X-UUID: 62824fa89efe45df9aca15e9ed29f23f-20210408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 217565226; Thu, 08 Apr 2021 20:07:18 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 20:07:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 11:07:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 11:07:11 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>
CC: Andy Gross <agross@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: [PATCH] phy: qcom-qmp: remove redundant error of clock bulk
Date: Fri, 9 Apr 2021 11:07:10 +0800
Message-ID: <1617937630-24832-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 32FA1E2DB58F90B2EEED82E4AD1BB02B3B0CEDA66E5DA65390E399B2F26CF9072000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_040730_092457_D1705257 
X-CRM114-Status: GOOD (  10.54  )
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

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 9cdebe7..f14b8be 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3598,10 +3598,8 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 	}
 
 	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
-	if (ret) {
-		dev_err(qmp->dev, "failed to enable clks, err=%d\n", ret);
+	if (ret)
 		goto err_rst;
-	}
 
 	if (cfg->has_phy_dp_com_ctrl) {
 		qphy_setbits(dp_com, QPHY_V3_DP_COM_POWER_DOWN_CTRL,
@@ -4035,10 +4033,8 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
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
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
