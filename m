Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6149EC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 09:42:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 292D420738
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 09:42:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iz5d8blE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="m75TliNa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 292D420738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s+FPW0QJ654a2g+iu6OI0RFALw66f/N3O/KqJkd+SfM=; b=iz5d8blEbMrzwZXqYoO8dP9+I
	zCVnYQlLc7t0iR0rcg6gJGftIE7Hedy7MktQpxkv7ST4L7a6PBPrL2T0gG613w7zTqOnHUeKVfof7
	LAgVdB8sZsavaDRXm+xvNGyFi7QD6zZJGVkiIcmg8NQUjLOl6u/SEJdcNmxp5dE8uOebVObGArUvY
	M/+UfRfsvnjuC8eE8LrDuSPM0Wh6+6F+6WvcVZsUkA42XTXyvCGACuSQSRFlIX12VQTc1TwAVI1Gu
	NNjhOtqshPsAwU8z0UsO17SytoNfr8+nciq+dOAbdYU5V+DtqNEe+Ns9KnWqgRT9uj+G1mpnXuegF
	buOc6zFbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBEQG-0000Aw-T7; Thu, 27 Aug 2020 09:42:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBEQC-00009N-Ec; Thu, 27 Aug 2020 09:42:17 +0000
X-UUID: 2f6449a2cec74d32aa90afcd42d30993-20200827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sOsx+/Ixg/H533GD9DuoQ2e+BVG8OHUWraoXKvxGaVM=; 
 b=m75TliNamjNFtogRm6GfgFmY42dg4zKW16irJkg5ul62ZpfKcisOfUpi2lSe6xfwGVg01QO73kD8IoAUfIpHh3B7/l7Pnwqf6hJYtjPHBeP2KqMOltvTALIb/6g9r56OVfuzt14a8/9BX/A7NZDVpfzvM0Cez9wDA42IP3ZfIRQ=;
X-UUID: 2f6449a2cec74d32aa90afcd42d30993-20200827
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1913398012; Thu, 27 Aug 2020 01:39:02 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 02:33:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 17:33:07 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 27 Aug 2020 17:33:08 +0800
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: <mirq-linux@rere.qmqm.pl>, Jonathan Hunter <jonathanh@nvidia.com>, "Al
 Cooper" <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 <bcm-kernel-feedback-list@broadcom.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek
 <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Mao Yong <yong.mao@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, "Kate
 Stewart" <kstewart@linuxfoundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Pan Bian <bianpan2016@163.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 "Mathieu Malaterre" <malat@debian.org>, Asutosh Das
 <asutoshd@codeaurora.org>, "Ritesh Harjani" <riteshh@codeaurora.org>, Stanley
 Chu <stanley.chu@mediatek.com>, Kuohong Wang <kuohong.wang@mediatek.com>
Subject: [PATCH v1 1/2] mmc: cqhci: add new cqhci_host_ops pre_enable() and
 post_disable()
Date: Thu, 27 Aug 2020 17:33:02 +0800
Message-ID: <1598520783-25250-2-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1598520783-25250-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1598520783-25250-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1A51BED8B7CD5237DD2E95BA511B67CCBDB8EA47EF3D2DB61BDEFA5BDD9EBA022000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_054216_724412_C1F93D14 
X-CRM114-Status: GOOD (  15.10  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add pre_enable() and post_disable() for cqhci_host_ops.
Add hook functions before cqhci enable and
after cqhci disable for platforms need them.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/mmc/host/cqhci.c |    6 ++++++
 drivers/mmc/host/cqhci.h |    2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/mmc/host/cqhci.c b/drivers/mmc/host/cqhci.c
index cfa87df..697fe40 100644
--- a/drivers/mmc/host/cqhci.c
+++ b/drivers/mmc/host/cqhci.c
@@ -376,6 +376,9 @@ static void cqhci_off(struct mmc_host *mmc)
 	else
 		pr_debug("%s: cqhci: CQE off\n", mmc_hostname(mmc));
 
+	if (cq_host->ops->post_disable)
+		cq_host->ops->post_disable(mmc);
+
 	mmc->cqe_on = false;
 }
 
@@ -580,6 +583,9 @@ static int cqhci_request(struct mmc_host *mmc, struct mmc_request *mrq)
 		__cqhci_enable(cq_host);
 
 	if (!mmc->cqe_on) {
+		if (cq_host->ops->pre_enable)
+			cq_host->ops->pre_enable(mmc);
+
 		cqhci_writel(cq_host, 0, CQHCI_CTL);
 		mmc->cqe_on = true;
 		pr_debug("%s: cqhci: CQE on\n", mmc_hostname(mmc));
diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
index 4377001..89bf6ad 100644
--- a/drivers/mmc/host/cqhci.h
+++ b/drivers/mmc/host/cqhci.h
@@ -206,6 +206,8 @@ struct cqhci_host_ops {
 	void (*disable)(struct mmc_host *mmc, bool recovery);
 	void (*update_dcmd_desc)(struct mmc_host *mmc, struct mmc_request *mrq,
 				 u64 *data);
+	void (*pre_enable)(struct mmc_host *mmc);
+	void (*post_disable)(struct mmc_host *mmc);
 };
 
 static inline void cqhci_writel(struct cqhci_host *host, u32 val, int reg)
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
