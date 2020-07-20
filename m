Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E286EC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 00:53:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA7DF208B3
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 00:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PJuKtXYw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VSnwGdiU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA7DF208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+RsaXY2uPWQhrHrDPkia3Foh5iQTlH7/FUaVYip9wFM=; b=PJuKtXYwESEs9C9AQcDobGAwq
	cXjWfwvFfd29cmpO7lvFNpaI+CYv1MxZya6I+Grt0PA8fAyN4ZuH/3Omu3qxJlKQbrRh5hqmmSZFq
	ghmaCNimW1tofNaZauL3cnJnCjZT46d7H9FKqa+Ps5Xizqd6LLJX3Fra2t6JHZmtUFxs1N6WsQree
	bLvx8iyPHEI44aINFpyuZJ8hQv2okaje8SYciH1K5bWGzoqv5501iGToF0/+4vI7D5ETIDN+oSY4y
	Kkppz2hNzeEdXUJf3jtJMia8L7LQqBluYqivsTbBV/oE+Yfuu49twufI2wazvY+KBEweMKesgI1yF
	1hvho2Ssg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxK36-0006JY-VA; Mon, 20 Jul 2020 00:52:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxK33-0006IV-0V; Mon, 20 Jul 2020 00:52:54 +0000
X-UUID: 96844a3c6c924b38b52ead9237a53447-20200719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=juG6BnX41+DeE6Q27S76GMbkvGJcmbG29m+dVuuEOXo=; 
 b=VSnwGdiULnQHMth7veNNzYmoxFpJCXx+UAft2ttRO0zHTm6XUQMAeWkSllHtlg4mNbK9jsw1rtBGCNuQPLPyrDoFg1EQDWzDKpSYlxxV4nFTRV4DVQ8a+j4U3iMc9MsoY7lSGVZ6oQQn9ta/yPyV8L/oUN9+5ZH58Q6+Rqa92Ks=;
X-UUID: 96844a3c6c924b38b52ead9237a53447-20200719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1355892920; Sun, 19 Jul 2020 16:52:47 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jul 2020 17:42:46 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 08:42:43 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 20 Jul 2020 08:42:43 +0800
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: <mirq-linux@rere.qmqm.pl>, Jonathan Hunter <jonathanh@nvidia.com>, "Al
 Cooper" <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 <bcm-kernel-feedback-list@broadcom.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek
 <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate
 Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Pan Bian <bianpan2016@163.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 "Mathieu Malaterre" <malat@debian.org>, Stanley Chu
 <stanley.chu@mediatek.com>, "Kuohong Wang" <kuohong.wang@mediatek.com>
Subject: [PATCH v7 2/4] mmc: mediatek: refine msdc timeout api
Date: Mon, 20 Jul 2020 08:42:37 +0800
Message-ID: <1595205759-5825-3-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C4513997F2F8320F12D325293F26DF128DB1966A082367BFE74571B7E9C474092000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_205253_432599_2AE036D5 
X-CRM114-Status: GOOD (  12.41  )
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

Extract msdc timeout api common part to have
better code architecture and avoid redundant code.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index ed37a3c..347ed72 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -723,21 +723,21 @@ static void msdc_unprepare_data(struct msdc_host *host, struct mmc_request *mrq)
 	}
 }
 
-/* clock control primitives */
-static void msdc_set_timeout(struct msdc_host *host, u32 ns, u32 clks)
+static u64 msdc_timeout_cal(struct msdc_host *host, u64 ns, u64 clks)
 {
-	u32 timeout, clk_ns;
+	u64 timeout, clk_ns;
 	u32 mode = 0;
 
-	host->timeout_ns = ns;
-	host->timeout_clks = clks;
 	if (host->mmc->actual_clock == 0) {
 		timeout = 0;
 	} else {
-		clk_ns  = 1000000000UL / host->mmc->actual_clock;
-		timeout = (ns + clk_ns - 1) / clk_ns + clks;
+		clk_ns  = 1000000000ULL;
+		do_div(clk_ns, host->mmc->actual_clock);
+		timeout = ns + clk_ns - 1;
+		do_div(timeout, clk_ns);
+		timeout += clks;
 		/* in 1048576 sclk cycle unit */
-		timeout = (timeout + (0x1 << 20) - 1) >> 20;
+		timeout = DIV_ROUND_UP(timeout, (0x1 << 20));
 		if (host->dev_comp->clk_div_bits == 8)
 			sdr_get_field(host->base + MSDC_CFG,
 				      MSDC_CFG_CKMOD, &mode);
@@ -747,9 +747,21 @@ static void msdc_set_timeout(struct msdc_host *host, u32 ns, u32 clks)
 		/*DDR mode will double the clk cycles for data timeout */
 		timeout = mode >= 2 ? timeout * 2 : timeout;
 		timeout = timeout > 1 ? timeout - 1 : 0;
-		timeout = timeout > 255 ? 255 : timeout;
 	}
-	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC, timeout);
+	return timeout;
+}
+
+/* clock control primitives */
+static void msdc_set_timeout(struct msdc_host *host, u64 ns, u64 clks)
+{
+	u64 timeout;
+
+	host->timeout_ns = ns;
+	host->timeout_clks = clks;
+
+	timeout = msdc_timeout_cal(host, ns, clks);
+	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC,
+		      (u32)(timeout > 255 ? 255 : timeout));
 }
 
 static void msdc_gate_clock(struct msdc_host *host)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
