Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2913C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 07:19:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A71C360241
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 07:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A71C360241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NKABrOZzr8DGLCpVsgmP/l4Eag2wljAlvz9wloHS+Tc=; b=VNtqvFLbff2uTsI4/h0Xpw0kh
	DUTdpL0C94ZBUgnkK9D8o15NAyB+SheJ6YyPlvah+8DpZ3EeTwMp0jPZDw3zQgaXjU2XyOWtw3moB
	AbJIoBtigajWy1/CCuVkOJtf8YQdYTbme0RmHVBuH7beHo4Hi5G3eAUU/FFpMm5BVJFuU8VjVqcAM
	0jMEbBGNay+D5yHQbnCuRY3Q5+tXCaIJUDKrbcHVULNyyI+2YXY4q3JDumYeJsEbxAcTkdUa3Ki2v
	LJ8QWN5N4NaqbRaJlBmpYdX4T8fGINopzypS3tDYuMTPVzz87IW9qshmjPMLyP9VaolanAVnCT5h0
	PoM6tbEMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7vOO-0006dO-Es; Fri, 05 Feb 2021 07:19:00 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7vOD-0006Zj-IK
 for linux-mediatek@lists.infradead.org; Fri, 05 Feb 2021 07:18:51 +0000
Received: by mail-pg1-x52e.google.com with SMTP id o63so3919917pgo.6
 for <linux-mediatek@lists.infradead.org>; Thu, 04 Feb 2021 23:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PpayG0fwWcWe/zBP0X3Dj60l0XxHvQg99iioDt7OmBA=;
 b=KfcdyuyYA6jzzVew83nfuESJC6ejYqO392+QLH8ookIBsE8a//uJ6shyFjIxTawSEx
 50tRzMj9BPEoFycONFDHB2hV75cXqSkuJpVQ4Yvh2LELHtxgFnMKCaBYFtmUmvvwARju
 pU2J8cTggCITiH7iFUwZg/LFWfTjNtrkKPFAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PpayG0fwWcWe/zBP0X3Dj60l0XxHvQg99iioDt7OmBA=;
 b=b52wMWSaU7yzdB4yqhwJoCs4Jo8xyfTTm86N6cy5Djo/GSIbmr7obNdnQN6tqqQvG3
 Ia+ty6AhX1/DxBW7whQdeLJjbX36FhS3zaArsBoN3WmC4AbYNJbeycqnnVVftpRDcMXB
 oEQQ1mrx4BwE2LX0yDGt+lF2WoJmqQtoMriwzrSzwEax7BrxLTmGsAkZsN9HwwHLB0cu
 cjnsxVh6bVfaZzvSK3OxQa7wPmCkuMTi3O/jLKCPqf8PJx5sSBPUjfuOIZkGFdFk56l3
 8ZYW4FYW4LgODm4m90aVe3zXBXVUHF1FbKleKgyf+qgp7lhV8aXkDnSQnBf61xFI+ev/
 0sCw==
X-Gm-Message-State: AOAM530fgO4oHQOLc0zUTaXW7CMTogTG2yeTAAGrywuPRj+3yjKkhSRo
 dxfYbE2/gCV+EX28sqrg5BDJBw==
X-Google-Smtp-Source: ABdhPJxm+2WdObo4SdsQR/w/HUx4KWzdxV/x1irKXtFISDVOMtWQly0cd4rl/7cVSgi19wA3eERgEQ==
X-Received: by 2002:a63:bd4a:: with SMTP id d10mr3033211pgp.18.1612509527122; 
 Thu, 04 Feb 2021 23:18:47 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ed70:6d43:9c6a:2e22])
 by smtp.gmail.com with ESMTPSA id oa10sm6292028pjb.45.2021.02.04.23.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 23:18:46 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/3] mailbox: cmdq: add mt8192 support
Date: Fri,  5 Feb 2021 15:18:33 +0800
Message-Id: <20210205071833.2707243-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210205071833.2707243-1-hsinyi@chromium.org>
References: <20210205071833.2707243-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_021849_664866_CAB06DF0 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: devicetree@vger.kernel.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

add mt8192 support

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 5665b6ea8119f..de4793ef6798a 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -36,6 +36,8 @@
 #define CMDQ_THR_WAIT_TOKEN		0x30
 #define CMDQ_THR_PRIORITY		0x40
 
+#define GCE_GCTL_VALUE			0x48
+
 #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
 #define CMDQ_THR_ENABLED		0x1
 #define CMDQ_THR_DISABLED		0x0
@@ -76,11 +78,13 @@ struct cmdq {
 	struct clk		*clock;
 	bool			suspended;
 	u8			shift_pa;
+	bool			control_by_sw;
 };
 
 struct gce_plat {
 	u32 thread_nr;
 	u8 shift;
+	bool control_by_sw;
 };
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
@@ -121,6 +125,8 @@ static void cmdq_init(struct cmdq *cmdq)
 	int i;
 
 	WARN_ON(clk_enable(cmdq->clock) < 0);
+	if (cmdq->control_by_sw)
+		writel(0x7, cmdq->base + GCE_GCTL_VALUE);
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
 	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
 		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
@@ -536,6 +542,7 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	cmdq->thread_nr = plat_data->thread_nr;
 	cmdq->shift_pa = plat_data->shift;
+	cmdq->control_by_sw = plat_data->control_by_sw;
 	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
 			       "mtk_cmdq", cmdq);
@@ -601,11 +608,14 @@ static const struct dev_pm_ops cmdq_pm_ops = {
 static const struct gce_plat gce_plat_v2 = {.thread_nr = 16};
 static const struct gce_plat gce_plat_v3 = {.thread_nr = 24};
 static const struct gce_plat gce_plat_v4 = {.thread_nr = 24, .shift = 3};
+static const struct gce_plat gce_plat_v5 = {.thread_nr = 24, .shift = 3,
+					    .control_by_sw = true};
 
 static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
+	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_v5},
 	{}
 };
 
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
