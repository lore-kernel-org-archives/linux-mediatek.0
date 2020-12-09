Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1FDC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:13:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43BBA23B98
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43BBA23B98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3qIK7fIC3bE63QkMZrhIi/euhF9l6+ox8DyhYiOiNjk=; b=m2hHkbXugzj43E4HWxWVR8sIO
	KRvO+X1yvxz9LpiZ46cdUW9mEdDUeVEO12bJBdpocwX85Yfh5qa9MNggOrJ2Yvp3nq4WDdgldjG/B
	aZooEP6DB4ab2RM+ThJv1ran9FF5HtvNmEODv2F+Iobdh+6DozQ97Gsl39Bd1nUwcg+TSQnhb3wBq
	2WMBGoiHjlgnsQwBSenY3qs2ULAbpi8cr6HOOyMHzg4vYI0lSZrq8IEl0jEWe9Z5sDQavY3YOlr2D
	YlB3oIpwdwDHppmZgzMFTWff0cfwPxT9eEJdkrOC+c+//a3nUPrON9xzjW0KmFuKbII4vzbLktM3z
	kb+9qKsGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmuao-0006zR-7y; Wed, 09 Dec 2020 08:12:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmuah-0006uF-38; Wed, 09 Dec 2020 08:12:52 +0000
X-UUID: 94991456e8394b17898f375d196e906e-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=azVKLcaPBUAuuK/djyxAmnD6aBGrjlOMfsqKimfI86w=; 
 b=jyIozQJW8L6fgQNZp2gSdy4eldRoF1Opdv1tG0h1UpG1xjGE/Kp954Deq/EcsbE6eSZz1vLr/2xaTksQ+iyT6b+TNnLXZBxUv5A6oz2mrOUFhSVCdFUNCtdKRwBQY9kLxNvF7H/2qqVoSaCOSTI97YyfX05Vj0Qc8BhZQnGtOx4=;
X-UUID: 94991456e8394b17898f375d196e906e-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 140442014; Wed, 09 Dec 2020 00:12:46 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 00:03:57 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:03:52 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 16:03:55 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v5 17/27] iommu/mediatek: Add pm runtime callback
Date: Wed, 9 Dec 2020 16:00:52 +0800
Message-ID: <20201209080102.26626-18-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201209080102.26626-1-yong.wu@mediatek.com>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_031251_382210_03BE8557 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds pm runtime callback.

In pm runtime case, all the registers backup/restore and bclk are
controlled in the pm_runtime callback, then pm_suspend is not needed in
this case.

runtime PM is disabled when suspend, thus we call
pm_runtime_status_suspended instead of pm_runtime_suspended.

And, m4u doesn't have its special pm runtime domain in previous SoC, in
this case dev->power.runtime_status is RPM_SUSPENDED defaultly, thus add
a "dev->pm_domain" checking for the SoC that has pm runtime domain.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 5614015e5b96..6fe3ee2b2bf5 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -808,7 +808,7 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused mtk_iommu_suspend(struct device *dev)
+static int __maybe_unused mtk_iommu_runtime_suspend(struct device *dev)
 {
 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
@@ -826,7 +826,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mtk_iommu_resume(struct device *dev)
+static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 {
 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
@@ -853,7 +853,25 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused mtk_iommu_suspend(struct device *dev)
+{
+	/* runtime PM is disabled when suspend in pm_runtime case. */
+	if (dev->pm_domain && pm_runtime_status_suspended(dev))
+		return 0;
+
+	return mtk_iommu_runtime_suspend(dev);
+}
+
+static int __maybe_unused mtk_iommu_resume(struct device *dev)
+{
+	if (dev->pm_domain && pm_runtime_status_suspended(dev))
+		return 0;
+
+	return mtk_iommu_runtime_resume(dev);
+}
+
 static const struct dev_pm_ops mtk_iommu_pm_ops = {
+	SET_RUNTIME_PM_OPS(mtk_iommu_runtime_suspend, mtk_iommu_runtime_resume, NULL)
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_iommu_suspend, mtk_iommu_resume)
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
