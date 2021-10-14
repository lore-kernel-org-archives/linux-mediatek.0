Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB1DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 09:35:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7EF60E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 09:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A7EF60E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxgXy/cOokL3y+oB5EWyShtaXWDpPbONlHy9NPZVNqY=; b=jypR533d6tVRst
	RA3vyghlFan/22ACzt+sZMS6jCKv5aQMA5m06/CEYZ3S50ed0afxXen6S54WNasH2WB3fFfyABlA5
	6MB6sNATiGYxHHXXXflR4SdjqyPU+l8JrCqmBrhK39ZILN8FseDWepRUAWQDAJY5jNpQYgFJM4Mxn
	cU7M966esNHLx3ilqbp3Y8n9V/Dba8zRXhx1iq1fQCo2lM3sUf98BRdvC6qpyXossa50rUsgABLYv
	EAPp5JtHDN8fuWz9qdYKPuCJ1HXNEisjW/rm+bNiZIwuDMA9OR3A+yJxFyPkyrCJhMGl4tvSd7sfn
	vtUgzTWeRJT+C4K5rn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1max8l-002ORI-1j; Thu, 14 Oct 2021 09:35:07 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1max6k-002NTu-3M
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 09:33:03 +0000
Received: by mail-pg1-x52c.google.com with SMTP id e65so2579352pgc.5
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 02:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5fwWMum+XGi3+U2DaIfb9q6LtryQgWT3ekOpQvR6dCM=;
 b=Ol6rRe7O26a+knJp2yEBarjsvc1AXZULqEyq6SqcwKJucDHNVpL17Mrx+bW69+Ch1e
 WlTXZDDtPg3zodERZTAE7EPuRvQI1fzCk8aaVNaYbuzvb35wBzDLSH0rue3UfG2GPvnU
 B/qX2dIFsazwatobJ1SUHJqZCTC6+aaenNs3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5fwWMum+XGi3+U2DaIfb9q6LtryQgWT3ekOpQvR6dCM=;
 b=JUqSiqlxvunK+nQ0Pzc7UCo0Q6nr5ek5YUy/lPkxpxkZTjjiykznPtKROt7rYXy2QE
 nhzRAtjqFUAl9Ru6lS4fEIQH+BJ+KXbzY2pqwFxb1aQ7I6RqRSn+xGpo8btL7vjRlNMO
 bDD68myP46Z36kgjk2cD/LzbhZR4Nfk2BuIjFWlG7ILIkKF2Dh5GikGeyV0Zbo0TveF1
 bfws4Xym97sZlJfgVbOMiEO/T4S0vKFMlvcVect/pIijABrCqKhargZF8SNbR1qoo1np
 LJ7vo+SjKXHN4+nQKn118Mueaf1/ABrJ+WsDay4X1ulGn0kVzEhHgiIqyBDXOKyIOka8
 AWQQ==
X-Gm-Message-State: AOAM533IHZiLkGeISoZgMFiJi2vtDJJr8RkENgwIESWszNwCmQq8UWaV
 xzucWJc5aFlv4eIIgg6rRfRWxA==
X-Google-Smtp-Source: ABdhPJwA36WyDNJj0nGpSsGt31gMXDVvFxJphvharItmmO5IICkZJmsfpN/t18YYip6v37GGlIaunw==
X-Received: by 2002:a65:62cb:: with SMTP id m11mr3373441pgv.425.1634203980906; 
 Thu, 14 Oct 2021 02:33:00 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com
 ([2401:fa00:1:10:64c0:3f2d:5152:a6f1])
 by smtp.gmail.com with ESMTPSA id k6sm2120116pfg.18.2021.10.14.02.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 02:33:00 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Fei Shao <fshao@chromium.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] mailbox: mtk-cmdq: Fix local clock ID usage
Date: Thu, 14 Oct 2021 17:31:11 +0800
Message-Id: <20211014093112.3852491-2-fshao@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
In-Reply-To: <20211014093112.3852491-1-fshao@chromium.org>
References: <20211014093112.3852491-1-fshao@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_023302_188854_847E7D2F 
X-CRM114-Status: GOOD (  15.38  )
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
after the probing stage becomes a use-after-free case.

Since there are only limited variants of the gce clock names so far, we
can just declare them as global constants to fix the issue.

Fixes: 85dfdbfc13ea ("mailbox: cmdq: add multi-gce clocks support for
mt8195")
Signed-off-by: Fei Shao <fshao@chromium.org>

---

 drivers/mailbox/mtk-cmdq-mailbox.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index f3e52dddd422..27248b31cd51 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -90,6 +90,9 @@ struct gce_plat {
 	u32 gce_num;
 };
 
+const char *clk_name = "gce";
+const char *clk_names[] = { "gce0", "gce1" };
+
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 {
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
@@ -532,7 +535,6 @@ static int cmdq_probe(struct platform_device *pdev)
 	struct device_node *phandle = dev->of_node;
 	struct device_node *node;
 	int alias_id = 0;
-	char clk_name[4] = "gce";
 
 	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
@@ -570,12 +572,9 @@ static int cmdq_probe(struct platform_device *pdev)
 
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
