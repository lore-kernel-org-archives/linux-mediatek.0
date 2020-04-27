Return-Path: <SRS0=gkfg=6L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7F6C83003
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2020 23:58:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B80D2076A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2020 23:58:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VAZDjzAf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n0RRhLr2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B80D2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CX3dCSLqXePLmCz0yMHwSpoDB4kdPekcQtBegXnvnEs=; b=VAZDjzAfyIfuQU
	GUhm8Q/fz2QLl/XY3NQdc0ECnrsO0Ms1GRFnwPd6SDD1L0dJpX7NkrSmtoMdmdl680Pn88o6rLY/3
	l2tiUt1qUmMnBZ6tkWjL9we8VIS68gBvXFSHl7jyiRpfc393nyNncUO4zmTpTUxPGB3JXJRkjbux3
	H19pgmWsXSufAmM212EIgIM9+6oGRNAW5OgAkDnzZJKzrkzl28iEX4ng+/i6q0yXe4DZFIaBqApGX
	Ed1eTusNOEMiJOMSSAjzAprhM8YAsPKDLQyhfjcw1LBZ2TL4moJ2InguQpGs2nP7Nxu9hczBJWC08
	/awEfeO2Hh32cnoIghZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTDeE-0001Yk-8G; Mon, 27 Apr 2020 23:58:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTDcp-0000Br-HY; Mon, 27 Apr 2020 23:57:25 +0000
X-UUID: 64add474bfee42ac83f74edf593d1942-20200427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4PG5NDEBrD4fO5vzTmIM1OqLtc9TFzvj1Pom1O6bbj0=; 
 b=n0RRhLr2R6tj3rik0oPmNQKtY/SoCcWjfpAa6xA5ud0gIqp4OY1LNgiffhXj8dIGODKOC/vE8AiOgu4YuCBL7V3tDq70BnSPSPZNm1UQsUzoP0l/nyhhgUKUEfdLxtKNmYrcbN/NArBjVbw8ehXFlHDKyMXkLIfad9bpd3Dvh94=;
X-UUID: 64add474bfee42ac83f74edf593d1942-20200427
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1059768930; Mon, 27 Apr 2020 15:57:16 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Apr 2020 16:57:14 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 07:57:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Apr 2020 07:57:13 +0800
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
 <stanley.chu@mediatek.com>, "Kuohong Wang" <kuohong.wang@mediatek.com>, Yong
 Mao <yong.mao@mediatek.com>
Subject: [PATCH v5 3/5] mmc: mediatek: refine msdc timeout api
Date: Tue, 28 Apr 2020 07:56:06 +0800
Message-ID: <1588031768-23677-4-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_165723_648525_BFB44F12 
X-CRM114-Status: GOOD (  11.86  )
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
better code architecture and avoid redundent
code.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 7726dcf..a2328fb 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -699,21 +699,21 @@ static void msdc_unprepare_data(struct msdc_host *host, struct mmc_request *mrq)
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
@@ -723,9 +723,21 @@ static void msdc_set_timeout(struct msdc_host *host, u32 ns, u32 clks)
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
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
