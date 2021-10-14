Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F900C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 12:05:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 396BB61130
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 12:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 396BB61130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrkWQCzxbN8I9JVHw9X/UflxRnr1/xnnJxXgAiAAiC8=; b=KAR0CyjK1YzMr7
	521n6vT94Ejc787B3tdrcvCNRlFlzJ79tPOXDOConBiRg2yuzZJFa47uATq0JgN4D+LjBV4b93UWZ
	o69UsJ9Q5LI6Qm17vxl9EADICP95dT2FNImfalOB6YFk8Xh1Ou3hrr6E83HWvmja2SztHpL4Gfoxu
	HCjQv0pnN9VBkfhCB+lZCiU5s3m4EEhMr32Bze5m1yh0K4IzDRU1yYvEO26MP3k9PrHsL6Vpc3Cxb
	HxHTQSaQJmWhi+Fp0kOCuaXa4iwNcyMpB+xkxK/U/zgBheEvdSkAUrruL9Sm45yVs2Obz+YAPpsbQ
	FSXcyfD6UOO76Z2w9gVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mazTh-002zwx-GP; Thu, 14 Oct 2021 12:04:53 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mazTN-002zoz-AG
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 12:04:34 +0000
Received: by mail-pg1-x532.google.com with SMTP id 66so5313412pgc.9
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xjtTKqJNAW9TAfK1opWSOcT+9CXDZRVrcJjqizIFop8=;
 b=VdsdzRAnoo6T3oe5ardLdZQTZfHNI7s0aObN2E47puJxRGKkUA0aqL/OuTMkAqV8v8
 Kbs/GAGctRezd7TcrMxuBUIHbGiVWwTZs2n8LWJLdOGaOjQg69LHDXh5e/WMJkhd4rHc
 /pB+N/2EBvXkvvsiB8ja2gf9a+ZtlCoe+vSS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xjtTKqJNAW9TAfK1opWSOcT+9CXDZRVrcJjqizIFop8=;
 b=lQCnHprrMIlaYNEQwNdPGGkoORIq+n5e4kmDrWQWrM0CwVUIXO5EBHC+K2QrberWsX
 mSVbmLJgJj1KTTfu52fy1h8l4UQckEI+f2ebxaprefXzoc+Tasldo9e+jN3Mq3R6K+NH
 G5UsSZ+RNzpPg2IQWolNaomoUMzRc0waxRt24zoA1cnMWg0CiH7WiAH48wL8EU6fvolP
 bn6P1wMJkA903fjFjPE2MMydzfoUsyTkLO56WrCLDLHw0hRzwGhofpsu9ANHhAasV8WO
 LYzj89qsSR4q348+6Cj5/ckOd7mChCCG38ik0tXs5/sKNwagngiOFu7OXtQfsgWGn6pT
 wctw==
X-Gm-Message-State: AOAM533GGuD7SdoNbXjgN296vTYtchaC9uWKWtPBZyBofDt6dSZEVSEj
 bm/zupq1NnPUXMzOp+XntMS5cA==
X-Google-Smtp-Source: ABdhPJzfAyd5w8l4m9xU+WIpJBe1EuuS5AIYTA+h6Lpw2RNsav3/vZ5qxcdkGjy6ufyy83SyD0FFQA==
X-Received: by 2002:a63:3481:: with SMTP id b123mr3910867pga.230.1634213072117; 
 Thu, 14 Oct 2021 05:04:32 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com
 ([2401:fa00:1:10:64c0:3f2d:5152:a6f1])
 by smtp.gmail.com with ESMTPSA id b11sm2300275pge.57.2021.10.14.05.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 05:04:31 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Fei Shao <fshao@chromium.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] mailbox: mtk-cmdq: Fix local clock ID usage
Date: Thu, 14 Oct 2021 20:03:52 +0800
Message-Id: <20211014120352.1506321-3-fshao@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
In-Reply-To: <20211014120352.1506321-1-fshao@chromium.org>
References: <20211014120352.1506321-1-fshao@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_050433_400354_D095E264 
X-CRM114-Status: GOOD (  14.92  )
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

In the probe function, the clock IDs were pointed to local variables
which should only be used in the same code block, and any access to them
after the probing stage becomes an use-after-free case.

Since there are only limited variants of the gce clock names so far, we
can just declare them as static constants to fix the issue.

Fixes: 85dfdbfc13ea ("mailbox: cmdq: add multi-gce clocks support for
mt8195")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- Make clock names static

 drivers/mailbox/mtk-cmdq-mailbox.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index f3e52dddd422..95ce7275641c 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -532,7 +532,8 @@ static int cmdq_probe(struct platform_device *pdev)
 	struct device_node *phandle = dev->of_node;
 	struct device_node *node;
 	int alias_id = 0;
-	char clk_name[4] = "gce";
+	static const char * const clk_name = "gce";
+	static const char * const clk_names[] = { "gce0", "gce1" };

 	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
@@ -570,12 +571,9 @@ static int cmdq_probe(struct platform_device *pdev)

 	if (cmdq->gce_num > 1) {
 		for_each_child_of_node(phandle->parent, node) {
-			char clk_id[8];
-
 			alias_id = of_alias_get_id(node, clk_name);
 			if (alias_id >= 0 && alias_id < cmdq->gce_num) {
-				snprintf(clk_id, sizeof(clk_id), "%s%d", clk_name, alias_id);
-				cmdq->clocks[alias_id].id = clk_id;
+				cmdq->clocks[alias_id].id = clk_names[alias_id];
 				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
 				if (IS_ERR(cmdq->clocks[alias_id].clk)) {
 					dev_err(dev, "failed to get gce clk: %d\n", alias_id);
--
2.33.0.882.g93a45727a2-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
